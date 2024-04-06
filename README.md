# Cadavre Exquis project Technical Documentation

Project contributors: De Martino Giada Flora, Llinares Isalyne, Tchilinguiran Théo.
**2023-2024 - DO3**

---

## Summary

I. Deploying the app

II. How it works

III. Why we made these technical choices

IV. How we designed and developped the project

V. Problems faced during development, where we failed

VI. What we learned

VII. Security concerns

---

## I. Deploying the app

This part of the documentation guides you through setting up the environment for using the OpenStack API, as well as environment variables, and finally deploying the app.
As described in [the official documentation (link)](https://help.ovhcloud.com/csm/en-public-cloud-compute-terraform?id=kb_article_view&sysparm_article=KB0050797).

- Prerequisites, setting up the virtual environment
- Loading OpenStack environment variables
- Provisionning OVH resources with Terraform


### 0. Prerequisites, setting up the virtual environment

You need:
- Terraform installed
- Ansible installed
- ansible-galaxy collection install community.docker
- ansible-galaxy collection install community.postgresql
* Python version >= 3.8,
* A user account to OVH Horizon ([see official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-horizon?id=kb_article_view&sysparm_article=KB0050888))

The following steps will allow you to set up the OpenStack API as seen in [the official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-prepare-openstack-api-environment?id=kb_article_view&sysparm_article=KB0050988).


### OPTIONAL : If you want, you can install the OpenStack CLI (which is very useful in development ; when auth with OVH, it allows you to manage OpenStack resources)
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


### 1. Loading OpenStack environment variables

The following steps will allow you to define the OpenStack environment variables to authenticate with the OpenStack API; as seen in [the official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-set-openstack-environment-variables?id=kb_article_view&sysparm_article=KB0050920).


1. Connect to you OVH account.
2. Go to Project Management -> Users & Roles and create a user with sufficient permissions. (*This project uses the **MetaCortex user***)
    >Best practices advise to follow the principle of least privileges when granting permissions.
3. Click the vertical dots at the right of the user's row and select `Download OpenStack's RC file`. This is where you choose the region (*This project was assigned the **WAW1 region***).
4. Execute `source openrc.sh` on your terminal. Enter the user's password. The script will set environment variables for you for this terminal session.
    > If you lost the user's password, you can generate a new password; see the vertical dots.


### 2. Provisionning OVH resources with Terraform

You need:
* To have completed the previous step

The following steps will allow you to finish setting up your environment, and deploy the project to the Cloud! See [the official documentation](https://help.ovhcloud.com/csm/en-public-cloud-compute-getting-started?id=kb_article_view&sysparm_article=KB0051009) for help.

1. Generate an ssh key with the command `ssh-keygen -t rsa -f ~/.ssh/id_rsa_ovh_MetaCortex`.
2. You can now deploy the app by running `./launch_project.sh`. This command executes the `launch_project` bash script.
   Note: you may need to type yes and press enter to confirm the provisioning or configuration of the resources.

You can now open a browser window and connect to `http://<dispatcher_instance_ip>:8080`. Replace <dispatcher_instance_ip> by the IP address of the Dispatcher instance (given as an output of the provisioning part of the script)

---

## II. How it works

The goal of the project is to deploy a web app. To do so, we chose to use Terraform and Ansible.

Here's a rough summary of how it works:
You need to have Terraform and Ansible installed ;
You then clone the repo, enter its directory, follow the documentation to authenticate to OVH, and execute the `launch_project.sh` script.
This script provisions the infrastructure (three virtual machines hosted by OVH) and remotely configures the instances (installs Docker, pulls images, makes containers, etc).
This is how the application is deployed.

## III. Why we made these technical choices

Since the application comes with already built images - ready to pull from Docker Hub, plus a docker-compose file, it would make sense to simply use Kubernetes to deploy the app, and introduce reliability and scalability to the system.
Except, that's what we do in every other project. For this once, we agreed to take on a more traditional approach and provision infrastructure that we would them remotely manage and configure to deploy the app.

Of course, this implies that the application would no benefit from Kubernetes' main strengths. If one of our virtual machines or containers were to fail, it would have to be manually restarted, and all data would have to be injected again from a backup. Then again, it would be the Development team's fault, of course.
Making these choices for our project allowed us to explore the reasons why DevOps exist today.

## IV. How we designed and developped the project

This part is about both technical and human aspects of the project.

First off, we made a minimum viable product (MVP) in Terraform, to provision a single VM.

We divided version control into three branches, one for each, to make proof-of-concept subprojects, and try out the technologies (Terraform, Ansible, Docker, Docker-Compose, ...).
We reviewed progression and set sprint goals in weekly meetings.

After looking for best practices and understanding some principles, the Terraform codebase was updated to be modular, variabilized, and include many neat features of Terraform such as multi-provider configuration, best practices on modules, and also some stretches to Terraform's field of duty: running Ansible code after a dependance chain is complete, filling template files, ...
It is certainly better to avoid using a tool beyond what it was intended for, but it's also a very interesting and rewarding experience. (On the same note, I have tried provisioning infrastructure with Ansible)

As for configuring the virtual machines' environment, it was hard to decide if we would remotely install Docker and Docker Compose, then use a docker-compose file (one sent to each VM) to deploy containers inside each VM ;
or if we would simply install Docker and use Ansible resources to pull the images and create the containers.
In any case, managing the network of containers across multiple VM would still turn out to be the most relevant problem.

Most of the time spent on the project was spent on trying to teach each other, and trying to share information. It would have probably been faster as three different projects, but we would not have learned anything about managing each other.

## V. Problems faced during development, where we failed

Human issues:
- Very little teamwork, scattered efforts,
- Difficult cooperation and agreements,
- Difficulty to adapt to change,
- Project and team management,
- Version control management.

Technical issues:
- Authentication with OVH without interefering with OpenStack provisioning; provider configuration in Terraform.
- PostgreSQL user, database and connection through Docker,
- Connectivity between containers of different machines,
- Sharing Terraform states,
- Terraform states not being aware of Ansible states,
- Yaml. (joking, it was not that hard)

About the design and development of the project,
We reviewed progression and set sprint goals in weekly meetings; except few expectations were actually met.
The POC branches turned out to not become very relevant in the long run, as project organization fell apart.

About some technical issues,
There were difficulties with configuring Postgres, its connections, user, database, etc. which were finally resolved by connecting the register container (on the Register instance) to the postgres container (also on the Register instance) using the remote public IP (defined by OVH) of the Register instance. I will look into how this actually works internally, and how that connection is made; it may be a security concern, and it is not a viable solution anyways.

Since our job was simply to deploy the app, it was sometimes difficult to guess or fully understand what the application would do, what choice would be best, or how it would react if deployed in a way or another.

About connecting Ansible and Terraform,
We used Terraform as the link to execute each Ansible playbook after each instance's dependance chain is complete (do basically, when the instance has finished being provisioned).
This is a stretch of Terraform's duties; an alternative could have been a script which waits for Terraform to successfully complete, before running an Ansible playbook on a list of hosts written by Terraform.

## VI. What we learned

It was an interesting experience to try and deploy an app that we know very little about. It's a good way to teach us how things work when there is a gap between the development and operations teams.
We were able to make our own choices and think our own solutions for deploying an app, while taking the role of a completely separate team.

Since we worked more as Ops, with our job simply being to "deploy the app", we were confronted to the many reasons that led to DevOps being a job today.
By being completely separated from the development process, we had issues understanding some aspects of the app and how to deploy it, which way would be best, etc.
Moreover, managing the deployed app's lifecycle as a separate team would be a lot of work - a lot of teamwork; and there would often be human errors, due to the lack of automation in our method.

This project also gave us a better idea of containerisation and orchestration.
They are simple concepts that can apply to many different systems, at many scales; yet only recently have they seen a surge in development and implementations.
Our method did not implement it, and I think that's also great, since it allows us to understand better why we are taught such concepts: we have experienced first-hand an environment orchestration, now be get why it's so popular, and what it would add or change to our system.

We learned a lot on the human aspect as well. Managing a team of participants that are not so willing to work or learn together is a reallly daunting task, and one person can only take so many responsibilities.

## VII. Security concerns

Lots of securiy concerns arose as we deployed the application:

First of all, the OVH provider is probably not the best optionin terms of reliability and security (but it's the cheapest). That's a good challenge anyways, as we may have to work between downtimes and prepare for data loss.

Terraform provisioning may be unsafe, and sensitive information appears in the console outputs during the provisioning steps. It's possible to mark them as sensitive for Terraform to hide them.

During deployment, we connect to the host machines and connect them together using their public IP, provided by OVH; there are no subnetworks made, and the machines are configured remotely from your workstation. They may be unecessarily exposed.

Of course, since we did not introduce any kind of orchestration of the machines or containers, there is no automatic reliability, and horizontal scalability would have to be manually managed.
If the instances were managed as nodes through Kubernetes, there would have been much less problems around configuring the connections between containers and machines, as Kubernetes abstracts those concepts and manages them, although doing a part of an orchestrator's job manually did help us understand how it works under the hood.

## VIII. Conclusion

In conclusion, this was a very gratifying experience for us. We did things differently from the rest of the class, so it was hard to find and share support; plus our team spirit probably looked like Slimer from Ghostbusters.
But throughout this project, all the issues we faced taught us so much about both human and technical aspects of being a team responsible for deploying an app.
I learned a lot about Terraform, Docker, Ansible, cloud providers, and even Kubernetes, even though we did not use it in our project.

Overall, it was a great experience and a very interesting, original project. We could have done much better, with event just a slitghly better organization.

Thanks!

