# Set the root directory
$root_dir = "learning-journal"

# Create the directory structure
Write-Host "Creating directory structure..."
New-Item -ItemType Directory -Path $root_dir | Out-Null
New-Item -ItemType Directory -Path "$root_dir\ec2" | Out-Null
New-Item -ItemType Directory -Path "$root_dir\cloudformation" | Out-Null
New-Item -ItemType Directory -Path "$root_dir\kubernetes" | Out-Null
New-Item -ItemType Directory -Path "$root_dir\security" | Out-Null
New-Item -ItemType Directory -Path "$root_dir\scripts" | Out-Null

# Create index.md
Write-Host "Creating index.md..."
@"
# Learning Journal

## Table of Contents

- [EC2](ec2/)
- [CloudFormation](cloudformation/)
- [Kubernetes](kubernetes/)
- [Security](security/)
- [Scripts](scripts/)
"@ | Out-File -FilePath "$root_dir\index.md"

# Create example ec2 markdown file.
Write-Host "Creating example ec2 markdown file..."
@"
# EC2 Instance Launch

This document covers how to launch an EC2 instance.
"@ | Out-File -FilePath "$root_dir\ec2\ec2-instance-launch.md"

# Create example cloudformation markdown file.
Write-Host "Creating example cloudformation markdown file..."
@"
# CloudFormation Basic Template

Basic CloudFormation template example.
"@ | Out-File -FilePath "$root_dir\cloudformation\cloudformation-basic-template.md"

# Create example kubernetes markdown file.
Write-Host "Creating example kubernetes markdown file..."
@"
# EKS Cluster Setup

This document covers how to setup an EKS cluster.
"@ | Out-File -FilePath "$root_dir\kubernetes\eks-cluster-setup.md"

# Create example security markdown file.
Write-Host "Creating example security markdown file..."
@"
# IAM Roles

This document covers IAM roles.
"@ | Out-File -FilePath "$root_dir\security\iam-roles.md"

# Create example python script file.
Write-Host "Creating example python script file..."
@"
# example python script

# example script.
"@ | Out-File -FilePath "$root_dir\scripts\boto3-ec2-script.py"

Write-Host "Directory structure created successfully."