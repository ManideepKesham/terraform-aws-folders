network_info = {
    vpccidr = "10.1.0.0/16"
    vpcname = "devvpc"
    subnets = [{
      subnetaz =["ap-south-1a","ap-south-1b"]
      subnetcidr = ["10.1.0.0/24","10.1.1.0/24"]
      subnetname = ["devpubsub1","devpubsub2"]
    }]
}