include:
  - podman.ppa

buildah:
  pkg.installed:
    - name: buildah
    - require:
      - pkgrepo: podman-ppa