# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils pax-utils

DESCRIPTION="Open Source build of Visual Studio Code"
HOMEPAGE="https://code.visualstudio.com"
SRC_URI="
	amd64? ( https://github.com/VSCodium/vscodium/releases/download/${PV}/VSCodium-linux-x64-${PV}.tar.gz -> ${P}-x64.tar.gz )"
RESTRICT="mirror strip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cairo libsecret libnotify nss png"

DEPEND="
        png? ( media-libs/libpng )
	x11-libs/gtk+
        cairo? ( x11-libs/cairo )
	x11-libs/libXtst
"

RDEPEND="
	${DEPEND}
        libnotify? ( x11-libs/libnotify )
        nss? ( dev-libs/nss )
	libsecret? ( app-crypt/libsecret[crypt] )
"

QA_PRESTRIPPED="opt/${PN}/code"

S="${WORKDIR}"

src_install(){
	pax-mark m code
	insinto "/opt/${PN}"
	doins -r *
	dosym "../../opt/${PN}/bin/codium" "/usr/bin/${PN}"
	dosym "../../opt/${PN}/bin/codium" "/usr/bin/codium"
	make_desktop_entry "${PN}" "Visual Studio Code" "${PN}" "Development;IDE"
	doicon "${FILESDIR}/${PN}.png"
	fperms +x "/opt/${PN}/codium"
	fperms +x "/opt/${PN}/bin/codium"
	fperms +x "/opt/${PN}/resources/app/node_modules.asar.unpacked/vscode-ripgrep/bin/rg"
	fperms +x "/opt/${PN}/resources/app/extensions/git/dist/askpass.sh"
	insinto "/usr/share/licenses/${PN}"
	for i in resources/app/LICEN*; do
		newins "${i}" "$(basename ${i})"
	done
}

pkg_postinst(){
	elog "You may install some additional utils, so check them in:"
	elog "https://code.visualstudio.com/Docs/setup#_additional-tools"
	elog ""
	elog "Upstream renamed the binary from vscodium to codium."
	elog "remember to update your aliases and shortcuts"
}
