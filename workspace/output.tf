output "vpc" {
    value = aws_vpc.mydemovpc.id
  
}
output "subnet"{
    value = aws_subnet.pubsubnets[*].id
}
output "routetable"{
    value = aws_route_table.myroute.id
}
output "igw"{
    value = aws_internet_gateway.myigw.id
}