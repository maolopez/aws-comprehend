# aws-comprehend
terraform deploying AWS Comprehend and additional related infrastructure

Drop your training data in app/Train.csv . Also, READ app/list_of_errors.txt

Amazon Comprehend requires the CSV file to be in a specific format for document classification:

The CSV file should not have a header row. However, the model is "text", "label" or viceversa.

Each subsequent row should contain a single document (text) and its corresponding label.

The labels should be mutually exclusive, meaning each document can only have one label.


INSTRUCTIONS
------------------

cd aws-comprehend/app/

terraform init

terraform validate

terraform plan  #More info in app/terraform_plan.txt

terraform apply auto-approve


EXPECTATIONS
------------------

You can view the infrastructure created by Terraform in the AWS Management Console. Here are the specific locations to check for each resource:


S3 Bucket:

Navigate to the S3 dashboard: https://s3.console.aws.amazon.com/s3/
Look for the bucket name you specified in your Terraform configuration.


Comprehend Document Classifier:

Navigate to the Amazon Comprehend dashboard: https://console.aws.amazon.com/comprehend/

Click on "Custom classification" in the left-hand menu.
Look for the classifier name you specified in your Terraform configuration.


IAM Role:

Navigate to the IAM dashboard: https://console.aws.amazon.com/iam/
Click on "Roles" in the left-hand menu.

Look for the role name you specified in your Terraform configuration.
By checking these locations, you should be able to see the infrastructure created by Terraform.


Additionally, you can also use the AWS CLI to list the resources created by Terraform. For example, you can use the following commands:

aws s3 ls to list S3 buckets

aws comprehend list-document-classifiers to list Comprehend document classifiers

aws iam list-roles to list IAM roles


Make sure to replace the resource names and IDs with the actual values specified in your Terraform configuration.


REFERENCES
------------------

https://github.com/maolopez/aws-capstone-kubernetes-mgl

https://github.com/maolopez/aws-capstone-pipeline-mgl

https://github.com/maolopez/aws-capstone