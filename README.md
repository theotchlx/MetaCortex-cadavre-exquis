# Technical Documentation

Project by Théo, Isalyne, Giada. DO3

---

## Summary

1. Loading OpenStack environment variables
2. Loading OVH API Keys
3. Modifying variables

---

## 1. Loading OpenStack environment variables

1. Connect to you OVH account.
2. Go to Project Management -> Users & Roles.
3. Download the MetaCortex user's OpenStack RC file. This is where you choose the region (`WAW1` for our project).
4. Execute `source openrc.sh`. Enter the user's password `<do not communicate>`. The script will set environment variables for you.

# SUPPOSÉMENT Y'A PAS BESOIN DE FAIRE CETTE ÉTAPE (L'ÉTAPE 2)
## 2. Loading OVH API Keys

1. Create a token to access the API endpoint: https://api.ovh.com/createToken/?GET=/*&POST=/*&PUT=/*&DELETE=/*
2. Replace the variables `application_key`, `application_secret` and `consumer_key` in `credentials.tf` by their respective values.
3. Generate an ssh key with the command `ssh-keygen -t rsa -f ~/.ssh/id_rsa_ovh`.

## 3. Modifying variables

1. Modify the variables in variables.tf to fit your requirements.

<br />

#### Well done, Terraform is now connected to the OVH provider.
