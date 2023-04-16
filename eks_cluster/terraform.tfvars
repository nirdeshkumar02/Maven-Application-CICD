eks_cluster_role_name = "eks-cluster-role"
eks_cluster_name = "cicd-cluster"
kubernetes_version = "1.24"
subnet_ids = ["subnet-0754370ab4af22554", "subnet-08913a6bd2cd945da", "subnet-0fa5393989fdcf8fe", "	subnet-007730aa686cc8794"]
eks_cluster_tags = {
    "Name" = "cicd-cluster"
}
eks_node_tags = {
    "Name" = "cicd-cluster-node"
}
eks_node_role_name = "eks-node-role"
eks_node_group_name = "cicd-node"