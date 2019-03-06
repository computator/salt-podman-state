include:
  - podman.ppa
  - podman.registrycfg

podman:
  pkg.installed:
    - name: podman
    - require:
      - pkgrepo: podman-ppa