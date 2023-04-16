resource "aws_iam_role" "eks_role" {
  name = var.eks_cluster_role_name
  assume_role_policy = <<Policy
  {
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "eks.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
  }
  Policy
}

resource "aws_iam_role_policy_attachment" "amazon_eks_cluster_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.eks_role.name
}

resource "aws_iam_role_policy_attachment" "AmazonEC2ContainerRegistryReadOnly-EKS" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role = aws_iam_role.eks_role.name
}

resource "aws_eks_cluster" "eks" {
  name = var.eks_cluster_name
  role_arn = aws_iam_role.eks_role.arn
  version = var.kubernetes_version
  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true
    subnet_ids = var.subnet_ids
  }
  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_cluster_policy
  ]
  tags = var.eks_cluster_tags
}