# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2021-present 351ELEC (https://github.com/351ELEC)

PKG_NAME="openbor"
PKG_VERSION="e6aec66221963f34476f8bcbf7730181216d7e75"
PKG_ARCH="any"
PKG_SITE="https://github.com/DCurrent/openbor"
PKG_URL="$PKG_SITE.git"
PKG_DEPENDS_TARGET="toolchain SDL2 libogg libvorbisidec libvpx libpng"
PKG_SHORTDESC="OpenBOR is the ultimate 2D side scrolling engine for beat em' ups, shooters, and more!"
PKG_LONGDESC="OpenBOR is the ultimate 2D side scrolling engine for beat em' ups, shooters, and more!"
PKG_TOOLCHAIN="make"
GET_HANDLER_SUPPORT="git"

pre_configure_target() {
  PKG_MAKE_OPTS_TARGET="BUILD_LINUX_${ARCH}=1 -C ${PKG_BUILD}/engine SDKPATH=${SYSROOT_PREFIX} PREFIX=${TARGET_NAME}"
}

pre_make_target() {
  cd $PKG_BUILD/engine
  ./version.sh
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/bin
  cp OpenBOR $INSTALL/usr/bin/OpenBOR
  cp $PKG_DIR/scripts/*.sh $INSTALL/usr/bin
  chmod +x $INSTALL/usr/bin/*
  mkdir -p $INSTALL/usr/config/openbor  
  cp $PKG_DIR/config/master.cfg $INSTALL/usr/config/openbor/master.cfg
} 
