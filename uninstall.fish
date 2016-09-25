functions -e mkr_hosts_tsv
functions -e __complement_mkr_host_ip
bind | command grep __complement_mkr_host_ip | command cut -d ' ' -f 2 | read -l COMPLEMENT_MKR_HOST_IP_KEYBIND
eval bind -e $COMPLEMENT_MKR_HOST_IP_KEYBIND
