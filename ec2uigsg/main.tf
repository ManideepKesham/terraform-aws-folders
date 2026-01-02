resource "aws_vpc" "myvpc" {
    cidr_block = var.network_info.vpccidr
    tags = {
      Name = var.network_info.vpcname
    }
  
}
resource "aws_subnet" "pubsubnets" {
    count = local.value
    vpc_id = aws_vpc.myvpc.id
    cidr_block = var.network_info.subnets[0].subnetcidr[count.index]
    availability_zone = var.network_info.subnets[0].subnetaz[count.index]   
     tags = {
        Name = var.network_info.subnets[0].subnetname[count.index]
    }
  
}
resource "aws_route_table" "myroute"{
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = var.network_info.routetable.routename
    }
    route {
        cidr_block = var.network_info.routetable.routecidr
        gateway_id = aws_internet_gateway.myig.id
    }

}
resource "aws_internet_gateway" "myig"{
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "myigec2"
    }
}
resource "aws_route_table_association" "myass"{
    count = local.value
    route_table_id = aws_route_table.myroute.id
    subnet_id = aws_subnet.pubsubnets[count.index].id
}
resource "aws_security_group" "mysg"{
    name = "sgec2"
    description = "about ec2 sg"
    vpc_id = aws_vpc.myvpc.id
    tags = {
        Name = "mysgec2"
    }
    
}
resource "aws_vpc_security_group_ingress_rule" "myingress"{
    security_group_id = aws_security_group.mysg.id
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
}
resource "aws_instance" "myec2"{
    ami = "ami-00ca570c1b6d79f36"
    instance_type = "t3.micro"
    key_name = aws_key_pair.mykeypair.key_name
    associate_public_ip_address = true
    subnet_id = aws_subnet.pubsubnets[0].id
    vpc_security_group_ids = [aws_security_group.mysg.id]
    tags = {
        Name = "myec2"
    }



}
resource "aws_key_pair" "mykeypair"{
    public_key = file("~/.ssh/id_ed25519.pub")
    key_name = "myec2key"
}