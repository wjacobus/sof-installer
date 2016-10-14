# sof-installer
A single script to install smart-on-fhir.

# Motivation
I decided to setup a stand alone smart-on-fhir instance due to my interest in developing interoperable medical apps. I went over to the smart-on-fhir github page and read and went through the steps outlined under their install section. However, I ran into various troubles in doing so. Thus, I've decided to write this script.

# Problem 1:
I am using Ubuntu 15.10 which makes use of **_systemd_** instead of **_upstart_**. Smart-on-fhir requires the use of upstart. Thus, we need to roll-back to upstart. The only way I know how to do so is shown below (Please let me know if there is a better way to do this).
```bash
sudo apt-get install upstart-sysv
sudo update-initramfs -u
```
reboot after you complete the above.
