# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

WORKDIR /temp
RUN wget https://download.visualstudio.microsoft.com/download/pr/80ec12e5-b26f-466c-a20c-f96772ea709d/606e7203912400b44cb35d6fcecf60bf/aspnetcore-runtime-8.0.4-linux-arm64.tar.gz
RUN tar aspnetcore-runtime-8.0.4-linux-arm64.tar.gz /opt/dotnet

# Copy root filesystem
COPY rootfs /
