locals {
  ZONE = "${var.ibmcloud_region}-${var.ibmcloud_zone}"
}

resource "ibm_resource_instance" "cos_instance" {
  name     = var.cos_name
  service  = "cloud-object-storage"
  plan     = "standard"
  location = "global"
}

resource "ibm_container_vpc_cluster" "rhpds" {
  name              = var.cluster_name
  vpc_id            = data.ibm_is_vpc.rhpds.id
  kube_version      = var.cluster_version
  flavor            = var.cluster_flavor
  worker_count      = var.cluster_worker_count
  resource_group_id = data.ibm_resource_group.rhpds.id
  cos_instance_crn  = ibm_resource_instance.cos_instance.id
  wait_till         = "IngressReady"
  zones {
    subnet_id = data.ibm_is_subnet.rhpds.id
    name      = local.ZONE
  }
}
