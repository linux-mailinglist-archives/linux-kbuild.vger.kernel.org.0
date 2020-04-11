Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9C8A1A4D9F
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Apr 2020 05:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgDKDZU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 Apr 2020 23:25:20 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:62037 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgDKDZU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Apr 2020 23:25:20 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 03B3PApA027704;
        Sat, 11 Apr 2020 12:25:11 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 03B3PApA027704
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586575511;
        bh=li2YLSjbiqBHVmtLv+tac08YXWdUVCvP3Mcy4eZaPUY=;
        h=From:Date:Subject:To:Cc:From;
        b=Eh3QOmiYbB4h1IHdHWnTHd67o7dFoXHwzdz2q2tqB+KlelXJ0SvDdxEfAB+AbJlij
         p5IqAGKCX7zSlOWBZkJfNilpEK1teLK3wJlsWgNc/QgcGDInh1FfTvcb18T4WEMKvz
         joCCxilVDyLnuCmk/viF8ZQLMtnkVZ4IKB53FCWp394HK97KcXiSecIcPuLe/fG47T
         2Nsyrz/RyFW4QiUVkd1L9langOaSAepvrQ2U6fPR2YhvTldbAIespKtBcDoUILQx3q
         arkhoICAZMweOh3kjNmgp5n73LMZdh3kz8Np3O4Tvpy3tP4nLljyfpqAzqTkgp8/QG
         tB7JQ83khy/6A==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id b5so2484817vsb.1;
        Fri, 10 Apr 2020 20:25:11 -0700 (PDT)
X-Gm-Message-State: AGi0PubocjOqMFgBaPiOvQ6gQhqj+tvGXWgjdn5iSukv23jCuegXzFHB
        zliBBcOkf0Te1xKQOivXjwg0COC11FzyZllxvx8=
X-Google-Smtp-Source: APiQypJbFOtnemb7B92hc4WMK4uHavJ46DhrPguAHwBpASX6kmpfzb0QCsc/E0QbSSLvboEgoCQc088bbSQ9MYnlMlk=
X-Received: by 2002:a67:3201:: with SMTP id y1mr6118137vsy.54.1586575510034;
 Fri, 10 Apr 2020 20:25:10 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 11 Apr 2020 12:24:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNART4rVUYsaqQKM4u1DVxTtDDs51kyY9JFKCOuHe1FLV-Q@mail.gmail.com>
Message-ID: <CAK7LNART4rVUYsaqQKM4u1DVxTtDDs51kyY9JFKCOuHe1FLV-Q@mail.gmail.com>
Subject: [GIT PULL] more Kbuild updates for v5.7-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull more Kbuild updates.

Thanks.



The following changes since commit f5e94d10e4c468357019e5c28d48499f677b284f:

  Merge tag 'drm-next-2020-04-08' of
git://anongit.freedesktop.org/drm/drm (2020-04-07 20:24:34 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kbuild-v5.7-2

for you to fetch changes up to 00d76a0c19436c88ffcafa1e816f0c0c9af082a0:

  kbuild: fix comment about missing include guard detection
(2020-04-11 12:09:48 +0900)

----------------------------------------------------------------
Kbuild updates for v5.7 (2nd)

 - raise minimum supported binutils version to 2.23

 - remove old CONFIG_AS_* macros that we know binutils >= 2.23 supports

 - move remaining CONFIG_AS_* tests to Kconfig from Makefile

 - enable -Wtautological-compare warnings to catch more issues

 - do not support GCC plugins for GCC <= 4.7

 - fix various breakages of 'make xconfig'

 - include the linker version used for linking the kernel into
   LINUX_COMPILER, which is used for the banner, and also exposed to
   /proc/version

 - link lib-y objects to vmlinux forcibly when CONFIG_MODULES=y,
   which allows us to remove the lib-ksyms.o workaround, and to
   solve the last known issue of the LLVM linker

 - add dummy tools in scripts/dummy-tools/ to enable all compiler
   tests in Kconfig, which will be useful for distro maintainers

 - support the single switch, LLVM=1 to use Clang and all LLVM utilities
   instead of GCC and Binutils.

 - support LLVM_IAS=1 to enable the integrated assembler, which is still
   experimental

----------------------------------------------------------------
Borislav Petkov (1):
      Documentation/changes: Raise minimum supported binutils version to 2.23

Fangrui Song (1):
      Documentation/llvm: fix the name of llvm-size

Jason A. Donenfeld (4):
      x86: probe assembler capabilities via kconfig instead of makefile
      crypto: x86 - rework configuration based on Kconfig
      crypto: curve25519 - do not pollute dispatcher based on assembler
      x86: update AS_* macros to binutils >=2.23, supporting ADX and AVX2

Kees Cook (1):
      kbuild: mkcompile_h: Include $LD version in /proc/version

Masahiro Yamada (22):
      sh: use __builtin_constant_p() directly instead of IS_IMMEDIATE()
      h8300: move definition of __kernel_size_t etc. to posix_types.h
      sh: remove unneeded uapi asm-generic wrappers
      lib/raid6/test: fix build on distros whose /bin/sh is not bash
      x86: remove unneeded defined(__ASSEMBLY__) check from asm/dwarf2.h
      x86: remove always-defined CONFIG_AS_CFI
      x86: remove unneeded (CONFIG_AS_)CFI_SIGNAL_FRAME
      x86: remove always-defined CONFIG_AS_CFI_SECTIONS
      x86: remove always-defined CONFIG_AS_SSSE3
      x86: remove always-defined CONFIG_AS_AVX
      drm/i915: remove always-defined CONFIG_AS_MOVNTDQA
      x86: add comments about the binutils version to support code in as-instr
      crypto: x86 - clean up poly1305-x86_64-cryptogams.S by 'make clean'
      gcc-plugins: drop support for GCC <= 4.7
      kbuild: do not pass $(KBUILD_CFLAGS) to scripts/mkcompile_h
      kbuild: remove -I$(srctree)/tools/include from scripts/Makefile
      MIPS: fw: arc: add __weak to prom_meminit and prom_free_prom_memory
      kbuild: link lib-y objects to vmlinux forcibly when CONFIG_MODULES=y
      kbuild: add dummy toolchains to enable all cc-option etc. in Kconfig
      kbuild: replace AS=clang with LLVM_IAS=1
      kbuild: support LLVM=1 to switch the default tools to Clang/LLVM
      kbuild: fix comment about missing include guard detection

