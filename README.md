# CI/CD Security Scanner

## About the Project

The **CI/CD Security Scanner** is all about bringing security into your DevOps pipeline. As we all know, security should never be an afterthought. This project automatically scans your Docker images and AWS resources for vulnerabilities right as they’re being built, helping you catch potential issues before they make it to production.

By integrating automated vulnerability checks into your CI/CD pipeline, you’ll be able to find security problems early and easily address them—without needing to worry about manual scanning or missed threats.

## Why This Project?

In modern development, it's essential to make security a part of every stage of your pipeline. Traditional security tools tend to work separately from the CI/CD process, which can cause delays in detecting and addressing vulnerabilities. This project solves that problem by embedding automated security checks into your CI/CD workflows, making it easier for teams to adopt security best practices from the get-go.

It integrates tools like Trivy for container scanning and Terraform for infrastructure management, ensuring your Docker images and AWS resources are as secure as possible throughout the build and deployment process.

## What’s Inside?

Here’s a quick breakdown of the key pieces of this project:

- **`iam.tf`**: A Terraform script that defines AWS IAM roles, policies, and user permissions. It helps secure access to your AWS resources and ensures only the right people (or services) have access to the infrastructure.
  
- **`sns.tf`**: Another Terraform script, this one sets up AWS Simple Notification Service (SNS) topics and subscriptions. You’ll use SNS to send notifications about vulnerabilities or issues during the CI/CD pipeline.

- **CI/CD Workflow**:
  - **GitHub Actions**: This is where the magic happens. The GitHub Actions workflow automates the process of building, testing, and scanning your Docker images for vulnerabilities. It also uses Terraform to create and manage AWS infrastructure.
  - **Trivy**: A security scanner that checks Docker images for known vulnerabilities. It looks at both the operating system and the libraries inside the container to make sure there are no potential security issues lurking.
  - **Terraform**: Used for managing your infrastructure. It takes care of provisioning AWS resources like IAM roles and SNS topics to handle security and alerting.

## How It Works

### 1. **GitHub Actions**: The heart of the project, GitHub Actions runs automatically every time you push code to the repository. It builds the Docker container, runs the Trivy scanner, and uses Terraform to create or manage AWS resources (like IAM roles and SNS topics).

### 2. **Trivy**: After building the Docker image, Trivy scans it for vulnerabilities. It checks for any known security issues in the image, whether they’re OS-level or from libraries in the container. If vulnerabilities are found, you get a detailed report.

### 3. **Terraform**: Terraform is used to provision and manage the necessary AWS resources:
   - **IAM**: Ensures only authorized users and services can access the resources.
   - **SNS**: Sends out notifications if any vulnerabilities are detected, so you can take action before they cause problems.

### 4. **AWS**: AWS services (like IAM and SNS) are used to manage permissions and send notifications when vulnerabilities are found. If anything goes wrong or if a security issue is detected, SNS will alert you so you can act quickly.

### How Everything Communicates

1. **GitHub Actions** is the orchestrator. Whenever you make a change to the code, GitHub Actions kicks off the pipeline. It builds the Docker image, runs the vulnerability scan, and manages AWS resources with Terraform.
2. **Trivy** scans the Docker image for vulnerabilities, and if it finds any, it creates a report.
3. **Terraform** provisions the AWS infrastructure like IAM roles and SNS topics to make sure everything is properly secured and set up to send notifications.
4. If Trivy detects any security issues, **SNS** sends alerts to notify the team so they can fix vulnerabilities before deployment.
