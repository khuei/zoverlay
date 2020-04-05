# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Turns the spacebar key to another control key"
HOMEPAGE="https://github.com/Z5483/SpaceCtrl"
EGIT_REPO_URI="https://github.com/Z5483/SpaceCtrl"

LICENSE=""
SLOT="0"
KEYWORDS="amd64 x86"
IUSE=""

DEPEND="
	x11-libs/libXtst
	x11-libs/libX11
"
RDEPEND="${DEPEND}"
BDEPEND=""
