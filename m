Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E33A83253DB
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Feb 2021 17:46:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233662AbhBYQp0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Feb 2021 11:45:26 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:30292 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233375AbhBYQoA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Feb 2021 11:44:00 -0500
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11PGggQx014178;
        Fri, 26 Feb 2021 01:42:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11PGggQx014178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614271362;
        bh=eWXLvR7TbaJ0BLSmfq2SKCvgsZY5O5gZT9vYboDxnnU=;
        h=From:Date:Subject:To:Cc:From;
        b=gM84cK5qQXHZXT94luTV4VKATxMfOhfJc8PsFMspM7uvTCqVtojWMdvMD03FuXbmf
         ChDEdgeicvn08nHOmUCILRkNbmdQ/i7tUXLwkyMLPjQ6jZMIVi3irSJmzQ+z0bqjK/
         qVQPVd0TikyrB1ryZIepUZmJX8/YbuUUuON/2OpHAN26fQLpuXQcHVll2GYQ+6f7C1
         kLBiH69SD49Guc5G3fI0iZikFNpeBTD5AiAxMU0OWWR+bpQCd8sjNaipSGB8Cu+V3e
         JvGyI1v2dKignQnZYgZSgOPyMdLcnVpKXm9UMJ7cr3TsFu67jKXxY/a22TBlH4e7r8
         y67Vx/IxSYMIg==
X-Nifty-SrcIP: [209.85.214.179]
Received: by mail-pl1-f179.google.com with SMTP id f8so3492149plg.5;
        Thu, 25 Feb 2021 08:42:42 -0800 (PST)
X-Gm-Message-State: AOAM530BFXUysaJIq1WHUBBPS6mTC+IvydD4wBkdFF8Os7P3iIfiyXmI
        gNcMxccrRkD/e8S6rG5lggC8hkKjDfQCvJtZoog=
X-Google-Smtp-Source: ABdhPJxB/eS0W+OFVXj5GbQDd5vSEzKmsQpHrN/bBD/vZ8lUxsOYhUoScm2fm5NHa3WGm9/7Nx94jS+vrkEATGpCRfA=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr4124022pji.87.1614271361342;
 Thu, 25 Feb 2021 08:42:41 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 26 Feb 2021 01:42:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQtF+_=U5ba+-rFW1ZFpKoWD4UM7bHBuPd+vYA21waOaA@mail.gmail.com>
Message-ID: <CAK7LNAQtF+_=U5ba+-rFW1ZFpKoWD4UM7bHBuPd+vYA21waOaA@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.12-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.12-rc1.

When you pull this, you will see conflicts
arch/mips/kernel/syscalls/Makefile and
scripts/Makefile.lib

The resolution is available in linux-next.

Thanks.



