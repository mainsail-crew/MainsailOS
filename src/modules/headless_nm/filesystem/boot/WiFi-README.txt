Wifi-README.txt
###############


Due to changes in Raspberry Pi OS, which OS_NAME is based on,
there is no longer a OS_NAME-wpa-supplicant.txt available.

How do I setup a (new) network on my Pi ?
-----------------------------------------

As described in the original Raspberry Pi OS documentation.
See https://www.raspberrypi.com/documentation/computers/configuration.html#setting-up-a-headless-raspberry-pi.


Quote:
    Connect to a wireless network
    To configure wireless network access at first boot in a headless Raspberry Pi,
    use the advanced settings menu in Raspberry Pi Imager.
    Enter the SSID and password of your preferred wireless network.
    Your Raspberry Pi will use these credentials to connect to the network on first boot.
    Some wireless adapters and some Raspberry Pi boards do not support 5GHz networks;
    check the documentation for your wireless module to ensure compatibility with your preferred network.

    NOTE
    Previous versions of Raspberry Pi OS made use of a wpa_supplicant.conf file
    which could be placed into the boot folder to configure wireless network settings.
    This functionality is not available from Raspberry Pi OS Bookworm onwards.


What does this all mean? What do I need to do now?
----------------------------------------------

This means that in a normal Raspberry Pi OS you will not able to change networks
after the first boot.
Unfortunately, this also true for OS_NAME.
Which is very inconvenient if you move your printer to a new location and
therefore (possible) a new network!

This is where this service called headless_nm comes in.
In its current state (which may change in the future),
it simply replaces Raspberry's preconfigured connection.


First, make sure you have a decent text editor of your choice.
Notepad++, VSCode, SublimeText or similar are recommended.

################################################################################
####                       IMPORTANT! WARNING!                            ####
################################################################################

!!!!! HEADS-UP WINDOWS USERS !!!!!
----------------------------------

Do not use Wordpad to edit this file, it will corrupt it and your
configuration will not work. Use a proper text editor instead.

!!!!! HEADS-UP MacOS X USERS !!!!!
---------------------------------

If you use Textedit to edit this file,be sure to use "plain text format"
and "disable smart quotes" in "Textedit > Preferences", otherwise Textedit
will use incompatible characters and your network configuration won't work!

1.) If you haven't already done so, insert the SDCard into your computer.

2.) Open the 'boot' partition.
    This partition is FAT32 formatted and should be visible,
    when you insert the SD Card into your computer.

3.) Copy and paste the 'headless_nm.txt.template'.
    Rename this file to 'headless_nm.txt'

4.) Now open the file with your favourite text editor.
    Windows and MacOS users please read the note above!

    This file is pretty self explaining, just the 'REGDOMAIN'
    needs some explaination:

    Valid country codes are:

        GB (United Kingdom)
        FR (France)
        DE (Germany)
        US (United States)
        SE (Sweden)

    For a complete list, please visit https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

5.) Remove the SD card afterwards.

6.) Almost done... Please put the SD card back into your Pi and wait for it to connect.

NOTE:

Plug in a monitor and watch the console output to get its IP address or
consult your router's setup page to get this information.

You could also try to reach it by its hostname.

    http://<yourpisname>.local

If you did not change the hostname during the initial flash, you could use

    http://OS_NAME.local

7.) Enjoy OS_NAME :)
