# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [ module.ec2_public, module.vpc ]
  instance = module.ec2_public.id
  vpc      = true
  tags = local.common_tags
}

#Associate EIP with EC2 Instance
resource "aws_eip_association" "demo-eip-association" {
  instance_id   = module.ec2_public.id
  allocation_id = aws_eip.bastion_eip.id
}