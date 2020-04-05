# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-p2p/btpd/btpd-0.15.ebuild,v 1.2 2012/03/13 12:02:54 phajdan.jr Exp $

EAPI=7

inherit git-r3 toolchain-funcs

DESCRIPTION="The BitTorrent Protocol Daemon"
HOMEPAGE="https://github.com/btpd/btpd/wiki"
EGIT_REPO_URI="https://github.com/btpd/btpd"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="libressl"

RDEPEND="
	!libressl? ( dev-libs/openssl )
	libressl? ( dev-libs/libressl )
"

DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
