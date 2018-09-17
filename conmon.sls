conmon-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - golang-1.10
      - libglib2.0-dev
    - prereq:
      - cmd: conmon

conmon-src:
  git.latest:
    - name: https://github.com/kubernetes-sigs/cri-o
    - target: /tmp/salt_podman_tmp_gopath/src/github.com/kubernetes-sigs/cri-o
    - prereq:
      - cmd: conmon

conmon-build:
  cmd.run:
    - name: mkdir -p bin && make bin/conmon
    - cwd: /tmp/salt_podman_tmp_gopath/src/github.com/kubernetes-sigs/cri-o
    - env:
      - GOPATH: /tmp/salt_podman_tmp_gopath
      - PATH: {{ salt['environ.get']('PATH') }}:/usr/lib/go-1.10/bin
    - creates: /tmp/salt_podman_tmp_gopath/src/github.com/kubernetes-sigs/cri-o/bin/conmon
    - prereq:
      - cmd: conmon

conmon:
  cmd.run:
    - name: install -D -m 755 /tmp/salt_podman_tmp_gopath/src/github.com/kubernetes-sigs/cri-o/bin/conmon /usr/libexec/podman/conmon
    - creates: /usr/libexec/podman/conmon