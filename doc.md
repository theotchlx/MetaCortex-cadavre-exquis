# Technical Documentation

Project by Théo, Isalyne, Giada. DO3

## Summary

1. Prerequisites, setting up the virtual environment
2. Loading OpenStack environment variables
3. Provisionning OVH resources with Terraform


## 1. Prerequisites, setting up the virtual environment

You need Python version >= 3.8

1. Install pip and venv: `sudo apt install python3-pip python3-venv -y`
2. Create a virtual environment in a `env` directory (creates the directory if it doesn't exist) `python3 -m venv env`
3. Activate the virtual environment: `source env/bin/activate`
4. Update the pip tool to the latest version (in the environment activated) : `pip3 install --upgrade pip`
5. Install the OpenStack client (in the activated environment): `pip3 install python-openstackclient`

Congratulations, you can execute `openstack` commands from the activated environment.
Execute `deactivate` to deactivate the python virtual environment.


## 2. Loading OpenStack environment variables

1. Connect to you OVH account.
2. Go to Project Management -> Users & Roles and create a user with sufficient permissions.
3. Download the user's OpenStack RC file. This is where you choose the region (WAW1 for our project).
4. Execute `source openrc.sh`. Enter your password. The script will set environment variables for you.

Well done, we will now move on to Terraform.


## 3. Provisionning OVH resources with Terraform

1. Create a token to access the API endpoint: https://api.ovh.com/createToken/?GET=/*&POST=/*&PUT=/*&DELETE=/*
2. Replace the variables `application_key`, `application_secret` and `consumer_key` in `variables.tf` by their respective values.
3. Generate an ssh key with the command `ssh-keygen -t rsa -f ~/.ssh/id_rsa_ovh`.

Si vous ne souhaitez pas définir vos secrets dans le fichier de configuration Terraform, vous pouvez également les définir dans des variables d'environnement :

console $ export OVH_ENDPOINT=ovh-eu $ export OVH_APPLICATION_KEY=Your_key_application_OVH(or_AK) $ export OVH_APPLICATION_SECRET=Your_secret_application_key_OVH(or_AS) $ export OVH_CONSUMER_KEY=Your_token(or_CK)


## Ressources

