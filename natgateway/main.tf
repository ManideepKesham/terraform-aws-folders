resource "aws_vpc" "vpc"{
    cidr_block = var.network_info.vpccidr
    tags ={
        Name = var.network_info.vpcname
    }
}

resource "aws_subnet" "prsubnets"{
    count = local.pr_sub_value
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.network_info.prsubnet[0].subnetcidr[count.index]
    availability_zone = var.network_info.prsubnet[0].subnetaz[count.index]
    tags = {
        Name = var.network_info.prsubnet[0].subnetname[count.index]
    }
    depends_on = [aws_vpc.vpc]

}
resource "aws_route_table" "route"{
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = var.network_info.routetable.routename
    }
    route {
        cidr_block = var.network_info.routetable.routecidr
        nat_gateway_id = aws_nat_gateway.mynat[0].id
    }
    depends_on = [aws_vpc.vpc]
}
resource "aws_nat_gateway" "mynat"{
    count = local.pr_sub_value
    connectivity_type = "private"
    subnet_id =aws_subnet.prsubnets[0].id
    tags = {
        Name = "Nat"
    }
    depends_on = [aws_subnet.prsubnets]

}

resource "aws_route_table_association" "myprsub"{
    count = local.pr_sub_value
    route_table_id = aws_route_table.route.id
    subnet_id = aws_subnet.prsubnets[0].id
    depends_on = [aws_route_table.route,aws_subnet.prsubnets]
    
}