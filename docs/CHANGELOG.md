# CHANGELOG

**2021-22-08**

- Date Order corrected in CHANGELOG.md
- Enable spi interface by default

**2021-17-08**

- Added is_req_preinstall Module
    - This installs python-numpy and python-matplotlib to the Image
    - Also numpy will be preinstalled in klipper-env.

**2021-17-07**

-   Improved Scripts, Replaced 'pi' with '${BASE_USER}' according to CustomPIOS Variables   


**2021-06-07**
- Serialcomm Module improvements.

**2021-05-07**

- Added new Module named "serialcomm".
    - This enables the GPIO Headers by default for Serial Communication with Boards like
    the BTT SKR Mini E3 V2.0 for example.
    - In Printer.cfg's MCU Section **serial: /dev/serial0** should work for most cases.

**2021-03-07**

-   Fixed Typo in .service files
-   Added udev as Wants= in klipper.service
    -   should bring up klipper, when Devices initialized, to prevent connection errors to mcu.

**2021-02-07**

-   Updated config to deliver zip compressed image
-   Added docs/CHANGELOG.md
-   Updated Klipper Module
    -   changed config file to be more flexible on changes in Klipper
    -   changed install routine according to config changes
    -   Updated klipper.service file to be more "robust"
-   Changed .gitignore to ignore also .sha1 file (since pulled every "make")
-   Updated Moonraker Module
    -   changed config file to be more flexible on changes in Moonraker
    -   changed install routine according to config changes
    -   Updated moonraker.service file to be more "robust"
-   Updated mainsail Module
    -   Moved folder creation 'gcode_files' to Klipper as Dependency

**2021-01-07**

-   Changed run.sh to Kernel 5.4.51-buster like RaspberryOS
-   Updated docker-compose.yml to match with CustomPIOS Version 1.4.0
-   Added .env file needed for CustomPIOS
-   Added, according to docker file, Kernel Image 5.4.51-buster for test environment.
