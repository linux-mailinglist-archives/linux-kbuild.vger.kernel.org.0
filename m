Return-Path: <linux-kbuild+bounces-6447-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DD8A7CC0D
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Apr 2025 00:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD1DE176E98
	for <lists+linux-kbuild@lfdr.de>; Sat,  5 Apr 2025 22:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64D71A83F4;
	Sat,  5 Apr 2025 22:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="beEXuG2j"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A899E1C27;
	Sat,  5 Apr 2025 22:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743890706; cv=none; b=gGv9lW9KkX6L36nKqplzO0PuVBlip3lW4cESh8GPGpxk+JrC/tk1j7itvxGbRTvJQIP3FDwI5jnedw8sYtW43WFy2vcd8tX7RImgK+KClrGE1kFUko8t75g9jbniuuzi6vtgIPQSEgA70eUYiLmaT0U1TlBsOxCDywQluXYz5S4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743890706; c=relaxed/simple;
	bh=cEiIbotG147pXZCx594XmcLOKgd/Q44o08EkQKm3CUY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=uzwNgo4XH8RAEi3hFlsPQQVgtzYh2fWKETdcq7ZXnzJNWTjdNjXgtmPkjfk4vTX1iu5czO9jCH+tBAybSHdfySbk8y3ARl+CkKYlg5dZ+EX+GWJu6J9DrZF06Wo1UdO7hE1RXJxqWhYwEeTvb94tPNLkvey7ojun5uiEkh5uD/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=beEXuG2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14490C4CEE4;
	Sat,  5 Apr 2025 22:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743890705;
	bh=cEiIbotG147pXZCx594XmcLOKgd/Q44o08EkQKm3CUY=;
	h=From:Date:Subject:To:Cc:From;
	b=beEXuG2jdJ7Izz/lzCoJT7FKCucU3gVhuDe8LLi2qs18KM0pEZsqWf/2PZF9HOvGM
	 AUNhe5HxJy9uGQQCmT4oeOiNTMV1FlJvbPtaAUlHwv8INhFOtAJX6Divlox182lLqN
	 f5XIqhhllBsAlXQyJxQ1VJND/LXr0qTseDKEX1hsg5n98h7FwiXrRhT0go2GX/jsXT
	 JSwEpBkXlKS90z397ScdU9P4VyVGT+zB0z6B91RvHYRDY2md+bt2PbJLgwbXNZD8FQ
	 o9IMv0NM3/Hvx3zHbNXsHKveg0Ks4zn47aNVc9VbYHhg/coYM2c+wjEk0FSCaIpKPY
	 1wRe2ubxJYlbA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so4003290e87.2;
        Sat, 05 Apr 2025 15:05:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRbUHE3r2njTzhLz5a1ZHV9cloXMBql63sP8+DYM3+wuJ/ZSyabxh2MJmI2AqpvYyhDml83zieddT7cVY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9naHYZmx+Ort3of/gcjNj8CFDL2rOt4sMPdB+wPdpClb8cj0q
	13oSdAO/RIT6lYDOOO6IjpVMnO7iYHWy/yDRp96cEfIOqerzP5pZed2zgoWFyINi5owGGwBRH7M
	9ZgctpofFo25+zSm2U5k51M3fnEk=
X-Google-Smtp-Source: AGHT+IFwC8F9VkzeXg6ut7ygBHrKWEAqU5SbHZ+Wq1+J4Op7XVd5k7qRg1YQ2EyXPie1SX9Bk+5E4c43Np3LKthnmgg=
X-Received: by 2002:a05:6512:230f:b0:545:d27:e367 with SMTP id
 2adb3069b0e04-54c233746d6mr2229376e87.42.1743890703680; Sat, 05 Apr 2025
 15:05:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 6 Apr 2025 07:04:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
X-Gm-Features: ATxdqUElUR9iPWDdCA1lo3BlEZO9promOLPJCGTPn8Eat2UfghrDAeXfflnvJBM
Message-ID: <CAK7LNATT_+Z6x0kBy9fkTTucM5NTv0XiG9TYKNDOwL2M9y3WhA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.15-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull Kbuild updates for v6.15-rc1.

