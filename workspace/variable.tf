variable "network_info" {
    description = "detailsto create vpc and subnets"
    type = object({
        vpccidr = string
        vpcname = string
        subnets = list(object({
            subnetcidr = list(string)
            subnetaz = list(string)
            subnetname = list(string)
        }))
    })
}