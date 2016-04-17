
include $(TOPDIR)/rules.mk

PKG_NAME:=wifidog
PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/wifidog
  SECTION:=wifidog
  CATEGORY:=IBeacon
  TITLE:=wifidog program
  DEPENDS:=+libstdcpp +libm +libpthread +kmod-ipt-extra +iptables-mod-extra +kmod-ipt-ipopt +iptables-mod-ipopt +kmod-ipt-nat +iptables-mod-nat
endef

define Package/wifidog/description
 	The Wifidog project is a complete and embeddable captive 
	portal solution for wireless community groups or individuals 
	who wish to open a free Hotspot while still preventing abuse 
	of their Internet connection.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef


define Build/Compile
	$(MAKE) -C $(PKG_BUILD_DIR) \
		CC="$(TARGET_CC)" \
		CXX="$(TARGET_CXX)" \
		CFLAGS="$(TARGET_CFLAGS) -Wall" \
		LDFLAGS="$(TARGET_LDFLAGS)"
endef

define Package/wifidog/install
	$(INSTALL_DIR) $(1)/usr/ibeacon/bin/
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/wifidog $(1)/usr/ibeacon/bin/
	
	$(INSTALL_DATA) ./files/cbProb.conf $(1)/usr/ibeacon/conf/
	#$(LN) $(1)/etc/init.d/startup $(1)/etc/rc.d/S99startup
endef

$(eval $(call BuildPackage,wifidog))
