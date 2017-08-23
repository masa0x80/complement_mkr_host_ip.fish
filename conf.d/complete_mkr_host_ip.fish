function __register_complete_mkr_host_ip_keybind --on-event fish_prompt
    if not set -q COMPLETE_MKR_HOST_IP_KEYBIND
        set COMPLETE_MKR_HOST_IP_KEYBIND '\co\co'
    end
    eval bind $COMPLETE_MKR_HOST_IP_KEYBIND __complete_mkr_host_ip
    functions -e __register_complete_mkr_host_ip_keybind
end
