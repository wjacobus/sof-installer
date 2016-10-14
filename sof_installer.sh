#!/bin/bash

echo "Setting up pre-requisuites for smart-on-fhir."
sudo apt-get update
sudo apt-get install curl git python-pycurl python-pip python-yaml python-paramiko python-jinja2
sudo pip install ansible==1.8.2
echo "Done."
echo "Downloading smart-on-fhir source."
git clone https://github.com/smart-on-fhir/installer
echo "Done."
echo "Creating smart-on-fhir directory."
mkdir smart-on-fhir
echo "Done."
echo "Changing directory to installer/provisioning"
cd installer/provisioning
echo "Done."
echo "Running ansible playbook."
sudo ansible-playbook  -c local -i 'localhost,' -vvvv smart-on-fhir-servers.yml
