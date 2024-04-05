# SSH keypair resource module

This Terraform module is designed to provision an OpenStack SSH keypair using the OVH provider.

---

## Summary

1. Prerequisites
2. Usage
3. Providers
4. Inputs
5. Outputs

---

## Prerequisites

Before using this module, ensure you have the following prerequisites:

    An active OVH account with access to the OpenStack services.
    Terraform installed on your local machine.


## Usage

    To use this module, follow the steps described in the root module's README.md


## Providers

This module utilizes the following Terraform providers:

    OpenStack Provider: Used for provisioning the compute instance.
    OVH Provider: Used for authentication purposes.


## Inputs

    ssh_keypair: The path to the SSH public key 
    ssh_keypair_name: The name of the SSH key, as known by OVH.
    ovh_endpoint: The OVH endpoint to be used for authentication.


## Outputs

    keypair_name: The name of the SSH keypair.

