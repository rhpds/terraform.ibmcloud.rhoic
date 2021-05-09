locals {
  ZONE = "${var.ibmcloud_region}-${var.ibmcloud_zone}"
}

resource "ibm_container_vpc_cluster" "rhpds_cluster" {
  name              = var.cluster_name
  vpc_id            = data.ibm_is_vpc.rhpds.id
  kube_version      = var.cluster_version
  flavor            = var.cluster_flavor
  worker_count      = var.cluster_worker_count
  resource_group_id = data.ibm_resource_group.rhpds.id
  cos_instance_crn  = var.cos_instance_crn
  wait_till         = "OneWorkerNodeReady"
  entitlement       = "cloud_pak"
  zones {
    subnet_id = data.ibm_is_subnet.rhpds.id
    name      = local.ZONE
  }
}
