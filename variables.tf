variable "ibmcloud_region" {
  description = "Preferred IBM Cloud region to use for your infrastructure"
  default = "us-east"
}

variable "ibmcloud_zone" {
  description = "Preferred zone in the preferred IBM Cloud region"
  default = "3"
}

variable "resource_group" {
  default = "Default"
  description = "Define the resource group for the workload"
}

variable "vpc_name" {
  default = "rhpds-vpc"
  description = "Name of your VPC"
}

variable "cluster_name" {
  default = "rhpds-cluster"
  description = "Name of RHOIC Cluster"
}

variable "cluster_version" {
  default = "4.6.23_openshift"
  description = "Openshift Version for RHOIC Cluster"
}

variable "cluster_flavor" {
  default = "bx2.4x16"
  description = "Worker Flavor for RHOIC Cluster"
}

variable "cluster_worker_count" {
  default = "3"
  description = "Worker count per Zone for RHOIC Cluster"
}

variable "cos_instance_crn" {
  default = ""
  description = "Define the COS Instance CRN"
}
