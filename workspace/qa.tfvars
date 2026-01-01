network_info = {
    vpccidr = "192.168.0.0/16"
    vpcname = "qavpc"
    subnets = [{
        subnetaz = ["ap-south-1a","ap-south-1c"]
        subnetcidr = ["192.168.0.0/24","192.168.1.0/24"]
        subnetname = ["qapubsub1","qapubsub2"]
    }]
}