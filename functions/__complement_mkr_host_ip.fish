function __complement_mkr_host_ip
  set -l selected_line
  if string match -q -- "$ANGLER" 'fzf'
    mkr_hosts_tsv | fzf --nth=2.. --delimiter='\t' | read selected_line
  else
    mkr_hosts_tsv | angler | read selected_line
  end

  if test -n "$selected_line"
    set -l ip   (echo $selected_line | cut -f 1)
    set -l host (echo $selected_line | cut -f 2)
    commandline -a "$ip # $host"
  end
  commandline -f repaint
end
