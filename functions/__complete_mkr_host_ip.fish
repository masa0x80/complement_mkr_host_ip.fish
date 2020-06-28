function __complete_mkr_host_ip
    type fzf >/dev/null || return 1

    mkr_hosts_tsv | fzf --nth=2.. --delimiter='\t' | tr ';' ' ' | tr '\n' ';' | read selected_lines

    if test -n "$selected_lines"
        for line in (string split ';' $selected_lines)
            echo $line | cut -f 1,2 | read ip host
            set ips $ips $ip
            set hosts $hosts $host
        end
        commandline -a -- (string join -- '# ' (string join -- ' ' $ips) (string join -- ' ' $hosts))
    end
    commandline -f repaint
end
