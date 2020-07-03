# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="a generic, highly customizable, and efficient menu for the X Window System"
HOMEPAGE="https://tools.suckless.org/dmenu/"
EGIT_REPO_URI="https://github.com/Z5483/slstatus.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 ~arm arm64 hppa ~ppc ~ppc64 x86"
IUSE="xinerama"

RDEPEND="
	x11-libs/libX11
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}"/${PN}-9999.patch
)

src_prepare() {
	default
	restore_config config.h
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" install

	dodoc README

	save_config config.h
}
