# Provider Configuration

terraform {
required_version    = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.42.0"
    }
    ovh = {
      source = "ovh/ovh"
      version = ">= 0.13.0"
    }
  }
}

provider "ovh" {
  endpoint           = var.ovh_endpoint
}

provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/"    # auth url
  domain_name = "default"                           # Domain name; "default" for OVHcloud
}