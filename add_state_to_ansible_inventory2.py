import json

# Load the Terraform state file
with open("terraform.tfstate", "r") as tfstate_file:
    tfstate = json.load(tfstate_file)
    if len(tfstate) == 0:
    	print("tfstate is empty")

# Initialize a dictionary to hold group memberships
group_memberships = {}

# Extract Linode instance information
for resource in tfstate["resources"]:
    if resource["type"] == "linode_instance":
        instance_attrs = resource["instances"][0]["attributes"]
        ipv4_address = instance_attrs.get("ip_address")
        groups = instance_attrs.get("tags", [])  # Default to an empty list if 'tags' is not present
        if len(groups) == 0:
        	print("groups variable is empty")
        
        # Create or append to groups
        for group in groups:
            if group not in group_memberships:
                group_memberships[group] = []
            group_memberships[group].append(ipv4_address)

# Generate the Ansible inventory
open("ansible_inventory.ini", "x")
with open("ansible_inventory.ini", "w") as inventory_file:
    for group, hosts in group_memberships.items():
        inventory_file.write(f"[{group}]\n")
        for host in hosts:
            inventory_file.write(f"{host}\n")