You will get a merge conflict in rust/Makefile.
You can find the resolution in linux-next.

Thank you



The following changes since commit 80e54e84911a923c40d7bee33a34c1b4be148d7a=
:

  Linux 6.14-rc6 (2025-03-09 13:45:25 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.15

for you to fetch changes up to a7c699d090a1f3795c3271c2b399230e182db06e:

  kbuild: rpm-pkg: build a debuginfo RPM (2025-04-06 06:22:01 +0900)

----------------------------------------------------------------
Kbuild updates for v6.15

 - Improve performance in gendwarfksyms

 - Remove deprecated EXTRA_*FLAGS and KBUILD_ENABLE_EXTRA_GCC_CHECKS

 - Support CONFIG_HEADERS_INSTALL for ARCH=3Dum

 - Use more relative paths to sources files for better reproducibility

 - Support the loong64 Debian architecture

 - Add Kbuild bash completion

 - Introduce intermediate vmlinux.unstripped for architectures that need
   static relocations to be stripped from the final vmlinux

 - Fix versioning in Debian packages for -rc releases

 - Treat missing MODULE_DESCRIPTION() as an error

 - Convert Nios2 Makefiles to use the generic rule for built-in DTB

 - Add debuginfo support to the RPM package

----------------------------------------------------------------
Alexandru Gagniuc (1):
      kbuild: deb-pkg: don't set KBUILD_BUILD_VERSION unconditionally

Ard Biesheuvel (4):
      kbuild: link-vmlinux.sh: Make output file name configurable
      kbuild: Introduce Kconfig symbol for linking vmlinux with relocations
      kbuild: Create intermediate vmlinux build with relocations preserved
      x86: Get rid of Makefile.postlink

Daniel Gomez (1):
      kconfig: merge_config: use an empty file as initfile

Jeff Johnson (1):
      modpost: require a MODULE_DESCRIPTION()

Kefan Liu (1):
      Documentation/kbuild: Fix indentation in modules.rst example

Kris Van Hees (1):
      kbuild: exclude .rodata.(cst|str)* when building ranges

Krzysztof Kozlowski (1):
      docs: kconfig: Mention IS_REACHABLE as way for optional dependency

Masahiro Yamada (17):
      kbuild: remove EXTRA_*FLAGS support
      gen_compile_commands.py: remove code for '\#' replacement
      genksyms: factor out APP for the ST_NORMAL state
      kconfig: do not clear SYMBOL_VALID when reading include/config/auto.c=
onf
      kconfig: remove unnecessary cast in sym_get_string()
      modpost: introduce get_basename() helper
      modpost: use strstarts() to clean up parse_source_files()
      kbuild: move -fzero-init-padding-bits=3Dall to the top-level Makefile
      kbuild: remove KBUILD_ENABLE_EXTRA_GCC_CHECKS support
      kbuild: add Kbuild bash completion
      Revert "kheaders: Ignore silly-rename files"
      kbuild: do not generate .tmp_vmlinux*.map when CONFIG_VMLINUX_MAP=3Dy
      kbuild: deb-pkg: fix versioning for -rc releases
      kbuild: deb-pkg: remove "version" variable in mkdebian
      kbuild: deb-pkg: add comment about future removal of KDEB_COMPRESS
      kbuild: pacman-pkg: hardcode module installation path
      nios2: migrate to the generic rule for built-in DTB

Miguel Ojeda (2):
      kbuild: rust: add rustc-min-version support function
      rust: kbuild: skip `--remap-path-prefix` for `rustdoc`

Sami Tolvanen (1):
      gendwarfksyms: Add a separate pass to resolve FQNs

Seyediman Seyedarab (1):
      kbuild: fix argument parsing in scripts/config

Thomas Wei=C3=9Fschuh (4):
      kbuild: implement CONFIG_HEADERS_INSTALL for Usermode Linux
      kbuild, rust: use -fremap-path-prefix to make paths relative
      x86: drop unnecessary prefix map configuration
      kbuild: make all file references relative to source root

Uday Shankar (2):
      scripts: make python shebangs specific about desired version
      kbuild: rpm-pkg: build a debuginfo RPM

WangYuli (1):
      kbuild: deb-pkg: add debarch for ARCH=3Dloongarch64

Xi Ruoyao (1):
      kbuild: add dependency from vmlinux to sorttable

Xin Li (Intel) (1):
      kbuild: Add a help message for "headers"

 .gitignore                                   |   1 +
 Documentation/dev-tools/checkpatch.rst       |  18 --
 Documentation/kbuild/bash-completion.rst     |  65 ++++
 Documentation/kbuild/index.rst               |   2 +
 Documentation/kbuild/kconfig-language.rst    |  29 +-
 Documentation/kbuild/makefiles.rst           |  17 +-
 Documentation/kbuild/modules.rst             |   2 +-
 Documentation/kbuild/reproducible-builds.rst |  17 --
 MAINTAINERS                                  |   1 +
 Makefile                                     |  23 +-
 arch/Kconfig                                 |   7 +
 arch/arm64/Makefile                          |   2 +-
 arch/mips/Kconfig                            |   1 +
 arch/mips/Makefile                           |   4 -
 arch/mips/Makefile.postlink                  |   2 +-
 arch/nios2/Kbuild                            |   2 +-
 arch/nios2/boot/dts/Makefile                 |   4 +-
 arch/nios2/kernel/prom.c                     |   2 +-
 arch/nios2/platform/Kconfig.platform         |  11 +-
 arch/riscv/Kconfig                           |   1 +
 arch/riscv/Makefile                          |   2 +-
 arch/riscv/Makefile.postlink                 |  11 +-
 arch/riscv/boot/Makefile                     |   5 +-
 arch/s390/Kconfig                            |   1 +
 arch/s390/Makefile                           |   2 +-
 arch/s390/Makefile.postlink                  |   4 +-
 arch/x86/Kconfig                             |   1 +
 arch/x86/Makefile                            |   6 -
 arch/x86/Makefile.postlink                   |  40 ---
 arch/x86/boot/Makefile                       |   1 -
 arch/x86/boot/compressed/Makefile            |  10 +-
 kernel/gen_kheaders.sh                       |   1 -
 lib/Kconfig.debug                            |   7 +-
 rust/Makefile                                |   8 +-
 scripts/Makefile.build                       |   4 -
 scripts/Makefile.compiler                    |   4 +
 scripts/Makefile.extrawarn                   |   3 -
 scripts/Makefile.lib                         |   8 -
 scripts/Makefile.vmlinux                     |  34 ++-
 scripts/bash-completion/make                 | 451 +++++++++++++++++++++++=
+++++
 scripts/checkpatch.pl                        |  14 -
 scripts/clang-tools/gen_compile_commands.py  |   8 +-
 scripts/config                               |  26 +-
 scripts/gendwarfksyms/die.c                  |   2 +-
 scripts/gendwarfksyms/dwarf.c                | 154 +++++-----
 scripts/gendwarfksyms/gendwarfksyms.h        |   2 +
 scripts/gendwarfksyms/types.c                |   2 +-
 scripts/generate_builtin_ranges.awk          |   5 +
 scripts/genksyms/lex.l                       |   6 +-
 scripts/kconfig/confdata.c                   |  19 +-
 scripts/kconfig/merge_config.sh              |   4 +-
 scripts/kconfig/symbol.c                     |   2 +-
 scripts/link-vmlinux.sh                      |  24 +-
 scripts/mod/modpost.c                        |  45 ++-
 scripts/mod/modpost.h                        |   1 +
 scripts/mod/sumversion.c                     |  17 +-
 scripts/package/PKGBUILD                     |   6 +-
 scripts/package/debian/rules                 |  10 +-
 scripts/package/kernel.spec                  |  46 ++-
 scripts/package/mkdebian                     |  23 +-
 scripts/package/mkspec                       |  10 +
 scripts/show_delta                           |   2 +-
 scripts/tracing/draw_functrace.py            |   2 +-
 63 files changed, 892 insertions(+), 352 deletions(-)
 create mode 100644 Documentation/kbuild/bash-completion.rst
 delete mode 100644 arch/x86/Makefile.postlink
 create mode 100644 scripts/bash-completion/make



--=20
Best Regards
Masahiro Yamada

