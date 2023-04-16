variable "region" {
  description = "Please Provide the AWS Region where you want to deploy."
  default = "us-east-1"
}

variable "access_key" {
  description = "Please Provide the AWS access key to communicate with your aws account."
}

variable "secret_key" {
  description = "Please Provide the AWS secret key associate with above access key."
}

variable "aws_eks_cluster_config" {}

variable "eks_node_group_config" {}