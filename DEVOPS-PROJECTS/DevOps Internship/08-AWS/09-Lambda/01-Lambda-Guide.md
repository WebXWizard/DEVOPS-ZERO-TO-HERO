# AWS Lambda (Serverless Compute)

## What is Lambda?
A compute service that lets you run code without provisioning or managing servers. You pay only for the compute time you consume.

## Key Concepts
1.  **Function**: The code you run.
2.  **Trigger**: Event that starts the function (e.g., S3 upload, DynamoDB update, API Gateway request).
3.  **Runtime**: Language environment (Node.js, Python, Java, Go).
4.  **Layers**: Zip archives containing libraries/dependencies to keep deployment package small.

## How it Works
Event Source -> Triggers Lambda -> Lambda executes code -> Does something (Write to DB, Log to CW).

## Use Cases
1.  **Real-time File Processing**: User uploads photo to S3 -> Lambda resizes it -> Saves thumbnail.
2.  **Data Transformation**: Kinesis stream -> Lambda filters data -> Writes to DynamoDB.
3.  **Cron Jobs**: EventBridge (Scheduled) -> Lambda performs clean up.
4.  **Serverless Backend**: API Gateway -> Lambda -> DynamoDB.

## Cold Start
When a function is invoked for the first time (or after being idle), AWS must provision a micro-container and load your code. This adds latency (`100ms - 1s`).
*   **Mitigation**: Provisioned Concurrency.

## Interview Questions
1.  **What is the maximum execution time (timeout) for Lambda?**
    *   15 minutes (900 seconds). For longer tasks, use AWS Batch or Step Functions.

2.  **How is Lambda priced?**
    *   Number of requests.
    *   Duration (Time code runs) * Memory allocated.

3.  **What is a Lambda Layer?**
    *   A way to package libraries and other dependencies that you can pull into your function code. Promotes code sharing and smaller deployment packages.

4.  **Serverless vs Containers?**
    *   **Serverless (Lambda)**: Event-driven, ephemeral, scales to zero, vendor lock-in.
    *   **Containers (Fargate/EKS)**: Long-running processes, portable, more control.
