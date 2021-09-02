Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C07A3FF7E2
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Sep 2021 01:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345371AbhIBXc4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 2 Sep 2021 19:32:56 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:21632 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232756AbhIBXcz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 2 Sep 2021 19:32:55 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 182NVYBG012615;
        Fri, 3 Sep 2021 08:31:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 182NVYBG012615
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630625495;
        bh=kxq6fnptYtu1dLDIvA331H8Y9pNyCkUDkAB22DjUdiA=;
        h=From:Date:Subject:To:Cc:From;
        b=XFfmwsdfvx9Y/5YoYNkUWuTZ2VHE0uVHX0QUlMjcllFxsPF1yQU5tW3dCo1WL5rVh
         yolpqBR3yajqeFnfAaQsYQ7GNmCVutgu4Zn0n6tBkYwXABSdmJ1Om8Ho8VwkNnxBTM
         C5HxKGeVF0/j1/s5GPATWa/igjWOdG0EMY/3BUU0Tcrzh8UQLC7q7IGX+7A0ce2ieJ
         WwIHaaWcUlNstDery9LeiZ8OzABZOpBbT95LkdOBsq3H7cIASRKrglkrOHKQuF8u0x
         esx2MFGZUBuBx16+GNH87QmlitAKvyFdoRrkIhdDAVpXaBy+4q+WE0ebWieQZRv8pf
         eA16wALqvuE1A==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id g13-20020a17090a3c8d00b00196286963b9so2608794pjc.3;
        Thu, 02 Sep 2021 16:31:34 -0700 (PDT)
X-Gm-Message-State: AOAM532LV/zYsq6ofyklaYf6mLThXkfNtbSrB4jodNTk8XKPD1MvZCqo
        ueQSEDSYK24C5EUc6sajCBv2hiBJfBvwto9cRyM=
X-Google-Smtp-Source: ABdhPJwyCN4U3H03heSOqQ0jqZMa6T+eht+s4w6kx2xwVZn7a3HI0DUR8IkoOkJ6sPjVM/Ex0pFZaDfGCwifromMUmo=
X-Received: by 2002:a17:90a:9314:: with SMTP id p20mr6676571pjo.87.1630625494006;
 Thu, 02 Sep 2021 16:31:34 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 3 Sep 2021 08:30:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
Message-ID: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com>
Subject: [GIT PULL v2] Kbuild updates for v5.15-rc1
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.15-rc1.

This pull request is randomly touching many files in the tree,
most of which are <stdarg.h> cleanups.

I fixed the warnings observed in the previous PR.


Thanks.







The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.15

