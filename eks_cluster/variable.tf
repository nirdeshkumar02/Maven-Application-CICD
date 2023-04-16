variable "region" {
  description = "Please Provide the AWS Region where you want to deploy."
}

variable "access_key" {
  description = "Please Provide the AWS access key to communicate with your aws account."
}

variable "secret_key" {
  description = "Please Provide the AWS secret key associate with above access key."
}

variable "eks_cluster_role_name" {}

variable "eks_cluster_name" {}

variable "eks_cluster_tags" {}

variable "kubernetes_version" {}

variable "subnet_ids" {}

variable "eks_node_role_name" {}

variable "eks_node_group_name" {}

variable "eks_node_tags" {}











