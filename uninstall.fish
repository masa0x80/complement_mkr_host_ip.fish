functions -e mkr_hosts_tsv
functions -e __complete_mkr_host_ip
bind | command grep __complete_mkr_host_ip | command cut -d ' ' -f 2 | read -l COMPLETE_MKR_HOST_IP_KEYBIND
eval bind -e $COMPLETE_MKR_HOST_IP_KEYBIND
