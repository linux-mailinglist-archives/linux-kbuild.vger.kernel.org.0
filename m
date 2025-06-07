Return-Path: <linux-kbuild+bounces-7391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 642C7AD0E99
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 18:42:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B21D16CE87
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Jun 2025 16:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0801C84C6;
	Sat,  7 Jun 2025 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RcrFAQNl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30C6145B25;
	Sat,  7 Jun 2025 16:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749314516; cv=none; b=ROnPMMn5DvY/RAsVFHt+i7BmUbbAbV3QPMCGY0VZBT8WapuYJ1rvKmuKwR4bW+uxgx5eM3R1IwjwD5xNURuTnJQ77aIStSo/PFeJpd6ZRz8I+yICZNajapzEWYWtJkqqIMCBi4yR2laSQJ51jdlzl2TGjyQcbDcbjs2GEQfp4h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749314516; c=relaxed/simple;
	bh=vGqf1DQ3vPBEJUIZU22dgxamO4cWYzk/9djMpl4VdPg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=seN3JhvS/pneeOxEy/7/kyULZ62EraIUElNb+EuBibAsjPCgPqZBp414SUrPKrE4zNHwjq3UEphIxcXQeEZGL99VWLX6DxMyBvRk6bpEIxHP8Kg7HN0GAVz5wVQqQSrgOAPjl57friyTStUO2sTP7ZFJYBX8mBkY22GeOozSGRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RcrFAQNl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42894C4CEE4;
	Sat,  7 Jun 2025 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749314516;
	bh=vGqf1DQ3vPBEJUIZU22dgxamO4cWYzk/9djMpl4VdPg=;
	h=From:Date:Subject:To:Cc:From;
	b=RcrFAQNlLmWNwohUMD3kGjqEHuaABqw7nQ8kQpzaYTdKlreNW2O2cWiHrg/lLhkMU
	 2XukC1luT2/2u8hrIVlEB69kQIEwFKetOGQiLObXsGAg9Ppj9QBvJTJ/dROhO+PxRe
	 LbEqWqMOvLRcs9zV2IszAiy5QFucXLiUVE9GHmtWL1Rq3QtKawwDex1SU6RkesVt48
	 T8WUd32WmpE/M5DVQk+3hMbSKYJF44smp9KLaf4WksR3cR0r9iFYCpwybRisOI4q97
	 QB+ptXeClOVVyYmPuSIs+TXIGgMuy64Ko+MV5OJ+hh17pq4uIzroN0pAE7jSGkST+I
	 OCvzPiYrt75JA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-553331c3dc7so3020321e87.3;
        Sat, 07 Jun 2025 09:41:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUMk9CgJ5hB57TNpOhwCtUcdmBN669ynJu2cWcXrWIFVdR0tlMNNGhjRcqI2nPza2nFdlsIEqcxgl3yVEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVxjOj20h3nZU5M16CP828mfzpXQVjCJtU/q0UI8Z1X9JMoMh6
	Jlrvq5BcXNZNRM3mRniJEQsC+bqR+TUisWFZAWVA6YbM4jts1WQBlDjv44i8lMv7d6oO/NBw7Cj
	IpB7LdzgRboKILnzTQs5ZxliTxJJo2pE=
X-Google-Smtp-Source: AGHT+IGnPfidxUScGgrkNCX0OhmDixvrssXzZSpUpnhK61Z7AkzGPL42frAMNIwzP5Tu51Npb1hMGh/cl+fhlPKjU/Q=
X-Received: by 2002:a05:6512:2210:b0:553:37e7:867b with SMTP id
 2adb3069b0e04-55366beaeb4mr1846891e87.31.1749314514898; Sat, 07 Jun 2025
 09:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 8 Jun 2025 01:41:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
X-Gm-Features: AX0GCFvNpvBD4dAgMeIkc-hSlGDat6lTm_RHVHDJWA1a4XOnKsTOnKs7_6t0AMY
Message-ID: <CAK7LNAQunzxOHR+vMZLf8kqxyRtLx-Z2G2VZquJmndrT9TZjiQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.16-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull Kbuild updates for v6.16-rc1.
Thank you


The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21=
:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.16

for you to fetch changes up to c50a04f8f45c7f13972f9097622d1d929033ea8c:

  genksyms: Fix enum consts from a reference affecting new values
(2025-06-07 14:38:07 +0900)

----------------------------------------------------------------
Kbuild updates for v6.16

 - Add support for the EXPORT_SYMBOL_GPL_FOR_MODULES() macro, which exports=
 a
   symbol only to specified modules

 - Improve ABI handling in gendwarfksyms

 - Forcibly link lib-y objects to vmlinux even if CONFIG_MODULES=3Dn

 - Add checkers for redundant or missing <linux/export.h> inclusion

 - Deprecate the extra-y syntax

 - Fix a genksyms bug when including enum constants from *.symref files

----------------------------------------------------------------
Henrik Lindstr=C3=B6m (1):
      Makefile: remove dependency on archscripts for header installation

Khaled Elnaggar (1):
      docs: symbol-namespaces: fix reST warning with literal block

