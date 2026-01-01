variable "network_info" {
  description = "about public subnets"
  type = object({
    cidr_vpc  = string
    cidr_name = string
    subnets = list(object({
      subnetcidr = list(string)
      subnetaz   = list(string)
      subnetname = list(string)
    }))

  })

  default = {
    cidr_vpc  = "192.168.0.0/16"
    cidr_name = "mydemovpc"
    subnets = [{
      subnetcidr = ["192.168.0.0/24", "192.168.1.0/24"]
      subnetaz   = ["ap-south-1a", "ap-south-1b"]
      subnetname = ["pubsub1", "pubsub2"]
    }]

  }

}