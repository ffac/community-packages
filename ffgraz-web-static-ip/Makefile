# SPDX-FileCopyrightText: Maciej Krüger <maciej@xeredo.it>
#
# SPDX-License-Identifier: MIT

include $(TOPDIR)/rules.mk

PKG_NAME:=ffgraz-web-static-ip

include $(TOPDIR)/../package/gluon.mk

define Package/ffgraz-web-static-ip
  DEPENDS:=+gluon-web-admin +ffgraz-web-model +ffgraz-static-ip
  TITLE:=UI for managing static IPs
endef

$(eval $(call BuildPackageGluon,ffgraz-web-static-ip))
