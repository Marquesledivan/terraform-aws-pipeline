resource "aws_instance" "web" {
  for_each               = var.subnet
  ami                    = data.aws_ami.ec2-linux.id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.ssh.id]
  iam_instance_profile   = "EC2"
  key_name               = "ledivan"
  subnet_id              = each.value
  user_data              = file("install_apache.sh")
  tags = {
    Name = "ledivan-web"
  }
}