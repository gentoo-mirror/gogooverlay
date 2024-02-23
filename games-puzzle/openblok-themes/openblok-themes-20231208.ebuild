# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

GAMEBOY_HASH="ea6ef1c1f8a5240596515f2977bcfd2aa7b78d51"
PUYO_HASH="69a25bea326507287db3cbe6ddc7dadc352d24e1"

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="
	https://github.com/mmatyas/openblok-theme-gameboy/archive/${GAMEBOY_HASH}.zip -> gameboy.zip
	https://github.com/mmatyas/openblok-theme-puyo/archive/${PUYO_HASH}.zip -> puyo.zip
"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="bindist"

DEPEND="games-puzzle/openblok"
RDEPEND="${DEPEND}"
BDEPEND=""

S=${WORKDIR}

src_install() {
	insinto "/usr/share/openblok/themes/gameboy"
	doins -r "${S}"/openblok-theme-gameboy-${GAMEBOY_HASH}/*

	insinto "/usr/share/openblok/themes/puyo"
	doins -r "${S}"/openblok-theme-puyo-${PUYO_HASH}/*
}