The following changes since commit 92bf22614b21a2706f4993b278017e437f7785b3=
:

  Linux 5.11-rc7 (2021-02-07 13:57:38 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.12

for you to fetch changes up to 481083ec0bfc14c15f00fbe87c7b06dc01091950:

  initramfs: Remove redundant dependency of RD_ZSTD on BLK_DEV_INITRD
(2021-02-24 15:12:06 +0900)

----------------------------------------------------------------
Kbuild updates for v5.12

 - Fix false-positive build warnings for ARCH=3Dia64 builds

 - Optimize dictionary size for module compression with xz

 - Check the compiler and linker versions in Kconfig

 - Fix misuse of extra-y

 - Support DWARF v5 debug info

 - Clamp SUBLEVEL to 255 because stable releases 4.4.x and 4.9.x
   exceeded the limit

 - Add generic syscall{tbl,hdr}.sh for cleanups across arches

 - Minor cleanups of genksyms

 - Minor cleanups of Kconfig

----------------------------------------------------------------
Elliot Berman (1):
      Kbuild: Make composite object searching more generic

Geert Uytterhoeven (1):
      initramfs: Remove redundant dependency of RD_ZSTD on BLK_DEV_INITRD

Masahiro Yamada (27):
      ia64: do not typedef struct pal_min_state_area_s
      ia64: remove unneeded header includes from <asm/mca.h>
      ia64: remove generated/nr-irqs.h generation to fix build warning
      kbuild: Remove $(cc-option,-gdwarf-4) dependency from DEBUG_INFO_DWAR=
F4
      kbuild: LD_VERSION redenomination
      kbuild: check the minimum compiler version in Kconfig
      genksyms: make source_file a local variable in lexer
      genksyms: remove dead code for ST_TABLE_*
      genksyms: remove useless case DOTS
      kbuild: doc: remove "Objects which export symbols" section
      kbuild: stop removing stale <linux/version.h> file
      kbuild: use always-y instead of extra-y
      gen_compile_commands: prune some directories
      arch: syscalls: add missing FORCE and fix 'targets' to make
if_changed work
      arch: syscalls: remove $(srctree)/ prefix from syscall tables
      scripts: add generic syscalltbl.sh
      scripts: add generic syscallhdr.sh
      kbuild: remove ld-version macro
      kbuild: check the minimum linker version in Kconfig
      kconfig: clean up nested if-conditionals in check_conf()
      kconfig: remove dead code in conf_askvalue()
      kconfig: fix 'invalid option' for help option
      kconfig: omit --oldaskconfig option for 'make config'
      kconfig: unify rule of config, menuconfig, nconfig, gconfig, xconfig
      kbuild: reuse this-makefile to define abs_srctree
      kbuild: parse C=3D and M=3D before changing the working directory
      kbuild: remove deprecated 'always' and 'hostprogs-y/m'

Micka=C3=ABl Sala=C3=BCn (1):
      kconfig: Remove duplicate call to sym_get_string_value()

Nathan Chancellor (1):
      Makefile: Remove # characters from compiler string

Nick Desaulniers (4):
      vmlinux.lds.h: add DWARF v5 sections
      Kbuild: make DWARF version a choice
      Kconfig: allow explicit opt in to DWARF v5
      Makefile: reuse CC_VERSION_TEXT

Sasha Levin (2):
      kbuild: clamp SUBLEVEL to 255
      kbuild: simplify access to the kernel's version

Tor Vic (1):
      Makefile: use smaller dictionary size for xz module compression

 Documentation/devicetree/bindings/Makefile     |   8 ++--
 Documentation/kbuild/makefiles.rst             |   8 +---
 MAINTAINERS                                    |   2 -
 Makefile                                       | 105
+++++++++++++++++++++++++++-----------------------
 arch/alpha/kernel/syscalls/Makefile            |  13 ++++---
 arch/arm/tools/Makefile                        |   2 +-
 arch/arm64/Kconfig                             |   2 +-
 arch/ia64/Makefile                             |   6 ---
 arch/ia64/include/asm/irq.h                    |   4 +-
 arch/ia64/include/asm/mca.h                    |  11 ++----
 arch/ia64/include/asm/pal.h                    |   4 +-
 arch/ia64/include/asm/sal.h                    |   2 +-
 arch/ia64/kernel/Makefile                      |   5 ---
 arch/ia64/kernel/asm-offsets.c                 |  18 ++++-----
 arch/ia64/kernel/crash.c                       |   1 +
 arch/ia64/kernel/efi.c                         |   1 +
 arch/ia64/kernel/mca.c                         |   5 ++-
 arch/ia64/kernel/mca_drv.c                     |   2 +-
 arch/ia64/kernel/nr-irqs.c                     |  22 -----------
 arch/ia64/kernel/syscalls/Makefile             |  13 ++++---
 arch/m68k/kernel/syscalls/Makefile             |  13 ++++---
 arch/microblaze/kernel/syscalls/Makefile       |  13 ++++---
 arch/mips/kernel/syscalls/Makefile             |  33 ++++++++--------
 arch/mips/loongson64/Platform                  |   2 +-
 arch/mips/vdso/Kconfig                         |   2 +-
 arch/parisc/kernel/syscalls/Makefile           |  19 ++++-----
 arch/powerpc/Makefile                          |   2 +-
 arch/powerpc/kernel/syscalls/Makefile          |  21 +++++-----
 arch/powerpc/lib/Makefile                      |   2 +-
 arch/sh/kernel/syscalls/Makefile               |  13 ++++---
 arch/sparc/kernel/syscalls/Makefile            |  19 ++++-----
 arch/x86/entry/syscalls/Makefile               |  29 +++++++-------
 arch/xtensa/kernel/syscalls/Makefile           |  13 ++++---
 drivers/gpu/drm/i915/Makefile                  |   2 +-
 drivers/net/ethernet/mellanox/mlx5/core/main.c |   4 +-
 drivers/usb/core/hcd.c                         |   4 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c       |   4 +-
 include/asm-generic/vmlinux.lds.h              |   7 +++-
 include/linux/compiler-clang.h                 |  10 -----
 include/linux/compiler-gcc.h                   |  11 ------
 include/linux/usb/composite.h                  |   4 +-
 init/Kconfig                                   |  30 +++++++++------
 kernel/sys.c                                   |   2 +-
 lib/Kconfig.debug                              |  49 ++++++++++++++++++++-=
--
 scripts/Kbuild.include                         |   6 +--
 scripts/Kconfig.include                        |  13 ++++++-
 scripts/Makefile.build                         |   1 -
 scripts/Makefile.clean                         |   3 --
 scripts/Makefile.lib                           |  34 +++++++---------
 scripts/cc-version.sh                          |  82
+++++++++++++++++++++++++++++++++++++++
 scripts/clang-tools/gen_compile_commands.py    |  12 +++++-
 scripts/clang-version.sh                       |  19 ---------
 scripts/gcc-version.sh                         |  20 ----------
 scripts/gdb/linux/Makefile                     |   4 +-
 scripts/genksyms/genksyms.c                    |   2 +-
 scripts/genksyms/genksyms.h                    |   2 +-
 scripts/genksyms/lex.l                         |  56
+--------------------------
 scripts/kconfig/Makefile                       |  36 +++++++----------
 scripts/kconfig/conf.c                         |  78
++++++++++++++++---------------------
 scripts/ld-version.sh                          |  82
++++++++++++++++++++++++++++++++++-----
 scripts/lld-version.sh                         |  20 ----------
 scripts/syscallhdr.sh                          |  98
++++++++++++++++++++++++++++++++++++++++++++++
 scripts/syscalltbl.sh                          |  73
+++++++++++++++++++++++++++++++++++
 scripts/test_dwarf5_support.sh                 |   8 ++++
 usr/Kconfig                                    |   1 -
 65 files changed, 696 insertions(+), 496 deletions(-)
 delete mode 100644 arch/ia64/kernel/nr-irqs.c
 create mode 100755 scripts/cc-version.sh
 delete mode 100755 scripts/clang-version.sh
 delete mode 100755 scripts/gcc-version.sh
 delete mode 100755 scripts/lld-version.sh
 create mode 100755 scripts/syscallhdr.sh
 create mode 100755 scripts/syscalltbl.sh
 create mode 100755 scripts/test_dwarf5_support.sh




--=20
Best Regards
Masahiro Yamada
