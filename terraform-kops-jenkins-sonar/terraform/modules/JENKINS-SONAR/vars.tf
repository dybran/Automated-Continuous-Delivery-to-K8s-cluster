variable "subnets-jenkins" {
    description = "public subnets for jenkins instances"
}
variable "ami-jenkins" {
    type = string
    description = "ami for jenkins"
}

variable "sg-jenkins" {
    description = "security group for http jenkins instances"
}

variable "keypair" {
    type = string
    description = "keypair for instances"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "iam_instance_profile" {
  type = string
  description = "IAM role for ECR access"
}


variable "subnets-sonarqube" {
    description = "public subnets for sonarqube instances"
}
variable "ami-sonarqube" {
    type = string
    description = "ami for sonarqube"
}

variable "sg-sonarqube" {
    description = "security group for http sonarqube instances"
}

variable "keypair" {
    type = string
    description = "keypair for instances"
}

variable "tags" {
  description = "A mapping of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

# variable "iam_instance_profile" {
#   type = string
#   description = "IAM role for ECR access"
# }