include:
  - podman.runc
  - podman.conmon
  - podman.cni

podman-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - golang-1.10
      - libseccomp-dev
      - libdevmapper-dev
      - libgpgme11-dev
      - go-md2man
      - python3-setuptools
    - prereq:
      - cmd: podman

podman-src:
  git.latest:
    - name: https://github.com/containers/libpod
    - target: /tmp/salt_podman_tmp_gopath/src/github.com/containers/libpod
    - prereq:
      - cmd: podman

podman-build:
  cmd.run:
    - name: make
    - cwd: /tmp/salt_podman_tmp_gopath/src/github.com/containers/libpod
    - env:
      - GOPATH: /tmp/salt_podman_tmp_gopath
      - PATH: {{ salt['environ.get']('PATH') }}:/usr/lib/go-1.10/bin
    - creates: /tmp/salt_podman_tmp_gopath/src/github.com/containers/libpod/bin/podman
    - prereq:
      - cmd: podman

podman:
  cmd.run:
    - name: make install
    - cwd: /tmp/salt_podman_tmp_gopath/src/github.com/containers/libpod
    - env:
      - GOPATH: /tmp/salt_podman_tmp_gopath
      - PATH: {{ salt['environ.get']('PATH') }}:/usr/lib/go-1.10/bin
    - creates: /usr/local/bin/podman

podman-config:
  file.managed:
    - name: /etc/containers/libpod.conf
    - contents: |
        cgroup_manager="cgroupfs"
    - mode: 644
    - makedirs: true

podman-policy:
  file.managed:
    - name: /etc/containers/policy.json
    - source: https://raw.githubusercontent.com/containers/skopeo/master/default-policy.json
    - skip_verify: true
    - mode: 644
    - makedirs: true
    - replace: false
