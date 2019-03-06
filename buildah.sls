include:
  - podman.ppa
  - podman.registrycfg

buildah:
  pkg.installed:
    - name: buildah
    - require:
      - pkgrepo: podman-ppa