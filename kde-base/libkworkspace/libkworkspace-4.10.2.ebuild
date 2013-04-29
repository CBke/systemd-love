# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KMNAME="kde-workspace"
KMMODULE="libs/kworkspace"
inherit kde4-meta

DESCRIPTION="A library for KDE desktop applications"
KEYWORDS="~amd64 ~arm ~ppc ~ppc64 ~x86 ~x86-fbsd ~amd64-linux ~x86-linux"
IUSE="debug"

KMEXTRACTONLY="
	ksmserver/org.kde.KSMServerInterface.xml
	kwin/org.kde.KWin.xml
"

KMSAVELIBS="true"

DEPEND="
	x11-libs/libxkbfile
	x11-libs/libXcomposite
	x11-libs/xcb-util-renderutil
"
RDEPEND="${DEPEND}"

PATCHES=(
	# Support for systemd AND ConsoleKit in kworkspace
	# contains a small hack, to be fixed properly soon
	# http://pkgs.fedoraproject.org/cgit/kde-workspace.git/
	"${FILESDIR}/kde-workspace-4.10.2-systemd-displaymanager.patch"
)

src_prepare() {
	sed -i -e 's/install( FILES kdisplaymanager.h/install( FILES kdisplaymanager.h screenpreviewwidget.h/' \
		libs/kworkspace/CMakeLists.txt || die "failed to provide screenpreviewwidget.h"

	kde4-meta_src_prepare
}
