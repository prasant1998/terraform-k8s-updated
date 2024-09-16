variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the node group"
  type        = string
}

variable "subnet_ids" {
  description = "The IDs of the subnets for the EKS cluster"
  type        = list(string)
}

variable "node_group_name" {
  description = "The name of the node group"
  type        = string
}

variable "cluster_security_group_id" {
  description = "The security group ID for the EKS cluster"
  type        = string
}

variable "node_security_group_id" {
  description = "The security group ID for the EKS node group"
  type        = string
}
