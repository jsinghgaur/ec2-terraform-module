resource "aws_instance" "myec2-1" {
  ami = data.aws_ami.myami.image_id
  key_name = var.key_name
  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.mysg.id]
}

