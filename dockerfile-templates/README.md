## Dockerfile naming convention

All Dockerfiles follow the naming pattern:

`appType_runtime_techStack_devOrProd.dockerfile`

**Examples:**
- `grafana_alpine_default_prod.dockerfile`
- `prometheus_alpine_default_dev.dockerfile`
- `homer_ubuntu_nginx_dev.dockerfile`

**Notes:**
- If no specific techStack is used, use `default`.
- Keep environment (`dev` or `prod`) always explicit for clarity.