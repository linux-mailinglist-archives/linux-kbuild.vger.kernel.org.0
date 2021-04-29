Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4530836E506
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 08:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhD2Gqn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 02:46:43 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29659 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239032AbhD2Gqn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 02:46:43 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 13T6jKmb030584;
        Thu, 29 Apr 2021 15:45:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 13T6jKmb030584
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619678721;
        bh=8DZzijCBdpCaLEnqJa+mumAbo6/dr98GX5sWG/LH/vI=;
        h=From:Date:Subject:To:Cc:From;
        b=z1STa/QXilrgzNxFDsICG6sdi6fdygVp5wDCvDRlQRMbSrPD5aJ1sBvZbOREstdOW
         K/hVBQMxFuk4TYoilCE1xP6fEEJrEdZndenRncSGxLQbBiiHqgz5WuL5WltZnzq+Id
         cdnlSIono2bD5YaBQyD3xr0/rtSNQ5g+8TDeXrufb3wQqJZxG/kKe5V4e1+lLmKXXo
         rXwVZqXBdDYE0hH2g/3W7NPKeEftYmjo+hoZfig5MJ70YUGqW0al9iPR3xg+ShPDI3
         C2iRJmAQno6oyY0zbcCd1+nRbvQ9C2l8FQwFtXHesIMCiRs3EIGFcDNdPm7R9YAvTb
         CBKdcpU1e3maQ==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id e15so8647339pfv.10;
        Wed, 28 Apr 2021 23:45:21 -0700 (PDT)
X-Gm-Message-State: AOAM530W3GjaXx+JZ+2Xj0TwmZuaUrdLRBAifN3CFqicphTQjFiwggLa
        CXt9UmVM9DSQjCecDNv+vDLfc863J+wQyAQC9to=
X-Google-Smtp-Source: ABdhPJxG2U+2+vZkCioFmEZVnj2vvZ8ywZQtvnFTZjpfCTWWfYy9Lb05EF6uSeDrq+nSTCx8sxSnhzqhrjGSyeYtH5o=
X-Received: by 2002:a63:a547:: with SMTP id r7mr4716798pgu.7.1619678720394;
 Wed, 28 Apr 2021 23:45:20 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 29 Apr 2021 15:44:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNASN32_wwEf7xD+kVgT6SXLqZ41dJYFu8qwu-99Q_xkyhQ@mail.gmail.com>
Message-ID: <CAK7LNASN32_wwEf7xD+kVgT6SXLqZ41dJYFu8qwu-99Q_xkyhQ@mail.gmail.com>
Subject: [GIT PULL 1/2] Kbuild updates for v5.13-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.13-rc1.
Thanks.


The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:

  Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.13

for you to fetch changes up to f634ca650f724347892068489c7920631a3aac6a:

  kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test (2021-04-25
06:14:56 +0900)

----------------------------------------------------------------
Kbuild updates for v5.13

 - Evaluate $(call cc-option,...) etc. only for build targets

 - Add CONFIG_VMLINUX_MAP to generate .map file when linking vmlinux

 - Remove unnecessary --gcc-toolchains Clang flag because the --prefix
   flag finds the toolchains

 - Do not pass Clang's --prefix flag when using the integrated as

 - Check the assembler version in Kconfig time

 - Add new CONFIG options, AS_VERSION, AS_IS_GNU, AS_IS_LLVM to clean up
   some dependencies in Kconfig

 - Fix invalid Module.symvers creation when building only modules without
   vmlinux

 - Fix false-positive modpost warnings when CONFIG_TRIM_UNUSED_KSYMS is
   set, but there is no module to build

 - Refactor module installation Makefile

 - Support zstd for module compression

 - Convert alpha and ia64 to use generic shell scripts to generate the
   syscall headers

 - Add a new elfnote to indicate if the kernel was built with LTO, which
   will be used by pahole

 - Flatten the directory structure under include/config/ so CONFIG options
   and filenames match

 - Change the deb source package name from linux-$(KERNELRELEASE) to
   linux-upstream

