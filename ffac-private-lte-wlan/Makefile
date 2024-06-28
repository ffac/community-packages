# SPDX-FileCopyrightText: 2024 Marius Wehrmann
# SPDX-License-Identifier: BSD-2-Clause
include $(TOPDIR)/rules.mk

PKG_NAME:=ffac-private-lte-wlan
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_LICENSE:=BSD-2-Clause

include $(TOPDIR)/../package/gluon.mk

define Package/$(PKG_NAME)
  TITLE:=bypass FF-Offloading for Direct Network Access through LTE via Private WAN-Socket and (WAN)-WiFi
  DEPENDS:=+uradvd
endef

define Package/$(PKG_NAME)/description
  The functionality of this package allows devices connected to a private WAN WiFi to utilize the LTE WAN 
  connection directly, without the typical redirection or offloading to local network resources. This is 
  achieved by dynamically managing network routing and gateway settings to ensure that all traffic is 
  directed through the LTE connection, providing an uninterrupted and low-latency internet experience.
endef


define Build/Compile
	$(call Gluon/Build/Compile)
	./gluonShellDiet.sh files/etc/ipv4-dhcp-nat.sh > $(PKG_BUILD_DIR)/ipv4-dhcp-nat.sh
  ./gluonShellDiet.sh files/etc/ipv6-dyn-radvd.sh > $(PKG_BUILD_DIR)/ipv6-dyn-radvd.sh
  ./gluonShellDiet.sh MOVE_uradvd-dyn.sh > $(PKG_BUILD_DIR)/MOVE_uradvd-dyn.sh
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/bin

	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ipv4-dhcp-nat.sh $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/ipv6-dyn-radvd.sh $(1)/usr/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/MOVE_uradvd-dyn.sh $(1)/etc/hotplug.d/iface/40-update-radvd
endef


$(eval $(call BuildPackageGluon,$(PKG_NAME)))
