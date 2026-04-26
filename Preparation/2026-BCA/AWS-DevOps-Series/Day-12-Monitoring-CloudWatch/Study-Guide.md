# Day 12: Monitoring and Logging with CloudWatch 📊🔍

Amazon CloudWatch is a monitoring and observability service that provides data and actionable insights to monitor your applications, respond to system-wide performance changes, and optimize resource utilization.

## 📈 CloudWatch Metrics vs. Logs

The two fundamental data types inside CloudWatch.

| Feature | CloudWatch Metrics | CloudWatch Logs |
| :--- | :--- | :--- |
| **Definition** | Time-ordered set of data points (numbers). | Records of discrete events (text/JSON strings). |
| **Examples** | EC2 CPU Utilization, S3 Bucket Size, DynamoDB Read Capacity. | Apache error logs, AWS CloudTrail audits, custom application debug logs. |
| **Cost** | Free for basic metrics (5-minute intervals). | Priced per GB ingested and stored. |
| **Use Case**| Triggering Auto Scaling, building high-level dashboard graphs. | Deep troubleshooting, forensic analysis, auditing. |

## 🚨 Alarms and Notifications Architecture

Metrics by themselves are just graphs. You need to be notified when things go wrong.

```mermaid
graph LR
    EC2[EC2 Instance] -- "Pushes CPU Metric Data" --> CW[CloudWatch Metrics]
    CW -- "Evaluates Rule:<br>If CPU > 80% for 5 mins" --> Alarm[CloudWatch Alarm]
    Alarm -- "State changes to ALARM" --> SNS[SNS Topic<br>(Simple Notification Service)]
    SNS -- "Sends HTTPS request" --> Slack[Slack Channel Webhook]
    SNS -- "Sends Email" --> Email[Admin Email Address]
    Alarm -- "Triggers scaling policy" --> ASG[Auto Scaling Group<br>(Add new instance)]
```

## 🖥️ Custom Dashboards

*   **CloudWatch Dashboards** are customizable home pages in the CloudWatch console.
*   You can monitor your resources in a single view, even those spread across different regions.
*   **Best Practice**: Create role-specific dashboards (e.g., a "Database Health" dashboard for the DBA team, a "High-Level App Status" dashboard for management).

## 🔍 Advanced Features

| Feature | Description | DevOps Value |
| :--- | :--- | :--- |
| **CloudWatch Logs Insights** | A specialized query language to rapidly search and analyze massive amounts of log data. | Find out *exactly* why the web server failed at 3:00 AM by querying across gigabytes of logs in seconds. |
| **CloudWatch Anomaly Detection** | Applies machine learning algorithms to continuously analyze metrics and detect unusual behavior. | Don't set static thresholds (like "Alert if CPU > 90%"). Anomaly detection alerts you if traffic is strange for a Tuesday afternoon, even if CPU is low. |
| **CloudWatch Synthetics** | Create "canaries" (configurable scripts that run on a schedule) to monitor your endpoints and APIs. | Simulates user traffic. Alerts you if your login page is broken, even if the backend servers say they are "healthy". |
