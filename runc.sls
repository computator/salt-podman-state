runc:
  file.managed:
    - name: /usr/bin/runc
    - source: https://github.com/opencontainers/runc/releases/download/v1.0.0-rc5/runc.amd64
    - skip_verify: true
    - replace: false # avoids redownloading
    - mode: 755
    - makedirs: true
    - show_changes: false