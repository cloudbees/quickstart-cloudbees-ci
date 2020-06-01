# quickstart-cloudbees-core
## CloudBees Core on the AWS Cloud


This Quick Start deploys CloudBees Core on the Amazon Web Services (AWS) Cloud, to provide a continuous integration and continuous delivery (CI/CD) solution that’s based on Jenkins and integrated with Amazon Elastic Container Service for Kubernetes (Amazon EKS).

The Quick Start sets up a CI/CD environment that meets architectural best practices, including high availability, automatic scaling, segregation of agent workloads, and Kubernetes-native integration with Amazon Elastic Compute Cloud (Amazon EC2) Spot Instances.

The Quick Start is automated by AWS CloudFormation templates that deploy CloudBees Core in about 45 minutes in your AWS account. After you deploy the Quick Start, you can use Jenkins plugins to add functionality to your CI/CD environment.

The Quick Start offers two deployment options:

- Deploying CloudBees Core into a new virtual private cloud (VPC) on AWS
- Deploying CloudBees Core into an existing VPC on AWS

You can also use the AWS CloudFormation templates as a starting point for your own implementation.

![Quick Start architecture for CloudBees Core on AWS](https://d0.awsstatic.com/partner-network/QuickStart/datasheets/cloudbees-core-architecture-on-aws.png)

For architectural details, best practices, step-by-step instructions, and customization options, see the 
[deployment guide](https://aws-quickstart.s3.amazonaws.com/quickstart-cloudbees-core/doc/cloudbees-core-on-the-aws-cloud.pdf).

To post feedback, submit feature ideas, or report bugs, use the **Issues** section of this GitHub repo.
If you'd like to submit code for this Quick Start, please review the [AWS Quick Start Contributor's Kit](https://aws-quickstart.github.io/). 
