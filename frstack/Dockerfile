# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG API_VERSION
ARG BUILD_FROM
FROM $BUILD_FROM


# Execute during the build of the image
ARG TEMPIO_VERSION BUILD_ARCH API_VERSION
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
  if [ "${BUILD_ARCH}" = "armhf" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-rpi-arm32_${API_VERSION}.zip && \
  unzip FRStackWebApi-rpi-arm32_${API_VERSION}.zip; \
  elif [ "${BUILD_ARCH}" = "armv7" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-rpi-arm64_${API_VERSION}.zip && \
  unzip FRStackWebApi-rpi-arm64_${API_VERSION}.zip; \
  elif [ "${BUILD_ARCH}" = "aarch64" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-rpi-arm64_${API_VERSION}.zip && \
  unzip FRStackWebApi-rpi-arm64_${API_VERSION}.zip; \
  elif [ "${BUILD_ARCH}" = "amd64" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-linux-x64_${API_VERSION}.zip && \
  unzip FRStackWebApi-linux-x64_${API_VERSION}.zip; \
  elif [ "${BUILD_ARCH}" = "i386" ]; then  \
  wget https://www.mkcmsoftware.com/download/FRStackWebApi-win-x64_${API_VERSION}.zip && \
  unzip FRStackWebApi-win-x64_${API_VERSION}.zip; \
  fi

# Copy root filesystem
#COPY rootfs /
WORKDIR /usr/local/frstack
CMD [ "/usr/local/bin/dotnet", "-d", "-v diag", "FRStackWebApi.dll", "--urls", "http://*.5025" ]