Masahiro Yamada (14):
      kbuild: move kbuild syntax processing to scripts/Makefile.build
      modpost: check forbidden MODULE_IMPORT_NS("module:") at compile time
      docs/core-api/symbol-namespaces: drop table of contents and
section numbering
      tinyconfig: enable CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
      kbuild: link lib-y objects to vmlinux forcibly even when CONFIG_MODUL=
ES=3Dn
      kconfig: introduce menu type enum
      kbuild: move W=3D1 check for scripts/misc-check to top-level Makefile
      scripts/misc-check: add double-quotes to satisfy shellcheck
      scripts/misc-check: check missing #include <linux/export.h> when W=3D=
1
      scripts/misc-check: check unnecessary #include <linux/export.h> when =
W=3D1
      module: make __mod_device_table__* symbols static
      efi/libstub: use 'targets' instead of extra-y in Makefile
      kbuild: set y instead of 1 to KBUILD_{BUILTIN,MODULES}
      arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds

Masatake YAMATO (1):
      scripts/tags.sh: allow to use alternative ctags implementation

Peter Zijlstra (5):
      modpost: Use for() loop
      module: Add module specific symbol namespace support
      module: Extend the module namespace parsing
      module: Account for the build time module name mangling
      module: Provide EXPORT_SYMBOL_GPL_FOR_MODULES() helper

Petr Pavlu (1):
      genksyms: Fix enum consts from a reference affecting new values

Sami Tolvanen (5):
      gendwarfksyms: Clean up kABI rule look-ups
      gendwarfksyms: Add a kABI rule to override byte_size attributes
      gendwarfksyms: Add a kABI rule to override type strings
      Documentation/kbuild: Drop section numbers
      Documentation/kbuild: Add new gendwarfksyms kABI rules

 Documentation/core-api/symbol-namespaces.rst                 |  63 +++++--=
---
 Documentation/kbuild/gendwarfksyms.rst                       | 141
+++++++++++++++++-----
 Documentation/kbuild/makefiles.rst                           |   4 +
 .../translations/it_IT/core-api/symbol-namespaces.rst        |  32 +++--
 .../translations/zh_CN/core-api/symbol-namespaces.rst        |  41 +++----
 Makefile                                                     |  28 +++--
 arch/alpha/kernel/Makefile                                   |   2 +-
 arch/arc/kernel/Makefile                                     |   2 +-
 arch/arm/kernel/Makefile                                     |   2 +-
 arch/arm64/kernel/Makefile                                   |   2 +-
 arch/csky/kernel/Makefile                                    |   2 +-
 arch/hexagon/kernel/Makefile                                 |   2 +-
 arch/loongarch/kernel/Makefile                               |   2 +-
 arch/m68k/kernel/Makefile                                    |   2 +-
 arch/microblaze/kernel/Makefile                              |   2 +-
 arch/mips/kernel/Makefile                                    |   2 +-
 arch/nios2/kernel/Makefile                                   |   2 +-
 arch/openrisc/kernel/Makefile                                |   2 +-
 arch/parisc/kernel/Makefile                                  |   2 +-
 arch/powerpc/kernel/Makefile                                 |   2 +-
 arch/riscv/kernel/Makefile                                   |   2 +-
 arch/s390/kernel/Makefile                                    |   2 +-
 arch/sh/kernel/Makefile                                      |   2 +-
 arch/sparc/kernel/Makefile                                   |   2 +-
 arch/um/kernel/Makefile                                      |   2 +-
 arch/x86/kernel/Makefile                                     |   2 +-
 arch/xtensa/kernel/Makefile                                  |   2 +-
 drivers/firmware/efi/libstub/Makefile                        |   2 +-
 include/linux/export.h                                       |  12 +-
 include/linux/module.h                                       |   4 +-
 kernel/configs/tiny.config                                   |   1 +
 kernel/module/main.c                                         |  89
+++++++++++++-
 scripts/Makefile.build                                       |  84
++++++++++++++
 scripts/Makefile.lib                                         |  84
--------------
 scripts/gendwarfksyms/dwarf.c                                |  14 ++-
 scripts/gendwarfksyms/examples/kabi.h                        |  21 +++-
 scripts/gendwarfksyms/examples/kabi_ex.c                     |   7 ++
 scripts/gendwarfksyms/examples/kabi_ex.h                     | 101
+++++++++++++++-
 scripts/gendwarfksyms/gendwarfksyms.h                        |   2 +
 scripts/gendwarfksyms/kabi.c                                 | 161
++++++++++++++++----------
 scripts/gendwarfksyms/types.c                                | 140
+++++++++++++++++++---
 scripts/genksyms/genksyms.c                                  |  27 +++--
 scripts/kconfig/expr.h                                       |  11 ++
 scripts/kconfig/lkc.h                                        |   2 +-
 scripts/kconfig/menu.c                                       |   5 +-
 scripts/kconfig/parser.y                                     |  12 +-
 scripts/misc-check                                           |  66 +++++++=
++--
 scripts/mod/modpost.c                                        |  56 +++++++=
+-
 scripts/tags.sh                                              |   2 +-
 49 files changed, 919 insertions(+), 335 deletions(-)


--=20
Best Regards
Masahiro Yamada

