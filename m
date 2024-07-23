Return-Path: <linux-kbuild+bounces-2633-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CE393A7BD
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2024 21:44:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F194283DA7
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Jul 2024 19:44:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80081422B4;
	Tue, 23 Jul 2024 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMRHJkNx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDD513D628;
	Tue, 23 Jul 2024 19:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721763884; cv=none; b=Lb9tIEx+nboAZiYFzFmB3DHw09CPu01F4bnMJ58hUT2RPHHAHuKZ7eAVPrADSGAyuW5IzDAfA4tlaDNm28m4P4goWhXO71FNGiL+d1q+X1XEtjPi/CRo3C/GxzEb4xvDZnheyy4jr+4b6efmCQg6A7xnnuPHkpxhNStlR6phRtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721763884; c=relaxed/simple;
	bh=NZPmwx9zHNHao+9I+jeqDdDmRqjZJBybf9j7OA7CvSM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Zz2dPvh8OTQnaApKZIlS6C1Ad/JwKzUsrlyZxtbFNM/UO+tdzK9seMngjRuFtJhjBH1VXV91xj6FvAOtQys2d0hRNmMLvqPea6PZzUsdpU/ffgKIvJL2gBdtQApuCG8iHYhYza/wXIyuf+gfR1cwmEkepWBPy/rllDVj6h/QhBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMRHJkNx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18353C4AF0A;
	Tue, 23 Jul 2024 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721763884;
	bh=NZPmwx9zHNHao+9I+jeqDdDmRqjZJBybf9j7OA7CvSM=;
	h=From:Date:Subject:To:Cc:From;
	b=UMRHJkNxQBBFJiGxxNfWBDsa6DlLZqlRw4QOrIrX3Ddq+rlTJOXKPMU1C5tqC33fD
	 6ZGcwPWlhLVKxBtVBJslUJKaeF3kVh4Lw5Qqs4px+TsAvpJdITiO+HPwLmVFBX5Ne2
	 QFI1wgJ0sP4JtZbbsEMSOCzpS62ZdN+MMCretwNDUS5DeWw+ARGuFFWXvYHTcPrcxa
	 +0n8+IHfv1bjpJlgkuLfa1tqWm5UA8TFL+5cEvPloxD81ZUdIwxuCuZEIf83rR/S9t
	 N1cvyzGYHZW5xpXvIlLMh9ar7AJTVUx4EpJLLsxdvilw9ApALzmFLgIgEDJzDV1H9O
	 RqgL5NRk6dqjQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef2c56da6cso28379731fa.1;
        Tue, 23 Jul 2024 12:44:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0QkgwKRHktkVv9CLrYQ1EcbRxDtwBYqdFLr2GViWcS1jzOAiZddwRLwwuxCfEjojUxgOvVcGYDfDDrKySE6j3bfCoxk2XjPUSPRnl
X-Gm-Message-State: AOJu0YwCKhj+6QGjvELgD3J3OicPPeTJm9O4v1Pkb+V3kcuUSb5ShA0X
	2Li2bUIPrQ/UV/tPE2ScL/HYPPdCUkMIBwq69l63OmdEswPHnriw5+Ydt8xS0YXFNH5mUxVCwMH
	5ChiwQYo5CsDksJPDJl0jafHabms=
X-Google-Smtp-Source: AGHT+IHsx8NQ92WXFtFm/EntXaO6XfThBXsCF/ZIbdZLOIBhnlnnKPPU+cBZbfYo1vP//NaL5Xi3Yya0upg3yrpTd4c=
X-Received: by 2002:a2e:a41c:0:b0:2ee:494c:c3d3 with SMTP id
 38308e7fff4ca-2ef16847a34mr81457881fa.43.1721763882725; Tue, 23 Jul 2024
 12:44:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 24 Jul 2024 04:44:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
Message-ID: <CAK7LNATbZgv6JNzSXznOm47oNUXku430-taoK4iE1G0YcBy4Lw@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.11-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,

Please pull Kbuild updates for v6.11-rc1




You will get a merge conflict in scripts/Makefile.lib

It is a conflict between the following two commits:
 49636c5680b977d8a39263c6c8db6061c427346e
 712aba5543b88996bc4682086471076fbf048927

The resolution exists in linux-next.


Thank you.





