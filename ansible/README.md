# The Ansible Section

## Why Ansible?
Ansible is a great tool to orchestrate repetative tasks whether they are simple or very complex. There are two main roles that we are using for in this section: geerlingguy.docker and ecadlabs.tezos_node

## Prerequisites
Ansible [Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Steps to create a Docker instance and Tezos node with ansible
1. Make sure you are in the `PROJECT_DIR\ansible\` directory
2. Install the geerilngguy.docker role
```bash
ansible-galaxy install geerlingguy.docker --roles-path ./roles
```
3. Install the ecadlabs.tezos_node role
```bash
ansible-galaxy install ecadlabs.tezos_node --roles-path ./roles
```
4. Create an inventory file in the ansible directory called `inventory.yml` directory
5. Add the GCP VM instance external IP address to the inventory file.
6. Run the Ansible playbook using the following command:
```bash
ansible-playbook ./playbook.yml -i ./inventory.yml
```

## Potential Gotchas
* The ecadlabs.tezos_node role runs with elevated priviledges so make sure that the python modules are installed in the correct python environment.
* Make sure that the `playbook.yml` file containe the correct python runtime environment.