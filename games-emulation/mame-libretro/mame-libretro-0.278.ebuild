# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_CORE_NAME="mame"
LIBRETRO_REPO_NAME="libretro/mame"
LIBRETRO_COMMIT_SHA="b0dcc353e82871ea53022cc9544fa74af21f1ed5"
inherit check-reqs libretro-core

DESCRIPTION="MAME (current) for libretro."
HOMEPAGE="https://github.com/libretro/mame"

LICENSE="MAME-GPL"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="games-emulation/libretro-info"
RDEPEND="${DEPEND}"

CHECKREQS_MEMORY="8G" # Debug build requires more
CHECKREQS_DISK_BUILD="25G" # Debug build requires more

pkg_pretend() {
		einfo "Checking for sufficient disk space to build ${PN} with debugging CFLAGS"
		check-reqs_pkg_pretend
}

pkg_setup() {
		check-reqs_pkg_setup
}

src_compile() {
		myemakeargs=(
			PTR64=1
			NEW_GIT_VERSION=$(PV)
		)
		libretro-core_src_compile
}
