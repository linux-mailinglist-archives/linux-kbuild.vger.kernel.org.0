Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 975331F0783
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jun 2020 17:22:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727100AbgFFPWr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jun 2020 11:22:47 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:28213 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgFFPWq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jun 2020 11:22:46 -0400
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 056FMUWr008325;
        Sun, 7 Jun 2020 00:22:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 056FMUWr008325
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591456951;
        bh=L0js+gdARSdykhaOnRE6hhf2IN7Lw5shOyohVu260ds=;
        h=From:Date:Subject:To:Cc:From;
        b=cT39+wdROOmjupYneSCT914JbbK4crH7pDRC2hkE7bKJM88x2fDQ3f4lFjg35mvSV
         Up/uRh0f8Yf+LAS0fRCFZgaH2I9WtWOr67fgpMNIpu9KWOLaLgIy2Dju01mYlZ6hb1
         7A152ltuzMtM21a+G6V2wTkWECn1idO36oVgCMpcBZhKbU8UZ/oatu1zBq7Xsgl63f
         Qpk4fSXqqUqwssZqagBCwyxEW9ZFywaxXiWM+7aKkIpqhkSBagED4OR/DnGryCRuRz
         b/26sOab/n2vPwOgKrz4p/9RlylYtUEeUC95HcBrFYq+dhEd+gzXlgffHmkracB9uS
         +zw7LR/ss8X+g==
X-Nifty-SrcIP: [209.85.217.54]
Received: by mail-vs1-f54.google.com with SMTP id u17so7309775vsu.7;
        Sat, 06 Jun 2020 08:22:31 -0700 (PDT)
X-Gm-Message-State: AOAM5319Jm0p6qsb944WUAH3OvkctMElCy1br9WeBZFtbWDJOq/X/0HY
        K6ABhCGt2kolSSEQ5cXGigwS9buFGkTBo8u2w3I=
X-Google-Smtp-Source: ABdhPJyph1J6gcyXt7Zu/ZuBd/wE9EO9KcpX3G9f8V+UpwH22Hfam2lAJC5Nt3BsBNmVd489YEPEPOxZyhtLhL9nIFc=
X-Received: by 2002:a67:6383:: with SMTP id x125mr11243365vsb.54.1591456950085;
 Sat, 06 Jun 2020 08:22:30 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 7 Jun 2020 00:21:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNASjL_SbPUC1PJNx3Fqv0WjcgQkOMtBkim=F-xdzqAzhkg@mail.gmail.com>
Message-ID: <CAK7LNASjL_SbPUC1PJNx3Fqv0WjcgQkOMtBkim=F-xdzqAzhkg@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.8-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.8-rc1

Thanks.


The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.8

for you to fetch changes up to bcfefb61cd2bc86329915a4074f7b4c48b00b33a:

  kconfig: announce removal of 'kvmconfig' and 'xenconfig' shorthands
(2020-05-26 00:02:32 +0900)

----------------------------------------------------------------
Kconfig updates for v5.8

 - allow only 'config', 'comment', 'if' statements inside 'choice' since
   the other statements are not sensible inside 'choice' and should be
   grammatical error

 - support LMC_KEEP env variable for 'make local{yes,mod}config' to
   preserve some CONFIG options

 - deprecate 'make kvmconfig' and 'make xenconfig' in favor of
   'make kvm_guest.config' and 'make xen.config'

 - code cleanups

----------------------------------------------------------------
Changbin Du (1):
      streamline_config.pl: add LMC_KEEP to preserve some kconfigs

Masahiro Yamada (5):
      kconfig: do not use OR-assignment for zero-cleared structure
      kconfig: do not assign a variable in the return statement
      kconfig: tests: remove randconfig test for choice in choice
      kconfig: allow only 'config', 'comment', and 'if' inside 'choice'
      kconfig: announce removal of 'kvmconfig' and 'xenconfig' shorthands

 Documentation/admin-guide/README.rst            | 11 ++++--
 scripts/kconfig/Makefile                        | 11 +++---
 scripts/kconfig/menu.c                          |  3 +-
 scripts/kconfig/parser.y                        | 30 ++++++++--------
 scripts/kconfig/streamline_config.pl            | 21 +++++++++++
 scripts/kconfig/symbol.c                        |  2 +-
 .../kconfig/tests/rand_nested_choice/Kconfig    | 35 -------------------
 .../tests/rand_nested_choice/__init__.py        | 17 ---------
 .../tests/rand_nested_choice/expected_stdout0   |  2 --
 .../tests/rand_nested_choice/expected_stdout1   |  4 ---
 .../tests/rand_nested_choice/expected_stdout2   |  5 ---
 11 files changed, 55 insertions(+), 86 deletions(-)
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/Kconfig
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/__init__.py
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout0
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout1
 delete mode 100644 scripts/kconfig/tests/rand_nested_choice/expected_stdout2


-- 
Best Regards
Masahiro Yamada
