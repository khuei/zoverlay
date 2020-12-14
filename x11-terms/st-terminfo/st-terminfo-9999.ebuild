# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit eutils git-r3

DESCRIPTION="terminfo for st"
HOMEPAGE="http://st.suckless.org/"
EGIT_REPO_URI="https://github.com/Z5483/st.git"

LICENSE="MIT-with-advertising"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/ncurses"
DEPEND="${RDEPEND}"

src_prepare() {
	default
	mkdir terminfo
}

src_compile() {
	tic -sxo terminfo st.info
}

src_install() {
	insinto "/usr/share/${PN%-*}"
	doins -r terminfo

	newenvd - "51${PN%-*}" <<- EOF
		TERMINFO_DIRS="/usr/share/${PN%-*}/terminfo"
		COLON_SEPARATED="TERMINFO_DIRS"
	EOF
}
