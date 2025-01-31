Return-Path: <linux-kbuild+bounces-5588-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 544BCA24387
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 20:45:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAABD188469A
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 19:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FBB1EB9E3;
	Fri, 31 Jan 2025 19:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tdsvswzC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B4F53368;
	Fri, 31 Jan 2025 19:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738352716; cv=none; b=sCcOdldFbb3xuIhsn7HNt9VytDf13fXYEFWn9QWpjnzM0eh3Jj+ITjqPNiT/WbTB/44eNQQXOxsdUk0YG2+3dix2e3gmQUAGzx33Eqz7hc8lrWfRGRXkTxBzhHKDriipqKJ6HtKZKL7YrQuiJHeBeFmAGhTjiLg+5XaxPuT5yx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738352716; c=relaxed/simple;
	bh=sG0jau21IA4HqzETbgkbN1xu0ZRDfUPymxj/fPfd6/E=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Q9+gO/N7JZoNGylMhfYQi781wChG5fKP/Vl6mXRXaqIyG9Q5qPSV57/vddK8QTO3wRSTmXNgiFGCqbmh/me/B9t3v40TEbOGd7dtw6mSh76fVIRBoIw0C6FRZRjOSRMXTdsh+espc1hXOF3Pn+3F72iEV5dy2pXzcGioQYP3jEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tdsvswzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB01C4CEDF;
	Fri, 31 Jan 2025 19:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738352715;
	bh=sG0jau21IA4HqzETbgkbN1xu0ZRDfUPymxj/fPfd6/E=;
	h=From:Date:Subject:To:Cc:From;
	b=tdsvswzCZ/SO0i18vD2SIOvJYPDwrLfzLq7VZ9Xabhyf2whikWRTa8SPuDVGmUiGX
	 LjIV/Wbk1aQEeGz/0TfAs2rpDCrLMnIeu+htGSr9HPqLu3W4ye6Y9L8uv5HUInImVP
	 NF6SGX3PrO+OmVqP7QQs3uGsauMwnd42C39AcBV4bO9ahtTpo3eX6Sk7W9rn+YNmYG
	 Lbv8+O4RdyJAoED1roOf7BXN+ChGI+BG5abseIxL4sEOFrmJceqaYvBieoddEKAuCA
	 THcQOe/E3FssTPrC854nYNboCpUz4J2sVPwvAePfVvR0EIg+u4/wSe6ddbwQdAUJmb
	 jN8hozhbW2+sQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so3668161e87.1;
        Fri, 31 Jan 2025 11:45:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVd+VqYrJl1SvNzOY0B1Xe+uC6nfarAOIyeuja7PBFiTSJytQ2hhY2TwAAkobxGRcVNTX4KglaU0DvJDG0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxQwXEs1Ppg/fRUYyyaFcvBkEfZu+uhgC7gvH4kniDwgc2o7Q
	NT8uqY0PxJRuJlPGdsFs3R+lBJY7ki6UWuFkzcVPSqsRgBEcZZlpGkGv2K1sSCQfnvcwkQICwkm
	4bdetKAi/SLKHq0kL5qbf2Fix2mI=
X-Google-Smtp-Source: AGHT+IFJjWY2E48FyHWtr74qkLrspdp7h+gdranVS++fOeZxB1A0RAEJCZsRnOW+msNwq3PzlBKOVqCj6LIrwqwuXsg=
X-Received: by 2002:a05:651c:b0d:b0:302:3021:9b23 with SMTP id
 38308e7fff4ca-307a1146f5amr23878061fa.17.1738352714426; Fri, 31 Jan 2025
 11:45:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 1 Feb 2025 04:44:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
X-Gm-Features: AWEUYZnXsF8oNxqsBw6v1b_FTvkbkC8cBUj2k6wshf06v1qie8vgO9Fb1SfisDo
Message-ID: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.14-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello Linus,

Please pull Kbuild updates for v6.14-rc1.
Thank you


