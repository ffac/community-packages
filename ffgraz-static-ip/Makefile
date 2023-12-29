# SPDX-FileCopyrightText: Maciej Krüger <maciej@xeredo.it>
#
# SPDX-License-Identifier: MIT

include $(TOPDIR)/rules.mk

PKG_NAME:=ffgraz-static-ip
PKG_VERSION:=1

PKG_MAINTAINER:=Maciej Krüger <maciej@xeredo.it>
PKG_LICENSE:=MIT

include $(TOPDIR)/../package/gluon.mk

define Package/ffgraz-static-ip
  TITLE:=Static IP assignment and configuration for gluon
  DEPENDS:=+gluon-core +luci-lib-ip
endef

$(eval $(call BuildPackageGluon,ffgraz-static-ip))
