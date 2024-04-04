# Technical Documentation

Project contributors: De Martino Giada Flora, Llinalres Isalyne, Tchilinguiran Théo.
**2023 - 2024**

---

## Summary

This documentation guides you through setting up the environment for using the OpenStack API, as well as environment variables, and using Terraform.
As described in [the official documentation (link)](https://help.ovhcloud.com/csm/en-public-cloud-compute-terraform?id=kb_article_view&sysparm_article=KB0050797).

1. Prerequisites, setting up the virtual environment
2. Loading OpenStack environment variables
3. Provisionning OVH resources with Terraform

---

## Prerequisites, setting up the virtual environment

You need:
-------------------- ansible-galaxy collection install community.docker ---------------------- ### FOR GIAGIA ### peace
------------------- ansible-galaxy collection install community.postgresql ----------------
--- ansible-playbook -i "54.37.130.217," -u debian --private-key=~/.ssh/id_rsa_ovh_MetaCortex ^Cdules/ansible/playbook-register.yaml
 ---
* Python version >= 3.8,
* A user account to OVH Horizon ([see official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-horizon?id=kb_article_view&sysparm_article=KB0050888))

The following steps will allow you to set up the OpenStack API as seen in [the official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-prepare-openstack-api-environment?id=kb_article_view&sysparm_article=KB0050988).


1. Install pip and venv: `sudo apt install python3-pip python3-venv -y`
2. Create a virtual environment in a `env` directory (creates the directory if it doesn't exist) `python3 -m venv env`
3. Activate the virtual environment: `source env/bin/activate`
4. Update the pip tool to the latest version (in the activated environment) : `pip3 install --upgrade pip`
5. Install the OpenStack client (in the activated environment): `pip3 install python-openstackclient`

Congratulations, you can execute `openstack` commands from the activated environment.
Run `deactivate` to deactivate the python virtual environment.

Summary of commands:
```bash
sudo apt install python4-pip python3-venv -y
python3 -m venv env
source env/bin/activate
pip3 install --upgrade pip
pip3 install python-openstackclient
```


## 1. Loading OpenStack environment variables

You need:
* To have completed the previous step

The following steps will allow you to define the OpenStack environment variables to authenticate with the OpenStack API; as seen in [the official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-set-openstack-environment-variables?id=kb_article_view&sysparm_article=KB0050920).


1. Connect to you OVH account.
2. Go to Project Management -> Users & Roles and create a user with sufficient permissions. (*This project uses the **MetaCortex user***)
    >Best practices advise to follow the principle of least privileges when granting permissions.
3. Click the vertical dots at the right of the user's row and select `Download OpenStack's RC file`. This is where you choose the region (*This project was assigned the **WAW1 region***).
4. Execute `source openrc.sh` on your terminal. Enter the user's password. The script will set environment variables for you for this terminal session.
    > If you lost the user's password, you can generate a new password; see the vertical dots.


## 2. Provisionning OVH resources with Terraform

You need:
* To have completed the previous step

The following steps will allow you to finish setting up your environment, and deploy the project to the Cloud! See [the official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-getting-started?id=kb_article_view&sysparm_article=KB0051009) for help.

1. Generate an ssh key with the command `ssh-keygen -t rsa -f ~/.ssh/id_rsa_ovh_MetaCortex`.
2. Run `terraform init` followed by `terraform apply`. Type yes and press enter to confirm the provisioning of the resources.
