# The Cloud Resume Challenge (AWS)

This is the **#1 Project** recommended for aspiring Cloud/DevOps Engineers. It forces you to touch Frontend, Backend, Infrastructure as Code, and CI/CD.

## The Goal
Host your resume as a static website on AWS, using HTTPS, custom domain, and a visitor counter.

## The Architecture
1.  **Frontend**: HTML/CSS Resume.
2.  **Hosting**: AWS S3 (Bucket website hosting).
3.  **Security/Speed**: AWS CloudFront (CDN) with HTTPS.
4.  **Database**: DynamoDB (to store visitor count).
5.  **API**: API Gateway + Lambda (Python) to update the count.
6.  **IaC**: Terraform or SAM to provision everything.
7.  **CI/CD**: GitHub Actions to deploy automatically on push.

## Step-by-Step Guide

### Phase 1: The Website
1.  Write your resume in `index.html`.
2.  Style it with `style.css`.
3.  Create an S3 bucket and upload the files.
4.  Enable "Static Website Hosting" in S3 properties.

### Phase 2: Domain & HTTPS
1.  Buy a cheap domain (Namecheap/GoDaddy) or utilize a free one if you learn how.
2.  Create a CloudFront Distribution pointing to your S3 bucket.
3.  Request an SSL certificate via AWS ACM (Amazon Certificate Manager).

### Phase 3: The Backend (Visitor Counter)
1.  **DynamoDB**: Create a table `VisitorCount` with a key `id`.
2.  **Lambda**: Write a Python function that:
    - Reads the current count from DynamoDB.
    - Increments it by 1.
    - Returns the new count.
3.  **API Gateway**: Create an API that triggers the Lambda function.

### Phase 4: Automation (The DevOps Part)
1.  **Frontend CI/CD**: Create a GitHub Action that syncs your HTML/CSS to S3 whenever you push content.
2.  **Backend IaC**: (Optional but Recommended) Write Terraform code to create the Lambda and API Gateway so you can destroy/recreate it easily.

## Why this gets you hired?
It proves you didn't just watch a tutorial. You actually connected the dots between networking, security, coding, and cloud.
