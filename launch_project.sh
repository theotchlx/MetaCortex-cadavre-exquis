#!/bin/bash

# You should follow the instructions in the README.md file before running this script.
# In particular to set up authentication with the OVH provider. You also need to have Terraform and Ansible installed.


# Initialize Terraform
terraform init

# Run Terraform apply and approve automatically
terraform apply -auto-approve
