variable "network_info" {
    description = "about ec2 creation variables"
    type = object({
      vpccidr = string
      vpcname = string
      subnets = list(object({
        subnetcidr = list(string)
        subnetname = list(string)
        subnetaz = list(string)
      }))
      routetable = object({
        routename = string
        routecidr = string
      })
    })

    default = {
      vpccidr = "172.16.0.0/16"
      vpcname = "myec2vpc"
      subnets = [({
        subnetcidr = ["172.16.0.0/24","172.16.1.0/24"]
        subnetaz = ["ap-south-1a","ap-south-1b"]
        subnetname = ["pubsub1","pubsub2"]
      })]
      routetable = ({
        routename = "myrouteec2"
        routecidr = "0.0.0.0/0"
      })
    }

  
}