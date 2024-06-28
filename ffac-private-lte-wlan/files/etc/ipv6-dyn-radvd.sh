#!/bin/sh

# dny-uradvd Script nach Hotplug verschieben
script_dir=$(dirname "$0")
file_name="MOVE_uradvd-dyn.sh"
destination="/etc/hotplug.d/iface/40-update-radvd"
mv "${script_dir}/${file_name}" "${destination}"

# Datei ausfuerbar machen
chmod +x /etc/hotplug.d/iface/40-update-radvd