Mauro Carvalho Chehab (6):
      kconfig: qconf: clean deprecated warnings
      kconfig: qconf: Change title for the item window
      kconfig: qconf: fix the content of the main widget
      kconfig: qconf: fix support for the split view mode
      kconfig: qconf: remove some old bogus TODOs
      kconfig: qconf: Fix a few alignment issues

Nathan Chancellor (1):
      kbuild: Enable -Wtautological-compare

 Documentation/kbuild/kbuild.rst               |   5 +
 Documentation/kbuild/llvm.rst                 |  15 ++-
 Documentation/process/changes.rst             |   4 +-
 Makefile                                      |  40 +++++--
 arch/h8300/include/uapi/asm/bitsperlong.h     |  15 ---
 arch/h8300/include/uapi/asm/posix_types.h     |  13 +++
 arch/mips/fw/arc/memory.c                     |   4 +-
 arch/sh/include/asm/bitops-op32.h             |   8 +-
 arch/sh/include/uapi/asm/setup.h              |   2 -
 arch/sh/include/uapi/asm/types.h              |   2 -
 arch/x86/Kconfig                              |   2 +
 arch/x86/Kconfig.assembler                    |  17 +++
 arch/x86/Makefile                             |  22 ----
 arch/x86/crypto/Makefile                      | 162
++++++++++++-----------------
 arch/x86/crypto/aesni-intel_avx-x86_64.S      |   6 --
 arch/x86/crypto/aesni-intel_glue.c            |  21 +---
 arch/x86/crypto/blake2s-core.S                |   2 -
 arch/x86/crypto/chacha_glue.c                 |   6 +-
 arch/x86/crypto/poly1305-x86_64-cryptogams.pl |  16 ---
 arch/x86/crypto/poly1305_glue.c               |  11 +-
 arch/x86/crypto/sha1_ssse3_asm.S              |   4 -
 arch/x86/crypto/sha1_ssse3_glue.c             |  13 ---
 arch/x86/crypto/sha256-avx-asm.S              |   3 -
 arch/x86/crypto/sha256-avx2-asm.S             |   3 -
 arch/x86/crypto/sha256_ssse3_glue.c           |  12 ---
 arch/x86/crypto/sha512-avx-asm.S              |   2 -
 arch/x86/crypto/sha512-avx2-asm.S             |   3 -
 arch/x86/crypto/sha512_ssse3_glue.c           |  10 --
 arch/x86/include/asm/dwarf2.h                 |  44 --------
 arch/x86/include/asm/xor_avx.h                |   9 --
 drivers/gpu/drm/i915/Makefile                 |   3 -
 drivers/gpu/drm/i915/i915_memcpy.c            |   5 -
 include/crypto/curve25519.h                   |   6 +-
 init/Makefile                                 |   2 +-
 lib/raid6/algos.c                             |   8 +-
 lib/raid6/avx2.c                              |   4 -
 lib/raid6/recov_avx2.c                        |   6 --
 lib/raid6/recov_ssse3.c                       |   6 --
 lib/raid6/test/Makefile                       |   9 +-
 net/netfilter/Makefile                        |   2 +-
 net/netfilter/nf_tables_api.c                 |   2 +-
 net/netfilter/nft_set_pipapo.c                |   2 +-
 net/netfilter/nft_set_pipapo_avx2.h           |   4 +-
 scripts/Kconfig.include                       |   3 -
 scripts/Makefile                              |   4 -
 scripts/Makefile.build                        |  19 +---
 scripts/Makefile.clean                        |   1 -
 scripts/Makefile.extrawarn                    |   1 +
 scripts/Makefile.host                         |  23 +---
 scripts/dummy-tools/gcc                       |  91 ++++++++++++++++
 scripts/dummy-tools/ld                        |  30 ++++++
 scripts/dummy-tools/nm                        |   1 +
 scripts/dummy-tools/objcopy                   |   1 +
 scripts/gcc-plugin.sh                         |  55 +---------
 scripts/gcc-plugins/Kconfig                   |  12 +--
 scripts/gcc-plugins/Makefile                  |  21 ++--
 scripts/kconfig/qconf.cc                      |  90 +++++++++++-----
 scripts/kconfig/qconf.h                       |   2 +
 scripts/mkcompile_h                           |   6 +-
 tools/objtool/Makefile                        |   6 ++
 usr/include/Makefile                          |   2 +-
 61 files changed, 384 insertions(+), 519 deletions(-)
 delete mode 100644 arch/h8300/include/uapi/asm/bitsperlong.h
 create mode 100644 arch/h8300/include/uapi/asm/posix_types.h
 delete mode 100644 arch/sh/include/uapi/asm/setup.h
 delete mode 100644 arch/sh/include/uapi/asm/types.h
 create mode 100644 arch/x86/Kconfig.assembler
 create mode 100755 scripts/dummy-tools/gcc
 create mode 100755 scripts/dummy-tools/ld
 create mode 120000 scripts/dummy-tools/nm
 create mode 120000 scripts/dummy-tools/objcopy


-- 
Best Regards
Masahiro Yamada
