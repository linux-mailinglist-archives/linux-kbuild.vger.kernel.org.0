Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1311F073E
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2020 17:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgFFPTc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jun 2020 11:19:32 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:57633 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbgFFPTb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jun 2020 11:19:31 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 056FIxDX003753;
        Sun, 7 Jun 2020 00:18:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 056FIxDX003753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591456740;
        bh=Duf51V6ymEdvwj/e3QuQo3aqheJfhy2DzZBRQUqix9A=;
        h=From:Date:Subject:To:Cc:From;
        b=ue6N/zChS8oBCtul3QId9GoEV1VG9Cr2UNPHVCKrasAJL6VGs5z4iRYEp9vmwfUsX
         nUzwZcVQ248dGgC9DTCKhal8wFTttw36k5kNTU4kWH2NenWomodjNpT0FvRo0DPLAQ
         1cqsh87bfzzrOW4KkE26MPUFmRNy+puKHj9RQ3DL/Ir5+9jVwkxmRZ1ok2YKp+fVfk
         et/bsWielv4CakE/+bzE4yyNyjkQhoIEB2hPQC86dFVpcIiULcukNCnoxOzm8YRgcW
         VB+/j+qIPMAJjS3tjL6ofn9VmIgi9xWfOW5coUrHQVdYPXzOD6o7zfIpgyDmcfcmTp
         VGEwYBss0jbZQ==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id 1so7298580vsl.9;
        Sat, 06 Jun 2020 08:18:59 -0700 (PDT)
X-Gm-Message-State: AOAM533vLxHf39PIb3l6fRlW0Ld03C0L9DsVsNXWOmmzsys35zVOLgr8
        KwqnbCgn5D9C8MMQGOy5KXiAZCWJB9w8mEV+A/A=
X-Google-Smtp-Source: ABdhPJy/A2kfaM3VROP5b/7VxmKtzyMaNY8AwlbPgJr/iUKtkeE2zc6L04vZ5+t4NcYMBScG/6jFkHLvPJNdCe3lo3M=
X-Received: by 2002:a67:6383:: with SMTP id x125mr11233738vsb.54.1591456738452;
 Sat, 06 Jun 2020 08:18:58 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 7 Jun 2020 00:18:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQde47uabtuAZXpCubw_bcjfh==+xnci-5_hOxgPUSO9g@mail.gmail.com>
Message-ID: <CAK7LNAQde47uabtuAZXpCubw_bcjfh==+xnci-5_hOxgPUSO9g@mail.gmail.com>
Subject: [GIT PULL 1/2] Kbuild updates for v5.8-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.8-rc1

Some commit dates are very new because I fixed up some
typos in a comment line and commit description.
That is why some commit hashes are missing in linux-next.
Other than the typos, they were tested in linux-next.





The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.8

for you to fetch changes up to 8dfb61dcbaceb19a5ded5e9c9dcf8d05acc32294:

  kbuild: add variables for compression tools (2020-06-06 23:42:01 +0900)

----------------------------------------------------------------
Kbuild updates for v5.8

 - fix warnings in 'make clean' for ARCH=um, hexagon, h8300, unicore32

 - ensure to rebuild all objects when the compiler is upgraded

 - exclude system headers from dependency tracking and fixdep processing

 - fix potential bit-size mismatch between the kernel and BPF user-mode
   helper

 - add the new syntax 'userprogs' to build user-space programs for the
   target architecture (the same arch as the kernel)

 - compile user-space sample code under samples/ for the target arch
   instead of the host arch

 - make headers_install fail if a CONFIG option is leaked to user-space

 - sanitize the output format of scripts/checkstack.pl

 - handle ARM 'push' instruction in scripts/checkstack.pl

 - error out before modpost if a module name conflict is found

 - error out when multiple directories are passed to M= because this
   feature is broken for a long time

 - add CONFIG_DEBUG_INFO_COMPRESSED to support compressed debug info

 - a lot of cleanups of modpost

 - dump vmlinux symbols out into vmlinux.symvers, and reuse it in the
   second pass of modpost

 - do not run the second pass of modpost if nothing in modules is updated

 - install modules.builtin(.modinfo) by 'make install' as well as by
   'make modules_install' because it is useful even when CONFIG_MODULES=n

 - add new command line variables, GZIP, BZIP2, LZOP, LZMA, LZ4, and XZ
   to allow users to use alternatives such as pigz, pbzip2, etc.

----------------------------------------------------------------
Denis Efremov (1):
      kbuild: add variables for compression tools

Gustavo A. R. Silva (1):
      modpost,fixdep: Replace zero-length array with flexible-array

