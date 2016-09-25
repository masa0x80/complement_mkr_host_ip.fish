function mkr_hosts_tsv
  set -l cache_dir $HOME/.cache/mkr-hosts-tsv
  set -l cache_file $cache_dir/cache
  set -l mackerel_hosts_api_uri https://mackerel.io/api/v0/hosts

  not set -q MKR_HOSTS_TSV_GIP; and set -l MKR_HOSTS_TSV_GIP false

  if test -z "$MACKEREL_APIKEY"
    cat $cache_dir/*
    return 0
  end

  if test -n "$MACKEREL_APIKEY_NAME"
    set cache_file "$cache_file.$MACKEREL_APIKEY_NAME"
  end

  mkdir -p (dirname $cache_file)

  if string match -q true -- $MKR_HOSTS_TSV_GIP
    curl -s -H "X-Api-Key: $MACKEREL_APIKEY" "$mackerel_hosts_api_uri" | jq -r -c '.hosts[] | if (.meta.cloud.metadata."public-ipv4") then [.meta.cloud.metadata."public-ipv4", .name, [.roles | keys], .roles[]] | flatten else empty end | @tsv' | tee $cache_file
  else
    if not type -qa mkr
      set_color $fish_color_error; echo 'mkr: command not found'
      set_color normal; echo 'Refer to https://github.com/mackerelio/mkr'
      return 1
    end

    mkr hosts -f '{{range .}}{{if (len .Interfaces)}}{{range .Interfaces}}{{if (eq .Name "eth0")}}{{.IPAddress}}{{end}}{{end}}{{"\t"}}{{.Name}}{{"\t"}}{{range $s,$rr := .Roles}}{{range $r := $rr}}{{$s}}:{{$r}} {{end}}{{end}}{{"\n"}}{{end}}{{end}}' | tee $cache_file
  end
  chmod go-r $cache_file
end
