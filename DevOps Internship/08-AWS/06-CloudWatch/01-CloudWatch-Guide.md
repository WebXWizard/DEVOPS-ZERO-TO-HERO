# Amazon CloudWatch

## What is CloudWatch?
A monitoring and observability service. It collects monitoring and operational data in the form of logs, metrics, and events.

## Components

### 1. CloudWatch Metrics
Data points collected over time.
*   **Standard resolution**: 1 minute.
*   **High resolution**: 1 second.
*   **Host Level Metrics**: CPU, Network, Disk Read/Write (Status Check) are free/default.
*   **Custom Metrics**: RAM Usage (Default EC2 doesn't report RAM), Application logic.

### 2. CloudWatch Logs
Centralized storage for logs.
*   **Log Groups**: Container for log streams (e.g., `/aws/lambda/my-function`).
*   **Log Streams**: Sequence of log events from a source.
*   **CloudWatch Agent**: Installed on EC2 to push logs (system logs, app logs) to CW.

### 3. CloudWatch Alarms
Watch metrics and perform actions based on thresholds.
*   **Actions**: Send SNS (Email), Trigger Auto Scaling, Reboot EC2.
*   **States**: OK, ALARM, INSUFFICIENT_DATA.

### 4. EventBridge (formerly CloudWatch Events)
Serverless event bus.
*   **Rules**: Match events (e.g., "EC2 terminated") and route to targets.
*   **Targets**: Lambda, SNS, SQS, Kinesis.
*   **Scheduled Events**: Crontab for AWS (e.g., Trigger Lambda every 5 mins).

## Interview Questions
1.  **Can CloudWatch restart an EC2 instance?**
    *   Yes, an Alarm can trigger an EC2 Action to Stop, Terminate, Reboot, or Recover an instance.

2.  **How do you monitor memory usage of EC2?**
    *   By default, EC2 pushes metrics visible to the hypervisor (CPU, Disk). Memory is OS-level. You must install the **CloudWatch Agent** (or Unified CloudWatch Agent) on the instance to push memory metrics.

3.  **Difference between CloudWatch and CloudTrail?**
    *   **CloudWatch**: Performance monitoring (Metrics, Logs). "What is crucial for app health?"
    *   **CloudTrail**: Auditing (API calls). "Who did what?" (e.g., User X deleted Bucket Y).
