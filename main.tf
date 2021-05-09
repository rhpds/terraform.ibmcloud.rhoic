data "ibm_resource_group" "rhpds" {
  name = var.resource_group
}

data "ibm_is_vpc" "rhpds" {
  name = var.vpc_name
}

data "ibm_is_subnet" "rhpds" {
    name = "${var.vpc_name}-sn"
}
