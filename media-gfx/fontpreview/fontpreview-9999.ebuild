# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit git-r3

DESCRIPTION="Highly customizable and minimal font previewer written in bash"
HOMEPAGE="https://github.com/sdushantha/fontpreview"
EGIT_REPO_URI="https://github.com/Z5483/fontpreview"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	x11-misc/xdotool
	app-shells/fzf
	media-gfx/imagemagick
	media-gfx/sxiv
"

src_prepare() {
	sed -i 's#install:#install:\n\t@mkdir -p $(DESTDIR)$(BINDIR)#' Makefile || die

	default
}
