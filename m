Return-Path: <linux-kbuild+bounces-4911-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EBF9DECA6
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Nov 2024 21:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7455B21269
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Nov 2024 20:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2C9158535;
	Fri, 29 Nov 2024 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWIuXb6O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479C14D428;
	Fri, 29 Nov 2024 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732911751; cv=none; b=SnabpZEYhrbW7hYR+FWuYg0Ni4VFVm2Jhs2pi47cuc4Ws26aQf8jGyYpM7BkD0tY5Pyv/4JgC13/NUDatkTXjLnwnLAPL+Hldk9mgLKePWIhUef/qVIfbNIQimirmeWCBUL2naLOzftURCHRx+gTy21ZTHAAN4KxPAJfFzP+0sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732911751; c=relaxed/simple;
	bh=oSAsd4BzKj77bXV2khtHAQT2jN80a9LncyRIC0g5LRQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bJoOOkzFlRjkhRKMenfrSkilNC06M2PAJsYYf4WaDowRtEzNp46IW7bWae7mrG2RaA7dnZp4H+7R1GXBmFM5UL6NXl6m2bwuWjCVPWZ27zpJJ8Yzs8wwLv1i56fH+1ytwNoVgjvnvTbvYjUowP5E1BcG416KponwYGroxJ/hZX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWIuXb6O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032EFC4CECF;
	Fri, 29 Nov 2024 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732911751;
	bh=oSAsd4BzKj77bXV2khtHAQT2jN80a9LncyRIC0g5LRQ=;
	h=From:Date:Subject:To:Cc:From;
	b=mWIuXb6ONEzdvuAg8FJ2lUtZ4eYNcudKPpgglOf3/rzY88Fvy2lQSMt/5z8UrJApo
	 n2N6KWPea4oEZK6PlGg5i8GEXN1u6ab7ZCEzjbV79bFykaJP75WzAVBrxqPqsDke0P
	 6nhgG4zCyFu1sc6J5c2P/2ahdfPuBOQbaffnupcoUNJEj9ptowqDz1BAyQK17njtbS
	 uDt8NYKIVM7Iy9i1w9C+0vX8/vZ2CKyPrWZCu5BKEzmNnTLzki1SLbQzgPHDs8WfXl
	 zf59p856EUScZ/mqweafKjtSpupOLWXitVqoxX4INwNAgSaeR85uYJRXjXEPbGI4DU
	 SCYOKrQFJKD2w==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53de6b7da14so2313773e87.0;
        Fri, 29 Nov 2024 12:22:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbh/88J06xgrl2NmeZZLWW45frAJSxEqdqRJY6FlvV2P79dKL14x759W7ou4B5wDrE33QXP1wgKSbH+cw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHnvOzZ1ebpnMnAthWEYccrE+mVp+SByd9wHMcYOXmvktt4LA7
	cp18mNcoSN04fW5uDYNdgIRBZZeOxiP1J2UJ4hTv7fpgrPH0M8aHeUSKxqfXTJvfSeZ2KzJ/0dc
	5c9xU0QCr7jTaKtRfdKkuAh+YGW0=
X-Google-Smtp-Source: AGHT+IGtxTfScttZRGKkughjPqQEUXhvioHYKF4z7QtLt9FXX9v3KrMG6+SmKg6T/jmOmunyVMJ3JBiBOVxSaoNYAtw=
X-Received: by 2002:a05:6512:224d:b0:53d:d210:4060 with SMTP id
 2adb3069b0e04-53df01121dbmr4355529e87.53.1732911749620; Fri, 29 Nov 2024
 12:22:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 30 Nov 2024 05:21:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAShSZrZh_-0wpUA2=FpnomQTBzhxY2bJbGwkYf+kyTzLg@mail.gmail.com>
Message-ID: <CAK7LNAShSZrZh_-0wpUA2=FpnomQTBzhxY2bJbGwkYf+kyTzLg@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v6.13-rc1
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Linus,


