#!/bin/bash

# You should follow the instructions in the README.md file before running this script.
# In particular to set up authentication with the OVH provider.


# Clone the repository
git clone https://github.com/fteychene/cloud-cadavre-exquis.git

# Initialize Terraform
terraform init

# Run Terraform apply and approve automatically
terraform apply -auto-approve
