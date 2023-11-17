#!/bin/bash


terraform apply -var-file=secret-variables.tfvars -auto-approve ;

sleep 2 ;

python3 add_state_to_ansible_inventory2.py ;

cat ansible_inventory.ini

sleep 2 ;

ansible-playbook -i ansible_inventory.ini install.yml ;

ansible-playbook -i ansible_inventory.ini cp_scopes.yml ;

# gets the inital subdomains to work with
ansible-playbook -i ansible_inventory.ini step1.yml ;

# starts first nmap scan
ansible-playbook -i ansible_inventory.ini step2.yml ;

# destroys the linodes
terraform destroy -auto-approve ;

# removes ansible inventory
rm ansible_inventory.ini
