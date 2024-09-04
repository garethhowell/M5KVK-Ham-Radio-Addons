# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM

# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
  curl -sSLf -o /usr/bin/tempio \
  "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

# install required dependencies
RUN \
  apk add \
  ca-certificates-bundle \
  libgcc \
  libssl3 \
  libstdc++ \
  zlib \
  icu-libs

# install dotnet using the Microsoft install script
WORKDIR /temp
RUN \
  wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
  bash ./dotnet-install.sh --version latest --runtime aspnetcore --install-dir /usr/local/bin

# Install the appropriate version of FRstackWebApi.dll
RUN mkdir -p /usr/local/frstack
WORKDIR /usr/local/frstack
RUN \
  if [ "${BUILD_ARCH}" = "armv7" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-rpi-arm64_3_7_3_74.zip && \
  unzip FRStackWebApi-rpi-arm64_3_7_3_74.zip; \
  elif [ "${BUILD_ARCH}" = "amd64" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-linux-x64_3_7_3_74.zip && \
  unzip FRStackWebApi-linux-x64_3_7_3_74.zip; \
  fi

# Copy root filesystem
COPY rootfs /
RUN chmod +x /usr/local/bin/frstackwebapi