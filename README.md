# quickstart-cloudbees-ci
## CloudBees CI on the AWS Cloud


This Quick Start deploys CloudBees Continuous Integration (CI) on the Amazon Web Services (AWS) Cloud, to provide a continuous integration and continuous delivery (CI/CD) solution that’s based on Jenkins and integrated with Amazon Elastic Container Service for Kubernetes (Amazon EKS).

The Quick Start sets up a CI/CD environment, according to AWS best practices, including high availability, automatic scaling, segregation of agent workloads, and Kubernetes-native integration with Amazon Elastic Compute Cloud (Amazon EC2) Spot Instances.

This deployment uses CloudFormation templates that automatically deploy CloudBees CI in about 45 minutes in your AWS account. After you deploy the Quick Start, you can use Jenkins plugins to add functionality to your CI/CD environment.

The Quick Start offers two deployment options:

- Deploying CloudBees CI into a new virtual private cloud (VPC) on AWS
- Deploying CloudBees CI into an existing VPC on AWS

You can also use the AWS CloudFormation templates as a starting point for your own implementation.

![Quick Start architecture for CloudBees CI on AWS](https://d1.awsstatic.com/partner-network/QuickStart/datasheets/cloudbees-core-architecture-on-aws.f458a95880735d9329884e9ea2673c85a56abd9b.png)

For architectural details, best practices, step-by-step instructions, and customization options, see the 
[deployment guide](https://fwd.aws/dany3).

To post feedback, submit feature ideas, or report bugs, use the **Issues** section of this GitHub repo.
If you'd like to submit code for this Quick Start, please review the [AWS Quick Start Contributor's Kit](https://aws-quickstart.github.io/).
