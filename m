Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57C37128A35
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Dec 2019 16:37:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726179AbfLUPh6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 21 Dec 2019 10:37:58 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37587 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726114AbfLUPh6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 21 Dec 2019 10:37:58 -0500
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id xBLFbdbr027798;
        Sun, 22 Dec 2019 00:37:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com xBLFbdbr027798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1576942660;
        bh=OkEE5pPSwnt74ND2gBUTApOICUFM4AjRsad2kuXEM6Y=;
        h=From:Date:Subject:To:Cc:From;
        b=TPSv1zDUWQPcxi8vofqZK4g0BI672xBSU7XT5RMewyBFa5MlNeMmBc4D0H6Ie3BmH
         maqw4jq3PhxtKDM8PQy1FoIVkWbX4nD23jEctZnPyGn/oOR2pEV5II4axlkBvh6nlt
         t1YUZCMzVPVBHgolxJRO8Y9PrBO8mm1X/pdux0CopOIszafICOnlCnTlSdxz1v4Gw+
         8EVoLCvcTFBKPtL8ddmFEkEhMnosnYxEx0zubf1ViNECWeSB8Y6ndezKQiBasv1oeF
         ncW2NMxWA5F3QXG874DGZRK4eNk51l6vHxnXqB0XXjUSqrW5Lxf5xAKsyDq62oMUag
         3+NSBHsWjPNzA==
X-Nifty-SrcIP: [209.85.222.51]
Received: by mail-ua1-f51.google.com with SMTP id a12so4308297uan.0;
        Sat, 21 Dec 2019 07:37:39 -0800 (PST)
X-Gm-Message-State: APjAAAUD4bT5SuzztOJDveBx03/5s/q8hxbp/B/XdRs036fV8+mOUimj
        CIdmxIRamv8JxcZ0qfQ3Q9lMaSLJYqC2GwCas6Q=
X-Google-Smtp-Source: APXvYqzCX3rW7ptQ+HoaKErohnB0rOrShIGBiTOaIPpjWmcMXpC47TJcxwkBoiypmQpUlY74jyvD1pkMkKpb3TVuvt4=
X-Received: by 2002:ab0:6509:: with SMTP id w9mr12971934uam.121.1576942658691;
 Sat, 21 Dec 2019 07:37:38 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 22 Dec 2019 00:37:03 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQG3Tp=q8XWABfopHgQ8nTa2OhKf=msy0m6SbgcyS67OQ@mail.gmail.com>
Message-ID: <CAK7LNAQG3Tp=q8XWABfopHgQ8nTa2OhKf=msy0m6SbgcyS67OQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.5-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks.


The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.5

for you to fetch changes up to 28f94a44298c99c0db85539874b62f21d94fcaa7:

  kbuild: clarify the difference between obj-y and obj-m w.r.t.
descending (2019-12-22 00:25:35 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.5

 - fix warning in out-of-tree 'make clean'

 - add READELF variable to the top Makefile

 - fix broken builds when LINUX_COMPILE_BY contains a backslash

 - fix build warning in kallsyms

 - fix NULL pointer access in expr_eq() in Kconfig

 - fix missing dependency on rsync in deb-pkg build

 - remove ---help--- from documentation

 - fix misleading documentation about directory descending

----------------------------------------------------------------
Dmitry Golovin (1):
      x86/boot: kbuild: allow readelf executable to be specified

Enrico Weigelt, metux IT consult (1):
      scripts: package: mkdebian: add missing rsync dependency

Masahiro Yamada (6):
      kbuild: fix 'No such file or directory' warning when cleaning
      mkcompile_h: git rid of UTS_TRUNCATE from LINUX_COMPILE_{BY,HOST}
      mkcompile_h: use printf for LINUX_COMPILE_BY
      scripts/kallsyms: fix offset overflow of kallsyms_relative_base
      kconfig: remove ---help--- from documentation
      kbuild: clarify the difference between obj-y and obj-m w.r.t. descending

Thomas Hebb (1):
      kconfig: don't crash on NULL expressions in expr_eq()

 Documentation/kbuild/kconfig-language.rst |  5 +---
 Documentation/kbuild/makefiles.rst        | 16 ++++++++++---
 Makefile                                  |  3 ++-
 arch/x86/boot/compressed/Makefile         |  2 +-
 scripts/kallsyms.c                        | 38 +++++++++++++++----------------
 scripts/kconfig/expr.c                    |  7 ++++++
 scripts/mkcompile_h                       | 10 ++++----
 scripts/package/mkdebian                  |  2 +-
 usr/include/Makefile                      |  2 +-
 9 files changed, 48 insertions(+), 37 deletions(-)

--
Best Regards
Masahiro Yamada
