# Instances modules

module "register-instance" {
  source = "./modules/register-instance"

  // Pass the input variables to the module
  register_instance_name        = var.register_instance_name
  instance_type                 = var.instance_type
  ovh_endpoint                  = var.ovh_endpoint
  keypair_name                  = module.ssh-keypair.keypair_name  // Equal to var.ssh_keypair_name
}

module "provider-instance" {
  source = "./modules/provider-instance"

  // Pass the input variables to the module
  provider_instance_name        = var.provider_instance_name
  instance_type                 = var.instance_type
  ovh_endpoint                  = var.ovh_endpoint
  keypair_name                  = module.ssh-keypair.keypair_name  // Equal to var.ssh_keypair_name
}

module "dispatcher-instance" {
  source = "./modules/dispatcher-instance"

  // Pass the input variables to the module
  dispatcher_instance_name      = var.dispatcher_instance_name
  instance_type                 = var.instance_type
  ovh_endpoint                  = var.ovh_endpoint
  keypair_name                  = module.ssh-keypair.keypair_name  // Equal to var.ssh_keypair_name
}

# SSH keypair module

module "ssh-keypair" {
  source = "./modules/ssh-keypair"

  // Pass the input variables to the module
  ssh_keypair       = "${var.ssh_private_key}.pub"
  ssh_keypair_name  = var.ssh_keypair_name
  ovh_endpoint      = var.ovh_endpoint
}

// faire executer les playbooks a mon terraform
resource "null_resource" "ansible_provisioner" {
  provisioner "local-exec" {
    command = "ansible-playbook -i '${module.dispatcher-instance.instance_ip},' -u debian --private-key=${var.ssh_private_key} --extra-vars 'register_instance_ip=${module.register-instance.instance_ip}' ./ansible/playbook-dispatcher.yaml"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i '${module.provider-instance.instance_ip},' -u debian --private-key=${var.ssh_private_key} --extra-vars 'register_instance_ip=${module.register-instance.instance_ip}' ./ansible/playbook-provider.yaml"
  }
  provisioner "local-exec" {
    command = "ansible-playbook -i '${module.register-instance.instance_ip},' -u debian --private-key=${var.ssh_private_key} --extra-vars 'register_instance_ip=${module.register-instance.instance_ip}' ./ansible/playbook-register.yaml"
  }
}

# I know it's really not Terraform's job but....
// Create the Nginx config file (fill template with Dispatcher IP)
resource "local_file" "nginx_config" {
  content  = templatefile("${path.root}/ansible/nginx-template.conf", {
    dispatcher_ip = module.dispatcher-instance.instance_ip
  })
  filename = "${path.root}/ansible/nginx.conf"
}
