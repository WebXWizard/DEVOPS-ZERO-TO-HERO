# Module 14 | Python for DevOps

Python is the preferred scripting language for DevOps due to its readability, powerful libraries, and cross-platform support.

## 🐍 Python Automation Libraries

| Library | Use Case | Importance |
| :--- | :--- | :--- |
| **Boto3** | AWS SDK for Python. | Provisioning and managing AWS resources. |
| **Requests** | Making HTTP requests to APIs. | Testing and monitoring application health. |
| **Os / Sys** | Interacting with the OS/Interpreter. | Managing files, users, and environment variables. |
| **Subprocess** | Running shell commands from Python. | Automating legacy scripts or CLI tools. |
| **Flask/FastAPI**| Creating simple web servers. | Building microservices or internal tools. |

## 🚀 Scripting Workflow for DevOps

```mermaid
graph LR
    Define[Define Task: Automate S3] -- "Write Code" --> Python[Python: Boto3 Script]
    Python -- "Test Locally" --> Local[Local Success]
    Local -- "Run in CI/CD" --> Pipeline[Jenkins/GitHub Actions]
    Pipeline -- "Deploy" --> Cloud[AWS Infrastructure]
```

## 📜 Example Python Script (S3 Bucket Creator)

```python
import boto3

def create_bucket(bucket_name):
    s3 = boto3.client('s3')
    try:
        s3.create_bucket(Bucket=bucket_name)
        print(f"Bucket {bucket_name} created successfully.")
    except Exception as e:
        print(f"Error creating bucket: {e}")

if __name__ == "__main__":
    create_bucket('my-new-devops-bucket')
```

---
**Preparation Tip**: Be ready to explain why we use **Python** over **Shell Scripts** for complex automation.
- **Python**: Scalable, handles exceptions better, and has a rich library ecosystem.
- **Shell**: Great for quick tasks, but can be difficult to maintain for large projects.