Please pull Kbuild updates for v6.13-rc1.

You will see conflicts in two files.

[1] arch/powerpc/Makefile

This is caused by:
 214c0eea43b2 ("kbuild: add $(objtree)/ prefix to some in-kernel build
artifacts")

The resolution is provided by:
https://lore.kernel.org/all/20241113095228.4ac96776@canb.auug.org.au/


[2] tools/objtool/check.c

This is caused by:
 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
 d5dc95836147 ("kbuild: Add Propeller configuration for kernel build")

The resolution is provided by:
https://lore.kernel.org/all/20241112130136.52ffc457@canb.auug.org.au/



Thank you.



The following changes since commit 59b723cd2adbac2a34fc8e12c74ae26ae45bf230=
:

  Linux 6.12-rc6 (2024-11-03 14:05:52 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v6.13

for you to fetch changes up to e6064da6461f989a357f2e280d7f8d4155267c4c:

  kbuild: rename .tmp_vmlinux.kallsyms0.syms to .tmp_vmlinux0.syms
(2024-11-28 08:46:03 +0900)

----------------------------------------------------------------
Kbuild updates for v6.13

 - Add generic support for built-in boot DTB files

 - Enable TAB cycling for dialog buttons in nconfig

 - Fix issues in streamline_config.pl

 - Refactor Kconfig

 - Add support for Clang's AutoFDO (Automatic Feedback-Directed
   Optimization)

 - Add support for Clang's Propeller, a profile-guided optimization.

 - Change the working directory to the external module directory for M=3D
   builds

 - Support building external modules in a separate output directory

 - Enable objtool for *.mod.o and additional kernel objects

 - Use lz4 instead of deprecated lz4c

 - Work around a performance issue with "git describe"

 - Refactor modpost

----------------------------------------------------------------
David Hunter (3):
      streamline_config.pl: fix missing variable operator in debug print
      streamline_config.pl: ensure all defaults are tracked
      streamline_config.pl: remove prompt warnings for configs with default=
s

Li Zhijian (1):
      gitignore: Don't ignore 'tags' directory

Masahiro Yamada (62):
      speakup: use SPKDIR=3D$(src) to specify the source directory
      kbuild: refactor the check for missing config files
      kbuild: check the presence of include/generated/rustc_cfg
      kbuild: add generic support for built-in boot DTBs
      usb: use "prompt" instead of "bool" for choice prompts
      kconfig: remove support for "bool" prompt for choice entries
      kconfig: remove zconfprint()
      kconfig: qconf: set QSplitter orientation in the constructor
      kconfig: qconf: reorder code in ConfigMainWindow() constructor
      kconfig: qconf: set parent in the widget constructor
      kconfig: qconf: remove mouse{Press,Move}Event() functions
      kconfig: qconf: remove redundant type check for choice members
      kconfig: qconf: remove unnecessary setRootIsDecorated() call
      kconfig: qconf: remove unnecessary lastWindowClosed() signal connecti=
on
      kconfig: qconf: convert the last old connection syntax to Qt5 style
      kconfig: qconf: do not show goParent button in split view
      kconfig: qconf: remove ConfigItem::visible member
      kconfig: qconf: avoid unnecessary parentSelected() when ESC is presse=
d
      kconfig: qconf: remove redundant check in goBack()
      kconfig: qconf: remove non-functional href=3D"m..." tag
      kconfig: add sym_get_prompt_menu() helper function
      kconfig: qconf: refactor ConfigInfoView::clicked()
      kconfig: qconf: remove unnecessary mode check in ConfigItem::updateMe=
nu()
      kconfig: document the positional argument in the help message
      kbuild: simplify rustfmt target
      Rename .data.unlikely to .data..unlikely
      Rename .data.once to .data..once to fix resetting WARN*_ONCE
      kbuild: replace two $(abs_objtree) with $(CURDIR) in top Makefile
      kbuild: add $(objtree)/ prefix to some in-kernel build artifacts
      kbuild: rename abs_objtree to abs_output
      kbuild: use 'output' variable to create the output directory
      kbuild: change working directory to external module directory with M=
=3D
      kbuild: remove extmod_prefix, MODORDER, MODULES_NSDEPS variables
      kbuild: support building external modules in a separate build directo=
ry
      kbuild: support -fmacro-prefix-map for external modules
      kbuild: use absolute path in the generated wrapper Makefile
      kbuild: make wrapper Makefile more convenient for external modules
      kbuild: allow to start building external modules in any directory
      kbuild: do not pass -r to genksyms when *.symref does not exist
      kbuild: remove support for single %.symtypes build rule
      kbuild: move cmd_cc_o_c and cmd_as_o_S to scripts/Malefile.lib
      kbuild: enable objtool for *.mod.o and additional kernel objects
      kbuild: re-enable KCSAN for autogenerated *.mod.c intermediaries
      setlocalversion: add -e option
      modpost: remove incorrect code in do_eisa_entry()
      modpost: remove unnecessary check in do_acpi_entry()
      modpost: introduce module_alias_printf() helper
      modpost: deduplicate MODULE_ALIAS() for all drivers
      modpost: remove DEF_FIELD_ADDR_VAR() macro
      modpost: pass (struct module *) to do_*_entry() functions
      modpost: call module_alias_printf() from all do_*_entry() functions
      modpost: convert do_pnp_card_entries() to a generic handler
      modpost: convert do_pnp_device_entry() to a generic handler
      modpost: convert do_of_table() to a generic handler
      modpost: convert do_usb_table() to a generic handler
      modpost: move strstarts() to modpost.h
      modpost: rename variables in handle_moddevtable()
      modpost: rename alias symbol for MODULE_DEVICE_TABLE()
      modpost: improve error messages in device_id_check()
      genksyms: reduce indentation in export_symbol()
      kbuild: deb-pkg: add python3:native to build dependency
      modpost: replace tdb_hash() with hash_str()

Matt Fleming (1):
      kbuild: deb-pkg: Don't fail if modules.order is missing

Parth Pancholi (1):
      kbuild: switch from lz4c to lz4 for compression

Rasmus Villemoes (1):
      setlocalversion: work around "git describe" performance

Rolf Eike Beer (3):
      kconfig: qconf: use QString to store path to configuration file
      kconfig: qconf: use default platform shortcuts
      kconfig: qconf: simplify character replacement

Rong Xu (9):
      kbuild: Add AutoFDO support for Clang build
      objtool: Fix unreachable instruction warnings for weak functions
      MIPS: Place __kernel_entry at the beginning of text section
      vmlinux.lds.h: Adjust symbol ordering in text output section
      vmlinux.lds.h: Add markers for text_unlikely and text_hot sections
      AutoFDO: Enable -ffunction-sections for the AutoFDO build
      AutoFDO: Enable machine function split optimization for AutoFDO
      kbuild: Add Propeller configuration for kernel build
      kbuild: Fix Propeller build option

Sedat Dilek (1):
      kbuild: rename .tmp_vmlinux.kallsyms0.syms to .tmp_vmlinux0.syms

Thomas Wei=C3=9Fschuh (1):
      kbuild: add dependency from vmlinux to resolve_btfids

Thorsten Blum (2):
      kconfig: nconf: Use TAB to cycle thru dialog buttons
      kconfig: nconf: Fix typo in function comment

 .gitignore                                |   1 +
 Documentation/dev-tools/autofdo.rst       | 168 +++++++++
 Documentation/dev-tools/coccinelle.rst    |  20 +-
 Documentation/dev-tools/index.rst         |   2 +
 Documentation/dev-tools/propeller.rst     | 162 +++++++++
 Documentation/kbuild/kbuild.rst           |   8 +-
 Documentation/kbuild/kconfig-language.rst |   4 +-
 Documentation/kbuild/makefiles.rst        |  14 +
 Documentation/kbuild/modules.rst          |  29 +-
 MAINTAINERS                               |  14 +
 Makefile                                  | 221 +++++++-----
 arch/Kconfig                              |  39 ++
 arch/arm/Makefile                         |   4 +-
 arch/arm64/Makefile                       |   2 +-
 arch/mips/kernel/head.S                   |   1 +
 arch/mips/kernel/vmlinux.lds.S            |   1 +
 arch/powerpc/Makefile                     |   4 +-
 arch/riscv/Makefile                       |   2 +-
 arch/sparc/kernel/vmlinux.lds.S           |   5 +
 arch/x86/Kconfig                          |   2 +
 arch/x86/kernel/vmlinux.lds.S             |   4 +
 drivers/accessibility/speakup/Makefile    |   4 +-
 drivers/of/Kconfig                        |   6 +
 drivers/usb/dwc2/Kconfig                  |   2 +-
 drivers/usb/dwc3/Kconfig                  |   2 +-
 drivers/usb/isp1760/Kconfig               |   2 +-
 drivers/usb/mtu3/Kconfig                  |   2 +-
 drivers/usb/musb/Kconfig                  |   2 +-
 include/asm-generic/vmlinux.lds.h         |  53 ++-
 include/linux/mmdebug.h                   |   6 +-
 include/linux/module.h                    |   2 +-
 include/linux/once.h                      |   4 +-
 include/linux/once_lite.h                 |   2 +-
 include/linux/rcupdate.h                  |   2 +-
 include/net/net_debug.h                   |   2 +-
 mm/internal.h                             |   2 +-
 rust/Makefile                             |   4 +-
 scripts/Kbuild.include                    |   2 +-
 scripts/Makefile.autofdo                  |  24 ++
 scripts/Makefile.build                    |  59 +--
 scripts/Makefile.clean                    |   2 +-
 scripts/Makefile.compiler                 |   2 +-
 scripts/Makefile.host                     |   8 +-
 scripts/Makefile.lib                      |  62 +++-
 scripts/Makefile.modfinal                 |  31 +-
 scripts/Makefile.modinst                  |   8 +-
 scripts/Makefile.modpost                  |  24 +-
 scripts/Makefile.propeller                |  39 ++
 scripts/Makefile.vmlinux                  |  51 ++-
 scripts/coccicheck                        |   6 +-
 scripts/depmod.sh                         |   4 +-
 scripts/genksyms/genksyms.c               |  89 ++---
 scripts/head-object-list.txt              |   1 -
 scripts/kconfig/conf.c                    |   5 +-
 scripts/kconfig/lkc_proto.h               |   1 +
 scripts/kconfig/nconf.c                   |   2 +-
 scripts/kconfig/nconf.gui.c               |   9 +
 scripts/kconfig/parser.y                  |  28 +-
 scripts/kconfig/qconf.cc                  | 208 ++++-------
 scripts/kconfig/qconf.h                   |  19 +-
 scripts/kconfig/streamline_config.pl      |  18 +-
 scripts/kconfig/symbol.c                  |  26 +-
 scripts/link-vmlinux.sh                   |  16 +-
 scripts/mod/file2alias.c                  | 779
++++++++++++++++------------------------
 scripts/mod/modpost.c                     |  31 +-
 scripts/mod/modpost.h                     |  21 +-
 scripts/nsdeps                            |  10 +-
 scripts/package/builddeb                  |  20 +-
 scripts/package/install-extmod-build      |   7 +
 scripts/package/mkdebian                  |   2 +-
 scripts/setlocalversion                   |  58 ++-
 tools/objtool/check.c                     |   2 +
 tools/objtool/elf.c                       |  15 +-
 73 files changed, 1476 insertions(+), 1017 deletions(-)
 create mode 100644 Documentation/dev-tools/autofdo.rst
 create mode 100644 Documentation/dev-tools/propeller.rst
 create mode 100644 scripts/Makefile.autofdo
 create mode 100644 scripts/Makefile.propeller


--=20
Best Regards
Masahiro Yamada

