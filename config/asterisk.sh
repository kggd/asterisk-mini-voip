#!/bin/bash
sudo apt update && sudo apt upgrade
sudo apt install asterisk -y
sudo systemctl start asterisk
sudo systemctl enable asterisk
sudo systemctl status asterisk
sudo asterisk -rvv
