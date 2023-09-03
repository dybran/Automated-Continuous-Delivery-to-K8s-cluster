# create instance for jenkins
resource "aws_instance" "Jenkins" {
  ami                         = var.ami-jenkins
  instance_type               = "t2.micro"
  subnet_id                   = var.subnets-jenkins
  vpc_security_group_ids      = var.sg-jenkins
  associate_public_ip_address = true
  key_name                    = var.keypair
  iam_instance_profile        = var.iam_instance_profile

  tags = merge(
    var.tags,
    {
      Name = "tooling-Jenkins"
    },
  )
}

resource "aws_instance" "sonarqube" {
  ami                         = var.ami-sonarqube
  instance_type               = "t2.micro"
  subnet_id                   = var.subnets-sonarqube
  vpc_security_group_ids      = var.sg-soanrqube
  associate_public_ip_address = true
  key_name                    = var.keypair
  iam_instance_profile        = var.iam_instance_profile

  tags = merge(
    var.tags,
    {
      Name = "sonarqube"
    },
  )
}