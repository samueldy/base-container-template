#!/usr/bin/env bash
set -e

echo "Install TigerVNC server"
wget -qO- https://sourceforge.net/projects/tigervnc/files/stable/1.12.0/tigervnc-1.12.0.x86_64.tar.gz | tar xz --strip 1 -C /

# Now restore old behavior by putting the vncserver Perl script back onto $PATH.
# Thanks to https://www.linuxfromscratch.org/blfs/view/svn/xsoft/tigervnc.html
install -m755 --owner=root /usr/libexec/vncserver /usr/bin

# Try to get XFCE to start under VNC
sed -i -e 's|Exec=startxfce4|Exec=dbus-launch startxfce4|g' /usr/share/xsessions/xfce.desktop