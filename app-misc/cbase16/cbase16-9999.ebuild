# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit

if [[ "${PV}" == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/khuei/cbase16"
else
	KEYWORDS="~amd64"
	SRC_URI="https://github.com/khuei/cbase16/archive/v${PV}.tar.gz"
fi

DESCRIPTION="blazing fast base16 builder"
HOMEPAGE="https://github.com/khuei/cbase16"

LICENSE="GPL-3"
SLOT="0"
RESTRICT="mirror"

RDEPEND="
	dev-cpp/yaml-cpp
	dev-libs/libgit2
"
DEPEND="${RDEPEND}"

src_install() {
	emake DESTDIR="${D}" PREFIX="${EPREFIX}"/usr install
}
