output "vpc_id" {
    value = aws_vpc.myvpc.id  
}
output "subnet_ids" {
    value = aws_subnet.pubsubnets[0].id
  
}
output "route_table" {
    value = aws_route_table.myroute.id
  
}
output "intergateway" {
    value = aws_internet_gateway.myig.id
  
}
output "instance_id" {
    value = aws_instance.myec2.id  
}