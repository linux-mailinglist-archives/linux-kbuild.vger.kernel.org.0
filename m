Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F9C6ED54
	for <lists+linux-kbuild@lfdr.de>; Sat, 20 Jul 2019 04:32:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbfGTCbs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 19 Jul 2019 22:31:48 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36103 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728058AbfGTCbr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 19 Jul 2019 22:31:47 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x6K2VbDr004680;
        Sat, 20 Jul 2019 11:31:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6K2VbDr004680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1563589899;
        bh=8A38yUD+RN5H5a28RlqUjb+kTd+xkmGUmTALpNhFXHg=;
        h=From:Date:Subject:To:Cc:From;
        b=TdfjmxJOmPdLlk1GskO8i45+zDR5za9UgvVTec7JTr6eivcvg/qEl2JnhAsEhM8CE
         zTr9E3R6W0ihbr/exdtfxPDBY2vB6diW+LVHFdIi+3BIbCc3z5ykYELLe/RA68Du2x
         kMbBW2vE2BTanaIiC2mWzer96CyypOIMOFa5zfht3UCbq2fjuqjHYcxedDOb6Q4rvu
         5hECFttaBR1M3OIVH+benMUS5AMWhYRaDNewc/Sh2a+4EVBxpolOqvAGvfOfHSzcc1
         RGha6cwCSBVlLeVyGRQzg8fdkq7Ewiu3jhxiToj4kKO6ZwuLYBJVfs6e1t7g2cHhwg
         Fs3QD9su03wcQ==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id k9so22737005vso.5;
        Fri, 19 Jul 2019 19:31:38 -0700 (PDT)
X-Gm-Message-State: APjAAAVe4mQp0gXY+xQvKmnXPwwuo3h9HBrhP2VcAowgUYkcK0DlATD7
        HqyG1S0LkuBpD1uBYM2G2JZekDYFFcDxvdkvwDs=
X-Google-Smtp-Source: APXvYqy1FPrgczXlm+uOM6C4KBtD2dtEsQs0A2sfOFA+hSAr+WijLwbgRDhDO/zCfxNJCfjnjb9QGXlpMGN3pSUQgA8=
X-Received: by 2002:a67:d46:: with SMTP id 67mr35530737vsn.181.1563589897214;
 Fri, 19 Jul 2019 19:31:37 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 20 Jul 2019 11:31:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQD7m+PCS6KtoVmZ_7kggLeWD6LE6NkfZ7TeaSO26sQGA@mail.gmail.com>
Message-ID: <CAK7LNAQD7m+PCS6KtoVmZ_7kggLeWD6LE6NkfZ7TeaSO26sQGA@mail.gmail.com>
Subject: [GIT PULL] More Kbuild updates for v5.3-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     masahiroy@kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some more Kbuild updates.
Thanks!


The following changes since commit 9637d517347e80ee2fe1c5d8ce45ba1b88d8b5cd:

  Merge tag 'for-linus-20190715' of git://git.kernel.dk/linux-block
