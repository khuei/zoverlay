# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 savedconfig toolchain-funcs

DESCRIPTION="Dynamic virtual terminal manager"
HOMEPAGE="http://www.brain-dump.org/projects/dvtm/"
EGIT_REPO_URI="https://github.com/Z5483/dvtm"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"

RDEPEND=">=sys-libs/ncurses-6.1:0=[unicode]"
DEPEND="
	${RDEPEND}
	virtual/pkgconfig
"
PATCHES=(
	"${FILESDIR}"/${PN}-9999-gentoo.patch
)

src_prepare() {
	default

	restore_config config.h
}

src_compile() {
	tc-export PKG_CONFIG
	local msg=""
	use savedconfig && msg=", please check the configfile"
	emake CC=$(tc-getCC) ${PN}
}

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}/usr" STRIP=true install

	insinto /usr/share/${PN}
	newins config.h ${PF}.config.h

	dodoc README.md

	save_config config.h
}

pkg_postinst() {
	elog "This ebuild has support for user defined configs"
	elog "Please read this ebuild for more details and re-emerge as needed"
	elog "if you want to add or remove functionality for ${PN}"
}