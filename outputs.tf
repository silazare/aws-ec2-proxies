output "proxy_nodes" {
  value = aws_instance.proxy_node.*.public_ip
}
