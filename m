Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 699163FC07E
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 03:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239191AbhHaBfJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 30 Aug 2021 21:35:09 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27942 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231297AbhHaBfJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Aug 2021 21:35:09 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 17V1XjDV011046;
        Tue, 31 Aug 2021 10:33:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 17V1XjDV011046
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1630373626;
        bh=izy3AjAJdYXTfDP1zxVU0AUkl7ehRuklfEIlDdeT5/8=;
        h=From:Date:Subject:To:Cc:From;
        b=SkbztkCE3mZWXHgzTTTL9hMFHYWBgd4JY2WB5Zh+ceAeORiKwJH0St9b7aC/8XGV+
         KVhzRWsTbzlU25N13FcpnZ4EvEHR1w4e2lIzi+xcnXkDWdEEiiDMYMgKwwjGuMONV4
         aZF/BYL5Y1AtrgXUyhwW/5+erabXGfIzecE9DGzFhlC5CByijgMyRQQ3jaPY6am2H6
         HubvHLm40Ho7oiacTeY3doyIMj91pXCvuBB5dCD9uXunGyskDLaQ8vdPM/nEnVPpBd
         0Q+0r9ENLhQOtG04N+7G/+Mj3JTkX0mxZLmqx+WfPlry9+XBt98o1XnvznaYf7wI9m
         5IsHBdmZRh81w==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so1036813pje.0;
        Mon, 30 Aug 2021 18:33:45 -0700 (PDT)
X-Gm-Message-State: AOAM530nYUmL6KXcDGEsnG3W5sMH3s2oXWH46C8JtD7pY5Lhgc3ykBxW
        UHPWOJRt0AdztfcAcodKAGURUjb4uSVeUvnfJKU=
X-Google-Smtp-Source: ABdhPJzZnseS4NcI4lsC2EWfIYwMLy00QI1+NIIURNGbiUwRr1BraTXiMKTfC0H8XexqFk+PbjmO6Ds0rToeW23fV9c=
X-Received: by 2002:a17:902:c149:b0:132:86ed:3545 with SMTP id
 9-20020a170902c14900b0013286ed3545mr2236976plj.47.1630373624636; Mon, 30 Aug
 2021 18:33:44 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 31 Aug 2021 10:33:08 +0900
X-Gmail-Original-Message-ID: <CAK7LNATrzUSQg8pnpG1cDbA0sRdAeQGyy7d3ZqFJ4HMZymB=xQ@mail.gmail.com>
Message-ID: <CAK7LNATrzUSQg8pnpG1cDbA0sRdAeQGyy7d3ZqFJ4HMZymB=xQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.15-rc1
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


After pulling this, you may see new warnings like this:

    arch/x86/entry/vdso/Makefile:135: FORCE prerequisite is missing

They are just trivial Makefile mistakes, and patches
already exist. So, they will be fixed sooner or later.



Thanks.




