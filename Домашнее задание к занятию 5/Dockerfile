FROM hashicorp/terraform:latest AS stage_1
FROM ubuntu:latest AS stage_2
RUN apt-get update && apt-get install -y \
    file \
    coreutils
COPY --from=stage_1 /bin/terraform /terraform
RUN set -eux; \
    echo "Files were copied"; \
    ls -lh /terraform; \
    file /terraform; \
    chmod +x /terraform; \
    /terraform version || true; \
    echo "end"