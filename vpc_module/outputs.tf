output "id" {
  value = aws_vpc.vpc.id
}

output "id" {
  value = var.create_attatch_igw ? aws_internet_gateway.igw[0].id : null
}