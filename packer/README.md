# The Packer Section

## Why Packer?
This section of the project is devoted to Packer. Packer is part of the Hashicorp stack and is used to create virtual images for VMs or Containers. The reason one might want to use Packer and a custom image is to bake in certain repetative tasks for instance installing Ansible.

The code in this section is divided into a source/build file that will build our image, as well as a variables file for the most important variables. If you need to customize the build section anymore please see https://www.packer.io/docs/builders/googlecompute.html.

## Prerequisites
Packer [Installation Guide](https://learn.hashicorp.com/tutorials/packer/getting-started-install)

## Running the Packer project
If you are happy with the configurations of the Build script the it is a case of sipmple using the command:
```bash
packer build \
-var 'project_id=PROJECT_ID' \
PROJECT_DIR\packer\
```
### Variables
Required:

* *project_id*: The id of the GCP project that you want to create the image in. 
* *ssh_username*: The username for ssh purposes. (On some image families this can NOT be root) 

Optional:

* *source_image_family*: The image family that this image will be based off of. The dault value is *debian-10*

* *zone*: The Zone where you want the image created. This should be the same as the rest of the project and defaults to *us-central1-a*