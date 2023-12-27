# resource "aws_eks_addon" "csi_driver" {
#   depends_on               = [aws_iam_role_policy_attachment.ebs_csi_iam_role_policy_attach]
#   cluster_name             = aws_eks_cluster.eks_cluster.name
#   addon_name               = "aws-ebs-csi-driver"
#   service_account_role_arn = aws_iam_role.eks_ebs_csi_driver.arn
# }