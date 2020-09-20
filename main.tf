resource "aws_instance" "proxy_node" {
  count         = var.instance_count
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.ssh_key

  vpc_security_group_ids = [aws_security_group.proxy_sg.id]

  tags = {
    Name = "goproxy-node-${count.index + 1}"
  }

  provisioner "file" {
    source      = "setup.sh"
    destination = "/home/${var.instance_user}/setup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x ./setup.sh",
      "sudo ./setup.sh ${var.instance_user} ${var.proxy_type} ${var.proxy_port} ${var.proxy_user} ${var.proxy_password}",
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = var.instance_user
    private_key = file("${var.private_key_path}")
  }
}

resource "aws_key_pair" "proxy_key" {
  key_name   = var.ssh_key
  public_key = file("${var.public_key_path}")
}

resource "aws_security_group" "proxy_sg" {
  name = "goproxy-security-group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.ipinfo.body)}/32"]
  }

  ingress {
    from_port   = var.proxy_port
    to_port     = var.proxy_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
