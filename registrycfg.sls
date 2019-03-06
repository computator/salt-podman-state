podman-registrycfg:
  file.managed:
    - name: /etc/containers/registries.conf
    - source: https://raw.githubusercontent.com/projectatomic/registries/master/registries.conf
    - skip_verify: true
    - mode: 644
    - makedirs: true
    - replace: false
