Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFE921B7B25
	for <lists+linux-kbuild@lfdr.de>; Fri, 24 Apr 2020 18:10:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727049AbgDXQKZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Apr 2020 12:10:25 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:33109 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726920AbgDXQKZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Apr 2020 12:10:25 -0400
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 03OGA4Xb007030;
        Sat, 25 Apr 2020 01:10:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 03OGA4Xb007030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1587744607;
        bh=xceHdPymZ0jYeqlYbS+1ffX8Lsmm0Px07TLnEqY9gaE=;
        h=From:Date:Subject:To:Cc:From;
        b=VptGmdjz8KWGP7WfjlKeHhzFpCyWS70xVdlvOaVfcH0Ra7+QmhGIMROe6Kh6HpmMa
         wq8Ygxltb9vxI813dM8qJg0WTLSaJHJCWkcHPu5tAIkwBz3/Vrj+9iEnuu9UKp7TZo
         heLNgAFka4IssY2GQbux1SW8y/RCeYGkmFXfXGfKposTsCsgjVP0bgen5yiwGwQNxa
         JBn07Oq6G4Yyo1TiwiWziHdHV76Bk3aZ/QSiok+0EVzMvcXWqYOc6PPf9tZX+2WUuT
         mFau2Rwf529ghOt1LSzJKvMN2kvL6udOf/W6oS7GtCmZJsM2OjVRrchs2edAVkhxOm
         7o1PDqhMzumUA==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id z16so9974086uae.11;
        Fri, 24 Apr 2020 09:10:04 -0700 (PDT)
X-Gm-Message-State: AGi0PuZMKzDcU+k7DoGvL9bCN0sHg+u0/krBNIHjL2dTeU0U0v9B0YUB
        wBbPeX5CbVZ5IrMjYKbTdAkOw/njICsrwbQwL5I=
X-Google-Smtp-Source: APiQypJgw4L1bt6MdT4aesOm05pMR6gubOC6tW1R2n+87+6V0/QRV0SMQyP0b4MPfuI04HcF+NNPRc6j0OzHtDrohSE=
X-Received: by 2002:a67:3293:: with SMTP id y141mr8428387vsy.54.1587744603426;
 Fri, 24 Apr 2020 09:10:03 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 25 Apr 2020 01:09:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQRXn_n60K9LF=pBz0HHg55Lj-1p5gwwmT=YSOdMBXKCA@mail.gmail.com>
Message-ID: <CAK7LNAQRXn_n60K9LF=pBz0HHg55Lj-1p5gwwmT=YSOdMBXKCA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.7-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes.
Thanks.


The following changes since commit ae83d0b416db002fe95601e7f97f64b59514d936:

  Linux 5.7-rc2 (2020-04-19 14:35:30 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.7

for you to fetch changes up to d9451798998df3a72dce1bc365bc9e76401b0d3a:

  h8300: ignore vmlinux.lds (2020-04-23 16:41:26 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.7

 - fix scripts/config to properly handle ':' in string type CONFIG options

 - fix unneeded rebuilds of DT schema check rule

 - git rid of ordering dependency between <linux/vermagic.h> and
   <linux/module.h> to fix build errors in some network drivers

 - clean up generated headers of host arch with 'make ARCH=um mrproper'

----------------------------------------------------------------
Jeremie Francois (on alpha) (1):
      scripts/config: allow colons in option strings for sed

Masahiro Yamada (4):
      kbuild: fix DT binding schema rule again to avoid needless rebuilds
      arch: split MODULE_ARCH_VERMAGIC definitions out to <asm/vermagic.h>
      Documentation: kbuild: fix the section title format
      h8300: ignore vmlinux.lds

Vitor Massaru Iha (1):
      um: ensure `make ARCH=um mrproper` removes
arch/$(SUBARCH)/include/generated/

 Documentation/kbuild/makefiles.rst                |  3 +-
 arch/arc/include/asm/module.h                     |  5 --
 arch/arc/include/asm/vermagic.h                   |  8 +++
 arch/arm/include/asm/module.h                     | 24 ---------
 arch/arm/include/asm/vermagic.h                   | 31 ++++++++++++
 arch/arm64/include/asm/module.h                   |  2 -
 arch/arm64/include/asm/vermagic.h                 | 10 ++++
 arch/h8300/kernel/.gitignore                      |  2 +
 arch/hexagon/include/asm/{module.h => vermagic.h} |  8 +--
 arch/ia64/include/asm/module.h                    |  4 --
 arch/ia64/include/asm/vermagic.h                  | 15 ++++++
 arch/mips/include/asm/module.h                    | 61 -----------------------
 arch/mips/include/asm/vermagic.h                  | 66
+++++++++++++++++++++++++
 arch/nds32/include/asm/{module.h => vermagic.h}   |  8 ++-
 arch/powerpc/include/asm/module.h                 | 18 -------
 arch/powerpc/include/asm/vermagic.h               | 20 ++++++++
 arch/riscv/include/asm/module.h                   |  2 -
 arch/riscv/include/asm/vermagic.h                 |  9 ++++
 arch/sh/include/asm/module.h                      | 28 -----------
 arch/sh/include/asm/vermagic.h                    | 34 +++++++++++++
 arch/um/Makefile                                  |  1 +
 arch/x86/include/asm/module.h                     | 60 -----------------------
 arch/x86/include/asm/vermagic.h                   | 68
++++++++++++++++++++++++++
 arch/xtensa/include/asm/{module.h => vermagic.h}  | 15 +++---
 include/asm-generic/Kbuild                        |  1 +
 include/asm-generic/vermagic.h                    |  7 +++
 include/linux/vermagic.h                          |  8 +--
 scripts/Makefile.lib                              |  2 +-
 scripts/config                                    |  5 +-
 29 files changed, 297 insertions(+), 228 deletions(-)
 create mode 100644 arch/arc/include/asm/vermagic.h
 create mode 100644 arch/arm/include/asm/vermagic.h
 create mode 100644 arch/arm64/include/asm/vermagic.h
 create mode 100644 arch/h8300/kernel/.gitignore
 rename arch/hexagon/include/asm/{module.h => vermagic.h} (64%)
 create mode 100644 arch/ia64/include/asm/vermagic.h
 create mode 100644 arch/mips/include/asm/vermagic.h
 rename arch/nds32/include/asm/{module.h => vermagic.h} (52%)
 create mode 100644 arch/powerpc/include/asm/vermagic.h
 create mode 100644 arch/riscv/include/asm/vermagic.h
 create mode 100644 arch/sh/include/asm/vermagic.h
 create mode 100644 arch/x86/include/asm/vermagic.h
 rename arch/xtensa/include/asm/{module.h => vermagic.h} (57%)
 create mode 100644 include/asm-generic/vermagic.h


-- 
Best Regards
Masahiro Yamada
