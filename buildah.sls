include:
  - podman.repo

buildah:
  pkg.installed:
    - name: buildah
    - require:
      - pkgrepo: podman-repo