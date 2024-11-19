data "ibm_resource_group" "rg" {
  name = var.resource_group
}

data "ibm_is_vpc" "vpc" {
  name = var.vpc_name
}

data "ibm_is_subnet" "subnet" {
  name = var.subnet_name
}

locals {
  ZONE = "${var.ibmcloud_region}-${var.ibmcloud_zone}"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = var.cos_name
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
  resource_group_id = data.ibm_resource_group.rg.id
}

resource "ibm_container_vpc_cluster" "cluster" {
  name              = var.cluster_name
  vpc_id            = data.ibm_is_vpc.vpc.id
  kube_version      = var.cluster_version
  flavor            = var.cluster_flavor
  worker_count      = var.cluster_worker_count
  resource_group_id = data.ibm_resource_group.rg.id
  cos_instance_crn  = ibm_resource_instance.cos_instance.id
  wait_till         = "OneWorkerNodeReady"
  zones {
    subnet_id = data.ibm_is_subnet.subnet.id
    name      = local.ZONE
  }
}

data "ibm_container_cluster_config" "cluster_config" {
  cluster_name_id = ibm_container_vpc_cluster.cluster.id
}
