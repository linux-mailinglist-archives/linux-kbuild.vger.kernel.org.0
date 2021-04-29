Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7644836E513
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 08:49:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbhD2Gue (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 02:50:34 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:43334 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhD2Gud (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 02:50:33 -0400
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 13T6nUOI011264;
        Thu, 29 Apr 2021 15:49:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 13T6nUOI011264
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619678971;
        bh=YioOJRfCV5xNJjK8OwaGmWoUUHe4Hl6Qd35pu4qVlQ0=;
        h=From:Date:Subject:To:Cc:From;
        b=0bhUfnZ6QJGS+W2St8QxYO1kAI88tJ7HmyyHuvzBkLjz7q62kbUoOIE/0WQ9Jxxln
         IkHH4rUfih3HNxSe0uhb8TiYLM9vWfuDsVItMtr07BMVEFS9bFPeVy4PEBIr4fXJbT
         t3QkcR2dpjtA9W09WSqMZ4YEQah80LT5LQwmVJSUAgOuqocPSfUPkEYTRw+8u3fVhU
         qyQvIXacTagVpJJUELfB02MV5K+essEsJMEZSVDUUiWHgByF2u/aZojH1Ueu5ac45k
         bEVQgQ/ZBvY+bKM4TjnL+1Uxp/0zue5KssUtpzKfQKfW+85Twh/FfwHCjaBXJ+nSVT
         WRVLjTZISts1g==
X-Nifty-SrcIP: [209.85.216.47]
Received: by mail-pj1-f47.google.com with SMTP id md17so6700665pjb.0;
        Wed, 28 Apr 2021 23:49:30 -0700 (PDT)
X-Gm-Message-State: AOAM533PQ7S5DnQ1qaiUxeYP34roW5R/DcVrl0tixT0ZrM0PAdrZU6Li
        XVzPq/qGl1eQTV+6cAQu2b6Oa2V4uH13nZ6PcMc=
X-Google-Smtp-Source: ABdhPJzsp2AYA0lmRGtmLfFt/fRwHeSbe9qAgeEuitljAbtRaxRD5vo4BDQRWlkfR3v8u66VFes8xFsNl1LqUC89GvI=
X-Received: by 2002:a17:90a:2c4c:: with SMTP id p12mr7943546pjm.87.1619678970196;
 Wed, 28 Apr 2021 23:49:30 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 29 Apr 2021 15:48:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_2XPx6-v5irQDw0HyfSRKrrxcR2rutmZ=WBUsSBW-wA@mail.gmail.com>
Message-ID: <CAK7LNAQ_2XPx6-v5irQDw0HyfSRKrrxcR2rutmZ=WBUsSBW-wA@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.13-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.13-rc1.
Thanks.


The following changes since commit 1e28eed17697bcf343c6743f0028cc3b5dd88bf0:

  Linux 5.12-rc3 (2021-03-14 14:41:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.13

for you to fetch changes up to 8ac27f2c6eac1f140531411e404fb3ba23339ba5:

  kconfig: refactor .gitignore (2021-04-26 02:17:39 +0900)

----------------------------------------------------------------
Kconfig updates for v5.13

 - Change 'option defconfig' to the environment variable
   KCONFIG_DEFCONFIG_LIST

 - Refactor tinyconfig without using allnoconfig_y

 - Remove 'option allnoconfig_y' syntax

 - Change 'option modules' to 'modules'

 - Do not use /boot/config-* etc. as base config for cross-compilation

 - Fix a search bug in nconf

 - Various code cleanups

----------------------------------------------------------------
Bhaskar Chowdhury (2):
      kconfig: streamline_config.pl: Couple of typo fixes
      kconfig: lxdialog: A spello fix and a punctuation added

Masahiro Yamada (28):
      kconfig: split randconfig setup code into set_randconfig_seed()
      kconfig: refactor option parse code
      kconfig: add long options --help and --silent
      kconfig: add help messages for --help (-h) and --silent (-s)
      kconfig: remove assignment for Kconfig file
      kconfig: move conf_rewrite_mod_or_yes() to conf.c
      kconfig: move conf_set_all_new_symbols() to conf.c
      kconfig: move JUMP_NB to mconf.c
      kconfig: change defconfig_list option to environment variable
      kconfig: move default KBUILD_DEFCONFIG back to scripts/kconfig/Makefile
      kconfig: do not use allnoconfig_y option
      kconfig: remove allnoconfig_y option
      kconfig: change "modules" from sub-option to first-level attribute
      kconfig: nconf: fix core dump when searching in empty menu
      kconfig: change sym_change_count to a boolean flag
      kconfig: use /boot/config-* etc. as DEFCONFIG_LIST only for native build
      kconfig: mconf,nconf: remove unneeded '\0' termination after snprintf()
      kconfig: nconf: fix NORMAL attributes
      kconfig: nconf: get rid of (void) casts from wattrset() calls
      kconfig: nconf: remove unneeded default for menu prompt
      kconfig: nconf: refactor attributes setup code
      kconfig: nconf: change set_config_filename() to void function
      kconfig: nconf: remove meaningless wattrset() call from show_menu()
      kconfig: nconf: refactor in print_in_middle()
      kconfig: split menu.c out of parser.y
      kconfig: remove unused PACKAGE definition
      kconfig: gconf: remove unused code
      kconfig: refactor .gitignore

Mihai Moldovan (1):
      kconfig: nconf: stop endless search loops

Randy Dunlap (2):
      kconfig: highlight gconfig 'comment' lines with '***'
      kconfig: highlight xconfig 'comment' lines with '***'

Yang Li (1):
      kconfig: use true and false for bool variable

 Documentation/kbuild/kconfig-language.rst             |  23 +-
 Documentation/kbuild/kconfig.rst                      |   8 +
 Makefile                                              |   8 +-
 init/Kconfig                                          |  12 +-
 kernel/configs/tiny-base.config                       |   1 +
 scripts/kconfig/.gitignore                            |  13 +-
 scripts/kconfig/Makefile                              |  21 +-
 scripts/kconfig/conf.c                                | 363
++++++++++++++++++++-----
 scripts/kconfig/confdata.c                            | 262 +++---------------
 scripts/kconfig/expr.h                                |   6 -
 scripts/kconfig/gconf.c                               |  15 +-
 scripts/kconfig/internal.h                            |   9 +
 scripts/kconfig/lexer.l                               |   3 -
 scripts/kconfig/lkc.h                                 |  21 --
 scripts/kconfig/lkc_proto.h                           |   1 +
 scripts/kconfig/lxdialog/util.c                       |   4 +-
 scripts/kconfig/mconf.c                               |  15 +-
 scripts/kconfig/menu.c                                |  23 +-
 scripts/kconfig/nconf.c                               |  58 ++--
 scripts/kconfig/nconf.gui.c                           | 284 ++++++++-----------
 scripts/kconfig/nconf.h                               |  51 ++--
 scripts/kconfig/parser.y                              |  27 +-
 scripts/kconfig/qconf.cc                              |   1 +
 scripts/kconfig/streamline_config.pl                  |   4 +-
 scripts/kconfig/symbol.c                              |   3 +-
 scripts/kconfig/tests/choice/Kconfig                  |   2 +-
 scripts/kconfig/tests/choice_value_with_m_dep/Kconfig |   2 +-
 scripts/kconfig/tests/conftest.py                     |   4 +
 scripts/kconfig/tests/inter_choice/Kconfig            |   2 +-
 29 files changed, 578 insertions(+), 668 deletions(-)
 create mode 100644 kernel/configs/tiny-base.config
 create mode 100644 scripts/kconfig/internal.h


-- 
Best Regards
Masahiro Yamada
