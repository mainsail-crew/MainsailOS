qemu-system-arm -cpu arm1176 -m 256 \
  -kernel emulation/kernel-qemu-4.19.50-buster \
  -M versatilepb \
  -dtb emulation/versatile-pb.dtb \
  -no-reboot \
  -nographic \
  -append "dwc_otg.lpm_enable=0 root=/dev/sda2 rootfstype=ext4 elevator=deadline fsck.repair=yes rootwait" \
  -drive "file=src/workspace/2020-02-13-raspbian-buster-0.0.5.img,index=0,media=disk,format=raw" \
  -net user,ipv4=on,ipv6=on,hostfwd=tcp::22222-:22,hostfwd=tcp::8888-:80 -net nic
