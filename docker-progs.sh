#!/bin/sh

_packer_vsphere() {
    docker run \
	   --rm -it \
	   -v ${PWD}:/data \
	   -w /data \
	   --tmpfs /tmp \
	   -e PACKER_LOG \
	   --env-file <( env | grep -e '^VCENTER_' | cut -f1 -d=) \
	   fancyguy/packer \
	   $@
}
alias packer-vsphere='_packer_vsphere'

_terraform_docker() {
    docker run \
	   --rm -it \
	   -v ${PWD}:/data \
	   -v /Volumes/Development/Workspaces/fancyguy/devops/terraform/modules:/data/modules \
	   -w /data \
	   -e TF_LOG \
	   -e TF_LOG_PATH \
	   --env-file <( env | grep -e '^TF_VAR_' | cut -f1 -d=) \
	   fancyguy/terraform \
	   $@
}
alias terraform-docker="_terraform_docker"
alias tfd="_terraform_docker"
