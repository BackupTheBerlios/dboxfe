#/*
#*   Copyright (C) 2004 - 2009 by Alexander Saal <alex.saal@gmx.de>
#*
#*   This program is free software; you can redistribute it and/or modify
#*   it under the terms of the GNU General Public License as published by
#*   the Free Software Foundation; either version 3 of the License, or (at
#*   your option) any later version.
#*
#*   This program is distributed in the hope that it will be useful, but
#*   WITHOUT ANY WARRANTY; without even the implied warranty of
#*   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#*   GNU General Public License for more details.
#*
#*   You should have received a copy of the GNU General Public License
#*   along with this program; if not, write to the Free Software Foundation,
#*   Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#*/

include(dboxfe/dboxfe.pri)
include(../3rdparty/3rdparty.pri)
include(../base/base.pri)

# Qt 4 Settings
TEMPLATE = app
DESTDIR	= ../bin

RESOURCES += ../resource/dboxfe.qrc
RESOURCES += ../resource/templates.qrc
CONFIG += debug thread warn_on qt
QT += xml network

# Project Misc files
DISTFILES += ../resource/thanks
DISTFILES += ../resource/LICENSE.GPL

# Config settings
CONFIG(debug, debug|release) {

  TARGET = dboxfed
  RCC_DIR = ../build/dboxfed/rcc
  MOC_DIR += ../build/dboxfed/moc
  OBJECTS_DIR += ../build/dboxfed/obj
  UI_DIR += ../build/dboxfed/ui

} else {

  TARGET = dboxfe
  RCC_DIR = ../build/dboxfe/rcc
  MOC_DIR += ../build/dboxfe/moc
  OBJECTS_DIR += ../build/dboxfe/obj
  UI_DIR += ../build/dboxfe/ui

  unix {
    QMAKE_POST_LINK = strip -s ../bin/dboxfe
  }
}

# Windows settings
win32 {
  CONFIG += embed_manifest_exe
  RC_FILE = ../resource/dboxfe.rc
  CONFIG -= console
}

# Mac settings
mac {
  QMAKE_MAC_SDK = /Developer/SDKs/MacOSX10.5.sdk
  QMAKE_MACOSX_DEPLOYMENT_TARGET = 10.5
  CONFIG += x86 ppc
}
