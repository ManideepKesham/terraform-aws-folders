locals {
  pub_sub_value = length(var.network_info.subnets[0].subnetcidr)
}