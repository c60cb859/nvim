" #############################################################################
" Ansible
" #############################################################################

au BufNewFile,BufRead */playbooks/*.yml:
	\ set filetype=yaml.ansible

au BufNewFile,BufRead */roles/*/*.yml:
	\ set filetype=yaml.ansible
