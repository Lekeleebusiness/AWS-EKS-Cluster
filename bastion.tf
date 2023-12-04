resource "aws_iam_role" "bastion" {
  name               = "bastion-role"
  assume_role_policy = file("./templates/bastion/instance-profile-policy.json")
}

resource "aws_iam_role_policy_attachment" "bastion_attach_policy" {
  role       = aws_iam_role.bastion.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}

resource "aws_iam_instance_profile" "bastion" {
  name = "bastion-instance-profile"
  role = aws_iam_role.bastion.name
}

resource "aws_instance" "bastion" {
  ami                  = "ami-0fa1ca9559f1892ec"
  instance_type        = "t2.micro"
  user_data            = file("./templates/bastion/user-data.sh")
  iam_instance_profile = aws_iam_instance_profile.bastion.name
  key_name             = var.bastion_key_name
  subnet_id            = aws_subnet.public_subnet_az1.id

  vpc_security_group_ids = [
    aws_security_group.bastion.id
  ]

  tags = {
    Name = "Bastion-Server"
  }
}


resource "aws_security_group" "bastion" {
  description = "Control bastion inbound and outbound access"
  name        = "Bastion-SG"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion-SG"
  }
}
