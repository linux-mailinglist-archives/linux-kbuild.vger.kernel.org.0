Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 196B3B510E
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2019 17:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729086AbfIQPJK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Sep 2019 11:09:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:45664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728802AbfIQPJK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Sep 2019 11:09:10 -0400
Received: from linux-8ccs (unknown [193.86.95.52])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 043392171F;
        Tue, 17 Sep 2019 15:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568732948;
        bh=+ZhMOxmLVDi/08wYBPu3baEUXepkzm7b1+eUGjg6J7Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fEEzJ0181fEeaqfzbp3olecy9F3O5Bi68CcyXW90m6znUHOqXlKK5pfRBPWABVitW
         KvZPvGSnVQENue/y4+9jVPocFiwFOnDi6Kvf0KC2dMvv0UZTHudO3IhiE00MSFMVNZ
         BkwXL61ca+/IV2vQcQyw/W1C9IaExYgVNSC/VdSo=
Date:   Tue, 17 Sep 2019 17:09:03 +0200
From:   Jessica Yu <jeyu@kernel.org>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Matthias Maennich <maennich@google.com>,
        Will Deacon <will@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org
Subject: Re: [GIT PULL] Kbuild updates for v5.4-rc1
Message-ID: <20190917150902.GA4116@linux-8ccs>
References: <CAK7LNARsoed86dY75b_HNXXkCXRAKdMUGaEWUUca4BuGaZCwcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAK7LNARsoed86dY75b_HNXXkCXRAKdMUGaEWUUca4BuGaZCwcg@mail.gmail.com>
X-OS:   Linux linux-8ccs 4.12.14-lp150.12.28-default x86_64
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

+++ Masahiro Yamada [15/09/19 22:27 +0900]:
>Hi Linus,
>
>This is a Kbuild pull request for v5.4-rc1.
>I am sending this a bit earlier.
>Please pull it in when you open the merge window.
>
>Thanks.

Hi Masahiro, Linus,

There is a merge conflict between the kbuild and modules-next tree.

Specifically, commits

    69a94abb82e ("export.h, genksyms: do not make genksyms calculate CRC of trimmed symbols")

and

    9b9a3f20cbe ("kbuild: split final module linking out into Makefile.modfinal")

from the kbuild tree caused some conflicts in modules-next in
include/linux/export.h and scripts/Makefile.modpost. The conflict
caused by 69a94abb82e in export.h is *non* trivial whereas the latter
commit involving Makefile.modpost is trivial.

So there are a few options here..

Solution #1: Masahiro pops the topmost 4 commits (down to 69a94abb82e)
from kbuild/for-next and I take them resolved through modules-next.
This would only leave the trivial conflict in Makefile.modpost left.
Send Linus the modules-next tree with a trivial resolution for
Makefile.modpost.

Solution #2: 
Matthias Maennich staged a merge resolution from his tree
(https://github.com/metti/linux/tree/modules-next_linux-kbuild) so
another solution might be that I merge kbuild/for-next into
modules-next, take Matthias' (CC'd) conflict resolution including his
Signed-off-by, and then take that to Linus.

What would be most preferrable for you guys?

Thanks,

Jessica

