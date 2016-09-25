function __register_complement_mkr_host_ip_keybind --on-event fish_prompt
  not set -q COMPLEMENT_MKR_HOST_IP_KEYBIND; and set -l COMPLEMENT_MKR_HOST_IP_KEYBIND '\co\co'
  eval bind $COMPLEMENT_MKR_HOST_IP_KEYBIND __complement_mkr_host_ip
  functions -e __register_complement_mkr_host_ip_keybind
end
