Return-Path: <linux-kbuild+bounces-3701-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F21C79848D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 17:45:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B0AAB283BA5
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Sep 2024 15:45:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6026256E;
	Tue, 24 Sep 2024 15:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOB2TOXZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0521B85D5;
	Tue, 24 Sep 2024 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727192732; cv=none; b=gAf7wZIE9VE4cPvb266H4wJBDFfqcG/HJf5OPWGNgnBa7TyXagu7+nrTnr1i5KdABAiTcWx3tfXqTk+Aj5ECXH0pwgWZ4dmtarCgJQ40SrxvlDl0rDQG6+lY5+AfudlX5QkCXPQ6mQeW5OW9bo7oraispkX80MEoo5kdPRsap7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727192732; c=relaxed/simple;
	bh=a6WuSN+R0QTe0iMpSaI1lp+B3upYERKrAgsFzECh1Ng=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hjihDpsoztTQtjSk9iBfDuGGIopbMghciMUK54kVfi23bWbOHPTKx1VaPn7Dj4VuPgfp38mu4qoMgVc+skSr3t8gt8SHNSQb3J5DYvGawnkDsISYG0+Uj/2xAtkcQr8FUPMyUL+GPfmT/G2MyC3yiKiNEITwM6e1LtnSqs3lJD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOB2TOXZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C17C4CEC4;
	Tue, 24 Sep 2024 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727192731;
	bh=a6WuSN+R0QTe0iMpSaI1lp+B3upYERKrAgsFzECh1Ng=;
	h=From:Date:Subject:To:Cc:From;
	b=mOB2TOXZK5XuBGTiCz8fNqCsJmskv6TT18TnKUsFm3d5kBeZrI7hZng3314E/tkeH
	 ouStywAlnkox0kyi9vWR6l8uhrbt//L3MCp4LxJjn3xi5+Hh6cAyQR4RAvCz4UDIOa
	 NwE4LR9p3p08dMp/4sg1kkZePYjDPls7CifMdchzDa+Y9CzwfQoMW6TDIZP0io4K5s
	 qvtUZTlATye0ZQVi3lcWDvteRWSafMK3XXlazvWqgDFUj9y0pp3gNsjv9/x1gUbBFR
	 l61y8om0JlRDb/ViuT11Fx5CH5RIQAdWdRZpdT/ayp2T8jrrPb25iPNmFG/rxl1EkQ
	 mHFfjqYYRsYEA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f761461150so68673821fa.0;
        Tue, 24 Sep 2024 08:45:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWF12NSWcRKvz02HHpSHbVhJsHnN2WrTlZKVtmDS0RR5rTYoIbzlZbCiHp6TnF/7AvWMvtiUhS0Qt90saM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeFn6ypsLEOyfd6ZcdwXxTkCm6lCz4GF1+iONV+jHcwrqMi7ed
	tehMhBHM4gtpTjbaJzoRMbNiHfFdYUk//eimVb84jLR8Ir3Hfue9BajoYGn//DxLk6EsfvNVSNt
	6hpxjZvvpoiUpl42u07g9CuD4CYo=
X-Google-Smtp-Source: AGHT+IEqAXFBJFaI0TrfQuPpbCY1CkM/T9IvSZG/f+Xt2XiUIzPi59D1aDmiiSVTZzhxADtYg8V8PZn2LL74UueRjmM=
X-Received: by 2002:a05:6512:3048:b0:533:4785:82ab with SMTP id
 2adb3069b0e04-536ac2d6a6bmr10141777e87.1.1727192729764; Tue, 24 Sep 2024
 08:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 25 Sep 2024 00:44:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR=QwD=c1kN_VxQ-NoNoZqQWU3VPc+Xy88BDTjG8s_v8A@mail.gmail.com>
Message-ID: <CAK7LNAR=QwD=c1kN_VxQ-NoNoZqQWU3VPc+Xy88BDTjG8s_v8A@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.12-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,


