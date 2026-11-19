GHCR_NAMESPACE="${GHCR_NAMESPACE:-langduamc}"
GHCR_IMAGE="${GHCR_IMAGE:-pterodactyl-graalvm}"
IMAGE_REF="ghcr.io/${GHCR_NAMESPACE,,}/${GHCR_IMAGE,,}"

printf 'GraalVM 25-OC|%s:25-OC\n' "$IMAGE_REF"
