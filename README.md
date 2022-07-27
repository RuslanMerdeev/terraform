# terraform
Repository to determine infrastructure through Terraform using GitHub Actions

## infrastructure
Infrastructure consists of:
* VPC with security group
* Private subnet, included in VPC
* EC2 instances, included in Private subnet
* Group of users with attached IAM policies
* Users with IAM access keys, included in group
* VPN endpoints for appropriate users, attached to Private subnet

## quick start
To make project deployable need to:
1. Create AWS account and get AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY from there
2. Choose region (AWS_REGION) and choose AMI (AWS_AMI) for it
3. Create TerraformCloud account and create Organization and Workspace there (User Settings -> Organizations)
4. Change Execution mode from Remote to Local (choose Organization -> choose Workspace -> Settings -> General)
5. Create API Token (TF_API_TOKEN) and remember it (User Settings -> Tokens)
6. Put AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION, AWS_AMI and TF_API_TOKEN to GitHub Repository secrets (Settings -> Secrets)

## workflow
There are two workflows, run by GitHub Actions:
* Terraform plan: on pull request to master branch (or new commit to branch that has already had pull request). Goes till plan stage.
* Terraform apply: on pull request confirmation (or new commit to master branch). Goes till apply stage.

## local terraform run
To make it possible to run terraform commands without GitHub Actions need to:
1. Setup VPN Application to PC (Urban VPN from AppStore, for example)
2. Setup Terraform CLI and AWS CLI
3. Open Terminal and change directory to local cloned GitHub repository with main.tf
4. In local repository create file terraform.tfvars with following content:
>aws_region = <chosen_region>\
aws_ami = <chosen_ami>
5. Make "terraform login". It causes to create another one API Token in TerraformCloud. Do it and remember token
6. Paste token to Terminal
7. Make "terraform init"
8. Make "terraform validate"
9. Make "terraform plan"
10. Optionally make "terraform apply"
11. To destroy make "terraform destroy"