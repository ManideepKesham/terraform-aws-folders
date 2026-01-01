network_info ={
    vpcname = "myprod"
    vpccidr = "10.0.0.0/16"
    subnets = [{
      subnetaz = ["ap-south-1a","ap-south-1b"]
      subnetcidr = ["10.0.0.0/24","10.0.1.0/24"]
      subnetname = ["prodsub1","prodsub2"]
    }]
}