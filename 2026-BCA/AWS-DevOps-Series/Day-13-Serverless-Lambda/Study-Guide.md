# Day 13: Serverless Applications with AWS Lambda ⚡🛠️

AWS Lambda is a serverless, event-driven compute service that lets you run code for virtually any type of application or backend service without provisioning or managing servers.

## ☁️ Serverless vs. Provisioned Compute

| Feature | Provisioned (EC2) | Serverless (Lambda) |
| :--- | :--- | :--- |
| **Idle Costs** | You pay for the EC2 instance 24/7, even if no one is using your app. | You pay exactly $0.00 when the code is not running. |
| **Scaling** | Must configure Auto Scaling Groups, define rules, and wait for instances to boot. | Native, automatic scaling. Scales precisely with the size of the workload. |
| **Maintenance** | You are responsible for OS updates, security patches, and network config. | AWS handles all underlying infrastructure maintenance. |
| **Execution** | Long-running processes. | Short-lived executions (maximum 15-minute timeout). |

## ⚡ How Lambda Works (Event-Driven Architecture)

Lambda functions are triggered by events. They execute their code and then immediately spin down.

```mermaid
graph LR
    subgraph Trigger Sources
        API[API Gateway (HTTP Request)]
        S3[S3 Bucket (File Uploaded)]
        DB[DynamoDB Stream (Data Changed)]
        Event[EventBridge (Scheduled Cron)]
    end

    Trigger Sources -- Triggers --> Lambda((AWS Lambda Function))

    subgraph Destinations
        SNS[SNS Topic (Send Email)]
        Dynamo[DynamoDB (Write Record)]
        Red[External API (Stripe/Twilio)]
    end

    Lambda -- Writes/Sends --> Destinations
```

## ✍️ Writing and Deploying Lambda Functions

Lambda supports multiple languages natively: Node.js, Python, Java, Go, Ruby, and C#.

### Anatomy of a Lambda Function (Python Example)

```python
import json

# The 'handler' is the method AWS calls when the function is triggered
def lambda_handler(event, context):
    
    # 'event' contains the data about the trigger (e.g., HTTP request body)
    name = event.get('name', 'World')
    
    # Do some processing...
    message = f"Hello from Serverless, {name}!"
    
    # Return a response (especially if integrated with API Gateway)
    return {
        'statusCode': 200,
        'body': json.dumps({'message': message})
    }
```

## 📈 Monitoring and Limits

**Monitoring**: Lambda is deeply integrated with CloudWatch out of the box.
*   All `print()` statements in a Python Lambda are automatically sent to CloudWatch Logs.
*   CloudWatch Metrics automatically tracks invocation count, error rate, and execution duration.

**Important Limits**:
*   Maximum execution duration: 15 minutes.
*   Maximum deployment package size: 50 MB (zipped), 250 MB (unzipped). 
*   Memory allocation: 128 MB to 10 GB. *(Note: CPU power scales linearly with memory allocation).*

## 🛠️ Typical Use Cases in DevOps

1. **Infrastructure Automation**: Running Python/Boto3 scripts securely without a cron server (e.g., auto-tagging new EC2 instances).
2. **Web Backends**: Creating REST APIs using API Gateway + Lambda.
3. **Data Processing**: Automatically resizing images as soon as they are uploaded to an S3 bucket.
