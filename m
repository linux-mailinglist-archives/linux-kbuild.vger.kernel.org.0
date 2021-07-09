Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 074973C2978
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 Jul 2021 21:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhGITW2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 9 Jul 2021 15:22:28 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:40933 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbhGITW2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Jul 2021 15:22:28 -0400
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 169JJREl012271;
        Sat, 10 Jul 2021 04:19:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 169JJREl012271
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1625858368;
        bh=m104GlXJVC5q1AG9XKHaYUzyUiPJ1jnGghDq6ugywoQ=;
        h=From:Date:Subject:To:Cc:From;
        b=iU71n43lLm6VhN1Oq0UtIxKSoTDf1IJ2WIgcuJR2D+M+6UoPJzHNkZjGGSRThyNAl
         uPsxSnQXyE4mOUm3jurtatqbcU88dBYBNXjZWJgV5gaE/NpgruoEggYHNW7E4lL8IF
         G4YxCg3UX0v5Zc9erYZa/I5I5Biu+dx2W/LBVTbfOTDvLMGA/ZJrqQPmVdfw+hG4M2
         gwQRHN4h6Aug8Y0iveaEYVRWWa0mAoKAmxsUPteKWAHsFABO8z31FwjGB6AAauiLpp
         gv92w1pSaD+wWZhcvbem3EhzblQP8LcTPymhyQJg253rcQCPoRXdVSCyE0hRXQFV2a
         KDWIH75/fjvkw==
X-Nifty-SrcIP: [209.85.210.181]
Received: by mail-pf1-f181.google.com with SMTP id b12so9605798pfv.6;
        Fri, 09 Jul 2021 12:19:28 -0700 (PDT)
X-Gm-Message-State: AOAM533w+7mxdiPoyxmY7Np5ss2O7mr7xypO+htcs7dTrAINhRLI5s6N
        JHr06uxlJj6Sf9/qlEJXKiVPfJMiCM65Q1EaTFg=
X-Google-Smtp-Source: ABdhPJwmalI8RBfD9OtuK9Zf2tXNd8TRC9wf2bU/Ilh27wMTt30ujq4ZFMS35rpv1HvohOj1hseUo63pCBp86vMVMC4=
X-Received: by 2002:a65:6404:: with SMTP id a4mr40211990pgv.175.1625858367437;
 Fri, 09 Jul 2021 12:19:27 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 10 Jul 2021 04:18:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-9N_o_J8+pD5H9gnxzxuN-3ZBQ1wt-VmyHE=oEC295g@mail.gmail.com>
Message-ID: <CAK7LNAT-9N_o_J8+pD5H9gnxzxuN-3ZBQ1wt-VmyHE=oEC295g@mail.gmail.com>
Subject: [GIT PULL] Kbuild updates for v5.14-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild updates for v5.14-rc1
Thanks.


