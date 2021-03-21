output "public_ip" {
  description = "List of public IP addresses assigned to the instances, if applicable"
  value       = [
      for instance in aws_instance.web:
      instance.public_ip
    ]
}