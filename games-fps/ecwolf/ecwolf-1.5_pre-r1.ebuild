# Copyright 1999-2020 Ophelia Beatrice de Sica
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake xdg-utils

DESCRIPTION="ECWolf is a port of the Wolfenstein 3D engine based of Wolf4SDL."
HOMEPAGE="https://maniacsvault.net/ecwolf/"

if [[ ${PV} != "9999" ]] ; then
	KEYWORDS="~amd64 ~x86"
	SRC_URI="https://bitbucket.org/ecwolf/ecwolf/get/1.5pre.tar.gz -> ${P}.tar.gz"

	S="${WORKDIR}/ecwolf-ecwolf-601d5b2a0f12"
else
	inherit git-r3
	EGIT_REPO_URI="https://bitbucket.org/ecwolf/${PN}.git"
fi

LICENSE="BSD GPL-2+ MIT non-free? ( XMAME )"
SLOT="0"
IUSE="non-free"

RDEPEND="
	media-libs/libsdl[opengl]
	media-libs/sdl-mixer
	media-libs/sdl-net
	sys-libs/zlib
	app-arch/bzip2
	media-libs/libjpeg-turbo
	x11-libs/gtk+
	app-arch/xz-utils"
DEPEND="${RDEPEND}"

src_prepare() {
	eapply "${FILESDIR}/${PN}-gentoo.patch"
	default
	cmake_src_prepare
}

src_configure() {
	local mycmakeargs=(
		-DGPL="$(usex non-free 0 1)"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
}

pkg_postinst() {
	xdg_icon_cache_update

	echo
	ewarn "The original game data files are required for operation."
	elog "Consult the man page for more information."
	echo
}
