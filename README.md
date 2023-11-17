# Fetlife_Recon_Platform
This is a set of scripts used to do bug bounty recon on fetlife.com

## State
> This is a collection of scripts it is not one coherent program. Scripts are not nessasarily meant to be used in a specific order.
> This is also in a very unrefined state. I would consider this project still in development

## Technology
> Terraform
> Ansible
> Python
> Linode

## Purpouse
During the summer of 2023 I had attempted to get into bug bounty recon. 
I realized that I did not want to use my IP address for this because I didn't want to get accidentally flagged as a malicious IP and therefor loose internet connectivity. 
Therefore Instead of using a VPN I decided it would be more efficient to pick a bug bounty platform and just write some scripts to be run remotely on some linode servers that could be quickly brought up and taken down as needed.
This is my attempt at doing so. I decided later on to publish my code for educational purpouses.

## Note to users
If you plan on using this script for other platforms remember to add your bug bounty platform's scope by modifying the files as needed. I recomend writing some of your own code and figuring it out yourself for
