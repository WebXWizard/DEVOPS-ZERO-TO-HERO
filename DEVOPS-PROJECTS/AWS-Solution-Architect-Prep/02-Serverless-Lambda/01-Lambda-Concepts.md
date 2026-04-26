# Lambda & Serverless Concepts

## 1. AWS Lambda
Run code without provisioning or managing servers. You pay only for the compute time you consume.

### Execution Environment
- **Memory:** 128 MB to 10 GB. (CPU scales proportionally with Memory).
- **Timeout:** Max 15 minutes. (Not for long tasks).
- **Concurrency:** Limit of 1,000 concurrent executions per region (Soft limit, can be raised).

### Invocation Types
1. **Synchronous:** Client waits for response.
   - *Examples:* API Gateway, ALB, CLI.
   - *Error Handling:* Client handles retries.
2. **Asynchronous:** Client sends and leaves. Lambda queues the event.
   - *Examples:* S3 events, SNS, CloudWatch Events.
   - *Error Handling:* Built-in retries (twice). Configurable Dead Letter Queue (DLQ) for failed events.
3. **Event Source Mapping:** Polling a stream.
   - *Examples:* Kinesis, DynamoDB Streams, SQS.

## 2. Serverless Application Model (SAM)
An open-source framework for building serverless applications. Use a simplified YAML syntax to define functions, APIs, DBs.
- `SAM build` -> `SAM deploy` (Uses CloudFormation under the hood).

## 3. Serverless Patterns
- **Fan-out:** SNS -> Multiple Lambdas. (Publish once, process many ways).
- **S3 Trigger:** User uploads photo to S3 -> Lambda triggers to resize image -> Save to new bucket.
- **API Backend:** Client -> API Gateway -> Lambda -> DynamoDB.
