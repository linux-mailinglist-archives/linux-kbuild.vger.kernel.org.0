Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D1E4296045
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Oct 2020 15:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900430AbgJVNrr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Oct 2020 09:47:47 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:38339 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2900429AbgJVNrr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Oct 2020 09:47:47 -0400
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 09MDlSdD028005;
        Thu, 22 Oct 2020 22:47:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 09MDlSdD028005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603374448;
        bh=X8WuaJKmZT0L77l4ewuKWgQIfvhlzBlVo7ZUARb1Eoo=;
        h=From:Date:Subject:To:Cc:From;
        b=ZzCIPcp5S+HuNmYH0hdI4cI693C8bUBIMuQbpS9fialpPZAh3Wjdxs0ztbPuZbvhW
         Ku6U5s8DwzpOpNAFcHmvWEnH1fygKjzn+vR+A2I5onFkjbPYQRP9IMT1HVRJ2EpTID
         lqoHwGS0d2iNIly1xNC7NofhrGw4nxvMu3O3bTrGR//e9L3KKGGSjKuPmyHikGvrE2
         sR1TYDaqra46xri+pyTZ6kWkEZzl/hKiZiOaZhbGAyxuVGB+3gwVPttaPobA8bWvPk
         CME4KdPwjzzCvypPeaaVDCpTdVTeEEU6AgwdOE+VgH8Y7kCDaJaBGWNqevaIUaqpu2
         6BjC8SAPX92Ag==
X-Nifty-SrcIP: [209.85.216.44]
Received: by mail-pj1-f44.google.com with SMTP id p21so1065659pju.0;
        Thu, 22 Oct 2020 06:47:28 -0700 (PDT)
X-Gm-Message-State: AOAM530bENYsW1EpIoHfn5RRiionHynbBpVungYWE2EUotwm/YP+J0QO
        5whW+2rkVE6B5TOSRmAt0gjGBAkNDNI/+1fEEdc=
X-Google-Smtp-Source: ABdhPJzB+oE/pPl49qtu21+dq3CLro6htEv4l7AzKaDU7anDphKBTjP8r9cojNQWdvyP98udBy6luzUdGt/RBiUDfDo=
X-Received: by 2002:a17:90a:7023:: with SMTP id f32mr2525806pjk.87.1603374447536;
 Thu, 22 Oct 2020 06:47:27 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 22 Oct 2020 22:46:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNATH0zXhw+2-XJ2DcUkmJaC6=gW-67zqAtx1dnXn+hDhEw@mail.gmail.com>
Message-ID: <CAK7LNATH0zXhw+2-XJ2DcUkmJaC6=gW-67zqAtx1dnXn+hDhEw@mail.gmail.com>
Subject: [GIT PULL 1/2] Kbuild updates for v5.10-rc1
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.10

You will see a merge conflict in arch/arm/Makefile.
The fix-up is easy, and also available in linux-next.

Thanks.


