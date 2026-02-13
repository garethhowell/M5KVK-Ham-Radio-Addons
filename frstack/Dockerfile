# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG API_VERSION="4_0_0_5"
ARG BASE_TAG="3.15"
ARG BUILD_FROM="ghcr.io/home-assistant/aarch64-base"
ARG SDK_VERSION="9.0.13"
ARG BUILD_ARCH="aarch64"
ARG TEMPIO_VERSION="2021.09.0"
FROM $BUILD_FROM:${BASE_TAG}


# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH API_VERSION SDK_VERSION
RUN \
  curl -sSLf -o /usr/bin/tempio \
  "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

# install required dependencies
RUN \
  apk update && apk add \
  ca-certificates-bundle \
  libgcc \
  libssl3 \
  libstdc++ \
  zlib \
  icu-libs \
  dotnet9-sdk

# install dotnet using the Microsoft install script
#WORKDIR /temp
#RUN \
#  wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
#  bash ./dotnet-install.sh --version $SDK_VERSION --runtime aspnetcore --install-dir /usr/local/bin

# Install the appropriate version of FRstackWebApi.dll
RUN mkdir -p /opt/frstack
WORKDIR /opt/frstack
RUN \
  if [ "${BUILD_ARCH}" = "aarch64" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-rpi-arm64_${API_VERSION}.zip && \
  unzip FRStackWebApi-rpi-arm64_${API_VERSION}.zip; \
  elif [ "${BUILD_ARCH}" = "amd64" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-linux-x64_${API_VERSION}.zip && \
  unzip FRStackWebApi-linux-x64_${API_VERSION}.zip; \
  fi

# Copy root filesystem
#COPY rootfs /
WORKDIR /opt/frstack
CMD dotnet FRStackWebApi.dll --urls http://*:5025
