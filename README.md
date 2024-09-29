[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-white.svg)](https://choosealicense.com/licenses/unlicense/) [![GitHub pull-requests closed](https://img.shields.io/github/issues-pr-closed/kunduso/aws-lambda-layer-terraform)](https://GitHub.com/kunduso/aws-lambda-layer-terraform/pull/) [![GitHub pull-requests](https://img.shields.io/github/issues-pr/kunduso/aws-lambda-layer-terraform)](https://GitHub.com/kunduso/aws-lambda-layer-terraform/pull/) 
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/kunduso/aws-lambda-layer-terraform)](https://github.com/kunduso/aws-lambda-layer-terraform/issues?q=is%3Aissue+is%3Aclosed) [![GitHub issues](https://img.shields.io/github/issues/kunduso/aws-lambda-layer-terraform)](https://GitHub.com/kunduso/aws-lambda-layer-terraform/issues/)
[![terraform-infra-provisioning](https://github.com/kunduso/aws-lambda-layer-terraform/actions/workflows/terraform.yml/badge.svg?branch=main)](https://github.com/kunduso/aws-lambda-layer-terraform/actions/workflows/terraform.yml) [![checkov-static-analysis-scan](https://github.com/kunduso/aws-lambda-layer-terraform/actions/workflows/code-scan.yml/badge.svg?branch=main)](https://github.com/kunduso/aws-lambda-layer-terraform/actions/workflows/code-scan.yml)
![Image](https://skdevops.files.wordpress.com/2024/09/102-image-0.png)

## Introduction
This repository contains the necessary Terraform configurations to create an AWS Lambda layer to manage Python3.10 library dependencies. The mechanism can also be used to manage other supported Lambda runtimes.

A **Lambda layer** is a distribution mechanism for libraries, custom runtimes, or other dependencies required in the AWS Lambda functions. Cloud engineers can manage and reuse these libraries and dependencies across multiple functions by packaging them into a layer. 

Please refer to [Create AWS Lambda Layer using Docker, Terraform and GitHub Actions](https://skundunotes.com/2024/09/29/create-aws-lambda-layer-using-docker-terraform-and-github-actions/) for details.

The repository utilizes **Bridgecrew Checkov** to scan the Terraform code for security vulnerabilities. For those interested in adding code scanning capabilities to their GitHub Actions pipeline, a guide is available at [Automate Terraform Configuration Scan with Checkov and GitHub Actions](https://skundunotes.com/2023/04/12/automate-terraform-configuration-scan-with-checkov-and-github-actions/).

Infracost is employed to generate a cost estimate for building the architecture. To learn more about integrating Infracost estimates into a repository, refer to the note [Estimate AWS Cloud Resource Cost with Infracost, Terraform, and GitHub Actions](https://skundunotes.com/2023/07/17/estimate-aws-cloud-resource-cost-with-infracost-terraform-and-github-actions/).

The provisioning process of the resources is automated using a GitHub Actions pipeline. Detailed information on this can be found in the note [CI/CD with Terraform and GitHub Actions to Deploy to AWS](https://skundunotes.com/2023/03/07/ci-cd-with-terraform-and-github-actions-to-deploy-to-aws/).

## Prerequisites
To ensure the code functions without errors, an OpenID Connect identity provider must be created in Amazon Identity and Access Management (IAM) with a trust relationship established with the GitHub repository. A detailed explanation with steps can be found [here.](https://skundunotes.com/2023/02/28/securely-integrate-aws-credentials-with-github-actions-using-openid-connect/)

The `ARN` of the `IAM Role` and the `organization_id` of the AWS account are stored as GitHub secrets, which is referenced in the [`terraform.yml`](.github/workflows/terraform.yml) file. Both these are sensitive variables.

Additionally, since Infracost is used in this repository, the `INFRACOST_API_KEY` is also stored as a repository secret and is referenced in the GitHub Actions workflow file. The cost estimate process is managed using a GitHub Actions variable, `INFRACOST_SCAN_TYPE`, where the value is either `hcl_code` or `tf_plan`, depending on the type of scan desired.
<br />You can read about that at  [Integrate Infracost with GitHub Actions.](http://skundunotes.com/2023/07/17/estimate-aws-cloud-resource-cost-with-infracost-terraform-and-github-actions/)
## Usage
Ensure that the policy attached to the IAM role whose credentials are being used in this configuration has permission to create and manage all the AWS Cloud resources that are included in this repository.

If you want to check the pipeline logs, click on the **Build Badges** above the image in this ReadMe.

## Contributing
If you find any issues or have suggestions for improvement, feel free to open an issue or submit a pull request. Contributions are always welcome!

## License
This code is released under the Unlicense License. See [LICENSE](LICENSE).