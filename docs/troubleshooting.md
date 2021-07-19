# Troubleshooting

## My steppers are running backwards!
Refer to the stepper section at the top of printer.cfg, you can add or remove `!` in front of the dir_pin to reverse the direction of that particular stepper.

## Everytime i update my changes are gone.
You're not supposed to change *any* files inside the config/ folder. You should *only* change your printer.cfg, if you need to change settings refer to the [Configuration: overrides](configuration.md#overrides) section. 

## Klipper says the MCU is unable to connect
Double check your USB connection, try another cable (the one that comes with the board usually works), and check that your firmware was flashed correctly (refer to the guide for your board).
## Get help
For further support check out the v-coreos-support and klipper channels on Discord. Use the invite link below to join.

<a href="https://discord.gg/D62e8XNeYa" class="button">Join the Unnofficial RatRig Discord Community</a>