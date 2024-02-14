ssh_username=$(aws ssm get-parameter --name "ssh.username" --with-decryption --query 'Parameter.Value' --output text)
ssh_password=$(aws ssm get-parameter --name "ssh.password" --with-decryption --query 'Parameter.Value' --output text)

tool_name=$1
IP=$(aws ec2 describe-instances --filters Name=tag:Name,Values=$tool_name --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text)
ansible-playbook -i ${IP}, playbook.yml -e ansible_user=$ssh_username -e ansible_password=$ssh_password