>The following changes since commit d45331b00ddb179e291766617259261c112db872:
>
>  Linux 5.3-rc4 (2019-08-11 13:26:41 -0700)
>
>are available in the Git repository at:
>
>  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>tags/kbuild-v5.4
>
>for you to fetch changes up to 77564a4829ef6d309331d443ea6ceb065f3dc371:
>
>  genksyms: convert to SPDX License Identifier for lex.l and parse.y
>(2019-09-14 11:40:13 +0900)
>
>----------------------------------------------------------------
>Kbuild updates for v5.4
>
> - add modpost warn exported symbols marked as 'static' because 'static'
>   and EXPORT_SYMBOL is an odd combination
>
> - break the build early if gold linker is used
>
> - optimize the Bison rule to produce .c and .h files by a single
>   pattern rule
>
> - handle PREEMPT_RT in the module vermagic and UTS_VERSION
>
> - warn CONFIG options leaked to the user-space except existing ones
>
> - make single targets work properly
>
> - rebuild modules when module linker scripts are updated
>
> - split the module final link stage into scripts/Makefile.modfinal
>
> - fix the missed error code in merge_config.sh
>
> - improve the error message displayed on the attempt of the O= build
>   in unclean source tree
>
> - remove 'clean-dirs' syntax
>
> - disable -Wimplicit-fallthrough warning for Clang
>
> - add CONFIG_CC_OPTIMIZE_FOR_SIZE_O3 for ARC
>
> - remove ARCH_{CPP,A,C}FLAGS variables
>
> - add $(BASH) to run bash scripts
>
> - change *CFLAGS_<basetarget>.o to take the relative path to $(obj)
>   instead of the basename
>
> - stop suppressing Clang's -Wunused-function warnings when W=1
>
> - fix linux/export.h to avoid genksyms calculating CRC of trimmed
>   exported symbols
>
> - misc cleanups
>
>----------------------------------------------------------------
>Denis Efremov (2):
>      modpost: check for static EXPORT_SYMBOL* functions
>      modpost: add NOFAIL to strndup
>
>Guillaume Tucker (1):
>      merge_config.sh: ignore unwanted grep errors
>
>Heikki Krogerus (1):
>      modpost: add guid_t type definition
>
>Kees Cook (1):
>      kbuild: Parameterize kallsyms generation and correct reporting
>
>Mark Brown (1):
>      merge_config.sh: Check error codes from make
>
>Masahiro Yamada (54):
>      kbuild: use $(basename ...) for cmd_asn1_compiler
>      kbuild: make bison create C file and header in a single pattern rule
>      kbuild: move flex and bison rules to Makefile.host
>      kbuild: add [M] marker for build log of *.mod.o
>      kbuild: treat an object as multi-used when $(foo-) is set
>      kbuild: move the Module.symvers check for external module build
>      kbuild: refactor part-of-module more
>      kbuild: fix modkern_aflags implementation
>      kbuild: remove 'make /' support
>      kbuild: remove meaningless 'targets' in ./Kbuild
>      kbuild: do not descend to ./Kbuild when cleaning
>      kbuild: unset variables in top Makefile instead of setting 0
>      kbuild: unify vmlinux-dirs and module-dirs rules
>      kbuild: unify clean-dirs rule for in-kernel and external module
>      kbuild: re-implement detection of CONFIG options leaked to user-space
>      kbuild: make single targets work more correctly
>      treewide: remove dummy Makefiles for single targets
>      kbuild: move KBUILD_LDS, KBUILD_VMLINUX_{OBJS,LIBS} to makefiles.rst
>      kbuild: rebuild modules when module linker scripts are updated
>      kbuild: split final module linking out into Makefile.modfinal
>      .gitignore: ignore modules.order explicitly
>      kbuild: add CONFIG_ASM_MODVERSIONS
>      kbuild: move modkern_{c,a}flags to Makefile.lib from Makefile.build
>      kbuild: pkg: clean up package files/dirs from the top Makefile
>      kbuild: pkg: add package targets to PHONY instead of FORCE
>      kbuild: pkg: rename scripts/package/Makefile to scripts/Makefile.package
>      kbuild: remove unneeded '+' marker from kselftest-merge
>      docs: kbuild: fix invalid ReST syntax
>      docs: kbuild: remove cc-ldoption from document again
>      init/Kconfig: rework help of CONFIG_CC_OPTIMIZE_FOR_SIZE
>      kbuild: remove unneeded comments and code from scripts/basic/Makefile
>      kbuild: remove unneeded dependency for $(DOC_TARGETS)
>      kbuild: get rid of $(realpath ...) from scripts/mkmakefile
>      kbuild: remove 'Using ... as source for kernel' message
>      kbuild: Inform user to pass ARCH= for make mrproper only when necessary
>      kbuild: clarify where to run make mrproper when out-of-tree fails
>      kbuild: move the clean srctree check to the outputmakefile target
>      kbuild: remove prepare3 target
>      kbuild: check clean srctree even earlier
>      kbuild: remove clean-dirs syntax
>      kbuild: remove unneeded '+' marker from cmd_clean
>      kbuild: clean up subdir-ymn calculation in Makefile.clean
>      kbuild,arc: add CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 for ARC
>      kbuild: remove ARCH_{CPP,A,C}FLAGS
>      kbuild: add $(BASH) to run scripts with bash-extension
>      kbuild: change *FLAGS_<basetarget>.o to take the path relative to $(obj)
>      kbuild: refactor scripts/Makefile.extrawarn
>      kbuild: rename KBUILD_ENABLE_EXTRA_GCC_CHECKS to KBUILD_EXTRA_WARN
>      kbuild: allow Clang to find unused static inline functions for W=1 build
>      export.h: remove defined(__KERNEL__), which is no longer needed
>      export.h, genksyms: do not make genksyms calculate CRC of trimmed symbols
>      modpost: use MODULE_INFO() for __module_depends
>      modpost: use __section in the output to *.mod.c
>      genksyms: convert to SPDX License Identifier for lex.l and parse.y
>
>Nathan Chancellor (1):
>      kbuild: Do not enable -Wimplicit-fallthrough for clang for now
>
>Thomas Gleixner (2):
>      kbuild: Fail if gold linker is detected
>      Kbuild: Handle PREEMPT_RT for version string and magic
>
> .gitignore                                                  |   2 +-
> Documentation/kbuild/kbuild.rst                             |  28 +--
> Documentation/kbuild/makefiles.rst                          |  67 +++---
> Kbuild                                                      |   7 -
> Makefile                                                    | 296
>+++++++++++++-------------
> arch/Kconfig                                                |   7 +
> arch/alpha/Kconfig                                          |   1 +
> arch/arc/Makefile                                           |   8 -
> arch/arc/configs/axs101_defconfig                           |   1 +
> arch/arc/configs/axs103_defconfig                           |   1 +
> arch/arc/configs/axs103_smp_defconfig                       |   1 +
> arch/arc/configs/haps_hs_defconfig                          |   1 +
> arch/arc/configs/haps_hs_smp_defconfig                      |   1 +
> arch/arc/configs/hsdk_defconfig                             |   1 +
> arch/arc/configs/nps_defconfig                              |   1 +
> arch/arc/configs/nsim_700_defconfig                         |   1 +
> arch/arc/configs/nsim_hs_defconfig                          |   1 +
> arch/arc/configs/nsim_hs_smp_defconfig                      |   1 +
> arch/arc/configs/nsimosci_defconfig                         |   1 +
> arch/arc/configs/nsimosci_hs_defconfig                      |   1 +
> arch/arc/configs/nsimosci_hs_smp_defconfig                  |   1 +
> arch/arc/configs/tb10x_defconfig                            |   1 +
> arch/arc/configs/vdk_hs38_defconfig                         |   1 +
> arch/arc/configs/vdk_hs38_smp_defconfig                     |   1 +
> arch/arm/Makefile                                           |   2 +-
> arch/arm/kvm/Makefile                                       |   5 +-
> arch/arm64/Kconfig                                          |   1 +
> arch/arm64/Makefile                                         |   2 +-
> arch/ia64/Kconfig                                           |   1 +
> arch/ia64/Makefile                                          |   2 +-
> arch/m68k/Kconfig                                           |   1 +
> arch/m68k/Makefile                                          |   2 +-
> arch/mips/Kconfig                                           |   1 +
> arch/mips/boot/Makefile                                     |   2 +-
> arch/parisc/Makefile                                        |   2 +-
> arch/powerpc/Kconfig                                        |   1 +
> arch/powerpc/Makefile                                       |   2 +-
> arch/powerpc/Makefile.postlink                              |   2 +-
> arch/powerpc/kernel/prom_init_check.sh                      |   2 +-
> arch/riscv/Kconfig                                          |   1 +
> arch/riscv/Makefile                                         |   2 +-
> arch/s390/Kconfig                                           |   1 +
> arch/sparc/Kconfig                                          |   1 +
> arch/um/Kconfig                                             |   1 +
> arch/x86/Kconfig                                            |   1 +
> arch/x86/entry/vdso/Makefile                                |   3 +-
> drivers/gpu/drm/amd/display/dc/calcs/Makefile               |   6 +-
> drivers/gpu/drm/amd/display/dc/dcn20/Makefile               |   2 +-
> drivers/gpu/drm/amd/display/dc/dml/Makefile                 |  17 +-
> drivers/gpu/drm/amd/display/dc/dsc/Makefile                 |   7 +-
> drivers/gpu/drm/i915/Makefile                               |   2 +-
> drivers/net/ethernet/aquantia/atlantic/hw_atl/Makefile      |   2 -
> drivers/net/ethernet/mellanox/mlx5/core/accel/Makefile      |   2 -
> drivers/net/ethernet/mellanox/mlx5/core/diag/Makefile       |   2 -
> drivers/net/ethernet/mellanox/mlx5/core/en/Makefile         |   2 -
> drivers/net/ethernet/mellanox/mlx5/core/en/xsk/Makefile     |   1 -
> drivers/net/ethernet/mellanox/mlx5/core/en_accel/Makefile   |   2 -
> drivers/net/ethernet/mellanox/mlx5/core/fpga/Makefile       |   2 -
> drivers/net/ethernet/mellanox/mlx5/core/ipoib/Makefile      |   2 -
> drivers/net/ethernet/mellanox/mlx5/core/lib/Makefile        |   2 -
> drivers/net/ethernet/netronome/nfp/bpf/Makefile             |   2 -
> drivers/net/ethernet/netronome/nfp/flower/Makefile          |   2 -
> drivers/net/ethernet/netronome/nfp/nfpcore/Makefile         |   2 -
> drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000/Makefile |   2 -
> drivers/net/ethernet/netronome/nfp/nic/Makefile             |   2 -
> include/linux/compiler_types.h                              |  20 +-
> include/linux/export.h                                      |  42 ++--
> include/linux/vermagic.h                                    |   2 +
> init/Kconfig                                                |  26 ++-
> init/Makefile                                               |   5 +-
> kernel/Makefile                                             |   2 +-
> scripts/Kconfig.include                                     |   3 +
> scripts/Makefile                                            |   2 +-
> scripts/Makefile.build                                      |  73 ++++---
> scripts/Makefile.clean                                      |  31 +--
> scripts/Makefile.extrawarn                                  | 121 ++++++-----
> scripts/Makefile.host                                       |  39 +++-
> scripts/Makefile.lib                                        |  63 +++---
> scripts/Makefile.modfinal                                   |  60 ++++++
> scripts/Makefile.modpost                                    |  80 ++-----
> scripts/{package/Makefile => Makefile.package}              |  43 ++--
> scripts/basic/Makefile                                      |  14 +-
> scripts/genksyms/Makefile                                   |  11 +-
> scripts/genksyms/keywords.c                                 |   6 +-
> scripts/genksyms/lex.l                                      |  32 +--
> scripts/genksyms/parse.y                                    |  32 +--
> scripts/headers_install.sh                                  |  72 +++++++
> scripts/kconfig/Makefile                                    |  10 +-
> scripts/kconfig/merge_config.sh                             |  12 +-
> scripts/link-vmlinux.sh                                     |  38 ++--
> scripts/mkcompile_h                                         |   4 +-
> scripts/mkmakefile                                          |   4 +-
> scripts/mod/file2alias.c                                    |   5 +
> scripts/mod/modpost.c                                       |  48 ++++-
> usr/include/Makefile                                        |   4 +-
> 95 files changed, 755 insertions(+), 680 deletions(-)
> delete mode 100644 drivers/net/ethernet/aquantia/atlantic/hw_atl/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/accel/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/diag/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/xsk/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en_accel/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/fpga/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/ipoib/Makefile
> delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/lib/Makefile
> delete mode 100644 drivers/net/ethernet/netronome/nfp/bpf/Makefile
> delete mode 100644 drivers/net/ethernet/netronome/nfp/flower/Makefile
> delete mode 100644 drivers/net/ethernet/netronome/nfp/nfpcore/Makefile
> delete mode 100644 drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000/Makefile
> delete mode 100644 drivers/net/ethernet/netronome/nfp/nic/Makefile
> create mode 100644 scripts/Makefile.modfinal
> rename scripts/{package/Makefile => Makefile.package} (92%)
>
>
>-- 
>Best Regards
>Masahiro Yamada
