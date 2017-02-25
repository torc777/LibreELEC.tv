################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="openpht"
PKG_VERSION="2.0"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.openpht.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain JsonSchemaBuilder:host TexturePacker:host xmlstarlet:host Python zlib systemd pciutils lzo pcre swig:host libass curl fontconfig fribidi tinyxml libjpeg-turbo freetype libcdio taglib libxml2 libxslt yajl sqlite ffmpeg crossguid giflib libdvdnav libhdhomerun"
PKG_SECTION="mediacenter"
PKG_SHORTDESC="OpenPHT is a community driven fork of Plex Home Theater"
PKG_LONGDESC="OpenPHT is a community driven fork of Plex Home Theater"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CMAKE_SCRIPT="$PKG_BUILD/project/cmake/CMakeLists.txt"

  get_graphicdrivers

  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET dbus"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libX11 libXext libdrm libXrandr"
  KODI_XORG="-DENABLE_X11=ON"
else
  KODI_XORG="-DENABLE_X11=OFF"
fi

if [ ! "$OPENGL" = "no" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGL glu"
  KODI_OPENGL="-DENABLE_OPENGL=ON"
else
  KODI_OPENGL="-DENABLE_OPENGL=OFF"
fi

if [ "$OPENGLES_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $OPENGLES"
  KODI_OPENGLES="-DENABLE_OPENGLES=ON"
else
  KODI_OPENGLES="-DENABLE_OPENGLES=OFF"
fi

if [ "$ALSA_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET alsa-lib"
  KODI_ALSA="-DENABLE_ALSA=ON"
else
  KODI_ALSA="-DENABLE_ALSA=OFF"
fi

if [ "$PULSEAUDIO_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET pulseaudio"
  KODI_PULSEAUDIO="-DENABLE_PULSEAUDIO=ON"
else
  KODI_PULSEAUDIO="-DENABLE_PULSEAUDIO=OFF"
fi

if [ "$ESPEAK_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET espeak"
fi

if [ "$CEC_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libcec"
  KODI_CEC="-DENABLE_CEC=ON"
else
  KODI_CEC="-DENABLE_CEC=OFF"
fi

if [ "$KODI_OPTICAL_SUPPORT" = yes ]; then
  KODI_OPTICAL="-DENABLE_OPTICAL=ON"
else
  KODI_OPTICAL="-DENABLE_OPTICAL=OFF"
fi

if [ "$KODI_NONFREE_SUPPORT" = yes ]; then
  KODI_NONFREE="-DENABLE_NONFREE=ON"
else
  KODI_NONFREE="-DENABLE_NONFREE=OFF"
fi

if [ "$KODI_DVDCSS_SUPPORT" = yes ]; then
  KODI_DVDCSS="-DENABLE_DVDCSS=ON \
               -DLIBDVDCSS_URL=$ROOT/$SOURCES/libdvdcss/libdvdcss-$(get_pkg_version libdvdcss).tar.gz"
else
  KODI_DVDCSS="-DENABLE_DVDCSS=OFF"
fi

if [ "$KODI_BLURAY_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libbluray"
  KODI_BLURAY="-DENABLE_BLURAY=ON"
else
  KODI_BLURAY="-DENABLE_BLURAY=OFF"
fi

if [ "$AVAHI_DAEMON" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET avahi nss-mdns"
  KODI_AVAHI="-DENABLE_AVAHI=ON"
else
  KODI_AVAHI="-DENABLE_AVAHI=OFF"
fi

if [ "$KODI_MYSQL_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET mysql"
  KODI_MYSQL="-DENABLE_MYSQLCLIENT=ON"
else
  KODI_MYSQL="-DENABLE_MYSQLCLIENT=OFF"
fi

if [ "$KODI_AIRPLAY_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libplist"
  KODI_AIRPLAY="-DENABLE_PLIST=ON"
else
  KODI_AIRPLAY="-DENABLE_PLIST=OFF"
fi

if [ "$KODI_AIRTUNES_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libshairplay"
  KODI_AIRTUNES="-DENABLE_AIRTUNES=ON"
else
  KODI_AIRTUNES="-DENABLE_AIRTUNES=OFF"
fi

if [ "$KODI_NFS_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libnfs"
  KODI_NFS="-DENABLE_NFS=ON"
else
  KODI_NFS="-DENABLE_NFS=OFF"
fi

if [ "$KODI_SAMBA_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET samba"
  KODI_SAMBA="-DENABLE_SMBCLIENT=ON"
else
  KODI_SAMBA="-DENABLE_SMBCLIENT=OFF"
fi

if [ "$KODI_WEBSERVER_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libmicrohttpd"
fi

if [ "$KODI_UPNP_SUPPORT" = yes ]; then
  KODI_UPNP="-DENABLE_UPNP=ON"
else
  KODI_UPNP="-DENABLE_UPNP=OFF"
fi

if [ "$KODI_SSHLIB_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libssh"
  KODI_SSH="-DENABLE_SSH=ON"
else
  KODI_SSH="-DENABLE_SSH=OFF"
fi

if [ "$VDPAU_SUPPORT" = "yes" -a "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libvdpau"
  KODI_VDPAU="-DENABLE_VDPAU=ON"
else
  KODI_VDPAU="-DENABLE_VDPAU=OFF"
fi

if [ "$VAAPI_SUPPORT" = yes ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET libva-intel-driver"
  KODI_VAAPI="-DENABLE_VAAPI=ON"
else
  KODI_VAAPI="-DENABLE_VAAPI=OFF"
fi

if [ "$TARGET_ARCH" = "x86_64" ]; then
  KODI_ARCH="-DWITH_CPU=$TARGET_ARCH"
else
  KODI_ARCH="-DWITH_ARCH=$TARGET_ARCH"
fi

if [ ! "$KODIPLAYER_DRIVER" = default ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET $KODIPLAYER_DRIVER"
  if [ "$KODIPLAYER_DRIVER" = bcm2835-driver ]; then
    KODI_PLAYER="-DENABLE_MMAL=ON -DCORE_SYSTEM_NAME=rbpi"
  elif [ "$KODIPLAYER_DRIVER" = libfslvpuwrap ]; then
    KODI_PLAYER="-DENABLE_IMX=ON"
    CFLAGS="$CFLAGS -DHAS_IMXVPU -DLINUX -DEGL_API_FB"
    CXXFLAGS="$CXXFLAGS -DHAS_IMXVPU -DLINUX -DEGL_API_FB"
  elif [ "$KODIPLAYER_DRIVER" = libamcodec ]; then
    KODI_PLAYER="-DENABLE_AML=ON"
  fi
fi

KODI_LIBDVD="$KODI_DVDCSS \
             -DLIBDVDNAV_URL=$ROOT/$SOURCES/libdvdnav/libdvdnav-$(get_pkg_version libdvdnav).tar.gz \
             -DLIBDVDREAD_URL=$ROOT/$SOURCES/libdvdread/libdvdread-$(get_pkg_version libdvdread).tar.gz"

PKG_CMAKE_OPTS_TARGET="-DNATIVEPREFIX=$TOOLCHAIN \
                       -DWITH_TEXTUREPACKER=$TOOLCHAIN/bin/TexturePacker \
                       -DDEPENDS_PATH=$PKG_BUILD/depends \
                       -DPYTHON_INCLUDE_DIRS=$SYSROOT_PREFIX/usr/include/python2.7 \
                       -DENABLE_INTERNAL_FFMPEG=OFF \
                       -DFFMPEG_INCLUDE_DIRS=$SYSROOT_PREFIX/usr \
                       -DENABLE_INTERNAL_CROSSGUID=OFF \
                       -DENABLE_SDL=OFF \
                       -DENABLE_OPENSSL=ON \
                       -DENABLE_UDEV=ON \
                       -DENABLE_DBUS=ON \
                       -DENABLE_XSLT=ON \
                       -DENABLE_CCACHE=ON \
                       -DENABLE_LIRC=ON \
                       -DENABLE_EVENTCLIENTS=ON \
                       -DENABLE_LDGOLD=ON \
                       $KODI_ARCH \
                       $KODI_OPENGL \
                       $KODI_OPENGLES \
                       $KODI_OPENMAX \
                       $KODI_VDPAU \
                       $KODI_VAAPI \
                       $KODI_CEC \
                       $KODI_XORG \
                       $KODI_SAMBA \
                       $KODI_NFS \
                       $KODI_LIBDVD \
                       $KODI_AVAHI \
                       $KODI_UPNP \
                       $KODI_MYSQL \
                       $KODI_SSH \
                       $KODI_AIRPLAY \
                       $KODI_AIRTUNES \
                       $KODI_NONFREE \
                       $KODI_OPTICAL \
                       $KODI_BLURAY \
                       $KODI_PLAYER"

unpack() {
  rm -fr $BUILD/BUILD_OPENPHT
  rm -rf $BUILD/$PKG_NAME-$PKG_VERSION
  git clone --depth 1 --branch $OPENPHT_BRANCH $OPENPHT_REPO $BUILD/$PKG_NAME-$PKG_VERSION
}

post_patch() {
  OPENPHT_GITREV="$(git --git-dir=$BUILD/$PKG_NAME-$PKG_VERSION/.git rev-parse HEAD)"
  OPENPHT_VERSION_PREFIX=$(cat $BUILD/$PKG_NAME-$PKG_VERSION/version.txt|awk '/VERSION_MAJOR |VERSION_MINOR |VERSION_PATCH / {gsub(/\)/,""); printf $2"."}  END {print ""}'|sed 's/.$//g')
  OPENPHT_VERSION="${OPENPHT_VERSION_PREFIX}.${BUILD_NUMBER:-0}-$(git --git-dir=$BUILD/$PKG_NAME-$PKG_VERSION/.git rev-parse --short=8 HEAD)"
  echo "OPENPHT_GITREV=$OPENPHT_GITREV" > $BUILD/BUILD_OPENPHT
  echo "OPENPHT_VERSION_PREFIX=$OPENPHT_VERSION_PREFIX" >> $BUILD/BUILD_OPENPHT
  echo "OPENPHT_VERSION=$OPENPHT_VERSION" >> $BUILD/BUILD_OPENPHT
}

pre_configure_target() {
# kodi should never be built with lto
  strip_lto

  export LIBS="$LIBS -lz -lterminfo"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin/openpht
  rm -rf $INSTALL/usr/bin/openpht-standalone
  rm -rf $INSTALL/usr/bin/xbmc
  rm -rf $INSTALL/usr/bin/xbmc-standalone
  rm -rf $INSTALL/usr/share/openpht/cmake
  rm -rf $INSTALL/usr/share/applications
  rm -rf $INSTALL/usr/share/icons
  rm -rf $INSTALL/usr/share/pixmaps
  rm -rf $INSTALL/usr/share/openpht/addons/skin.estouchy
  rm -rf $INSTALL/usr/share/openpht/addons/skin.estuary
  rm -rf $INSTALL/usr/share/openpht/addons/service.xbmc.versioncheck
  rm -rf $INSTALL/usr/share/openpht/addons/visualization.vortex
  rm -rf $INSTALL/usr/share/xsessions

  mv $INSTALL/usr/lib/python2.7/dist-packages $INSTALL/usr/lib/python2.7/site-packages

  mkdir -p $INSTALL/usr/lib/openpht
    cp $PKG_DIR/scripts/openpht-config $INSTALL/usr/lib/openpht
    cp $PKG_DIR/scripts/openpht.sh $INSTALL/usr/lib/openpht

  mkdir -p $INSTALL/usr/lib/libreelec
    cp $PKG_DIR/scripts/systemd-addon-wrapper $INSTALL/usr/lib/libreelec

  mkdir -p $INSTALL/usr/bin
    cp $PKG_DIR/scripts/cputemp $INSTALL/usr/bin
      ln -sf cputemp $INSTALL/usr/bin/gputemp
    cp $PKG_DIR/scripts/setwakeup.sh $INSTALL/usr/bin

  mkdir -p $INSTALL/usr/share/openpht/addons
    cp -R $PKG_DIR/config/os.openelec.tv $INSTALL/usr/share/openpht/addons
    $SED "s|@OS_VERSION@|$OS_VERSION|g" -i $INSTALL/usr/share/openpht/addons/os.openelec.tv/addon.xml
    cp -R $PKG_DIR/config/os.libreelec.tv $INSTALL/usr/share/openpht/addons
    $SED "s|@OS_VERSION@|$OS_VERSION|g" -i $INSTALL/usr/share/openpht/addons/os.libreelec.tv/addon.xml
    cp -R $PKG_DIR/config/repository.libreelec.tv $INSTALL/usr/share/openpht/addons
    $SED "s|@ADDON_URL@|$ADDON_URL|g" -i $INSTALL/usr/share/openpht/addons/repository.libreelec.tv/addon.xml
    cp -R $PKG_DIR/config/repository.kodi.game $INSTALL/usr/share/openpht/addons

  mkdir -p $INSTALL/usr/share/openpht/config
    cp $PKG_DIR/config/guisettings.xml $INSTALL/usr/share/openpht/config
    cp $PKG_DIR/config/sources.xml $INSTALL/usr/share/openpht/config

# install project specific configs
    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/guisettings.xml ]; then
      cp -R $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/guisettings.xml $INSTALL/usr/share/openpht/config
    elif [ -f $PROJECT_DIR/$PROJECT/openpht/guisettings.xml ]; then
      cp -R $PROJECT_DIR/$PROJECT/openpht/guisettings.xml $INSTALL/usr/share/openpht/config
    fi

    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/sources.xml ]; then
      cp -R $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/sources.xml $INSTALL/usr/share/openpht/config
    elif [ -f $PROJECT_DIR/$PROJECT/openpht/sources.xml ]; then
      cp -R $PROJECT_DIR/$PROJECT/openpht/sources.xml $INSTALL/usr/share/openpht/config
    fi

  mkdir -p $INSTALL/usr/share/openpht/system/
    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/advancedsettings.xml ]; then
      cp $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/advancedsettings.xml $INSTALL/usr/share/openpht/system/
    elif [ -f $PROJECT_DIR/$PROJECT/openpht/advancedsettings.xml ]; then
      cp $PROJECT_DIR/$PROJECT/openpht/advancedsettings.xml $INSTALL/usr/share/openpht/system/
    else
      cp $PKG_DIR/config/advancedsettings.xml $INSTALL/usr/share/openpht/system/
    fi

  mkdir -p $INSTALL/usr/share/openpht/system/settings
    if [ -n "$DEVICE" -a -f $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/appliance.xml ]; then
      cp $PROJECT_DIR/$PROJECT/devices/$DEVICE/openpht/appliance.xml $INSTALL/usr/share/openpht/system/settings
    elif [ -f $PROJECT_DIR/$PROJECT/openpht/appliance.xml ]; then
      cp $PROJECT_DIR/$PROJECT/openpht/appliance.xml $INSTALL/usr/share/openpht/system/settings
    else
      cp $PKG_DIR/config/appliance.xml $INSTALL/usr/share/openpht/system/settings
    fi

  # update addon manifest
  ADDON_MANIFEST=$INSTALL/usr/share/openpht/system/addon-manifest.xml
  xmlstarlet ed -L -d "/addons/addon[text()='service.xbmc.versioncheck']" $ADDON_MANIFEST
  xmlstarlet ed -L -d "/addons/addon[text()='skin.estouchy']" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "repository.kodi.game" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "os.libreelec.tv" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "os.openelec.tv" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "repository.libreelec.tv" $ADDON_MANIFEST
  xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "service.libreelec.settings" $ADDON_MANIFEST

  # more binaddons cross compile badness meh
  sed -e "s:INCLUDE_DIR /usr/include/openpht:INCLUDE_DIR $SYSROOT_PREFIX/usr/include/openpht:g" \
      -e "s:CMAKE_MODULE_PATH /usr/lib/openpht /usr/share/openpht/cmake:CMAKE_MODULE_PATH $SYSROOT_PREFIX/usr/share/openpht/cmake:g" \
      -i $SYSROOT_PREFIX/usr/share/openpht/cmake/KodiConfig.cmake

  mkdir -p $SYSROOT_PREFIX/usr/lib/cmake/Kodi
   cp $SYSROOT_PREFIX/usr/share/openpht/cmake/KodiConfig.cmake $SYSROOT_PREFIX/usr/lib/cmake/Kodi

  if [ "$KODI_EXTRA_FONTS" = yes ]; then
    mkdir -p $INSTALL/usr/share/openpht/media/Fonts
      cp $PKG_DIR/fonts/*.ttf $INSTALL/usr/share/openpht/media/Fonts
  fi

  debug_strip $INSTALL/usr/lib/openpht/openpht.bin
}

post_install() {
  enable_service openpht.target
  enable_service openpht-autostart.service
  enable_service openpht-cleanlogs.service
  enable_service openpht-halt.service
  enable_service openpht-poweroff.service
  enable_service openpht-reboot.service
  enable_service openpht-waitonnetwork.service
  enable_service openpht.service
  enable_service openpht-lirc-suspend.service
  enable_service storage-.kodi.mount
}