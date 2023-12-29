# SPDX-FileCopyrightText: Maciej Krüger <maciej@xeredo.it>
#
# SPDX-License-Identifier: MIT

include $(TOPDIR)/rules.mk

PKG_NAME:=ffgraz-yggdrasil

PKG_MAINTAINER:=Maciej Krüger <maciej@xeredo.it>
PKG_LICENSE:=MIT

include $(TOPDIR)/../package/gluon.mk

define Package/ffgraz-yggdrasil
  TITLE:=yggdrasil integration
  DEPENDS:=+gluon-core +yggdrasil
endef

$(eval $(call BuildPackageGluon,ffgraz-yggdrasil))