for you to fetch changes up to bc7cd2dd1f8e5889cc68b69984033ac5bef6ba61:

  kbuild: redo fake deps at include/ksym/*.h (2021-09-03 08:17:21 +0900)

----------------------------------------------------------------
Kbuild updates for v5.15

 - Add -s option (strict mode) to merge_config.sh to make it fail when
   any symbol is redefined.

 - Show a warning if a different compiler is used for building external
   modules.

 - Infer --target from ARCH for CC=clang to let you cross-compile the
   kernel without CROSS_COMPILE.

 - Make the integrated assembler default (LLVM_IAS=1) for CC=clang.

 - Add <linux/stdarg.h> to the kernel source instead of borrowing
   <stdarg.h> from the compiler.

 - Add Nick Desaulniers as a Kbuild reviewer.

 - Drop stale cc-option tests.

 - Fix the combination of CONFIG_TRIM_UNUSED_KSYMS and CONFIG_LTO_CLANG
   to handle symbols in inline assembly.

 - Show a warning if 'FORCE' is missing for if_changed rules.

 - Various cleanups

----------------------------------------------------------------
Alexey Dobriyan (2):
      isystem: trim/fixup stdarg.h and other headers
      isystem: ship and use stdarg.h

Ariel Marcovitch (1):
      checkkconfigsymbols.py: Fix the '--ignore' option

Greg Kroah-Hartman (1):
      kbuild: sh: remove unused install script

Masahiro Yamada (20):
      kbuild: do not require sub-make for separate output tree builds
      scripts: make some scripts executable
      kbuild: warn if a different compiler is used for external module builds
      kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
      x86/build/vdso: fix missing FORCE for *.so build rule
      kbuild: macrofy the condition of if_changed and friends
      kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk
      kbuild: Fix 'no symbols' warning when CONFIG_TRIM_UNUSD_KSYMS=y
      security: remove unneeded subdir-$(CONFIG_...)
      sparc: move the install rule to arch/sparc/Makefile
      ia64: move core-y in arch/ia64/Makefile to arch/ia64/Kbuild
      gen_compile_commands: extract compiler command from a series of commands
      kbuild: remove unused quiet_cmd_update_lto_symversions
      kbuild: remove stale *.symversions
      kbuild: merge vmlinux_link() between the ordinary link and Clang LTO
      kbuild: do not remove 'linux' link in scripts/link-vmlinux.sh
      kbuild: merge vmlinux_link() between ARCH=um and other architectures
      modpost: get the *.mod file path more simply
      kbuild: clean up objtool_args slightly
      kbuild: redo fake deps at include/ksym/*.h

Matthias Maennich (1):
      scripts: merge_config: add strict mode to fail upon any redefinition

Nathan Chancellor (4):
      kbuild: Remove -Wno-format-invalid-specifier from clang block
      kbuild: Add a comment above -Wno-gnu
      kbuild: Shuffle blank line to improve comment meaning
      kbuild: Switch to 'f' variants of integrated assembler flag

Nick Desaulniers (9):
      Makefile: move initial clang flag handling into scripts/Makefile.clang
      Makefile: infer --target from ARCH for CC=clang
      Documentation/llvm: update CROSS_COMPILE inferencing
      scripts/Makefile.clang: default to LLVM_IAS=1
      MAINTAINERS: add Nick to Kbuild reviewers
      Makefile: remove stale cc-option checks
      s390: replace cc-option-yn uses with cc-option
      arc: replace cc-option-yn uses with cc-option
      x86: remove cc-option-yn test for -mtune=

Sami Tolvanen (1):
      kbuild: Fix TRIM_UNUSED_KSYMS with LTO_CLANG

 Documentation/kbuild/llvm.rst                          | 25 ++++++-
 MAINTAINERS                                            |  2 +
 Makefile                                               | 90
++++++++++++-----------
 arch/arc/Makefile                                      |  3 +-
 arch/arm/kernel/process.c                              |  2 -
 arch/arm/mach-bcm/bcm_kona_smc.c                       |  2 -
 arch/arm64/kernel/process.c                            |  3 -
 arch/ia64/Kbuild                                       |  2 +
 arch/ia64/Makefile                                     |  2 -
 arch/mips/Makefile                                     |  2 +-
 arch/openrisc/kernel/process.c                         |  2 -
 arch/parisc/kernel/firmware.c                          |  2 +-
 arch/parisc/kernel/process.c                           |  3 -
 arch/powerpc/kernel/prom.c                             |  1 -
 arch/powerpc/kernel/prom_init.c                        |  2 +-
 arch/powerpc/kernel/rtas.c                             |  2 +-
 arch/powerpc/kernel/udbg.c                             |  2 +-
 arch/riscv/Makefile                                    |  2 +-
 arch/s390/Makefile                                     | 14 ++--
 arch/s390/boot/pgm_check_info.c                        |  2 +-
 arch/sh/boot/compressed/install.sh                     | 56 --------------
 arch/sparc/Makefile                                    |  3 +-
 arch/sparc/boot/Makefile                               |  4 -
 arch/sparc/kernel/process_32.c                         |  3 -
 arch/sparc/kernel/process_64.c                         |  3 -
 arch/um/Makefile                                       |  6 +-
 arch/um/drivers/rtc_user.c                             |  1 +
 arch/um/drivers/vector_user.c                          |  1 +
 arch/um/include/shared/irq_user.h                      |  1 -
 arch/um/include/shared/os.h                            |  1 -
 arch/um/os-Linux/signal.c                              |  2 +-
 arch/um/os-Linux/util.c                                |  1 +
 arch/x86/Makefile                                      |  2 +-
 arch/x86/Makefile_32.cpu                               |  6 --
 arch/x86/boot/boot.h                                   |  2 +-
 arch/x86/entry/vdso/Makefile                           |  2 +-
 drivers/block/xen-blkback/xenbus.c                     |  1 -
 drivers/firmware/efi/libstub/efi-stub-helper.c         |  2 +-
 drivers/firmware/efi/libstub/vsprintf.c                |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c             |  2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h        |  1 -
 drivers/gpu/drm/drm_print.c                            |  2 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h           |  1 -
 drivers/isdn/capi/capiutil.c                           |  2 +-
 drivers/macintosh/macio-adb.c                          |  1 -
 drivers/macintosh/via-cuda.c                           |  2 +-
 drivers/macintosh/via-macii.c                          |  2 -
 drivers/macintosh/via-pmu.c                            |  2 +-
 drivers/net/wireless/intersil/orinoco/hermes.c         |  1 -
 drivers/net/wwan/iosm/iosm_ipc_imem.h                  |  1 -
 drivers/pinctrl/aspeed/pinmux-aspeed.h                 |  1 -
 drivers/scsi/elx/efct/efct_driver.h                    |  1 -
 .../atomisp/pci/hive_isp_css_common/host/isp_local.h   |  2 -
 .../atomisp/pci/hive_isp_css_include/print_support.h   |  2 +-
 drivers/staging/media/atomisp/pci/ia_css_env.h         |  2 +-
 .../atomisp/pci/runtime/debug/interface/ia_css_debug.h |  2 +-
 drivers/staging/media/atomisp/pci/sh_css_internal.h    |  2 +-
 drivers/xen/xen-scsiback.c                             |  2 -
 fs/befs/debug.c                                        |  2 +-
 fs/reiserfs/prints.c                                   |  2 +-
 fs/ufs/super.c                                         |  2 +-
 include/acpi/platform/acgcc.h                          |  2 +-
 include/linux/filter.h                                 |  2 -
 include/linux/kernel.h                                 |  2 +-
 include/linux/mISDNif.h                                |  1 -
 include/linux/printk.h                                 |  2 +-
 include/linux/stdarg.h                                 | 11 +++
 include/linux/string.h                                 |  2 +-
 kernel/debug/kdb/kdb_support.c                         |  1 -
 lib/Kconfig.debug                                      |  2 +
 lib/debug_info.c                                       |  3 +-
 lib/kasprintf.c                                        |  2 +-
 lib/kunit/string-stream.h                              |  2 +-
 lib/vsprintf.c                                         |  2 +-
 mm/kfence/report.c                                     |  2 +-
 net/batman-adv/log.c                                   |  2 +-
 scripts/Kbuild.include                                 | 13 +++-
 scripts/Makefile.build                                 | 30 +++++++-
 scripts/Makefile.clang                                 | 35 +++++++++
 scripts/Makefile.lib                                   | 18 +++--
 scripts/Makefile.modfinal                              | 21 +-----
 scripts/Makefile.modpost                               | 22 +-----
 scripts/adjust_autoksyms.sh                            |  4 +-
 scripts/as-version.sh                                  |  8 +-
 scripts/checkdeclares.pl                               |  0
 scripts/checkkconfigsymbols.py                         |  2 +-
 scripts/clang-tools/gen_compile_commands.py            |  2 +-
 scripts/gcc-plugins/gen-random-seed.sh                 |  0
 scripts/gen_autoksyms.sh                               | 12 ---
 scripts/gen_ksymdeps.sh                                | 11 ++-
 scripts/kconfig/merge_config.sh                        | 15 ++++
 scripts/link-vmlinux.sh                                | 81
+++++++++-----------
 scripts/mod/modpost.c                                  | 11 ++-
 scripts/mod/modpost.h                                  |  9 ---
 scripts/mod/sumversion.c                               |  7 +-
 scripts/syscallnr.sh                                   |  0
 scripts/xen-hypercalls.sh                              |  0
 security/Makefile                                      | 11 ---
 sound/aoa/codecs/onyx.h                                |  1 -
 sound/aoa/codecs/tas.c                                 |  1 -
 sound/core/info.c                                      |  1 -
 101 files changed, 305 insertions(+), 349 deletions(-)
 delete mode 100644 arch/sh/boot/compressed/install.sh
 create mode 100644 include/linux/stdarg.h
 create mode 100644 scripts/Makefile.clang
 mode change 100644 => 100755 scripts/checkdeclares.pl
 mode change 100644 => 100755 scripts/gcc-plugins/gen-random-seed.sh
 mode change 100644 => 100755 scripts/syscallnr.sh
 mode change 100644 => 100755 scripts/xen-hypercalls.sh


-- 
Best Regards
Masahiro Yamada
