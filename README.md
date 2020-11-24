# tezos-node-devops
This is a solution for starting a Tezos node running in a docker container on a GCP virtual machine. The solution tries to follow Infrastructure-as-Code principles. There are three main parts to this code namely:
* [Packer](packer/) (This is optional if you prefer to run initialization scripts in Terraform)
* [Terraform](terraform/)
* [Ansible](ansible/)

Please see each section for more details on how each piece is deployed.

## What each section does
### Packer
Packer builds images for virtual machines and containers. It is a good idea to have defined images that you can manage to have the exact software and versions that your solution requires. Building your custom image also helps when patching is included in your CI/CD pipeline.

For this project, we use Packer to build a custom Debian 10 Buster instance, create a user that will run Docker and Ansible, as well as install the `docker` python module.

### Terraform
Terraform helps us define and provision our infrastructure using code in a declarative manner.

In this project Terraform provisions a GCP instance, network, and firewall in our Google Cloud project.

### Ansible
In this project, we use Ansible to configure and deploy Docker on to the virtual machine and then run a Tezos node in a Docker container.

There are two roles in the ansible section that can be installed using `ansible-galaxy`:
* [geerlingguy.docker](https://github.com/geerlingguy/ansible-role-docker)
* [ecadlabs.tezos_node](https://github.com/ecadlabs/ansible-role-tezos-node)

## Prerequisites
* Packer should be installed
* Terraform should be installed
* Ansible
* GCP SDK
* An SSH public/private key pair

## High-level steps to run this project
The steps listed here are high-level steps, for more information on each step please see the relevant section README.
1. Clone this repository
2. Follow the steps in the Packer section and build the image
```bash
packer build \
-var 'project_id=PROJECT_ID' \
-var 'ssh_username=SSH_USERNAME'
PROJECT_DIR\packer\
```
3. Follow the steps in the Terraform section and provision the infrastructure using the following commands:
```bash
terraform plan -out plan.plan
terraform apply "plan.plan"
```
4. Follow the steps in the Ansible section and deploy the ansible roles.
```bash
ansible-playbook ./playbook.yml -i ./inventory.yml
```
5. Test to see if the Tezos node is bootstrapped.
```bash
curl -s INSTANCE_EXTERNAL_IP:8732/monitor/bootstrapped
```
or
```bash
ssh ansible@INSTANCE_EXTERNAL_IP "docker exec -i delphinet_node tezos-client bootstrapped"
```
6. If everything went well you should see a response like this
```json
{"block":"A HASH VALUE","timestamp":"2020-09-29T19:40:11Z"}
```
or
```bash
Current head: BKyPYNxKRWwt (timestamp: 2020-10-04T18:51:57-00:00, validation: 2020-10-13T19:59:10-00:00)
Bootstrapped.
```

---
**IMPORTANT NOTE**

If you chose to not build your custom virtual machine image please be sure to add the instance metadata script to initialize the VM.

---
