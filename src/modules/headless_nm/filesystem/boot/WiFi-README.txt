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


What does that all mean? What do I have to do now?
----------------------------------------------

This means in an regular Raspberry Pi OS you are not able to change networks
after your first boot is done.
Unfortunatly, this applies to OS_NAME in the same way.
Which is very unpractical if you move you printer to a new location and
therefore a (possible) new network!

That is, where this service called headless_nm comes to help you out.
In current state (may change in future) it only replaces Raspberrys preconfigured
connection.


First, ensure you have a proper text editor of your choice.
Recommendations are Notepad++, VSCode, Atom or SublimeText.

################################################################################
####                       IMPORTANT! ATTENTION!                            ####
################################################################################

!!!!! HEADS-UP WINDOWS USERS !!!!!
----------------------------------

Do not use Wordpad for editing this file, it will mangle it and your
configuration won't work. Use a proper text editor instead.

!!!!! HEADS-UP MacOS X USERS !!!!!
---------------------------------

If you use Textedit to edit this file make sure to use "plain text format"
and "disable smart quotes" in "Textedit > Preferences", otherwise Textedit
will use none-compatible characters and your network configuration won't work!


1.) Please copy the 'headless_nm.txt.template' to your harddrive

2.) Rename that file to 'headless_nm.txt'

3.) Now open the file with your favorite text editor.
    Windows and MacOS user please read the hint above!

    This file is pretty self explaining, just the 'REGDOMAIN'
    needs some explaination:

Valid Country Codes are:

    GB (United Kingdom)
    FR (France)
    DE (Germany)
    US (United States)
    SE (Sweden)

For a full list, please visit https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2


4.) Now navigate to the boot partition,
    this partition is FAT32 formatted and should be visible if you plug the SD Card into your computer.

    Find the folder 'firmware' and put the 'headless_nm.txt' inside the mentioned folder.

5.) Remove the SDcard afterwards

6.) Almost done... Please reboot the pi and wait for it to connect.

NOTE:

Attach a screen and watch the console output to get its IP address or
consult your router setup page to grab that information.

You could also try to reach it by its hostname.

    http://<yourpisname>.local

If you didnt change the hostname during initial flash, you could use

    http://OS_NAME.local

7.) Enjoy OS_NAME :)
