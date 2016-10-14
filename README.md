# sof-installer
A single script to install smart-on-fhir.

# Motivation
I decided to setup a stand alone smart-on-fhir instance due to my interest in developing interoperable medical apps. I went over to the smart-on-fhir github page and read and went through the steps outlined under their install section. However, I ran into various troubles in doing so. Thus, I've decided to write this script.


### Before running the script make sure you have solved the problems outlined below.

# Problem 1:
I am using Ubuntu 15.10 which makes use of **_systemd_** instead of **_upstart_**. Smart-on-fhir requires the use of upstart. Thus, we need to roll-back to upstart. The only way I know how to do so is shown below (Please let me know if there is a better way to do this).
```bash
sudo apt-get install upstart-sysv
sudo update-initramfs -u
```
reboot after you complete the above.

# Problem 2:
If we take a peek in the **_custom_settings.yml_** file within the **_installer_** directory we'll see the following:
```
keystore_password: "changeme"
username: fhir
userpass: secretpass
auth_server_host: localhost
fhir_server_host: localhost
app_server_host: localhost
docs_server_host: localhost
#use_custom_ssl_certificates: false
#custom_ssl_certificates_path: /example/local/path
fhir_server_branch: v0.1.2
auth_server_branch: f0.1.0
auth_ldap_server_branch: f0.1.0
sample_patients_branch: v0.1.0
fhir_starter_branch: v0.1.2
cardiac_risk_branch: v0.1.0
bp_centiles_branch: v0.1.1
growth_chart_branch: v0.1.1
fhir_demo_app_branch: v0.1.0
mpr_monitor_branch: v0.1.0
diabetes_monograph_branch: v0.1.0
disease_monograph_branch: v0.1.0
```
Based on the aboveI concluded that the installer creates a user named fhir on my machine with the password __secretpass__. However, if we try to  log into the fhir user account the password doesn't work. Thus, I changed the password manually. This is shown below.

```
sudo passwd fhir
```

### We are now ready to run my script.
