################################################################################
####                           IMPORTANT WARNING                            ####
################################################################################
####                                                                        ####
#### First, make sure you have a decent text editor of your choice.         ####
#### Notepad++, VSCode, SublimeText or similar are recommended.             ####
####                                                                        ####
#### Do not use Wordpad to edit this file, it will corrupt it and your      ####
#### configuration will not work.                                           ####
####                                                                        ####
#### If you use Textedit to edit this file,                                 ####
#### be sure to use "plain text format" and "disable smart quotes"          ####
#### in "Textedit > Preferences", otherwise Textedit will use               ####
#### incompatible characters and your network configuration won't work!     ####
####                                                                        ####
################################################################################

How do I set up a new network on my OS_NAME?
---------------------------------------------

1.) Copy and paste the 'headless_nm.txt.template' file.
    Rename this file to 'headless_nm.txt'

2.) Open the file with your favourite text editor.
    Windows and macOS users, please read the note above!

    This file is fairly self-explanatory; only the 'REGDOMAIN'
    parameter requires further explanation:

    Valid country codes are:

        GB (United Kingdom)
        FR (France)
        DE (Germany)
        US (United States)
        SE (Sweden)

    For a complete list, please visit:
    https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

3.) Remove the SD card afterwards.

4.) Almost done... Please insert the SD card back into your SBC and wait for it
    to connect.

NOTE:

Plug in a monitor and watch the console output to obtain its IP address, or
consult your router's setup page to retrieve this information.

You can also try accessing it by its hostname:

    http://<your-hostname>.local

If you did not change the hostname during the initial flash, you can use:

    http://OS_NAME.local

5.) Enjoy OS_NAME :)
