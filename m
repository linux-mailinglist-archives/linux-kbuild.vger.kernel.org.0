Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09FC9214D93
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Jul 2020 17:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgGEPOO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Jul 2020 11:14:14 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:36677 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgGEPOO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Jul 2020 11:14:14 -0400
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 065FDkTX024909;
        Mon, 6 Jul 2020 00:13:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 065FDkTX024909
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1593962027;
        bh=fQuQFv/SLNfuMXM4t3LK7AbKKjdn4MSwV7JTU0JwejQ=;
        h=From:Date:Subject:To:Cc:From;
        b=DhzU25nptdakYBf8ByeZ7suYEVZ/ElBsYlGkgGAVzK8XaFomlKwQioGa2DQiQFQkO
         ghyuXf/W2iPlDwtpj2CtD0g1NlGeYcumLB61oH0iGD8PB58Pujw1zhZ6yUrjUHQmRE
         EDajLE0D94tF/qjvh7Jg5X7cQir5y1Fn9+ntnBp9OuX4nESvIb2May0yiqC7OoRJvx
         IenfPY4gmPBbMouR4ovr5PIvtM7kDJwOukdKvUHm3tIbH4EyfC2X7Is4raMIb04cl2
         7pKPitdNcndERz5wvTMxGSHaDIlCRmWPBkk/7JaKSTG4u3zNEn2eBQ+Qtux2Ih3VBZ
         K+5dIQInQaZBA==
X-Nifty-SrcIP: [209.85.217.42]
Received: by mail-vs1-f42.google.com with SMTP id 64so13095962vsl.3;
        Sun, 05 Jul 2020 08:13:46 -0700 (PDT)
X-Gm-Message-State: AOAM533CcXWymqm5jJDlbPMOpvw8R+uRTDkgzR/m4F8RkdPRrZbqC3Lt
        7HJop4uS/YG2ndyUcR5p8ITTU+NS1tlybRYSqb8=
X-Google-Smtp-Source: ABdhPJyn6UHdLo8/SXtPLDScAGDcUJn5XiDdR0H5IC/iw0NIPtCmHZpJQAvGwOup566GhpVLBOxaFs+gBBjsuKjjB3M=
X-Received: by 2002:a67:694d:: with SMTP id e74mr34092030vsc.155.1593962025474;
 Sun, 05 Jul 2020 08:13:45 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 6 Jul 2020 00:13:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQEMNSM2PRaTwPoX+2hn3FpU2=kQEyJdFjH2xkz+eq5gg@mail.gmail.com>
Message-ID: <CAK7LNAQEMNSM2PRaTwPoX+2hn3FpU2=kQEyJdFjH2xkz+eq5gg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.8-rc4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some more Kbuild fixes.
Thanks.



The following changes since commit 48778464bb7d346b47157d21ffde2af6b2d39110:

  Linux 5.8-rc2 (2020-06-21 15:45:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.8-2

for you to fetch changes up to ba77dca584f5abf30340672bc752fe7912731af5:

  .gitignore: Do not track `defconfig` from `make savedefconfig`
(2020-07-05 16:15:46 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.8 (2nd)

 - fix various bugs in xconfig

 - fix some issues in cross-compilation using Clang

 - fix documentation

----------------------------------------------------------------
Dov Murik (1):
      docs: kbuild: fix ReST formatting

Masahiro Yamada (3):
      gcc-plugins: fix gcc-plugins directory path in documentation
      kbuild: fix CONFIG_CC_CAN_LINK(_STATIC) for cross-compilation with Clang
      kbuild: make Clang build userprogs for target architecture

Mauro Carvalho Chehab (8):
      kconfig: qconf: cleanup includes
      kconfig: qconf: make search fully work again on split mode
      kconfig: qconf: make debug links work again
      kconfig: qconf: re-implement setSelected()
      kconfig: qconf: simplify the goBack() logic
      kconfig: qconf: don't show goback button on splitMode
      kconfig: qconf: navigate menus on hyperlinks
      kconfig: qconf: parse newer types at debug info

Paul Menzel (1):
      .gitignore: Do not track `defconfig` from `make savedefconfig`

 .gitignore                                   |   3 +
 Documentation/kbuild/modules.rst             |   7 +-
 Documentation/kbuild/reproducible-builds.rst |   2 +-
 Makefile                                     |   4 +-
 init/Kconfig                                 |   8 +-
 scripts/gcc-plugins/Kconfig                  |   2 +-
 scripts/kconfig/qconf.cc                     | 173 ++++++++++++++++-----------
 scripts/kconfig/qconf.h                      |  23 ++--
 8 files changed, 136 insertions(+), 86 deletions(-)


-- 
Best Regards
Masahiro Yamada
