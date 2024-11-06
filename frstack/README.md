# FRStack add-on for Home Assistant

This is a simple addon that runs the [FRStackWebApi.dll][API] code produced by
[Mark Hanson - W3II][W3II] of [MKCM Software][MKCM].
FRStackWebAPI allows a ham to control a Flex radio using a [REST][REST] API.
See the [README][API] on the [MKCM Website][MKCM] for more details.

## NB

_
1. I haven't managed to use the builder, so it will build on your own machine.
This may take a bit of time. Hopefully, I'll sort this out and re-publish
1. This release uses the version of `appsettings.json` supplied with the package.
It does not allow this to be edited.
1. It has not been tested on `armv7` or `armhf` architectures._

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Settings** -> **Add-ons** -> **Add-on store**.
2. Click the "..." at the top right and select **Repositories**
3. Add this repository `https://github.com/garethhowell/M5KVK-Ham-Radio-Addons.git`
4. Click the "..." at the top right and select **Check for updates**
5. Find the "FRStack" add-on and click it.
6. Click on the "INSTALL" button.

## Add-on Configuration

Currently, the only configuration option that can be changed is which port the addon listens on.
It default to 5025, but can be changed.

[README]: https://github.com/garethhowell/M5KVK-Ham-Radio-Addons/blob/main/frstack/README.md
[API]: https://www.mkcmsoftware.com/download/FRStackWebApiReadme.html
[W3II]: https://www.qrz.com/db/W3II
[MKCM]: https://www.mkcmsoftware.com
[REST]: https://en.wikipedia.org/wiki/REST

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
