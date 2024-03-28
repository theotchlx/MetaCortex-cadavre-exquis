terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
    }
    ovh = {
      source = "ovh/ovh"
    }
  }
}

provider "ovh" {
  endpoint           = var.ovh_endpoint
  /*application_key  = var.application_key
  application_secret = var.application_secret
  consumer_key       = var.consumer_key*/
  alias              = "ovh"
}

provider "openstack" {
  auth_url    = "https://auth.cloud.ovh.net/v3/"    # auth url
  domain_name = "default"                           # Domain name; "default" for OVHcloud
  alias       = "ovh"
}