Wifi-README.txt
###############


Due to changes in Raspberry Pi OS, which OS_NAME is based on,
there is no longer a OS_NAME-wpa-supplicant.txt available.

How do I setup a (new) network on my Pi ?
-----------------------------------------

As described in the original Raspberry Pi OS documentation.
See https://www.raspberrypi.com/documentation/computers/configuration.html#setting-up-a-headless-raspberry-pi.


Quote:
    You will need to define a wpa_supplicant.conf file for your particular wireless network.
    Put this file onto the boot folder of the SD card.
    When the Raspberry Pi boots for the first time,
    it will copy that file into the correct location in the Linux root file system
    and use those settings to start up wireless networking.

    The Raspberry Pi’s IP address will not be visible immediately after power on,
    so this step is crucial to connect to it headlessly.
    Depending on the OS and editor you are creating this on,
    the file could have incorrect newlines or the wrong file extension,
    so make sure you use an editor that accounts for this.
    Linux expects the line feed (LF) newline character.

What does that all mean? What have I to do now?
----------------------------------------------

First, ensure you have a proper text editor.
Recommendations are Notepad++, VSCode, Atom or SublimeText.

################################################################################
####                       IMPORTANT! ATTENTION!                            ####
################################################################################

!!!!! HEADS-UP WINDOWS USERS !!!!!
----------------------------------

Do not use Wordpad for editing this file, it will mangle it and your
configuration won't work. Use a proper text editor instead.

!!!!! HEADS-UP MACOS X USERS !!!!!
---------------------------------

If you use Textedit to edit this file make sure to use "plain text format"
and "disable smart quotes" in "Textedit > Preferences", otherwise Textedit
will use none-compatible characters and your network configuration won't work!


1.) Open your choosen text editor and create a new file called

    wpa_supplicant.conf

2.) Create a basic configuration file. This has to be in place!

    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    country=<Insert 2 letter ISO 3166-1 country code here>
    update_config=1

Valid Country Codes are:

    GB (United Kingdom)
    FR (France)
    DE (Germany)
    US (United States)
    SE (Sweden)

For a full list, please visit https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2

2.1) If you plan to use multiple WiFi networks, also add

    ap_scan=1

to the mentioned basic configuration.


3.) Setup your "network" block.

For detailed information, please consult:
https://linux.die.net/man/5/wpa_supplicant.conf
or
https://wiki.debian.org/WiFi/HowToUse#wpa_supplicant
or
https://man.archlinux.org/man/wpa_supplicant.conf.5

Examples:

Open or unsecured WiFi network:
-------------------------------

# Open/unsecured
network={
  scan_ssid=1 # Used to find hidden SSID's
  ssid="put SSID here"
  key_mgmt=NONE
}

-------------------------------


WEP "secured" network:
-------------------------------

NOTE:

    WEP can be cracked within minutes. If your network is still relying on this
    encryption scheme you should seriously consider to update your network ASAP.

network={
  ssid="put SSID here"
  key_mgmt=NONE
  wep_key0="put password here"
  wep_tx_keyidx=0
}
--------------------------------


WPA2 Personal secured network:
(Please don't use WPA secured networks, WPA isn't secure anymore)
--------------------------------

# WPA/WPA2 secured
network={
        scan_ssid=1 # Used to find hidden SSID's
        ssid="<Name of your wireless LAN>"
        psk="<Password for your wireless LAN>"
        proto=RSN
        key_mgmt=WPA-PSK
        pairwise=CCMP
        auth_alg=OPEN
}
--------------------------------

For the WPA2 Enterprise setup, please use your google-foo.
This is an advanced topic!

4.) Put that file on to the "/boot" partition,
this partition is FAT32 formatted and should be visible if you plug the SD Card into your computer.

If you created a file while the Pi was running, copy that file to boot.
Assuming you created the file in your users "home" directory use

    sudo cp -v wpa_supplicant.conf /boot/

5.) Almost done... Please reboot the pi and wait for it to connect.

NOTE:

Attach a screen and watch the console output to get its IP or
consult your Router setup page to grab that information.

You could also try to reach it by its hostname.

    http://<yourpisname>.local

If you didnt change the hostname during initial flash, you could use

    http://OS_NAME.local

6.) Enjoy OS_NAME :)
