##############

module "instance" {
  source = "github.com/apahomovs/tf-handson2.1/ec2_module"
  
  for_each = toset(module.subnet["public_1a"].id, module.subnet["public-1b"].id)

  ami = data.aws_ami.ami.id
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.mykey.key_name
  vpc_security_group_id = [module.ec2.sgrp.id]
  subnet_id = each.key
   user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd.service
              sudo systemctl enable httpd.service
              echo "<h1>Hello from $(hostname -f)</h1>" >> /var/www/html/index.html
              EOF

}