Jonas Zeiger (1):
      Makefile: install modules.builtin even if CONFIG_MODULES=n

Maninder Singh (4):
      scripts/checkstack.pl: don't display $dre as different entity
      scripts/checkstack.pl: Add argument to print stacks greather than value.
      scripts/checkstack.pl: add arm push handling for stack usage
      scripts/checkstack.pl: fix arm sp regex

Masahiro Yamada (84):
      um: do not evaluate compiler's library path when cleaning
      hexagon: suppress error message for 'make clean'
      h8300: suppress error messages for 'make clean'
      unicore32: do not evaluate compiler's library path when cleaning
      kbuild: use $(CC_VERSION_TEXT) to evaluate CC_IS_GCC and CC_IS_CLANG
      kbuild: ensure full rebuild when the compiler is updated
      kbuild: use -MMD instead of -MD to exclude system headers from dependency
      kbuild: use CONFIG_CC_VERSION_TEXT to construct LINUX_COMPILER macro
      Revert "objtool: Skip samples subdirectory"
      kbuild: remove '/' target
      kbuild: remove unused AS assignment
      kbuild: determine the output format of DTC by the target suffix
      kbuild: warn if always, hostprogs-y, or hostprogs-m is used
      bpfilter: match bit size of bpfilter_umh to that of the kernel
      bpfilter: check if $(CC) can link static libc in Kconfig
      kbuild: add infrastructure to build userspace programs
      bpfilter: use 'userprogs' syntax to build bpfilter_umh
      samples: seccomp: build sample programs for target architecture
      kbuild: doc: document the new syntax 'userprogs'
      samples: uhid: build sample program for target architecture
      samples: hidraw: build sample program for target architecture
      samples: connector: build sample program for target architecture
      samples: vfs: build sample programs for target architecture
      samples: pidfd: build sample program for target architecture
      samples: mei: build sample program for target architecture
      samples: auxdisplay: use 'userprogs' syntax
      samples: timers: use 'userprogs' syntax
      samples: watchdog: use 'userprogs' syntax
      kbuild: invoke syncconfig if autoconf.h is missing
      kbuild: remove misleading stale FIXME comment
      kbuild: remove {CLEAN,MRPROPER,DISTCLEAN}_DIRS
      gcc-plugins: remove always-false $(if ...) in Makefile
      kbuild: add this-makefile as a shorthand for $(lastword $(MAKEFILE_LIST))
      kbuild: error out if targets prefixed with '__' are directly run
      kbuild: make module name conflict fatal error
      kbuild: doc: remove documentation about copying Module.symvers around
      kbuild: remove ifdef builtin-target / lib-target
      kbuild: clear KBUILD_MODULES in top Makefile if CONFIG_MODULES=n
      kbuild: move subdir-obj-y to scripts/Makefile.build
      kbuild: rename subdir-obj-y to subdir-builtin
      kbuild: make modules.order rule consistent with built-in.a
      kbuild: disallow multi-word in M= or KBUILD_EXTMOD
      modpost: fix potential segmentation fault for addend_i386_rel()
      modpost: refactor sech_name()
      kbuild: force to build vmlinux if CONFIG_MODVERSION=y
      kbuild: merge two 'ifdef CONFIG_TRIM_UNUSED_KSYMS' blocks
      kbuild: refactor subdir-ym calculation
      kbuild: refactor tagets caluculation for KBUILD_{BUILTIN,KBUILD_MODULES}
      kbuild: merge init-y into core-y
      kbuild: merge net-y and virt-y into drivers-y
      kbuild: refactor KBUILD_VMLINUX_{OBJS,LIBS} calculation
      kbuild: update modules.order only when contained modules are updated
      modpost: fix -i (--ignore-errors) MAKEFLAGS detection
      modpost: move -T option close to the modpost command
      modpost: pass -N option only for modules modpost
      modpost: load KBUILD_EXTRA_SYMBOLS files in order
      modpost: track if the symbol origin is a dump file or ELF object
      modpost: allow to pass -i option multiple times to remove -e option
      modpost: rename ext_sym_list to dump_list
      modpost: re-add -e to set external_module flag
      modpost: print symbol dump file as the build target in short log
      modpost: refactor -i option calculation
      modpost: generate vmlinux.symvers and reuse it for the second modpost
      modpost: invoke modpost only when input files are updated
      modpost: show warning if vmlinux is not found when processing modules
      modpost: show warning if any of symbol dump files is missing
      modpost: drop RCS/CVS $Revision handling in MODULE_VERSION()
      modpost: do not call get_modinfo() for vmlinux(.o)
      modpost: add read_text_file() and get_line() helpers
      modpost: fix potential mmap'ed file overrun in get_src_version()
      modpost: avoid false-positive file open error
      modpost: use read_text_file() and get_line() for reading text files
      modpost: remove get_next_text() and make {grab,release_}file static
      modpost: remove -s option
      modpost: move -d option in scripts/Makefile.modpost
      modpost: remove mod->is_dot_o struct member
      modpost: remove is_vmlinux() call in check_for_{gpl_usage,unused}()
      modpost: add mod->is_vmlinux struct member
      modpost: remove mod->skip struct member
      modpost: set have_vmlinux in new_module()
      modpost: strip .o from modname before calling new_module()
      modpost: remove is_vmlinux() helper
      modpost: change elf_info->size to size_t
      kbuild: doc: rename LDFLAGS to KBUILD_LDFLAGS

