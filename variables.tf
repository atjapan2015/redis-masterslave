## Copyright (c) 2020, Oracle and/or its affiliates. 
## All rights reserved. The Universal Permissive License (UPL), Version 1.0 as shown at http://oss.oracle.com/licenses/upl

variable "tenancy_ocid" {}
variable "user_ocid" {}
variable "fingerprint" {}
variable "private_key_path" {}
variable "region" {}
variable "compartment_ocid" {}
variable "availablity_domain_name" {}

variable "redis_master_count" {
  description = "Number of redis master instances"
  type        = number
  default     = 3
}

variable "redis_replica_count" {
  description = "Number of redis cluster replicas, availabe value are 0,1,2"
  type        = number
  default     = 1
}

variable "is_redis_cluster" {
  description = "true for redis cluster, false for master-slave"
  type        = bool
  default     = true
}

variable "release" {
  description = "Redis Manager Release"
  default     = "1.1"
}

variable "VCN-CIDR" {
  default = "10.0.0.0/16"
}

variable "Subnet-CIDR" {
  default = "10.0.1.0/24"
}

variable "redis_prefix" {
  default = "redis"
}

variable "redis_domain" {
  default = "oraclevcn.com"
}

variable "redis_version" {
  default = "stable"
}

variable "redis_port1" {
  default = "6379"
}

variable "redis_port2" {
  default = "16379"
}

variable "sentinel_port" {
  default = "26379"
}

variable "ssh_public_key" {
  default = ""
}

variable "global_password" {
  default = ""
}

variable "instance_os" {
  description = "Operating system for compute instances"
  default     = "Oracle Linux"
}

variable "linux_os_version" {
  description = "Operating system version for all Linux instances"
  default     = "7.9"
}

variable "instance_shape" {
  description = "Instance Shape"
  default     = "VM.Standard3.Flex"
}

variable "instance_flex_shape_ocpus" {
  default = 1
}

variable "instance_flex_shape_memory" {
  default = 8
}

variable redis_manager_tag_namespace_name {
  default = "RedisManager\\deploy-redis-cluster-a7b1"
}

variable redis_manager_tag_namespace_id {
  default = ""
}

variable redis_manager_tag_name {
  default = "release"
}

variable "virtual_network_redis_vcn_id" {
  default = ""
}

variable "subnet_redis_subnet_id" {
  default = ""
}

# Dictionary Locals
locals {
  compute_flexible_shapes = [
    "VM.Standard3.Flex",
    "VM.Standard.E3.Flex"
  ]
}

# Checks if is using Flexible Compute Shapes
locals {
  is_flexible_node_shape = contains(local.compute_flexible_shapes, var.instance_shape)
}

