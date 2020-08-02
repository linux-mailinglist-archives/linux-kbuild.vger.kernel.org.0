Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7670223587A
	for <lists+linux-kbuild@lfdr.de>; Sun,  2 Aug 2020 18:35:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726150AbgHBQfs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Aug 2020 12:35:48 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59477 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725768AbgHBQfs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Aug 2020 12:35:48 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 072GZYAE010032;
        Mon, 3 Aug 2020 01:35:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 072GZYAE010032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1596386135;
        bh=buqQ+5V+jZVeUJqv5ynUltuexC7jQ90Idd2IOU9lLI8=;
        h=From:Date:Subject:To:Cc:From;
        b=Yiq/eYwc8od/CXLN3XIPvlPlxaljXLc1FTZ2wdoNOG7A4UoREGeqkyxUs+VEZshJS
         IRoVU+zuT2lc67UdqhPQqug2I14rN/wcZkjPf1pGubYTUXO2FeCriS7NtGJNEJkecx
         eWy1j345MU4q3pR4nDLJn/Sd+jeTw2FySUQ05FY4BXl1LS8sw+Nu5gp42BPCc0U4PA
         g4MZf8CNVb4dxzUZBUP/Jm12xGsboE4eY0GXd+TNEhbVLyakwFpSB5JpcYltyjuisn
         CLkMsl6XyBaWJIEv6UTSIQAvQO0nPXH4/Ua3CwHF1BYv6o6vo4omczVggz6ERJsu/W
         FZVvBTQJC8xYg==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id r63so11104738uar.9;
        Sun, 02 Aug 2020 09:35:34 -0700 (PDT)
X-Gm-Message-State: AOAM533td9vdpq0XEouWqMGxXmstbl9Ja7npSxt2c1gaw+gQFZQ6DaPj
        1Ev0R8nxJIBS2847964rD+xAOw4jHO4Iwn10mD4=
X-Google-Smtp-Source: ABdhPJwxFY3d019c2MX2wWRgJzpZrgSNxbaBHJ5+SamHhXc5OnRNKaTx7RUHCanswWoV0JyG8eJQ5icSEAuqNUDAroU=
X-Received: by 2002:ab0:2390:: with SMTP id b16mr8660376uan.25.1596386133613;
 Sun, 02 Aug 2020 09:35:33 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 3 Aug 2020 01:34:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNATJbLfuj8bbjPevXWTk5HAra3n2aG-B2ueTPxMpYhbZnQ@mail.gmail.com>
Message-ID: <CAK7LNATJbLfuj8bbjPevXWTk5HAra3n2aG-B2ueTPxMpYhbZnQ@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.8(-rc8)
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

The following changes since commit 92ed301919932f777713b9172e525674157e983d:

  Linux 5.8-rc7 (2020-07-26 14:14:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.8-4

for you to fetch changes up to 28ab576ba8de934ee3145b6d75119f016de567cb:

  kbuild: remove redundant FORCE definition in
scripts/Makefile.modpost (2020-08-02 23:09:16 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.8 (4th)

 - clean the generated moc file for xconfig

 - fix xconfig bugs, and revert some bad commits

----------------------------------------------------------------
Masahiro Yamada (8):
      kconfig: qconf: use if_changed for qconf.moc rule
      kconfig: qconf: compile moc object separately
      kconfig: qconf: use delete[] instead of delete to free array
      kconfig: qconf: remove "goBack" debug message
      Revert "kconfig: qconf: Change title for the item window"
      Revert "kconfig: qconf: don't show goback button on splitMode"
      kconfig: qconf: remove wrong ConfigList::firstChild()
      kbuild: remove redundant FORCE definition in scripts/Makefile.modpost

Wolfram Sang (1):
      modpost: explain why we can't use strsep

 scripts/Makefile.modpost   |  3 ---
 scripts/kconfig/.gitignore |  2 +-
 scripts/kconfig/Makefile   | 13 ++++++++-----
 scripts/kconfig/qconf.cc   | 23 ++++++-----------------
 scripts/kconfig/qconf.h    |  4 ----
 scripts/mod/modpost.c      |  1 +
 6 files changed, 16 insertions(+), 30 deletions(-)

-- 
Best Regards
Masahiro Yamada
