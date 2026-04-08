GHCR_NAMESPACE="${GHCR_NAMESPACE:-langduamc}"
GHCR_IMAGE="${GHCR_IMAGE:-pterodactyl-graalvm}"
IMAGE_REF="ghcr.io/${GHCR_NAMESPACE,,}/${GHCR_IMAGE,,}"

echo "22-JDK
17-JDK
11-EE
11
17
21-JDK
21-temurin
19
17-EE
19-EE
20-JDK
22-OC
25-OC
22-temurin
23-OC
23-temurin" | sed -re "s~(.*)$~GraalVM \\1|${IMAGE_REF}:\\1~"

# Copy this list into dashboard.acme.co/admin/nests/egg/<the egg ofc>
echo "

GraalVM 22-JDK|${IMAGE_REF}:22-JDK
GraalVM 17-JDK|${IMAGE_REF}:17-JDK
GraalVM 11-EE|${IMAGE_REF}:11-EE
GraalVM 11|${IMAGE_REF}:11
GraalVM 17|${IMAGE_REF}:17
GraalVM 21-JDK|${IMAGE_REF}:21-JDK
GraalVM 19|${IMAGE_REF}:19
GraalVM 17-EE|${IMAGE_REF}:17-EE
GraalVM 19-EE|${IMAGE_REF}:19-EE
GraalVM 20-JDK|${IMAGE_REF}:20-JDK
GraalVM 22-OC|${IMAGE_REF}:22-OC
GraalVM 25-OC|${IMAGE_REF}:25-OC
GraalVM 23-OC|${IMAGE_REF}:23-OC
Temurin 22|${IMAGE_REF}:22-temurin
Temurin 21|${IMAGE_REF}:21-temurin
Temurin 23|${IMAGE_REF}:23-temurin

" > /dev/null
