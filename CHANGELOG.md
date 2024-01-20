<!-- THIS FILE IS UPDATED AUTOMATICALLY, ANY CHANGES WILL BE OVERRIDDEN -->
# Changelog
All notable changes to MainsailOS will be documented in this file.

## [1.3.2](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.3.2) - 2024-01-20
### Bug Fixes and Improvements

- Fix version number in release workflow ([#276](https://github.com/mainsail-crew/MainsailOS/pull/276))

## [1.3.1](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.3.1) - 2024-01-20
### Bug Fixes and Improvements

- Fix version number in release ([#275](https://github.com/mainsail-crew/MainsailOS/pull/275))

## [1.3.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.3.0) - 2024-01-16
### Features

- Add BananaPi M2 Zero ([#247](https://github.com/mainsail-crew/MainsailOS/pull/247))
- Adds kiauh module for homebrewed images ([#184](https://github.com/mainsail-crew/MainsailOS/pull/184))
- Add python3-opencv for obico ([#248](https://github.com/mainsail-crew/MainsailOS/pull/248))

### Bug Fixes and Improvements

- Fix error in udev-fix.sh ([#228](https://github.com/mainsail-crew/MainsailOS/pull/228))
- Add crowsnest log path & pkglist link in postrename script ([#235](https://github.com/mainsail-crew/MainsailOS/pull/235))
- Fix typo in tools_dir var, Line171 ([#237](https://github.com/mainsail-crew/MainsailOS/pull/237))
- Fix wifi connectivity ([#240](https://github.com/mainsail-crew/MainsailOS/pull/240))
- Fix armbian-release file error ([#241](https://github.com/mainsail-crew/MainsailOS/pull/241))
- Fix error autologin on serial tty ([#242](https://github.com/mainsail-crew/MainsailOS/pull/242))
- Fix 'is_board_type' function ([#243](https://github.com/mainsail-crew/MainsailOS/pull/243))
- Fix Torrent and Checksum download URLs ([#244](https://github.com/mainsail-crew/MainsailOS/pull/244))
- Removing 'klippy' alias ([#246](https://github.com/mainsail-crew/MainsailOS/pull/246))
- Fix motd on armbian and orange pi based images ([#272](https://github.com/mainsail-crew/MainsailOS/pull/272))

### Documentation

- Fix broken README link to the docs ([#231](https://github.com/mainsail-crew/MainsailOS/pull/231))

### Other

- **build**: Add new matrix workflow ([#253](https://github.com/mainsail-crew/MainsailOS/pull/253))
- Update download urls for armbian & orangepi ([#233](https://github.com/mainsail-crew/MainsailOS/pull/233))
- Update .gitignore ([#254](https://github.com/mainsail-crew/MainsailOS/pull/254))
- Refactor build & release workflow to remove external actions ([#264](https://github.com/mainsail-crew/MainsailOS/pull/264))
- Update issue bot text ([#265](https://github.com/mainsail-crew/MainsailOS/pull/265))
- Update generate json to new format ([#266](https://github.com/mainsail-crew/MainsailOS/pull/266))
- Fix typo in bot text ([#273](https://github.com/mainsail-crew/MainsailOS/pull/273))

## [1.2.1](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.2.1) - 2023-05-26
### Bug Fixes and Improvements

- Remove legacy cam stack ([#227](https://github.com/mainsail-crew/MainsailOS/pull/227))

## [1.2.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.2.0) - 2023-05-23
### Bug Fixes and Improvements

- Load `i2c-dev` modules ([#217](https://github.com/mainsail-crew/MainsailOS/pull/217))
- Fix broken udev package ([#224](https://github.com/mainsail-crew/MainsailOS/pull/224))
- Fix udev for version 'rp1+deb11u2' ([#226](https://github.com/mainsail-crew/MainsailOS/pull/226))

### Other

- Remove unattended-upgrades service ([#215](https://github.com/mainsail-crew/MainsailOS/pull/215))
- Revert firstboot fix ([#219](https://github.com/mainsail-crew/MainsailOS/pull/219))
- Update crowsnest module ([#221](https://github.com/mainsail-crew/MainsailOS/pull/221))

## [1.1.1](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.1.1) - 2023-03-26
### Bug Fixes and Improvements

- Fix rpi-imager json value format for extract_size & image_download_size ([#212](https://github.com/mainsail-crew/MainsailOS/pull/212))
- Fix firstboot issue ([#214](https://github.com/mainsail-crew/MainsailOS/pull/214))

### Refactor

- Drop armbian_pkgupgrade ([#210](https://github.com/mainsail-crew/MainsailOS/pull/210))

## [1.1.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.1.0) - 2023-03-18
### Features

- Enable I2C by default ([#196](https://github.com/mainsail-crew/MainsailOS/pull/196))
- Add Orange Pi 3 and 4 LTS ([#186](https://github.com/mainsail-crew/MainsailOS/pull/186))
- Add orange pi zero2 ([#189](https://github.com/mainsail-crew/MainsailOS/pull/189))

### Bug Fixes and Improvements

- **build**: Fix mv of image file ([#204](https://github.com/mainsail-crew/MainsailOS/pull/204))
- Fix compress step ([#205](https://github.com/mainsail-crew/MainsailOS/pull/205))
- Fix rpi-image.json workflow in Release.yml ([#206](https://github.com/mainsail-crew/MainsailOS/pull/206))
- Remove enduser support msg from zero2 images ([#209](https://github.com/mainsail-crew/MainsailOS/pull/209))

### Refactor

- Use mv to move the image from the workspace to the root ([#203](https://github.com/mainsail-crew/MainsailOS/pull/203))

## [1.0.1](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.0.1) - 2022-12-30
### Bug Fixes and Improvements

- Fix shellcheck errors ([#185](https://github.com/mainsail-crew/MainsailOS/pull/185))
- Fix syntax error in net module ([#191](https://github.com/mainsail-crew/MainsailOS/pull/191))

## [1.0.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/1.0.0) - 2022-12-18
### Bug Fixes and Improvements

- **lint**: Should fix shellcheck warnings ([#160](https://github.com/mainsail-crew/MainsailOS/pull/160))
- Fix postrename script ([#150](https://github.com/mainsail-crew/MainsailOS/pull/150))
- Fix shellcheck errors in net module ([#161](https://github.com/mainsail-crew/MainsailOS/pull/161))
- Set wrong source path ([#164](https://github.com/mainsail-crew/MainsailOS/pull/164))
- Add otg_mode=1 for CM4 in config.txt ([#167](https://github.com/mainsail-crew/MainsailOS/pull/167))
- Fix SC2086 in armbian module ([#173](https://github.com/mainsail-crew/MainsailOS/pull/173))
- Fixes error setting link to macro ([#175](https://github.com/mainsail-crew/MainsailOS/pull/175))

### Refactor

- Deactivate IPv6 in nginx per default ([#157](https://github.com/mainsail-crew/MainsailOS/pull/157))
- Change behavior of piconfig module ([#180](https://github.com/mainsail-crew/MainsailOS/pull/180))

### Documentation

- Adds faq section

### Other

- **build**: Refactor build dependend files ([#154](https://github.com/mainsail-crew/MainsailOS/pull/154))
- **workflow**: Rework release workflow for multi builds ([#181](https://github.com/mainsail-crew/MainsailOS/pull/181))
- Rework build workflow with source image cache ([#146](https://github.com/mainsail-crew/MainsailOS/pull/146))
- Only build an image on push in master/develop branch ([#148](https://github.com/mainsail-crew/MainsailOS/pull/148))
- Change cron interval of stale action ([#149](https://github.com/mainsail-crew/MainsailOS/pull/149))
- Update versions according to bullseye ([#147](https://github.com/mainsail-crew/MainsailOS/pull/147))
- Rework build workflow for multiple images ([#152](https://github.com/mainsail-crew/MainsailOS/pull/152))
- Fix image name ([#153](https://github.com/mainsail-crew/MainsailOS/pull/153))
- Impove shellcheck and auto read version number ([#155](https://github.com/mainsail-crew/MainsailOS/pull/155))
- Add Raspberry 64bit config ([#156](https://github.com/mainsail-crew/MainsailOS/pull/156))
- Upload failed logfile ([#163](https://github.com/mainsail-crew/MainsailOS/pull/163))
- Add armbian module ([#165](https://github.com/mainsail-crew/MainsailOS/pull/165))
- Update modules according to path changes ([#166](https://github.com/mainsail-crew/MainsailOS/pull/166))
- Update BuildImages workflow ([#171](https://github.com/mainsail-crew/MainsailOS/pull/171))
- Improved shellcheck lint ([#172](https://github.com/mainsail-crew/MainsailOS/pull/172))
- Remove github-token for build action ([#178](https://github.com/mainsail-crew/MainsailOS/pull/178))
- Add "not-on-Github" bot for issues ([#179](https://github.com/mainsail-crew/MainsailOS/pull/179))
- Fix changelog in release workflow ([#182](https://github.com/mainsail-crew/MainsailOS/pull/182))
- Removes fkms overlays ([#183](https://github.com/mainsail-crew/MainsailOS/pull/183))

## [0.7.1](https://github.com/mainsail-crew/MainsailOS/releases/tag/0.7.1) - 2022-09-06
### Bug Fixes and Improvements

- Fix errors in moved venvs ([#138](https://github.com/mainsail-crew/MainsailOS/pull/138))
- Fixes error unusable wpa_supplicant.txt ([#142](https://github.com/mainsail-crew/MainsailOS/pull/142))

### Documentation

- Update README for improved readability ([#144](https://github.com/mainsail-crew/MainsailOS/pull/144))

### Other

- Add wireless-tools as moonraker dependency ([#137](https://github.com/mainsail-crew/MainsailOS/pull/137))
- Add workflow to close stale issues / pull requests ([#139](https://github.com/mainsail-crew/MainsailOS/pull/139))
- Add additional Input shaper dependencies ([#140](https://github.com/mainsail-crew/MainsailOS/pull/140))
- Bump version to v0.7.1 ([#145](https://github.com/mainsail-crew/MainsailOS/pull/145))

## [0.7.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/0.7.0) - 2022-07-29
### Features

- **moonraker.conf**: Add mainsail subscription to announcements ([#115](https://github.com/mainsail-crew/MainsailOS/pull/115))
- Stop part fan on CANCEL_PRINT ([#103](https://github.com/mainsail-crew/MainsailOS/pull/103))
- Add sonar by default to image ([#107](https://github.com/mainsail-crew/MainsailOS/pull/107))
- Add on_error_gcode to mainsail.cfg ([#116](https://github.com/mainsail-crew/MainsailOS/pull/116))
- Add on_error_gcode to mainsail.cfg ([#116](https://github.com/mainsail-crew/MainsailOS/pull/116))
- Add python3-serial CanBoot dependency ([#129](https://github.com/mainsail-crew/MainsailOS/pull/129))
- Add postrename module ([#128](https://github.com/mainsail-crew/MainsailOS/pull/128))
- Add timelapse module ([#130](https://github.com/mainsail-crew/MainsailOS/pull/130))

### Bug Fixes and Improvements

- **config.txt**: Fix configuration errors with attached screens ([#119](https://github.com/mainsail-crew/MainsailOS/pull/119))
- **crowsnest**: Fix install of crowsnest ([#111](https://github.com/mainsail-crew/MainsailOS/pull/111))
- **mainsail**: Changed download url to mainsail-crew url ([#92](https://github.com/mainsail-crew/MainsailOS/pull/92))
- **sonar**: Fixes missing moonraker update manager entry ([#112](https://github.com/mainsail-crew/MainsailOS/pull/112))
- Correct on_error_gcode in mainsail.cfg ([#118](https://github.com/mainsail-crew/MainsailOS/pull/118))
- Correct on_error_gcode in mainsail.cfg ([#118](https://github.com/mainsail-crew/MainsailOS/pull/118))

### Refactor

- **klipper**: Refactor klipper and is-pre-install module ([#113](https://github.com/mainsail-crew/MainsailOS/pull/113))
- **mainsail.cfg**: Substituting `/home/pi` with `~` ([#114](https://github.com/mainsail-crew/MainsailOS/pull/114))
- **mainsail.cfg**: Substituting `/home/pi` with `~` ([#114](https://github.com/mainsail-crew/MainsailOS/pull/114))
- Add `enable_auto_refresh: True` ([#133](https://github.com/mainsail-crew/MainsailOS/pull/133))

### Documentation

- Fix typo in readme.md ([#91](https://github.com/mainsail-crew/MainsailOS/pull/91))
- Correct screenshot image URL ([#93](https://github.com/mainsail-crew/MainsailOS/pull/93))
- Add mainsailos logo ([#124](https://github.com/mainsail-crew/MainsailOS/pull/124))

### Other

- **README**: Update README according to latest changes. ([#110](https://github.com/mainsail-crew/MainsailOS/pull/110))
- **crowsnest**: Update crowsnest module ([#123](https://github.com/mainsail-crew/MainsailOS/pull/123))
- **docs**: Fix urls, add includes ([#122](https://github.com/mainsail-crew/MainsailOS/pull/122))
- **klipper**: Update klipper and input shaper to py3 ([#105](https://github.com/mainsail-crew/MainsailOS/pull/105))
- Update moonraker.conf ([#101](https://github.com/mainsail-crew/MainsailOS/pull/101))
- Add funding informations ([#120](https://github.com/mainsail-crew/MainsailOS/pull/120))
- Add Issue Templates ([#121](https://github.com/mainsail-crew/MainsailOS/pull/121))
- Bump version to 0.7.0 ([#131](https://github.com/mainsail-crew/MainsailOS/pull/131))

## [0.6.1](https://github.com/mainsail-crew/MainsailOS/releases/tag/0.6.1) - 2022-01-31
### Bug Fixes and Improvements

- **build**: Updated torrent download url ([#90](https://github.com/mainsail-crew/MainsailOS/pull/90))

### Other

- Push versionnumber to 0.6.1

## [0.6.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/0.6.0) - 2022-01-31
### Features

- **build**: Removed raspicam and serialcomm module ([#83](https://github.com/mainsail-crew/MainsailOS/pull/83))
- Add park to CANCEL_PRINT ([#58](https://github.com/mainsail-crew/MainsailOS/pull/58))
- Replaced module busterpatch ([#77](https://github.com/mainsail-crew/MainsailOS/pull/77))
- Added .editorconfig ([#78](https://github.com/mainsail-crew/MainsailOS/pull/78))
- Changed logging and logrotate behavior ([#79](https://github.com/mainsail-crew/MainsailOS/pull/79))
- Added mainsailos module ([#81](https://github.com/mainsail-crew/MainsailOS/pull/81))

### Bug Fixes and Improvements

- **build**: Updated download paths ([#65](https://github.com/mainsail-crew/MainsailOS/pull/65))
- **build**: Fixes error in Makefile ([#76](https://github.com/mainsail-crew/MainsailOS/pull/76))
- **ustreamer**: Disable buffering on webcam proxy entries ([#84](https://github.com/mainsail-crew/MainsailOS/pull/84))
- Nginx config file
- Added http1.1 to moonraker api reverse proxy location ([#75](https://github.com/mainsail-crew/MainsailOS/pull/75))

### Refactor

- Updated input shaper dependencies to python3 ([#74](https://github.com/mainsail-crew/MainsailOS/pull/74))

### Documentation

- Improve reamde.md ([#54](https://github.com/mainsail-crew/MainsailOS/pull/54))

### Other

- **moonraker**: Refactored moonraker module ([#89](https://github.com/mainsail-crew/MainsailOS/pull/89))
- **workflows**: Update pull_request trigger
- Update default moonraker.conf
- Remove job_queue and postprocessing from moonraker.conf
- Updated .editorconfig for yml files ([#86](https://github.com/mainsail-crew/MainsailOS/pull/86))

## [0.5.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/0.5.0) - 2021-08-28
### Features

- Add multi mjpegstreamer support in klipper_config dir ([#35](https://github.com/mainsail-crew/MainsailOS/pull/35))

### Other

- **build**: 0.5.0 bump

## [0.1.0](https://github.com/mainsail-crew/MainsailOS/releases/tag/0.1.0) - 2020-11-28
### Features

- Allow the app.fluidd.xyz origin

## [0.0.9](https://github.com/mainsail-crew/MainsailOS/releases/tag/0.0.9) - 2020-10-16
### Other

- Moves $httpupgrade and upstream servers to common config

