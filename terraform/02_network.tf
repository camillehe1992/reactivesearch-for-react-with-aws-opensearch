resource "aws_security_group" "opensearch" {
  name   = var.os_security_group_name
  vpc_id = data.aws_vpc.main.id

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      data.aws_vpc.main.cidr_block,
    ]
  }

  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      var.local_ip_address,
    ]
  }
}
