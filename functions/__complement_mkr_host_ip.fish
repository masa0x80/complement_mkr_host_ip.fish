function __complement_mkr_host_ip
  mkr_hosts_tsv | fzf --nth=2,3 --delimiter='\t' | read -l selected_line

  if test -n "$selected_line"
    set -l ip   (echo $selected_line | cut -f 1)
    set -l host (echo $selected_line | cut -f 2)
    commandline -a "$ip # $host"
  end
  commandline -f repaint
end
