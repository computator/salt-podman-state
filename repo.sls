podman-repo:
  pkgrepo.managed:
    - name: deb [arch={{grains['osarch']}}] http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_{{grains['osrelease']}}/ /
    - file: /etc/apt/sources.list.d/podman-kubic.list
    - key_url: https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_{{grains['osrelease']}}/Release.key