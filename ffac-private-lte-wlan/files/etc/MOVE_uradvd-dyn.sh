#!/bin/sh

# Pfad zur uradvd-Konfigurationsdatei
URA_ADV_CONF="/etc/config/uradvd"

# Aktuelles IPv6-Präfix von wwan0 abrufen, doppelte Einträge entfernen
IPV6_PREFIX=$(ip -6 addr show dev wwan0 | grep 'global' | grep -v 'temporary' | awk '{print $2}' | cut -f1,2,3,4 -d':' | sed 's/$/::\/64/' | sort | uniq)

# Schauen ob Prefix gefunden, falls nein kein IPv6
if [ -z "$IPV6_PREFIX" ]; then
    exit 1
fi

# uradvd-Konfiguration aktualisieren
{
    echo "config interface"
    echo "    option enabled '1'"
    echo "    option ifname 'br-wan'"
    echo "    option default_lifetime '1800'"
    echo "    list prefix_on_link '$IPV6_PREFIX'"
    echo "    list dns '2620:fe::fe'"
} > $URA_ADV_CONF

# uradvd neu starten
/etc/init.d/uradvd Restart
