cni-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - golang-1.10
    - prereq:
      - cmd: cni

cni-src:
  git.latest:
    - name: https://github.com/containernetworking/plugins
    - target: /tmp/salt_podman_tmp_gopath/src/github.com/containernetworking/plugins
    - prereq:
      - cmd: cni

cni-build:
  cmd.run:
    - name: ./build.sh
    - cwd: /tmp/salt_podman_tmp_gopath/src/github.com/containernetworking/plugins
    - env:
      - GOPATH: /tmp/salt_podman_tmp_gopath
      - PATH: {{ salt['environ.get']('PATH') }}:/usr/lib/go-1.10/bin
    - creates: /tmp/salt_podman_tmp_gopath/src/github.com/containernetworking/plugins/bin/vlan
    - prereq:
      - cmd: cni

cni:
  cmd.run:
    - name: install -D -m 755 -v -t /usr/libexec/cni /tmp/salt_podman_tmp_gopath/src/github.com/containernetworking/plugins/bin/*
    - creates: /usr/libexec/cni/vlan