(2019-07-15 21:20:52 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-v5.3-2

for you to fetch changes up to 29be86d7f9cb18df4123f309ac7857570513e8bc:

  kbuild: add -fcf-protection=none when using retpoline flags
(2019-07-20 11:20:24 +0900)

----------------------------------------------------------------
Kbuild updates for v5.3 (2nd)

- match the directory structure of the linux-libc-dev package to that of
  Debian-based distributions

- fix incorrect include/config/auto.conf generation when Kconfig creates
  it along with the .config file

- remove misleading $(AS) from documents

- clean up precious tag files by distclean instead of mrproper

- add a new coccinelle patch for devm_platform_ioremap_resource migration

- refactor module-related scripts to read modules.order instead of
  $(MODVERDIR)/*.mod files to get the list of created modules

- remove MODVERDIR

- update list of header compile-test

- add -fcf-protection=none flag to avoid conflict with the retpoline
  flags when CONFIG_RETPOLINE=y

- misc cleanups

----------------------------------------------------------------
Cedric Hombourger (1):
      builddeb: generate multi-arch friendly linux-libc-dev package

Himanshu Jha (1):
      coccinelle: api: add devm_platform_ioremap_resource script

Masahiro Yamada (22):
      memory: ti-emif-sram: move driver-specific asm-offset.h to drivers/memory/
      riscv: drop unneeded -Wall addition
      kconfig: run olddefconfig instead of oldconfig after merging fragments
      kconfig: fix missing choice values in auto.conf
      kbuild: get rid of misleading $(AS) from documents
      kbuild: add --hash-style= and --build-id unconditionally
      kbuild: remove tag files by distclean instead of mrproper
      kbuild: remove unused hostcc-option
      kbuild: compile-test headers listed in header-test-m as well
      kbuild: do not create empty modules.order in the prepare stage
      kbuild: get rid of kernel/ prefix from in-tree modules.{order,builtin}
      kbuild: remove duplication from modules.order in sub-directories
      scsi: remove pointless $(MODVERDIR)/$(obj)/53c700.ver
      kbuild: modinst: read modules.order instead of $(MODVERDIR)/*.mod
      kbuild: modsign: read modules.order instead of $(MODVERDIR)/*.mod
      kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
      kbuild: export_report: read modules.order instead of .tmp_versions/*.mod
      kbuild: create *.mod with full directory path and remove MODVERDIR
      kbuild: remove the first line of *.mod files
      kbuild: remove 'prepare1' target
      kbuild: split out *.mod out of {single,multi}-used-m rules
      kbuild: update compile-test header list for v5.3-rc1

Seth Forshee (1):
      kbuild: add -fcf-protection=none when using retpoline flags

 .gitignore                                                  |  1 +
 Documentation/dontdiff                                      |  1 +
 Documentation/kbuild/kbuild.rst                             |  5 +--
 Documentation/kbuild/makefiles.rst                          | 12 +++---
 Makefile                                                    | 61
++++++++++++---------------
 arch/arm/vdso/Makefile                                      |  3 +-
 arch/arm64/kernel/vdso32/Makefile                           |  4 +-
 arch/riscv/Makefile                                         |  2 -
 arch/sparc/vdso/Makefile                                    |  3 +-
 arch/x86/entry/vdso/Makefile                                |  5 +--
 drivers/memory/.gitignore                                   |  1 +
 drivers/memory/Makefile                                     |  5 ++-
 drivers/memory/ti-emif-sram-pm.S                            |  2 +-
 drivers/scsi/Makefile                                       |  2 +-
 include/Kbuild                                              | 14 +++---
 lib/Kconfig.debug                                           | 12 +-----
 scripts/Kbuild.include                                      |  5 ---
 scripts/Makefile.build                                      | 42
++++++++----------
 scripts/Makefile.lib                                        |  2 +-
 scripts/Makefile.modbuiltin                                 |  2 +-
 scripts/Makefile.modinst                                    |  5 +--
 scripts/Makefile.modpost                                    | 19 +++++----
 scripts/Makefile.modsign                                    |  3 +-
 scripts/adjust_autoksyms.sh                                 | 14 +++---
 scripts/coccinelle/api/devm_platform_ioremap_resource.cocci | 60
++++++++++++++++++++++++++
 scripts/export_report.pl                                    | 11 +++--
 scripts/kconfig/Makefile                                    |  2 +-
 scripts/kconfig/confdata.c                                  |  7 ++-
 scripts/kconfig/expr.h                                      |  1 +
 scripts/mod/sumversion.c                                    | 23 ++--------
 scripts/modules-check.sh                                    |  2 +-
 scripts/package/builddeb                                    |  5 +++
 scripts/package/mkdebian                                    |  1 +
 scripts/package/mkspec                                      |  2 +-
 tools/power/cpupower/debug/kernel/Makefile                  |  4 +-
 usr/include/Makefile                                        |  8 ----
 36 files changed, 178 insertions(+), 173 deletions(-)
 create mode 100644 drivers/memory/.gitignore
 create mode 100644 scripts/coccinelle/api/devm_platform_ioremap_resource.cocci


--
Best Regards
Masahiro Yamada