Please pull Kbuild updates for v6.12-rc1.

Thank you.


The following changes since commit 431c1646e1f86b949fa3685efc50b660a364c2b6=
:

  Linux 6.11-rc6 (2024-09-01 19:46:02 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.12

for you to fetch changes up to fa911d1f377bbe4cc47e58afbd8fff7750b7ac62:

  kbuild: doc: replace "gcc" in external module description
(2024-09-24 03:07:21 +0900)

----------------------------------------------------------------
Kbuild updates for v6.12

 - Support cross-compiling linux-headers Debian package and kernel-devel
   RPM package

 - Add support for the linux-debug Pacman package

 - Improve module rebuilding speed by factoring out the common code to
   scripts/module-common.c

 - Separate device tree build rules into scripts/Makefile.dtbs

 - Add a new script to generate modules.builtin.ranges, which is useful
   for tracing tools to find symbols in built-in modules

 - Refactor Kconfig and misc tools

 - Update Kbuild and Kconfig documentation

----------------------------------------------------------------
Jose Fernandez (2):
      kbuild: control extra pacman packages with PACMAN_EXTRAPACKAGES
      kbuild: add debug package to pacman PKGBUILD

Kris Van Hees (4):
      kbuild: add mod(name,file)_flags to assembler flags for module object=
s
      kbuild: generate offset range data for builtin modules
      scripts: add verifier script for builtin module range data
      kbuild: add install target for modules.builtin.ranges

Laurent Pinchart (1):
      Remove *.orig pattern from .gitignore

Masahiro Yamada (39):
      modpost: remove unused HOST_ELFCLASS
      modpost: detect endianness on run-time
      kbuild: slim down package for building external modules
      kbuild: cross-compile linux-headers package when possible
      kbuild: modinst: remove the multithread option from zstd compression
      tinyconfig: remove unnecessary 'is not set' for choice blocks
      kconfig: remove dummy assignments to cur_{filename,lineno}
      kconfig: stop adding P_SYMBOL property to symbols
      kconfig: remove P_SYMBOL property
      kbuild: split x*alloc() functions in kconfig to scripts/include/xallo=
c.h
      modpost: replace the use of NOFAIL() with xmalloc() etc.
      kallsyms: use xmalloc() and xrealloc()
      fixdep: use xmalloc()
      modpost: improve the section mismatch warning format
      kbuild: pacman-pkg: move common commands to a separate function
      kbuild: pacman-pkg: do not override objtree
      modpost: simplify modpost_log()
      kbuild: remove *.symversions left-over
      ARC: update the help message for CONFIG_ARC_BUILTIN_DTB_NAME
      kbuild: add intermediate targets for Flex/Bison in scripts/Makefile.h=
ost
      kbuild: split device tree build rules into scripts/Makefile.dtbs
      scripts: import more hash table macros
      kallsyms: squash output_address()
      kallsyms: change overflow variable to bool type
      scripts: move hash function from scripts/kconfig/ to scripts/include/
      kconfig: change some expr_*() functions to bool
      kconfig: add comments to expression transformations
      kconfig: refactor expr_eliminate_dups()
      kconfig: use hash table to reuse expressions
      kconfig: cache expression values
      kbuild: remove unnecessary export of RUST_LIB_SRC
      kbuild: doc: update the description about Kbuild/Makefile split
      kbuild: doc: remove description about grepping CONFIG options
      kbuild: doc: remove outdated description of the limitation on -I usag=
e
      kbuild: doc: throw out the local table of contents in modules.rst
      kbuild: doc: drop section numbering, use references in modules.rst
      kbuild: doc: remove the description about shipped files
      kbuild: doc: describe the -C option precisely for external module bui=
lds
      kbuild: doc: replace "gcc" in external module description

Nick Desaulniers (1):
      scripts: subarch.include: fix SUBARCH on macOS hosts

Stephen Brennan (1):
      Documentation: kconfig: explicitly document missing prompt

Thomas Wei=C3=9Fschuh (2):
      kbuild: compile constant module information only once
      kbuild: remove append operation on cmd_ld_ko_o

Tony Battersby (1):
      kbuild: remove recent dependency on "truncate" program

 .gitignore                                |   3 +-
 Documentation/dontdiff                    |   1 +
 Documentation/kbuild/kbuild.rst           |  10 +
 Documentation/kbuild/kconfig-language.rst |   6 +-
 Documentation/kbuild/makefiles.rst        |   1 -
 Documentation/kbuild/modules.rst          | 224 ++++++--------------
 Documentation/process/changes.rst         |   7 +
 Makefile                                  |   7 +-
 arch/arc/Kconfig                          |   2 +-
 arch/x86/configs/tiny.config              |   4 -
 drivers/of/fdt.c                          |   2 +-
 drivers/of/unittest.c                     |   4 +-
 kernel/configs/tiny.config                |   6 -
 lib/Kconfig.debug                         |  15 ++
 scripts/Makefile.build                    |  58 +++---
 scripts/Makefile.dtbs                     | 142 +++++++++++++
 scripts/Makefile.host                     |   5 +
 scripts/Makefile.lib                      | 119 +----------
 scripts/Makefile.modfinal                 |   9 +-
 scripts/Makefile.modinst                  |   8 +-
 scripts/Makefile.package                  |   3 +-
 scripts/Makefile.vmlinux                  |  18 ++
 scripts/Makefile.vmlinux_o                |   3 +
 scripts/basic/fixdep.c                    |  15 +-
 scripts/generate_builtin_ranges.awk       | 508
++++++++++++++++++++++++++++++++++++++++++++++
 scripts/include/hash.h                    |  28 +++
 scripts/include/hashtable.h               |  50 +++++
 scripts/include/list.h                    |  69 +++++++
 scripts/include/xalloc.h                  |  53 +++++
 scripts/kallsyms.c                        |  46 ++---
 scripts/kconfig/confdata.c                |   3 +
 scripts/kconfig/expr.c                    | 482
+++++++++++++++++++------------------------
 scripts/kconfig/expr.h                    |  27 ++-
 scripts/kconfig/internal.h                |   6 +
 scripts/kconfig/lexer.l                   |   1 +
 scripts/kconfig/lkc.h                     |   6 -
 scripts/kconfig/mconf.c                   |   1 +
 scripts/kconfig/menu.c                    |  38 ++--
 scripts/kconfig/nconf.c                   |   1 +
 scripts/kconfig/nconf.gui.c               |   1 +
 scripts/kconfig/parser.y                  |  13 +-
 scripts/kconfig/preprocess.c              |   1 +
 scripts/kconfig/qconf.cc                  |   2 +-
 scripts/kconfig/symbol.c                  |   9 +-
 scripts/kconfig/util.c                    |  63 +-----
 scripts/link-vmlinux.sh                   |   2 +-
 scripts/mod/mk_elfconfig.c                |  25 ---
 scripts/mod/modpost.c                     | 125 ++++++------
 scripts/mod/modpost.h                     |  28 +--
 scripts/mod/sumversion.c                  |   6 +-
 scripts/mod/symsearch.c                   |   6 +-
 scripts/module-common.c                   |  25 +++
 scripts/package/PKGBUILD                  |  52 +++--
 scripts/package/install-extmod-build      |  55 ++++-
 scripts/subarch.include                   |   2 +-
 scripts/verify_builtin_ranges.awk         | 370
+++++++++++++++++++++++++++++++++
 56 files changed, 1867 insertions(+), 909 deletions(-)
 create mode 100644 scripts/Makefile.dtbs
 create mode 100755 scripts/generate_builtin_ranges.awk
 create mode 100644 scripts/include/hash.h
 create mode 100644 scripts/include/xalloc.h
 create mode 100644 scripts/module-common.c
 create mode 100755 scripts/verify_builtin_ranges.awk


--=20
Best Regards
Masahiro Yamada

