resource "aws_instance" "web" {
  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  key_name = "terraform_key"
  subnet_id = aws_subnet.public[count.index].id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true
  count = 2

  tags = {
    Name = "Web Server"
  }

    provisioner "remote-exec"{
      inline = [
        "sudo yum install httpd -y",
        "sudo systemctl enable httpd --now",
         "sudo sh -c 'wget https://www.free-css.com/assets/files/free-css-templates/download/page281/traveler.zip'", 
 	"sudo sh -c 'unzip traveler.zip'",
        "sudo cp -r free-travel-website-template/* /var/www/html"  
      ]
    }
    
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ec2-user"
      private_key = "${file("./terraform_key.pem")}"
    }  
  }

