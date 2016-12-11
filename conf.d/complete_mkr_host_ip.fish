function __register_complete_mkr_host_ip_keybind --on-event fish_prompt
  not set -q COMPLETE_MKR_HOST_IP_KEYBIND; and set -l COMPLETE_MKR_HOST_IP_KEYBIND '\co\co'
  eval bind $COMPLETE_MKR_HOST_IP_KEYBIND __complete_mkr_host_ip
  functions -e __register_complete_mkr_host_ip_keybind
end
