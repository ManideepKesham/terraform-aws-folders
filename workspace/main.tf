resource "aws_vpc" "mydemovpc"{
    cidr_block = var.network_info.vpccidr
    tags = {
        Name = var.network_info.vpcname
    }
}
resource "aws_subnet" "pubsubnets"{
    count = local.pub_sub_value
    vpc_id = aws_vpc.mydemovpc.id
    cidr_block = var.network_info.subnets[0].subnetcidr[count.index]
    availability_zone = var.network_info.subnets[0].subnetaz[count.index]
    tags = {
        Name = var.network_info.subnets[0].subnetname[count.index]
    }
    depends_on = [aws_vpc.mydemovpc]
}
resource "aws_route_table" "myroute"{
    vpc_id = aws_vpc.mydemovpc.id
    tags ={
        Name = "routetable"
    }
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.myigw.id
    }
    depends_on = [aws_vpc.mydemovpc]
}
resource "aws_internet_gateway" "myigw"{
    vpc_id = aws_vpc.mydemovpc.id
    tags = {
        Name = "igw"
    }
    depends_on = [aws_vpc.mydemovpc]
}
resource "aws_route_table_association" "roass"{
    count = local.pub_sub_value
    route_table_id = aws_route_table.myroute.id
    subnet_id = aws_subnet.pubsubnets[count.index].id
    depends_on = [aws_route_table.myroute,aws_subnet.pubsubnets]
}