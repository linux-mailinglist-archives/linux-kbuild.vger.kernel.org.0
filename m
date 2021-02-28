Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64002327303
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Feb 2021 16:23:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbhB1PXm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 28 Feb 2021 10:23:42 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:63786 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230298AbhB1PXl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Feb 2021 10:23:41 -0500
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 11SFMhff004288;
        Mon, 1 Mar 2021 00:22:44 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 11SFMhff004288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614525764;
        bh=E8MbUsVktI17bys/jc4lb5vE3K2baWFXsZLNPNNa6b0=;
        h=From:Date:Subject:To:Cc:From;
        b=gzSEqLorE9eyinwGJWvaGz3Y7CaqzctNejogguiEGZKdTWacBcsKsxmsGeOpZm+fR
         ZOpqm7Gu35CZvpMYPQpxqIbZadWk6pMoXWhuG6tNxuJqfhMXf9bokWdJXqdssIaPHT
         NC5pWJNYAzzR8u/F4CktYJ82QKIf6syimkZKaxEt+PzXGU0eYmfGwnL7ZPYxnyboPt
         5Xya2G8Z04vletL5FWafcBfnYyldwBcfG3NG+QiqNECjlu+8sPkNkWTIe3uIkdmHKt
         7qFilpR6qrFJ6tgD6ATekt9xtLDZ5tvyE6OBdNHfBfCvKWWQh7qzY4zkdGRrOMS/qh
         Cznr9pmgbWYSQ==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id z11so577572plg.10;
        Sun, 28 Feb 2021 07:22:44 -0800 (PST)
X-Gm-Message-State: AOAM531lU5avC+UduWrutRg4MOt9ogM7HDcK4Q44RSEcsZsvyZDW6lJF
        eXJP80JVB6yMALV839n9Ytd9R5820dL8Ti3+fHA=
X-Google-Smtp-Source: ABdhPJwvWfUtAelcjmbFxRIMHctHI6y/Zu/j0B0WLOu73zIaZLGjMJ1aef0gBo3wzHLTCXc5f/pcKBBru0PP38FCYMM=
X-Received: by 2002:a17:902:e891:b029:e4:20d3:3d5c with SMTP id
 w17-20020a170902e891b02900e420d33d5cmr11824115plg.71.1614525763284; Sun, 28
 Feb 2021 07:22:43 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 1 Mar 2021 00:22:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNASnND8Vs1q4_6ceuEBPo=JbeoWYFTJBp_t-gYQy4BjVNw@mail.gmail.com>
Message-ID: <CAK7LNASnND8Vs1q4_6ceuEBPo=JbeoWYFTJBp_t-gYQy4BjVNw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.12-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks.



The following changes since commit 3fb6d0e00efc958d01c2f109c8453033a2d96796:

  Merge tag 'docs-5.12-2' of git://git.lwn.net/linux (2021-02-26 14:21:18 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.12

for you to fetch changes up to 207da4c82ade9a6d59f7e794d737ba0748613fa2:

  kbuild: Fix <linux/version.h> for empty SUBLEVEL or PATCHLEVEL again
(2021-02-28 15:23:48 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.12

 - Fix UNUSED_KSYMS_WHITELIST for Clang LTO

 - Make -s builds really silent irrespective of V= option

 - Fix build error when SUBLEVEL or PATCHLEVEL is empty

----------------------------------------------------------------
Arnd Bergmann (1):
      kbuild: lto: add _mcount to list of used symbols

Masahiro Yamada (5):
      kbuild: fix UNUSED_KSYMS_WHITELIST for Clang LTO
      kbuild: do not include include/config/auto.conf from adjust_autoksyms.sh
      ia64: remove redundant READELF from arch/ia64/Makefile
      kbuild: make -s option take precedence over V=1
      kbuild: Fix <linux/version.h> for empty SUBLEVEL or PATCHLEVEL again

 Makefile                        |  7 +++++--
 arch/ia64/Makefile              |  1 -
 init/Kconfig                    |  1 -
 scripts/adjust_autoksyms.sh     |  3 ---
 scripts/gen_autoksyms.sh        | 35 ++++++++++++++++++++++++++---------
 scripts/lto-used-symbollist.txt |  5 -----
 6 files changed, 31 insertions(+), 21 deletions(-)
 delete mode 100644 scripts/lto-used-symbollist.txt


-- 
Best Regards
Masahiro Yamada
