network_info = {
      vpccidr = "192.168.0.0/16"
      vpcname = "myvpc"
      prsubnet = [{
        subnetcidr = ["192.168.0.0/24","192.168.1.0/24"]
        subnetaz = ["ap-south-1a","ap-south-1b"]
        subnetname = ["prsub1","prsub2"]
      }]
       routetable = ({
        routename = "myroute"
        routecidr = "0.0.0.0/0"
       })
    }