The following changes since commit 9d89551994a430b50c4fffcb1e617a057fa76e20:

  Linux 6.13-rc6 (2025-01-05 14:13:40 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.14

for you to fetch changes up to 695ed93bb30e03e9f826ee70abdd83f970741a37:

  kbuild: fix Clang LTO with CONFIG_OBJTOOL=n (2025-02-01 04:28:05 +0900)

----------------------------------------------------------------
Kbuild updates for v6.14

 - Support multiple hook locations for maint scripts of Debian package

 - Remove 'cpio' from the build tool requirement

 - Introduce gendwarfksyms tool, which computes CRCs for export symbols
   based on the DWARF information

 - Support CONFIG_MODVERSIONS for Rust

 - Resolve all conflicts in the genksyms parser

 - Fix several syntax errors in genksyms

----------------------------------------------------------------
Ard Biesheuvel (1):
      kbuild: Strip runtime const RELA sections correctly

HONG Yifan (1):
      kheaders: prevent `find` from seeing perl temp files

Johannes Schauer Marin Rodrigues (1):
      kbuild: deb-pkg: allow hooks also in /usr/share/kernel

Masahiro Yamada (36):
      kbuild: deb-pkg: do not include empty hook directories
      kbuild: refactor cross-compiling linux-headers package
      kbuild: suppress stdout from merge_config for silent builds
      kheaders: exclude include/generated/utsversion.h from kheaders_data.tar.xz
      kheaders: avoid unnecessary process forks of grep
      kheaders: rename the 'cpio_dir' variable to 'tmpdir'
      kheaders: use 'tar' instead of 'cpio' for copying files
      module: get symbol CRC back to unsigned
      modpost: zero-pad CRC values in modversion_info array
      genksyms: fix memory leak when the same symbol is added from source
      genksyms: fix memory leak when the same symbol is read from *.symref file
      genksyms: reduce the indentation in the for-loop in __add_symbol()
      genksyms: refactor the return points in the for-loop in __add_symbol()
      genksyms: use generic macros for hash table implementation
      genksyms: use uint32_t instead of unsigned long for calculating CRC
      ARC: migrate to the generic rule for built-in DTB
      genksyms: rename m_abstract_declarator to abstract_declarator
      genksyms: rename cvar_qualifier to type_qualifier
      genksyms: reduce type_qualifier directly to decl_specifier
      genksyms: fix 6 shift/reduce conflicts and 5 reduce/reduce conflicts
      genksyms: fix last 3 shift/reduce conflicts
      genksyms: remove Makefile hack
      genksyms: restrict direct-abstract-declarator to take one
parameter-type-list
      genksyms: restrict direct-declarator to take one parameter-type-list
      genksyms: record attributes consistently for init-declarator
      genksyms: decouple ATTRIBUTE_PHRASE from type-qualifier
      genksyms: fix syntax error for attribute before abstract_declarator
      genksyms: fix syntax error for attribute before nested_declarator
      genksyms: fix syntax error for attribute after abstact_declarator
      genksyms: fix syntax error for attribute after 'struct'
      genksyms: fix syntax error for attribute after 'union'
      genksyms: fix syntax error for builtin (u)int*x*_t types
      genksyms: fix syntax error for attribute before init-declarator
      kconfig: fix file name in warnings when loading KCONFIG_DEFCONFIG_LIST
      kconfig: fix memory leak in sym_warn_unmet_dep()
      kbuild: fix Clang LTO with CONFIG_OBJTOOL=n

Matthew Maurer (4):
      modules: Support extended MODVERSIONS info
      modpost: Produce extended MODVERSIONS information
      modpost: Allow extended modversions without basic MODVERSIONS
      Documentation/kbuild: Document storage of symbol information

Rolf Eike Beer (1):
      kconfig: qconf: use preferred form of QString API

Sami Tolvanen (19):
      tools: Add gendwarfksyms
      gendwarfksyms: Add address matching
      gendwarfksyms: Expand base_type
      gendwarfksyms: Add a cache for processed DIEs
      gendwarfksyms: Expand type modifiers and typedefs
      gendwarfksyms: Expand subroutine_type
      gendwarfksyms: Expand array_type
      gendwarfksyms: Expand structure types
      gendwarfksyms: Limit structure expansion
      gendwarfksyms: Add die_map debugging
      gendwarfksyms: Add symtypes output
      gendwarfksyms: Add symbol versioning
      gendwarfksyms: Add support for kABI rules
      gendwarfksyms: Add support for reserved and ignored fields
      gendwarfksyms: Add support for symbol type pointers
      export: Add __gendwarfksyms_ptr_ references to exported symbols
      kbuild: Add gendwarfksyms as an alternative to genksyms
      Documentation/kbuild: Add DWARF module versioning
      rust: Use gendwarfksyms + extended modversions for CONFIG_MODVERSIONS

Torsten Hilbrich (1):
      kbuild: Fix signing issue for external modules

 Documentation/kbuild/gendwarfksyms.rst     |  308 ++++++++++++
 Documentation/kbuild/index.rst             |    1 +
 Documentation/kbuild/modules.rst           |   20 +
 Documentation/process/changes.rst          |    6 -
 MAINTAINERS                                |    7 +
 arch/arc/Kconfig                           |    7 +-
 arch/arc/Makefile                          |    3 -
 arch/arc/boot/dts/Makefile                 |    9 +-
 arch/arc/configs/axs101_defconfig          |    2 +-
 arch/arc/configs/axs103_defconfig          |    2 +-
 arch/arc/configs/axs103_smp_defconfig      |    2 +-
 arch/arc/configs/haps_hs_defconfig         |    2 +-
 arch/arc/configs/haps_hs_smp_defconfig     |    2 +-
 arch/arc/configs/hsdk_defconfig            |    2 +-
 arch/arc/configs/nsim_700_defconfig        |    2 +-
 arch/arc/configs/nsimosci_defconfig        |    2 +-
 arch/arc/configs/nsimosci_hs_defconfig     |    2 +-
 arch/arc/configs/nsimosci_hs_smp_defconfig |    2 +-
 arch/arc/configs/tb10x_defconfig           |    2 +-
 arch/arc/configs/vdk_hs38_defconfig        |    2 +-
 arch/arc/configs/vdk_hs38_smp_defconfig    |    2 +-
 arch/powerpc/kernel/module_64.c            |   24 +-
 arch/riscv/Makefile.postlink               |    8 +-
 arch/s390/Makefile.postlink                |    6 +-
 arch/x86/Makefile.postlink                 |    6 +-
 include/linux/export.h                     |   15 +
 include/linux/module.h                     |    4 +-
 init/Kconfig                               |    3 +-
 kernel/gen_kheaders.sh                     |   42 +-
 kernel/module/Kconfig                      |   55 +++
 kernel/module/internal.h                   |   21 +-
 kernel/module/main.c                       |   94 +++-
 kernel/module/version.c                    |   47 +-
 rust/Makefile                              |   34 +-
 scripts/Makefile                           |    3 +-
 scripts/Makefile.build                     |   37 +-
 scripts/Makefile.defconf                   |   13 +-
 scripts/Makefile.lib                       |   13 +-
 scripts/Makefile.modinst                   |    2 +-
 scripts/Makefile.modpost                   |    2 +
 scripts/gendwarfksyms/.gitignore           |    2 +
 scripts/gendwarfksyms/Makefile             |   12 +
 scripts/gendwarfksyms/cache.c              |   51 ++
 scripts/gendwarfksyms/die.c                |  166 +++++++
 scripts/gendwarfksyms/dwarf.c              | 1159
++++++++++++++++++++++++++++++++++++++++++++++
 scripts/gendwarfksyms/examples/kabi.h      |  157 +++++++
 scripts/gendwarfksyms/examples/kabi_ex.c   |   30 ++
 scripts/gendwarfksyms/examples/kabi_ex.h   |  263 +++++++++++
 scripts/gendwarfksyms/examples/symbolptr.c |   33 ++
 scripts/gendwarfksyms/gendwarfksyms.c      |  187 ++++++++
 scripts/gendwarfksyms/gendwarfksyms.h      |  296 ++++++++++++
 scripts/gendwarfksyms/kabi.c               |  336 ++++++++++++++
 scripts/gendwarfksyms/symbols.c            |  341 ++++++++++++++
 scripts/gendwarfksyms/types.c              |  481 +++++++++++++++++++
 scripts/genksyms/Makefile                  |   18 -
 scripts/genksyms/genksyms.c                |  107 ++---
 scripts/genksyms/genksyms.h                |    9 +-
 scripts/genksyms/lex.l                     |   17 +-
 scripts/genksyms/parse.y                   |  168 ++++---
 scripts/kconfig/Makefile                   |    4 +-
 scripts/kconfig/confdata.c                 |    6 +-
 scripts/kconfig/qconf.cc                   |    8 +-
 scripts/kconfig/symbol.c                   |    1 +
 scripts/mod/modpost.c                      |   71 ++-
 scripts/package/PKGBUILD                   |    1 -
 scripts/package/builddeb                   |   24 +-
 scripts/package/install-extmod-build       |   33 +-
 scripts/package/mkdebian                   |    2 +-
 68 files changed, 4492 insertions(+), 307 deletions(-)
 create mode 100644 Documentation/kbuild/gendwarfksyms.rst
 create mode 100644 scripts/gendwarfksyms/.gitignore
 create mode 100644 scripts/gendwarfksyms/Makefile
 create mode 100644 scripts/gendwarfksyms/cache.c
 create mode 100644 scripts/gendwarfksyms/die.c
 create mode 100644 scripts/gendwarfksyms/dwarf.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi.h
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.h
 create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
 create mode 100644 scripts/gendwarfksyms/kabi.c
 create mode 100644 scripts/gendwarfksyms/symbols.c
 create mode 100644 scripts/gendwarfksyms/types.c


-- 
Best Regards
Masahiro Yamada