The following changes since commit d012a7190fc1fd72ed48911e77ca97ba4521bccd:

  Linux 5.9-rc2 (2020-08-23 14:08:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.10

for you to fetch changes up to 1e66d50ad3a1dbf0169b14d502be59a4b1213149:

  kbuild: Use uname for LINUX_COMPILE_HOST detection (2020-10-21 00:46:04 +0900)

----------------------------------------------------------------
Kbuild updates for v5.10

 - Support 'make compile_commands.json' to generate the compilation
   database more easily, avoiding stale entries

 - Support 'make clang-analyzer' and 'make clang-tidy' for static checks
   using clang-tidy

 - Preprocess scripts/modules.lds.S to allow CONFIG options in the module
   linker script

 - Drop cc-option tests from compiler flags supported by our minimal
   GCC/Clang versions

 - Use always 12-digits commit hash for CONFIG_LOCALVERSION_AUTO=y

 - Use sha1 build id for both BFD linker and LLD

 - Improve deb-pkg for reproducible builds and rootless builds

 - Remove stale, useless scripts/namespace.pl

 - Turn -Wreturn-type warning into error

 - Fix build error of deb-pkg when CONFIG_MODULES=n

 - Replace 'hostname' command with more portable 'uname -n'

 - Various Makefile cleanups

----------------------------------------------------------------
Bill Wendling (1):
      kbuild: explicitly specify the build id style

Chris Down (1):
      kbuild: Use uname for LINUX_COMPILE_HOST detection

Guillem Jover (3):
      builddeb: Pass -n to gzip for reproducible packages
      builddeb: Enable rootless builds
      builddeb: Add support for all required debian/rules targets

Jacob Keller (1):
      scripts: remove namespace.pl

Mark Wielaard (1):
      kbuild: Only add -fno-var-tracking-assignments for old GCC versions

Masahiro Yamada (21):
      kbuild: hide commands to run Kconfig, and show short log for syncconfig
      gen_compile_commands: parse only the first line of .*.cmd files
      gen_compile_commands: use choices for --log_levels option
      gen_compile_commands: do not support .cmd files under tools/ directory
      gen_compile_commands: reword the help message of -d option
      gen_compile_commands: make -o option independent of -d option
      gen_compile_commands: move directory walk to a generator function
      gen_compile_commands: support *.o, *.a, modules.order in
positional argument
      kbuild: wire up the build rule of compile_commands.json to Makefile
      gen_compile_commands: remove the warning about too few .cmd files
      arch: vdso: add vdso linker script to 'targets' instead of extra-y
      kbuild: preprocess module linker script
      kbuild: do not create built-in objects for external module builds
      kbuild: remove redundant CONFIG_KASAN check from scripts/Makefile.kasan
      kbuild: move CFLAGS_{KASAN,UBSAN,KCSAN} exports to relevant Makefiles
      kbuild: remove cc-option test of -fno-strict-overflow
      kbuild: remove cc-option test of -fno-stack-check
      kbuild: remove cc-option test of -Werror=date-time
      kbuild: split the build log of kallsyms
      kbuild: deb-pkg: do not build linux-headers package if CONFIG_MODULES=n
      kbuild: deb-pkg: clean up package name variables

Nathan Huckleberry (1):
      Makefile: Add clang-tidy and static analyzer support to makefile

Olaf Hering (1):
      kbuild: enforce -Werror=return-type

Rasmus Villemoes (2):
      scripts/setlocalversion: make git describe output more reliable
      kbuild: remove leftover comment for filechk utility

Sami Tolvanen (1):
      treewide: remove DISABLE_LTO

Sedat Dilek (1):
      kbuild: Simplify DEBUG_INFO Kconfig handling

 Documentation/process/submit-checklist.rst                   |   3 +-
 MAINTAINERS                                                  |   1 +
 Makefile                                                     |  94 ++++--
 arch/arm/Makefile                                            |   4 -
 arch/arm/{kernel/module.lds => include/asm/module.lds.h}     |   2 +
 arch/arm/vdso/Makefile                                       |   2 +-
 arch/arm64/Makefile                                          |   4 -
 arch/arm64/{kernel/module.lds => include/asm/module.lds.h}   |   2 +
 arch/arm64/kernel/vdso/Makefile                              |   5 +-
 arch/arm64/kernel/vdso32/Makefile                            |   8 +-
 arch/ia64/Makefile                                           |   1 -
 arch/ia64/{module.lds => include/asm/module.lds.h}           |   0
 arch/m68k/Makefile                                           |   1 -
 arch/m68k/{kernel/module.lds => include/asm/module.lds.h}    |   0
 arch/mips/vdso/Makefile                                      |   2 +-
 arch/nds32/kernel/vdso/Makefile                              |   2 +-
 arch/powerpc/Makefile                                        |   1 -
 arch/powerpc/{kernel/module.lds => include/asm/module.lds.h} |   0
 arch/powerpc/kernel/vdso32/Makefile                          |   2 +-
 arch/powerpc/kernel/vdso64/Makefile                          |   2 +-
 arch/riscv/Makefile                                          |   3 -
 arch/riscv/{kernel/module.lds => include/asm/module.lds.h}   |   3 +-
 arch/riscv/kernel/vdso/Makefile                              |   2 +-
 arch/s390/kernel/vdso64/Makefile                             |   4 +-
 arch/sparc/vdso/Makefile                                     |   4 +-
 arch/um/include/asm/Kbuild                                   |   1 +
 arch/x86/entry/vdso/Makefile                                 |   4 +-
 include/asm-generic/Kbuild                                   |   1 +
 include/asm-generic/module.lds.h                             |  10 +
 kernel/Makefile                                              |   3 -
 lib/Kconfig.debug                                            |  10 +-
 scripts/.gitignore                                           |   1 +
 scripts/Kbuild.include                                       |   2 -
 scripts/Makefile                                             |   3 +
 scripts/Makefile.build                                       |   2 +-
 scripts/Makefile.kasan                                       |   4 +-
 scripts/Makefile.kcsan                                       |   2 +-
 scripts/Makefile.modfinal                                    |   5 +-
 scripts/Makefile.ubsan                                       |   3 +
 scripts/clang-tools/gen_compile_commands.py                  | 236
+++++++++++++
 scripts/clang-tools/run-clang-tools.py                       |  74 +++++
 scripts/gen_compile_commands.py                              | 151 ---------
 scripts/kconfig/Makefile                                     |  16 +-
 scripts/link-vmlinux.sh                                      |  20 +-
 scripts/mkcompile_h                                          |   2 +-
 scripts/{module-common.lds => module.lds.S}                  |   3 +
 scripts/namespace.pl                                         | 473
---------------------------
 scripts/package/builddeb                                     |  19 +-
 scripts/package/mkdebian                                     |  44 ++-
 scripts/setlocalversion                                      |  21 +-
 tools/testing/selftests/bpf/Makefile                         |   2 +-
 51 files changed, 512 insertions(+), 752 deletions(-)
 rename arch/arm/{kernel/module.lds => include/asm/module.lds.h} (72%)
 rename arch/arm64/{kernel/module.lds => include/asm/module.lds.h} (76%)
 rename arch/ia64/{module.lds => include/asm/module.lds.h} (100%)
 rename arch/m68k/{kernel/module.lds => include/asm/module.lds.h} (100%)
 rename arch/powerpc/{kernel/module.lds => include/asm/module.lds.h} (100%)
 rename arch/riscv/{kernel/module.lds => include/asm/module.lds.h} (84%)
 create mode 100644 include/asm-generic/module.lds.h
 create mode 100755 scripts/clang-tools/gen_compile_commands.py
 create mode 100755 scripts/clang-tools/run-clang-tools.py
 delete mode 100755 scripts/gen_compile_commands.py
 rename scripts/{module-common.lds => module.lds.S} (93%)
 delete mode 100755 scripts/namespace.pl


-- 
Best Regards
Masahiro Yamada
