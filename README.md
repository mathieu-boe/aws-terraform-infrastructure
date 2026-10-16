# AWS Terraform Infrastructure

An infrastructure-as-code project built as part of my hands-on AWS and DevOps portfolio. This project extends the [Containerised Operations API](https://github.com/mathieu-boe/containerised-operations-api) by developing the AWS infrastructure required to host, secure, and monitor the application using Terraform.

## Objectives

- Provision and manage AWS infrastructure using Terraform.
- Apply least-privilege IAM permissions and secure network configuration.
- Build a VPC and supporting networking resources for the application.
- Deploy the Containerised Operations API to an EC2 instance using Docker.
- Use Amazon S3 for a defined infrastructure or operational artifact storage use case.
- Configure CloudWatch monitoring, logs, metrics, and alarms.
- Automate Terraform formatting and validation using GitHub Actions.
- Practise infrastructure planning, change review, deployment, and resource cleanup.
- Document security considerations, deployment procedures, and AWS cost management.

## Current status

Milestone 1 — Repository setup and Terraform foundation (in progress)

- [x] Independent repository created for Project 3.
- [x] Existing local repository connected to GitHub.
- [x] Initial Terraform configuration files created.
- [x] `.gitignore` configured to exclude Terraform state, plans, and local configuration files.
- [x] Terraform and AWS provider requirements defined.
- [x] AWS provider configured to use a variable for the deployment region.
- [x] Environment variable validation added.
- [x] Initial Terraform configuration validated locally.
- [ ] README and initial project documentation completed.
- [ ] Initial Git commit created and pushed to GitHub.

Milestone 2 — AWS networking and security (planned)

- [ ] VPC and subnet configuration implemented.
- [ ] Internet connectivity and routing configured where required.
- [ ] Security groups configured with restricted inbound access.
- [ ] IAM roles and policies implemented using least-privilege principles.
- [ ] Terraform plan reviewed before any deployment.
- [ ] Networking and security configuration validated.

Milestone 3 — Compute and container deployment (planned)

- [ ] EC2 instance provisioned using Terraform.
- [ ] Docker runtime and application deployment configured.
- [ ] Containerised Operations API deployed to the EC2 instance.
- [ ] Application access restricted to the required network paths.
- [ ] API health endpoint tested against the deployed application.
- [ ] Deployment and troubleshooting procedures documented.

Milestone 4 — Amazon S3 and operational storage (planned)

- [ ] S3 use case and storage requirements documented.
- [ ] S3 bucket provisioned using Terraform.
- [ ] Public access blocked.
- [ ] Appropriate encryption and access controls configured.
- [ ] Storage behaviour and permissions validated.
- [ ] Any required retention or cleanup approach documented.

Milestone 5 — Monitoring and observability (planned)

- [ ] CloudWatch monitoring requirements defined.
- [ ] Relevant EC2 metrics reviewed.
- [ ] CloudWatch alarms configured for selected operational thresholds.
- [ ] Application logging approach documented and implemented where appropriate.
- [ ] Monitoring and alerting behaviour validated.
- [ ] Operational troubleshooting guidance documented.

Milestone 6 — Continuous integration and documentation (planned)

- [ ] GitHub Actions workflow created for Terraform quality checks.
- [ ] Terraform formatting checks configured.
- [ ] Terraform configuration validation configured.
- [ ] Provider and Terraform version requirements reviewed.
- [ ] README updated with verified setup, deployment, and cleanup instructions.
- [ ] All local checks passing.
- [ ] GitHub Actions checks passing.
- [ ] Repository committed and pushed to GitHub.

## Development

The project uses Terraform to define AWS infrastructure as code. The planned environment includes IAM, VPC networking, EC2, S3, and CloudWatch, with Docker used to run the Containerised Operations API.

Terraform configuration is developed and validated locally before any AWS resources are provisioned. AWS credentials are supplied through an appropriate local authentication mechanism rather than committed to version control.

### Repository structure

```text
.
├── .github/
│   └── workflows/
├── .gitignore
├── README.md
├── main.tf
├── outputs.tf
├── providers.tf
├── variables.tf
└── versions.tf
```

The structure will expand as the infrastructure and automation are implemented.

### Prerequisites

- Linux or WSL2 with Ubuntu
- Git
- Terraform CLI
- AWS CLI
- An AWS account and an appropriate authenticated identity when deploying resources
- Docker for application containerisation and testing

### Terraform configuration

The project defines the required Terraform and AWS provider versions in `versions.tf`. The AWS provider configuration in `providers.tf` uses variables to select the deployment region and environment.

The default deployment region is `eu-west-2` (London), and the default environment is `dev`.

### Initialise Terraform

Run from the repository root:

```bash
terraform init
```

Initialisation downloads the required provider plugins and prepares the working directory. It does not provision AWS infrastructure.

To initialise without configuring a backend:

```bash
terraform init -backend=false
```

### Format and validate the configuration

Check Terraform formatting:

```bash
terraform fmt -check -recursive
```

Apply canonical formatting when necessary:

```bash
terraform fmt -recursive
```

Validate the configuration:

```bash
terraform validate
```

Validation checks the Terraform configuration for structural and configuration errors. It does not confirm that AWS permissions are sufficient or that a deployment will succeed.

### Review infrastructure changes

Once deployable infrastructure has been implemented and AWS authentication is configured, generate a plan:

```bash
terraform plan
```

Review the proposed changes before applying them. Do not apply infrastructure until resource requirements, permissions, network exposure, and expected costs have been assessed.

## Related project

This infrastructure is intended to host the application developed in the [Containerised Operations API](https://github.com/mathieu-boe/containerised-operations-api) repository.

The API builds on the [Infrastructure Automation Toolkit](https://github.com/mathieu-boe/python-infrastructure-toolkit), which provides reusable infrastructure health-check and monitoring functionality.

## Security and cost

- Never commit AWS credentials, access keys, secrets, Terraform state, or sensitive variable files.
- Prefer temporary AWS credentials and IAM roles over long-lived access keys.
- Apply least-privilege IAM policies and restrict inbound network access.
- Keep S3 buckets private and enable appropriate encryption and access controls.
- Review Terraform plans before applying changes.
- Protect Terraform state if a remote backend is introduced.
- Monitor AWS spending and use cost controls appropriate to the account.
- Remove resources when they are no longer required, after reviewing dependencies and the intended cleanup.
- Remember that EC2 instances, storage, networking, logs, and monitoring resources may incur charges.

This is a learning project. Production deployment would require additional security controls, availability planning, monitoring, operational procedures, and a reviewed infrastructure lifecycle.