----------------------------------------------------------------
Alexey Dobriyan (1):
      kbuild: redo fake deps at include/config/*.h

Bhaskar Chowdhury (2):
      docs: kbuild: Fix a typo in the file Kconfig.recursion-issue-02
      scripts: modpost.c: Fix a few typos

Masahiro Yamada (31):
      kbuild: prefix $(srctree)/ to some included Makefiles
      kbuild: split cc-option and friends to scripts/Makefile.compiler
      kbuild: include Makefile.compiler only when compiler is needed
      kbuild: show warning if 'make headers_check' is used
      kbuild: rename multi-used-* to multi-obj-*
      kbuild: move $(strip ) to suffix-search definition
      kbuild: replace sed with $(subst ) or $(patsubst )
      kbuild: collect minimum tool versions into scripts/min-tool-version.sh
      kbuild: check the minimum assembler version in Kconfig
      kbuild: dwarf: use AS_VERSION instead of test_dwarf5_support.sh
      arm64: move --fix-cortex-a53-843419 linker test to Kconfig
      kbuild: generate Module.symvers only when vmlinux exists
      kbuild: do not set -w for vmlinux.o modpost
      kbuild: fix false-positive modpost warning when all symbols are trimmed
      kbuild: remove unneeded mkdir for external modules_install
      kbuild: unify modules(_install) for in-tree and external modules
      kbuild: show the target directory for depmod log
      kbuild: check module name conflict for external modules as well
      kbuild: rename extmod-prefix to extmod_prefix
      kbuild: refactor scripts/Makefile.modinst
      kbuild: move module strip/compression code into scripts/Makefile.modinst
      kbuild: merge scripts/Makefile.modsign to scripts/Makefile.modinst
      kbuild: remove CONFIG_MODULE_COMPRESS
      sysctl: use min() helper for namecmp()
      alpha: syscalls: switch to generic syscalltbl.sh
      alpha: syscalls: switch to generic syscallhdr.sh
      ia64: syscalls: switch to generic syscalltbl.sh
      ia64: syscalls: switch to generic syscallhdr.sh
      kbuild: remove TMPO from try-run
      tools: do not include scripts/Kbuild.include
      kbuild: deb-pkg: change the source package name to linux-upstream

Michal Suchanek (1):
      MAINTAINERS: add pattern for dummy-tools

Nathan Chancellor (3):
      Makefile: Remove '--gcc-toolchain' flag
      Makefile: Only specify '--prefix=' when building with clang + GNU as
      kbuild: Add $(KBUILD_HOSTLDFLAGS) to 'has_libelf' test

Piotr Gorski (1):
      kbuild: add support for zstd compressed modules

Rasmus Villemoes (2):
      kbuild: add CONFIG_VMLINUX_MAP expert option
      kbuild: apply fixdep logic to link-vmlinux.sh

Yonghong Song (1):
      kbuild: add an elfnote for whether vmlinux is built with lto

 .gitignore                                       |   2 +
 Documentation/devicetree/bindings/Makefile       |   2 +-
 Documentation/dontdiff                           |   2 +
 Documentation/kbuild/Kconfig.recursion-issue-02  |   2 +-
 MAINTAINERS                                      |   1 +
 Makefile                                         | 230
+++++++++++++-----------------
 arch/Kconfig                                     |   3 +-
 arch/alpha/kernel/syscalls/Makefile              |  14 +-
 arch/alpha/kernel/syscalls/syscallhdr.sh         |  36 -----
 arch/alpha/kernel/syscalls/syscalltbl.sh         |  32 -----
 arch/alpha/kernel/systbls.S                      |   3 +-
 arch/arm64/Kconfig                               |   3 +
 arch/arm64/Makefile                              |   2 +-
 arch/ia64/kernel/entry.S                         |   3 +-
 arch/ia64/kernel/syscalls/Makefile               |  16 +--
 arch/ia64/kernel/syscalls/syscallhdr.sh          |  36 -----
 arch/ia64/kernel/syscalls/syscalltbl.sh          |  32 -----
 arch/x86/Makefile                                |   4 +-
 fs/proc/proc_sysctl.c                            |   7 +-
 include/linux/compiler-version.h                 |   2 +-
 include/linux/elfnote-lto.h                      |  14 ++
 init/Kconfig                                     |  65 ++++++---
 init/version.c                                   |   2 +
 kernel/gen_kheaders.sh                           |   2 +-
 lib/Kconfig.debug                                |  13 +-
 scripts/Kbuild.include                           |  80 -----------
 scripts/Kconfig.include                          |   6 +
 scripts/Makefile.asm-generic                     |   4 +-
 scripts/Makefile.build                           |  19 +--
 scripts/Makefile.clean                           |   2 +-
 scripts/Makefile.compiler                        |  74 ++++++++++
 scripts/Makefile.dtbinst                         |   2 +-
 scripts/Makefile.headersinst                     |   2 +-
 scripts/Makefile.lib                             |  16 +--
 scripts/Makefile.modinst                         | 113 ++++++++++++---
 scripts/Makefile.modpost                         |  32 ++++-
 scripts/Makefile.modsign                         |  29 ----
 scripts/Makefile.package                         |   2 +-
 scripts/as-version.sh                            |  82 +++++++++++
 scripts/basic/fixdep.c                           |  43 +-----
 scripts/cc-version.sh                            |  20 +--
 scripts/dummy-tools/gcc                          |   6 +
 scripts/kconfig/confdata.c                       |  15 +-
 scripts/ld-version.sh                            |  11 +-
 scripts/link-vmlinux.sh                          |  12 ++
 scripts/min-tool-version.sh                      |  39 +++++
 scripts/mod/modpost.c                            |  50 +++----
 scripts/modules-check.sh                         |   4 +-
 scripts/test_dwarf5_support.sh                   |   8 --
 tools/build/Build.include                        |  24 ++++
 tools/testing/selftests/bpf/Makefile             |   2 +-
 tools/testing/selftests/kvm/Makefile             |   2 +-
 tools/testing/selftests/powerpc/pmu/ebb/Makefile |   2 +-
 tools/thermal/tmon/Makefile                      |   2 +-
 54 files changed, 635 insertions(+), 596 deletions(-)
 delete mode 100644 arch/alpha/kernel/syscalls/syscallhdr.sh
 delete mode 100644 arch/alpha/kernel/syscalls/syscalltbl.sh
 delete mode 100644 arch/ia64/kernel/syscalls/syscallhdr.sh
 delete mode 100644 arch/ia64/kernel/syscalls/syscalltbl.sh
 create mode 100644 include/linux/elfnote-lto.h
 create mode 100644 scripts/Makefile.compiler
 delete mode 100644 scripts/Makefile.modsign
 create mode 100755 scripts/as-version.sh
 create mode 100755 scripts/min-tool-version.sh
 delete mode 100755 scripts/test_dwarf5_support.sh


--
Best Regards
Masahiro Yamada
