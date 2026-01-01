output "vpcid"{
    value = aws_vpc.vpc.id
}
output "prsubnetsids"{
    value = aws_subnet.prsubnets[*].id
}
output "routeid"{
    value = aws_route_table.route.id
}
output "natid"{
    value = aws_nat_gateway.mynat[0].id
}