The following changes since commit c4681547bcce777daf576925a966ffa824edd09d:

  Linux 5.13-rc3 (2021-05-23 11:42:48 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.14

for you to fetch changes up to 27932b6a2088eac7a5afa5471963b926cfbb4de7:

  scripts: add generic syscallnr.sh (2021-07-09 04:01:14 +0900)

----------------------------------------------------------------
Kbuild updates for v5.14

 - Increase the -falign-functions alignment for the debug option.

 - Remove ugly libelf checks from the top Makefile.

 - Make the silent build (-s) more silent.

 - Re-compile the kernel if KBUILD_BUILD_TIMESTAMP is specified.

 - Various script cleanups

----------------------------------------------------------------
Bjorn Helgaas (1):
      kconfig.h: explain IS_MODULE(), IS_ENABLED()

Feng Tang (1):
      Makefile: extend 32B aligned debug option to 64B aligned

Mark Brown (1):
      kbuild: modpost: Explicitly warn about unprototyped symbols

Masahiro Yamada (23):
      kbuild: hide tools/ build targets from external module builds
      kbuild: remove libelf checks from top Makefile
      kbuild: require all architectures to have arch/$(SRCARCH)/Kbuild
      alpha: move core-y in arch/alpha/Makefile to arch/alpha/Kbuild
      h8300: move core-y in arch/h8300/Makefile to arch/h8300/Kbuild
      hexagon: move core-y in arch/hexagon/Makefile to arch/hexagon/Kbuild
      sh: move core-y in arch/sh/Makefile to arch/sh/Kbuild
      kbuild: merge scripts/mkmakefile to top Makefile
      init: use $(call cmd,) for generating include/generated/compile.h
      kbuild: sink stdout from cmd for silent build
      kbuild: clean up ${quiet} checks in shell scripts
      scripts/setlocalversion: remove mercurial, svn and git-svn supports
      scripts/setlocalversion: remove workaround for old make-kpkg
      scripts/setlocalversion: add more comments to -dirty flag detection
      scripts/setlocalversion: factor out 12-chars hash construction
      scripts/setlocalversion: simplify the short version part
      kconfig: constify long_opts
      kbuild: remove trailing slashes from $(KBUILD_EXTMOD)
      nds32: add arch/nds32/boot/.gitignore
      parisc: syscalls: use pattern rules to generate syscall headers
      sparc: syscalls: use pattern rules to generate syscall headers
      scripts: check duplicated syscall number in syscall table
      scripts: add generic syscallnr.sh

Matthias Maennich (1):
      kbuild: mkcompile_h: consider timestamp if KBUILD_BUILD_TIMESTAMP is set

 Makefile                             | 130
++++++++++++++++++++++++--------------------------------
 arch/alpha/Kbuild                    |   3 ++
 arch/alpha/Makefile                  |   2 -
 arch/arc/Makefile                    |   3 --
 arch/arm/Makefile                    |   1 -
 arch/arm64/Makefile                  |   1 -
 arch/csky/Kbuild                     |   1 +
 arch/h8300/Kbuild                    |   2 +
 arch/h8300/Makefile                  |   3 --
 arch/hexagon/Kbuild                  |   2 +
 arch/hexagon/Makefile                |   4 --
 arch/ia64/Kbuild                     |   1 +
 arch/m68k/Makefile                   |   1 -
 arch/microblaze/Kbuild               |   1 +
 arch/mips/Makefile                   |   3 --
 arch/nds32/Kbuild                    |   1 +
 arch/nds32/boot/.gitignore           |   2 +
 arch/nios2/Kbuild                    |   1 +
 arch/openrisc/Makefile               |   1 -
 arch/parisc/Kbuild                   |   1 +
 arch/parisc/kernel/syscalls/Makefile |  18 ++------
 arch/powerpc/Makefile                |   3 --
 arch/riscv/Makefile                  |   1 -
 arch/s390/Makefile                   |   3 --
 arch/sh/Kbuild                       |   4 ++
 arch/sh/Makefile                     |   5 ---
 arch/sparc/Makefile                  |   3 --
 arch/sparc/kernel/syscalls/Makefile  |  18 ++------
 arch/um/Kbuild                       |   1 +
 arch/x86/Makefile                    |   3 --
 arch/xtensa/Kbuild                   |   1 +
 include/linux/kconfig.h              |   6 ++-
 init/Makefile                        |  12 +++---
 kernel/gen_kheaders.sh               |   4 +-
 lib/Kconfig.debug                    |   4 +-
 scripts/Kbuild.include               |   7 ++-
 scripts/Makefile.build               |   2 -
 scripts/Makefile.modfinal            |   2 -
 scripts/kconfig/conf.c               |   2 +-
 scripts/link-vmlinux.sh              |   4 +-
 scripts/mkcompile_h                  |  18 +++++---
 scripts/mkmakefile                   |  17 --------
 scripts/mod/modpost.c                |   7 ++-
 scripts/setlocalversion              |  75 ++++++--------------------------
 scripts/syscallhdr.sh                |   2 +-
 scripts/syscallnr.sh                 |  74 ++++++++++++++++++++++++++++++++
 scripts/syscalltbl.sh                |   7 ++-
 47 files changed, 215 insertions(+), 252 deletions(-)
 create mode 100644 arch/alpha/Kbuild
 create mode 100644 arch/csky/Kbuild
 create mode 100644 arch/h8300/Kbuild
 create mode 100644 arch/hexagon/Kbuild
 create mode 100644 arch/ia64/Kbuild
 create mode 100644 arch/microblaze/Kbuild
 create mode 100644 arch/nds32/Kbuild
 create mode 100644 arch/nds32/boot/.gitignore
 create mode 100644 arch/nios2/Kbuild
 create mode 100644 arch/parisc/Kbuild
 create mode 100644 arch/sh/Kbuild
 create mode 100644 arch/um/Kbuild
 create mode 100644 arch/xtensa/Kbuild
 delete mode 100755 scripts/mkmakefile
 create mode 100644 scripts/syscallnr.sh

-- 
Best Regards
Masahiro Yamada
