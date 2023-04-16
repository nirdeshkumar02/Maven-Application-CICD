module "eks_cluster" {
  source = "./modules/eks_cluster"
  
  eks_cluster_role_name = var.eks_cluster_role_name
  eks_cluster_name = var.eks_cluster_name
  kubernetes_version = var.kubernetes_version
  subnet_ids = var.subnet_ids
  eks_cluster_tags = var.eks_cluster_tags
}

module "eks_node" {
  source = "./modules/eks_node"

  eks_node_role_name = var.eks_node_role_name
  eks_cluster_name = var.eks_cluster_name
  eks_node_group_name = var.eks_node_group_name
  subnet_ids = var.subnet_ids
  kubernetes_version = var.kubernetes_version
  eks_node_tags = var.eks_node_tags
}

