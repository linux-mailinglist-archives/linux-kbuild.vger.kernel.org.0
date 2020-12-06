Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4A12D04E4
	for <lists+linux-kbuild@lfdr.de>; Sun,  6 Dec 2020 13:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgLFMs7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 6 Dec 2020 07:48:59 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28146 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbgLFMs7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 6 Dec 2020 07:48:59 -0500
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0B6ClomE010606;
        Sun, 6 Dec 2020 21:47:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0B6ClomE010606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1607258871;
        bh=YwHXyPtK+HFXMHSx6oDim2DCEMYz76YcSZXPvyNul4s=;
        h=From:Date:Subject:To:Cc:From;
        b=AfEjDZ66GQxV77yPbWsQd5vkZG8ccG/6dUaiJB3AkIm2PFXf2bkvvvJV3Z7C0gRbj
         bu5S9r/jnh3PJHXNv6lOGtfqfs043Pi1LfBRbe4aVWLKIi+Z3R9+R8YpKIi8gxo5M1
         dwXU06KlKnSC9dEVkxYMFxVmErJl1j8VcbMaMsw34wd4AHWJML4nGYaSH4hnKFqX6T
         byiOMzPRhDErqhiHiC+s851DdG0I+d3hz5eb3r6F2cjp68sfaB9BQmmAPnr6Fbv05/
         Q6q3yoq7FrZpafjmm/DWV70Umw7J/0E/8poewPGDoFPZreLac/SMk3Iuy0hHMivd5X
         xlz2d7aUciZIQ==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id w6so7161682pfu.1;
        Sun, 06 Dec 2020 04:47:50 -0800 (PST)
X-Gm-Message-State: AOAM532WOK9zXoUHRBciyY7qRKzvuse/4aTGuwoK4yHf43darp5VKTWr
        EA0uAJFXCkEyRRh5Hqd1kmqNbtfdRn1+gmk9drU=
X-Google-Smtp-Source: ABdhPJy0P34g+6OA1pp9WNupdF9zdDELDIrMTd6GRiwBF7BfCDXveAHCD1U/kj+9EI6AXbm+rrYE0RmXF6RfMN442WY=
X-Received: by 2002:aa7:9606:0:b029:198:14c4:4f44 with SMTP id
 q6-20020aa796060000b029019814c44f44mr11910291pfg.80.1607258869977; Sun, 06
 Dec 2020 04:47:49 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 6 Dec 2020 21:47:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNASVM_r0q6vQzjzTivu-bhOxgDwm4rsJzT5j7TFJmwOViA@mail.gmail.com>
Message-ID: <CAK7LNASVM_r0q6vQzjzTivu-bhOxgDwm4rsJzT5j7TFJmwOViA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.10-rc6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some more Kbuild fixes for v5.10
Thanks.



The following changes since commit 418baf2c28f3473039f2f7377760bd8f6897ae18:

  Linux 5.10-rc5 (2020-11-22 15:36:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.10-2

for you to fetch changes up to 7d32358be8acb119dcfe39b6cf67ec6d94bf1fe7:

  kbuild: avoid split lines in .mod files (2020-12-06 21:09:28 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.10 (2nd)

 - Move -Wcast-align to W=3, which tends to be false-positive and there
   is no tree-wide solution.

 - Pass -fmacro-prefix-map to KBUILD_CPPFLAGS because it is a preprocessor
   option and makes sense for .S files as well.

 - Disable -gdwarf-2 for Clang's integrated assembler to avoid warnings.

 - Disable --orphan-handling=warn for LLD 10.0.1 to avoid warnings.

 - Fix undesirable line breaks in *.mod files.

----------------------------------------------------------------
Arnd Bergmann (1):
      Makefile.extrawarn: move -Wcast-align to W=3

Denys Zagorui (1):
      kbuild: use -fmacro-prefix-map for .S sources

Masahiro Yamada (1):
      kbuild: avoid split lines in .mod files

Nathan Chancellor (2):
      kbuild: Hoist '--orphan-handling' into Kconfig
      kbuild: Disable CONFIG_LD_ORPHAN_WARN for ld.lld 10.0.1

Nick Desaulniers (1):
      Kbuild: do not emit debug info for assembly with LLVM_IAS=1

 MAINTAINERS                       |  1 +
 Makefile                          | 10 +++++++++-
 arch/Kconfig                      |  9 +++++++++
 arch/arm/Kconfig                  |  1 +
 arch/arm/Makefile                 |  4 ----
 arch/arm/boot/compressed/Makefile |  4 +++-
 arch/arm64/Kconfig                |  1 +
 arch/arm64/Makefile               |  4 ----
 arch/powerpc/Kconfig              |  1 +
 arch/powerpc/Makefile             |  1 -
 arch/x86/Kconfig                  |  1 +
 arch/x86/Makefile                 |  3 ---
 arch/x86/boot/compressed/Makefile |  4 +++-
 init/Kconfig                      | 10 ++++++++++
 scripts/Makefile.build            | 12 ++++--------
 scripts/Makefile.extrawarn        |  2 +-
 scripts/lld-version.sh            | 20 ++++++++++++++++++++
 17 files changed, 64 insertions(+), 24 deletions(-)
 create mode 100755 scripts/lld-version.sh


-- 
Best Regards
Masahiro Yamada
