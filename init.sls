include:
  - podman.repo

podman:
  pkg.installed:
    - name: podman
    - require:
      - pkgrepo: podman-repo