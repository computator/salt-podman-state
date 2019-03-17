include:
  - podman.ppa

podman:
  pkg.installed:
    - name: podman
    - require:
      - pkgrepo: podman-ppa