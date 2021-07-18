# Configuring V-CoreOS

V-CoreOS only needs minimal configuration to work, but comes with a lot of optional functionality that you can enable manually.

## Introduction
?> V-CoreOS comes preconfigured for the V-Core 3, to use other printers, copy the contents of the printer template from `config/templates/` to your printer.cfg

Once you have completed the initial [setup](quickstart.md) and opened [http://v-coreos.local/](v-coreos.local) in your browser, you are almost ready to print. There's a just a few things to go over to make sure the configuration matches your particular setup.

## Fluidd
In the configuration page in Fluidd (the webinterface you just opened in your browser), there's a list of files, among them is `printer.cfg`. Right click it and choose "Edit". This is where your klipper configuration lives. As you can see, it's prepopulated with some included files which are meant to get you up and running quick and easy. Follow the instructions in the file to make sure the configuration matches your setup.

## Overrides

You can override any setting in V-CoreOS, to do so you just copy the section and the parameter you need to change, and paste it in your printer.cfg after the related config file has been loaded. Let's say we wanted to change the current the extruder motor. If we navigate to `config/printers/v-core-3/steppers.cfg` we will be presented with the following file:
 wef [gist: script.js](https://gist.githubusercontent.com/anikethsaha/f88893bb563bb7229d6e575db53a8c15/raw/script.js ':include :type=code')