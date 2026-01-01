data "aws_vpc" "mydefaultvpc"{
    default = true
}
resource "aws_security_group" "mydefaultsg"{
    name = "securitygroup"
    description ="for creating sg"
    vpc_id = data.aws_vpc.mydefaultvpc.id
}

resource "aws_vpc_security_group_ingress_rule" "myingress"{
    security_group_id = aws_security_group.mydefaultsg.vpc_id
    from_port = 22
    ip_protocol = "tcp"
    to_port = 22
    cidr_ipv4 = "0.0.0.0/0"
}