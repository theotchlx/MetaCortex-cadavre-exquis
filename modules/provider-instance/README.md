# Provider instance module

This Terraform module is designed to provision an OpenStack compute instance using the OVH provider.

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

    provider_instance_name: The name of the Provider instance to be created.
    instance_type: The type of the compute instance (e.g., "b2-7").
    keypair_name: The name of the SSH keypair to be associated with the instance.
    ovh_endpoint: The OVH endpoint to be used for authentication.


## Outputs

    provider_instance_id: ID of the created OpenStack instance.