The following changes since commit 36a21d51725af2ce0700c6ebcb6b9594aac658a6:

  Linux 5.14-rc5 (2021-08-08 13:49:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kbuild-v5.15

for you to fetch changes up to 26d5313d02e4c5ca05bbf01e162abad7eebda906:

  checkkconfigsymbols.py: Fix the '--ignore' option (2021-08-27 14:07:07 +0900)

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

 - Remove -isystem from the global compiler flag (except nds32) so
   nobody will accidentally include unintended headers.

 - Add Nick Desaulniers as a Kbuild reviewer.

 - Drop stale cc-option tests.

 - Fix the combination of CONFIG_TRIM_UNUSED_KSYMS and CONFIG_LTO_CLANG
   to handle symbols in inline assembly.

 - Show a warning if 'FORCE' is missing for if_changed rules.

 - Various cleanups

----------------------------------------------------------------
Alexey Dobriyan (3):
      isystem: trim/fixup stdarg.h and other headers
      isystem: ship and use stdarg.h
      isystem: delete global -isystem compile option

Ariel Marcovitch (1):
      checkkconfigsymbols.py: Fix the '--ignore' option

Greg Kroah-Hartman (1):
      kbuild: sh: remove unused install script

Masahiro Yamada (16):
      kbuild: do not require sub-make for separate output tree builds
      scripts: make some scripts executable
      kbuild: warn if a different compiler is used for external module builds
      kbuild: check CONFIG_AS_IS_LLVM instead of LLVM_IAS
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

 Documentation/kbuild/llvm.rst
 | 25 +++++++--
 MAINTAINERS                                                            |  2 +
 Makefile
 | 92 ++++++++++++++++++----------------
 arch/arc/Makefile                                                      |  3 +-
 arch/arm/kernel/process.c                                              |  2 -
 arch/arm/mach-bcm/bcm_kona_smc.c                                       |  2 -
 arch/arm64/kernel/process.c                                            |  3 --
 arch/arm64/lib/Makefile                                                |  2 +
 arch/ia64/Kbuild                                                       |  2 +
 arch/ia64/Makefile                                                     |  2 -
 arch/mips/Makefile                                                     |  2 +-
 arch/nds32/Makefile                                                    |  2 +
 arch/openrisc/kernel/process.c                                         |  2 -
 arch/parisc/kernel/firmware.c                                          |  2 +-
 arch/parisc/kernel/process.c                                           |  3 --
 arch/powerpc/kernel/prom.c                                             |  1 -
 arch/powerpc/kernel/prom_init.c                                        |  2 +-
 arch/powerpc/kernel/rtas.c                                             |  2 +-
 arch/powerpc/kernel/udbg.c                                             |  2 +-
 arch/powerpc/lib/Makefile                                              |  2 +
 arch/riscv/Makefile                                                    |  2 +-
 arch/s390/Makefile
 | 14 +++---
 arch/s390/boot/pgm_check_info.c                                        |  2 +-
 arch/sh/boot/compressed/install.sh
 | 56 ---------------------
 arch/sparc/Makefile                                                    |  3 +-
 arch/sparc/boot/Makefile                                               |  4 --
 arch/sparc/kernel/process_32.c                                         |  3 --
 arch/sparc/kernel/process_64.c                                         |  3 --
 arch/um/Makefile                                                       |  6 +--
 arch/um/drivers/rtc_user.c                                             |  1 +
 arch/um/drivers/vector_user.c                                          |  1 +
 arch/um/include/shared/irq_user.h                                      |  1 -
 arch/um/include/shared/os.h                                            |  1 -
 arch/um/os-Linux/signal.c                                              |  2 +-
 arch/um/os-Linux/util.c                                                |  1 +
 arch/x86/Makefile                                                      |  2 +-
 arch/x86/Makefile_32.cpu                                               |  6 ---
 arch/x86/boot/boot.h                                                   |  2 +-
 crypto/Makefile                                                        |  2 +
 drivers/block/xen-blkback/xenbus.c                                     |  1 -
 drivers/firmware/efi/libstub/efi-stub-helper.c                         |  2 +-
 drivers/firmware/efi/libstub/vsprintf.c                                |  2 +-
 drivers/gpu/drm/amd/display/dc/dc_helper.c                             |  2 +-
 drivers/gpu/drm/amd/display/dmub/inc/dmub_cmd.h                        |  1 -
 drivers/gpu/drm/drm_print.c                                            |  2 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h                           |  1 -
 drivers/isdn/capi/capiutil.c                                           |  2 +-
 drivers/macintosh/macio-adb.c                                          |  1 -
 drivers/macintosh/via-cuda.c                                           |  2 +-
 drivers/macintosh/via-macii.c                                          |  2 -
 drivers/macintosh/via-pmu.c                                            |  2 +-
 drivers/net/wireless/intersil/orinoco/hermes.c                         |  1 -
 drivers/net/wwan/iosm/iosm_ipc_imem.h                                  |  1 -
 drivers/pinctrl/aspeed/pinmux-aspeed.h                                 |  1 -
 drivers/scsi/elx/efct/efct_driver.h                                    |  1 -
 drivers/staging/media/atomisp/pci/hive_isp_css_common/host/isp_local.h |  2 -
 drivers/staging/media/atomisp/pci/hive_isp_css_include/print_support.h |  2 +-
 drivers/staging/media/atomisp/pci/ia_css_env.h                         |  2 +-
 .../staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h   |  2 +-
 drivers/staging/media/atomisp/pci/sh_css_internal.h                    |  2 +-
 drivers/xen/xen-scsiback.c                                             |  2 -
 fs/befs/debug.c                                                        |  2 +-
 fs/reiserfs/prints.c                                                   |  2 +-
 fs/ufs/super.c                                                         |  2 +-
 include/acpi/platform/acgcc.h                                          |  2 +-
 include/linux/filter.h                                                 |  2 -
 include/linux/kernel.h                                                 |  2 +-
 include/linux/mISDNif.h                                                |  1 -
 include/linux/printk.h                                                 |  2 +-
 include/linux/stdarg.h
 | 11 ++++
 include/linux/string.h                                                 |  2 +-
 kernel/debug/kdb/kdb_support.c                                         |  1 -
 lib/Kconfig.debug                                                      |  2 +
 lib/debug_info.c                                                       |  3 +-
 lib/kasprintf.c                                                        |  2 +-
 lib/kunit/string-stream.h                                              |  2 +-
 lib/raid6/Makefile                                                     |  4 ++
 lib/vsprintf.c                                                         |  2 +-
 mm/kfence/report.c                                                     |  2 +-
 net/batman-adv/log.c                                                   |  2 +-
 scripts/Kbuild.include
 | 13 +++--
 scripts/Makefile.build
 | 30 ++++++++++-
 scripts/Makefile.clang
 | 35 +++++++++++++
 scripts/Makefile.lib                                                   |  7 +++
 scripts/Makefile.modfinal
 | 21 +-------
 scripts/Makefile.modpost
 | 22 ++------
 scripts/as-version.sh                                                  |  8 +--
 scripts/checkdeclares.pl                                               |  0
 scripts/checkkconfigsymbols.py                                         |  2 +-
 scripts/clang-tools/gen_compile_commands.py                            |  2 +-
 scripts/gcc-plugins/gen-random-seed.sh                                 |  0
 scripts/gen_autoksyms.sh
 | 12 -----
 scripts/gen_ksymdeps.sh                                                |  8 ++-
 scripts/kconfig/merge_config.sh
 | 15 ++++++
 scripts/link-vmlinux.sh
 | 81 +++++++++++++-----------------
 scripts/syscallnr.sh                                                   |  0
 scripts/xen-hypercalls.sh                                              |  0
 security/Makefile
 | 11 ----
 sound/aoa/codecs/onyx.h                                                |  1 -
 sound/aoa/codecs/tas.c                                                 |  1 -
 sound/core/info.c                                                      |  1 -
 101 files changed, 298 insertions(+), 323 deletions(-)
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