Nick Desaulniers (1):
      Makefile: support compressed debug info

Sam Ravnborg (1):
      samples: uhid: fix warnings in uhid-example

Siddharth Gupta (1):
      scripts: headers_install: Exit with error on config leak

Valdis Kletnieks (1):
      bpfilter: document build requirements for bpfilter_umh

ashimida (1):
      mksysmap: Fix the mismatch of '.L' symbols in System.map

 .gitignore                          |   1 +
 Documentation/dontdiff              |   1 +
 Documentation/kbuild/makefiles.rst  | 187 +++++++++++----
 Documentation/kbuild/modules.rst    |  12 -
 Kconfig                             |   2 -
 Makefile                            | 217 ++++++++++-------
 arch/arm/Makefile                   |   2 -
 arch/arm/boot/deflate_xip_data.sh   |   2 +-
 arch/arm64/Makefile                 |   2 -
 arch/h8300/boot/compressed/Makefile |   2 +-
 arch/hexagon/Makefile               |   2 +-
 arch/ia64/Makefile                  |   2 +-
 arch/m68k/Makefile                  |   8 +-
 arch/parisc/Makefile                |   2 +-
 arch/um/Makefile                    |   2 +-
 arch/um/drivers/Makefile            |   4 +-
 arch/unicore32/lib/Makefile         |   4 +-
 include/linux/kconfig.h             |   2 +
 init/Kconfig                        |  30 ++-
 init/Makefile                       |   2 +-
 kernel/gen_kheaders.sh              |   2 +-
 lib/Kconfig.debug                   |  17 ++
 net/bpfilter/Kconfig                |   6 +-
 net/bpfilter/Makefile               |  11 +-
 samples/Kconfig                     |  26 +-
 samples/Makefile                    |   5 +-
 samples/auxdisplay/Makefile         |  11 +-
 samples/connector/Makefile          |  12 +-
 samples/hidraw/Makefile             |   9 +-
 samples/mei/Makefile                |   9 +-
 samples/pidfd/Makefile              |   8 +-
 samples/seccomp/Makefile            |  42 +---
 samples/timers/Makefile             |  17 +-
 samples/uhid/.gitignore             |   2 +
 samples/uhid/Makefile               |   9 +-
 samples/uhid/uhid-example.c         |   4 +-
 samples/vfs/Makefile                |  11 +-
 samples/watchdog/Makefile           |  10 +-
 scripts/Kbuild.include              |   2 +-
 scripts/Makefile.build              |  67 +++---
 scripts/Makefile.clean              |   2 +-
 scripts/Makefile.host               |   4 +-
 scripts/Makefile.lib                |  79 +++---
 scripts/Makefile.modpost            |  75 ++++--
 scripts/Makefile.package            |   8 +-
 scripts/Makefile.userprogs          |  45 ++++
 scripts/basic/fixdep.c              |   2 +-
 scripts/checkstack.pl               |  87 ++++---
 scripts/gcc-plugins/Makefile        |   2 +-
 scripts/headers_install.sh          |  11 +-
 scripts/link-vmlinux.sh             |   2 -
 scripts/mkcompile_h                 |   3 +-
 scripts/mksysmap                    |   2 +-
 scripts/mod/modpost.c               | 386 ++++++++++++++----------------
 scripts/mod/modpost.h               |  19 +-
 scripts/mod/sumversion.c            | 117 ++-------
 scripts/modules-check.sh            |  16 +-
 scripts/package/buildtar            |   6 +-
 scripts/xz_wrap.sh                  |   2 +-
 usr/include/Makefile                |   6 +-
 60 files changed, 883 insertions(+), 757 deletions(-)
 create mode 100644 samples/uhid/.gitignore
 create mode 100644 scripts/Makefile.userprogs



-- 
Best Regards
Masahiro Yamada
