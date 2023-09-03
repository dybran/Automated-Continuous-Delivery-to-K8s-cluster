
output "jenkins-sg" {
  value = aws_security_group.jenkins-http-ssh-sg.id
}

output "sonarqube-sg" {
  value = aws_security_group.sonarqube-http-ssh-sg.id
}