Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 821971F804
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 May 2019 17:57:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfEOP5b (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 15 May 2019 11:57:31 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:20132 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfEOP5b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 May 2019 11:57:31 -0400
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id x4FFvOU9020916;
        Thu, 16 May 2019 00:57:25 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com x4FFvOU9020916
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557935845;
        bh=CVB3einOzSmQkAArZSEfGiIV/vsSTw25G7oWKEkq1vI=;
        h=From:Date:Subject:To:Cc:From;
        b=hOyUz0NdF61A4cywMn5qZ57MWTCccptp3aOTVVbNd5yW2kgbIRAGRXby+5sfST71r
         aMsLOY4ryK7OY8YV/XdllwNRPADnJHT8PnI4SORLj30Q+vpHL6VKL1C6V1/PNTXRWY
         aiOYZf+nJxUnQbwuoGQYV9sVzkaEXmpimLVIHAA4h1C2Ba+vENUEqyVlPfqkP1xB+A
         7rn8yUPOgUQfqIuPnzGgofz/YpCP3oOdQzEh/lrEVlVD3wJarbz9UhgeUo+u1FtyF4
         GUl06x0zj8kZOR9qJTi+OvuSvcJWDo1YM+6oQT/UVNcnE3tjMOMZLqSn7UaJ/TTVRX
         Og+GP1Tu+rxXA==
X-Nifty-SrcIP: [209.85.222.53]
Received: by mail-ua1-f53.google.com with SMTP id 49so61309uas.0;
        Wed, 15 May 2019 08:57:24 -0700 (PDT)
X-Gm-Message-State: APjAAAXFFbt4CGpa+wZPsRYLSuXTuAk/Xp5Q0c3DZRSLH5RJrhz7CdCg
        bOIXVi2LoYh9+gEubZF42cs+msxdWzkF6K+qnow=
X-Google-Smtp-Source: APXvYqx3aK73SbT9SWJfHOr39Jpll5rf8qsj5YOMwfZDhWxmjsyNsTEEfby+AdNsTOEvUyTBn01zsc9pw028RG02Dp4=
X-Received: by 2002:ab0:20c1:: with SMTP id z1mr18626427ual.109.1557935843938;
 Wed, 15 May 2019 08:57:23 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 16 May 2019 00:56:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQoi24VYEVdwvmjD3CP=Q7_91KQ1o47ocL+MFPKnVBOKA@mail.gmail.com>
Message-ID: <CAK7LNAQoi24VYEVdwvmjD3CP=Q7_91KQ1o47ocL+MFPKnVBOKA@mail.gmail.com>
Subject: [GIT PULL] Kconfig updates for v5.2
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     masahiroy@kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.2

Thanks.



The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.2

for you to fetch changes up to 9b9f5948afcdf583cb1b58e0c4cc327aa1820f5a:

  kconfig: make conf_get_autoconfig_name() static (2019-05-14 23:23:25 +0900)

----------------------------------------------------------------
Kconfig updates for v5.2

 - error out if a user specifies a directory instead of a file from
   "Save" menu of GUI interfaces

 - do not overwrite .config if there is no change in the configuration

 - create parent directories as needed when a user specifies a new file
   path from "Save" menu of menuconfig/nconfig

 - fix potential buffer overflow

 - some trivial cleanups

----------------------------------------------------------------
Jacob Garber (1):
      kconfig: use snprintf for formatting pathnames

Masahiro Yamada (6):
      kconfig: remove trailing whitespaces
      kconfig: do not accept a directory for configuration output
      kconfig: do not write .config if the content is the same
      kconfig: make parent directories for the saved .config as needed
      kconfig: remove useless NULL pointer check in conf_write_dep()
      kconfig: make conf_get_autoconfig_name() static

Petr Vorel (1):
      kconfig: Make nconf-cfg.sh executable

 scripts/kconfig/confdata.c               | 121 ++++++++++++++-------
 scripts/kconfig/gconf.c                  |   2 +-
 scripts/kconfig/lexer.l                  |   3 +-
 scripts/kconfig/lkc.h                    |   1 -
 scripts/kconfig/lxdialog/BIG.FAT.WARNING |   2 +-
 scripts/kconfig/mconf.c                  |   2 +-
 scripts/kconfig/nconf-cfg.sh             |   0
 scripts/kconfig/nconf.c                  |   3 +-
 8 files changed, 89 insertions(+), 45 deletions(-)
 mode change 100644 => 100755 scripts/kconfig/nconf-cfg.sh


-- 
Best Regards
Masahiro Yamada