The following changes since commit 256abd8e550ce977b728be79a74e1729438b4948=
:

  Linux 6.10-rc7 (2024-07-07 14:23:46 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.11

for you to fetch changes up to 13c239a2c088e91e453d26517b562c9a116444fa:

  kbuild: doc: gcc to CC change (2024-07-24 01:18:25 +0900)

----------------------------------------------------------------
Kbuild updates for v6.11

 - Remove tristate choice support from Kconfig

 - Stop using the PROVIDE() directive in the linker script

 - Reduce the number of links for the combination of CONFIG_DEBUG_INFO_BTF
   and CONFIG_KALLSYMS

 - Enable the warning for symbol reference to .exit.* sections by default

 - Fix warnings in RPM package builds

 - Improve scripts/make_fit.py to generate a FIT image with separate base
   DTB and overlays

 - Improve choice value calculation in Kconfig

 - Fix conditional prompt behavior in choice in Kconfig

 - Remove support for the uncommon EMAIL environment variable in Debian
   package builds

 - Remove support for the uncommon "name <email>" form for the DEBEMAIL
   environment variable

 - Raise the minimum supported GNU Make version to 4.0

 - Remove stale code for the absolute kallsyms

 - Move header files commonly used for host programs to scripts/include/

 - Introduce the pacman-pkg target to generate a pacman package used in
   Arch Linux

 - Clean up Kconfig

----------------------------------------------------------------
Chen-Yu Tsai (1):
      scripts/make_fit: Support decomposing DTBs

HONG Yifan (1):
      kconfig: recursive checks drop file/lineno

Ivan Davydov (1):
      kbuild: doc: gcc to CC change

Jann Horn (1):
      kallsyms: get rid of code for absolute kallsyms

Masahiro Yamada (55):
      initramfs: shorten cmd_initfs in usr/Makefile
      kconfig: qconf: remove initial call to conf_changed()
      kconfig: gconf: remove unnecessary forward declarations
      kconfig: gconf: move conf_changed() definition up
      kconfig: pass new conf_changed value to the callback
      kconfig: remove tristate choice support
      kconfig: refactor conf_set_all_new_symbols() to reduce indentation le=
vel
      kconfig: refactor conf_write_defconfig() to reduce indentation level
      kbuild: refactor variables in scripts/link-vmlinux.sh
      kbuild: remove PROVIDE() for kallsyms symbols
      kbuild: merge temporary vmlinux for BTF and kallsyms
      kconfig: add -e and -u options to *conf-cfg.sh scripts
      kconfig: remove unneeded code in expr_compare_type()
      kconfig: add fallthrough comments to expr_compare_type()
      kconfig: introduce choice_set_value() helper
      kconfig: remember the current choice while parsing the choice block
      kbuild: move init/build-version to scripts/
      kconfig: import list_move(_tail) and list_for_each_entry_reverse macr=
os
      kconfig: refactor choice value calculation
      kconfig: remove sym_get_choice_value()
      kconfig: remove conf_unsaved in conf_read_simple()
      kconfig: change sym_choice_default() to take the choice menu
      kconfig: use menu_list_for_each_sym() in sym_choice_default()
      kconfig: remove expr_list_for_each_sym() macro
      kconfig: use sym_get_choice_menu() in sym_check_print_recursive()
      kconfig: use sym_get_choice_menu() in sym_check_choice_deps()
      kconfig: use sym_get_choice_menu() in sym_check_deps()
      kconfig: remove P_CHOICE property
      kconfig: remove E_LIST expression type
      treewide: change conditional prompt for choices to 'depends on'
      kconfig: fix conditional prompt behavior for choice
      kconfig: improve error message for dependency between choice members
      kconfig: improve error message for recursive dependency in choice
      kconfig: refactor error messages in sym_check_print_recursive()
      kbuild: deb-pkg: remove support for EMAIL environment variable
      kbuild: deb-pkg: remove support for "name <email>" form for DEBEMAIL
      kbuild: package: add -e and -u options to some shell scripts
      kbuild: avoid build error when single DTB is turned into composite DT=
B
      kbuild: raise the minimum GNU Make requirement to 4.0
      modpost: remove self-definitions of R_ARM_* macros
      modpost: rename R_ARM_THM_CALL to R_ARM_THM_PC22
      kbuild: deb-pkg: use default string when variable is unset or null
      kconfig: call expr_eliminate_yn() at least once in expr_eliminate_dup=
s()
      kconfig: add const qualifiers to several function arguments
      kconfig: remove SYMBOL_CHOICEVAL flag
      kconfig: remove 'e1' and 'e2' macros from expression deduplication
      kbuild: clean up scripts/remove-stale-files
      Makefile: add comment to discourage tools/* addition for kernel build=
s
      kbuild: move some helper headers from scripts/kconfig/ to scripts/inc=
lude/
      modpost: use generic macros for hash table implementation
      kallsyms: avoid repeated calculation of array size for markers
      kallsyms: use \t instead of a tab in printf()
      kallsyms: add more original symbol type/name in comment lines
      kallsyms: unify seq and start_pos fields of struct sym_entry
      kallsyms: change sym_entry::percpu_absolute to bool type

Rafael Aquini (2):
      kbuild: rpm-pkg: make sure to have versioned 'Obsoletes' for kernel.s=
pec
      kbuild: rpm-pkg: introduce a simple changelog section for kernel.spec

Thomas Wei=C3=9Fschuh (1):
      kbuild: add script and target to generate pacman package

Uwe Kleine-K=C3=B6nig (1):
      modpost: Enable section warning from *driver to .exit.text

Zhang Bingwu (2):
      kbuild: Abort make on install failures
      kbuild: Create INSTALL_PATH directory if it does not exist

 .gitignore                                                    |   6 +
 Documentation/kbuild/kconfig-language.rst                     |  11 +-
 Documentation/kbuild/makefiles.rst                            |   6 +-
 Documentation/process/changes.rst                             |   4 +-
 MAINTAINERS                                                   |   8 +
 Makefile                                                      |  36 ++--
 arch/arm/Kconfig                                              |   6 +-
 arch/arm/boot/install.sh                                      |   2 +
 arch/arm64/Kconfig                                            |   3 +-
 arch/arm64/boot/install.sh                                    |   2 +
 arch/m68k/install.sh                                          |   2 +
 arch/mips/Kconfig                                             |   6 +-
 arch/nios2/boot/install.sh                                    |   2 +
 arch/parisc/install.sh                                        |   2 +
 arch/powerpc/Kconfig                                          |   3 +-
 arch/riscv/Kconfig                                            |   3 +-
 arch/riscv/boot/install.sh                                    |   2 +
 arch/s390/boot/install.sh                                     |   2 +
 arch/sparc/boot/install.sh                                    |   2 +
 arch/x86/boot/install.sh                                      |   2 +
 fs/jffs2/Kconfig                                              |   3 +-
 include/asm-generic/vmlinux.lds.h                             |  19 --
 init/Kconfig                                                  |  18 --
 init/Makefile                                                 |   2 +-
 kernel/kallsyms.c                                             |   5 +-
 kernel/kallsyms_internal.h                                    |   6 -
 kernel/vmcore_info.c                                          |   4 -
 scripts/Kbuild.include                                        |   2 +-
 scripts/Makefile.lib                                          |   7 +-
 scripts/Makefile.package                                      |  14 ++
 {init =3D> scripts}/build-version                               |   0
 scripts/{kconfig =3D> include}/array_size.h                     |   0
 scripts/{kconfig =3D> include}/hashtable.h                      |   0
 scripts/{kconfig =3D> include}/list.h                           |  53 ++++=
++
 scripts/{kconfig =3D> include}/list_types.h                     |   0
 scripts/install.sh                                            |   4 +
 scripts/kallsyms.c                                            | 125
++++++-------
 scripts/kconfig/conf.c                                        | 238
++++++++++--------------
 scripts/kconfig/confdata.c                                    | 127
++++---------
 scripts/kconfig/expr.c                                        | 128
++++++-------
 scripts/kconfig/expr.h                                        |  29 ++-
 scripts/kconfig/gconf-cfg.sh                                  |   2 +
 scripts/kconfig/gconf.c                                       |  26 ++-
 scripts/kconfig/internal.h                                    |   2 +-
 scripts/kconfig/lkc.h                                         |  34 ++--
 scripts/kconfig/lkc_proto.h                                   |  16 +-
 scripts/kconfig/mconf-cfg.sh                                  |   2 +
 scripts/kconfig/mconf.c                                       |  38 ++--
 scripts/kconfig/menu.c                                        | 111
++----------
 scripts/kconfig/mnconf-common.c                               |   2 +-
 scripts/kconfig/mnconf-common.h                               |   2 +
 scripts/kconfig/nconf-cfg.sh                                  |   2 +
 scripts/kconfig/nconf.c                                       |  38 ++--
 scripts/kconfig/parser.y                                      |  45 ++---
 scripts/kconfig/preprocess.c                                  |   4 +-
 scripts/kconfig/qconf-cfg.sh                                  |   2 +
 scripts/kconfig/qconf.cc                                      |  20 +--
 scripts/kconfig/qconf.h                                       |   2 +-
 scripts/kconfig/symbol.c                                      | 369
++++++++++++++++++++------------------
 scripts/kconfig/tests/choice/Kconfig                          |  17 --
 scripts/kconfig/tests/choice/__init__.py                      |  10 --
 scripts/kconfig/tests/choice/alldef_expected_config           |   3 -
 scripts/kconfig/tests/choice/allmod_expected_config           |   3 -
 scripts/kconfig/tests/choice/allno_expected_config            |   3 -
 scripts/kconfig/tests/choice/allyes_expected_config           |   3 -
 scripts/kconfig/tests/choice/oldask0_expected_stdout          |   4 -
 scripts/kconfig/tests/choice/oldask1_config                   |   1 -
 scripts/kconfig/tests/choice/oldask1_expected_stdout          |   9 -
 scripts/kconfig/tests/choice_value_with_m_dep/Kconfig         |  21 ---
 scripts/kconfig/tests/choice_value_with_m_dep/__init__.py     |  16 --
 scripts/kconfig/tests/choice_value_with_m_dep/config          |   2 -
 scripts/kconfig/tests/choice_value_with_m_dep/expected_config |   3 -
 scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout |   4 -
 scripts/kconfig/tests/err_recursive_dep/expected_stderr       |  36 ++--
 scripts/kconfig/tests/inter_choice/Kconfig                    |  25 ---
 scripts/kconfig/tests/inter_choice/__init__.py                |  15 --
 scripts/kconfig/tests/inter_choice/defconfig                  |   1 -
 scripts/kconfig/tests/inter_choice/expected_config            |   4 -
 scripts/kconfig/util.c                                        |   4 +-
 scripts/link-vmlinux.sh                                       | 105 ++++++=
-----
 scripts/make_fit.py                                           |  86 ++++++=
---
 scripts/mod/list.h                                            | 213
----------------------
 scripts/mod/modpost.c                                         |  67 +-----=
-
 scripts/mod/modpost.h                                         |   2 +-
 scripts/package/PKGBUILD                                      | 108 ++++++=
+++++
 scripts/package/builddeb                                      |   2 +-
 scripts/package/buildtar                                      |   2 +-
 scripts/package/gen-diff-patch                                |   2 +
 scripts/package/install-extmod-build                          |   5 +-
 scripts/package/kernel.spec                                   |   2 +-
 scripts/package/mkdebian                                      |  44 ++---
 scripts/package/mkspec                                        |  27 ++-
 scripts/remove-stale-files                                    |  18 --
 tools/perf/tests/vmlinux-kallsyms.c                           |   1 -
 usr/Makefile                                                  |   4 +-
 95 files changed, 1016 insertions(+), 1467 deletions(-)
 rename {init =3D> scripts}/build-version (100%)
 rename scripts/{kconfig =3D> include}/array_size.h (100%)
 rename scripts/{kconfig =3D> include}/hashtable.h (100%)
 rename scripts/{kconfig =3D> include}/list.h (81%)
 rename scripts/{kconfig =3D> include}/list_types.h (100%)
 delete mode 100644 scripts/kconfig/tests/choice/oldask1_config
 delete mode 100644 scripts/kconfig/tests/choice/oldask1_expected_stdout
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/Kconfig
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/__init__.=
py
 delete mode 100644 scripts/kconfig/tests/choice_value_with_m_dep/config
 delete mode 100644
scripts/kconfig/tests/choice_value_with_m_dep/expected_config
 delete mode 100644
scripts/kconfig/tests/choice_value_with_m_dep/expected_stdout
 delete mode 100644 scripts/kconfig/tests/inter_choice/Kconfig
 delete mode 100644 scripts/kconfig/tests/inter_choice/__init__.py
 delete mode 100644 scripts/kconfig/tests/inter_choice/defconfig
 delete mode 100644 scripts/kconfig/tests/inter_choice/expected_config
 delete mode 100644 scripts/mod/list.h
 create mode 100644 scripts/package/PKGBUILD




--=20
Best Regards
Masahiro Yamada

