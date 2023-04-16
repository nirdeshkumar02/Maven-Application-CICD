aws_eks_cluster_config = {
  "cicd-cluster" = {

    eks_cluster_name      = "cicd-cluster1"
    subnet_ids            = ["subnet-0754370ab4af22554", "subnet-08913a6bd2cd945da", "subnet-0fa5393989fdcf8fe", "	subnet-007730aa686cc8794"]
    kubernetes_version    = "1.25"
    eks_cluster_role_name = "eks-cluster-role"
    tags = {
      "Name" = "cicd-cluster"
    }
  }
}

eks_node_group_config = {

  "node1" = {

    eks_cluster_name    = "cicd-cluster"
    eks_node_group_name = "cicd-node"
    eks_node_role_name  = "eks-node-role"
    subnet_ids          = ["subnet-0754370ab4af22554", "subnet-08913a6bd2cd945da"]
    kubernetes_version  = "1.25"
    tags = {
      "Name" = "cicd-cluster-node"
    }
  }
}

