module "eks_cluster" {
  source = "./modules/eks_cluster"

  for_each = var.aws_eks_cluster_config

  eks_cluster_name      = each.value.eks_cluster_name
  subnet_ids            = each.value.subnet_ids
  eks_cluster_role_name = each.value.eks_cluster_role_name
  kubernetes_version    = each.value.kubernetes_version
  tags                  = each.value.tags

}

module "eks_node" {
  source = "./modules/eks_node"

  for_each = var.eks_node_group_config

  eks_node_group_name = each.value.eks_node_group_name
  eks_cluster_name    = module.eks_cluster[each.value.eks_cluster_name].eks_cluster_name
  subnet_ids          = each.value.subnet_ids
  eks_node_role_name  = each.value.eks_node_role_name
  tags                = each.value.tags
  kubernetes_version  = each.value.kubernetes_version
}

