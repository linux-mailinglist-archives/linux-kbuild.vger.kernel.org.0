Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E1AA80B9B
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Aug 2019 18:08:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726369AbfHDQIU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Aug 2019 12:08:20 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:25717 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfHDQIU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Aug 2019 12:08:20 -0400
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x74G7pDC012038;
        Mon, 5 Aug 2019 01:07:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x74G7pDC012038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564934872;
        bh=FKuc8xwg/DVam5baXsIHAAoB5kZncUfPUTgAEGAA3xU=;
        h=From:Date:Subject:To:Cc:From;
        b=yoy6bkKxbU1nk3P1Btk+4UKUAmKTUxA3VL6hpGqoD91PMpWDvy6jJ4spJJ2rps80o
         GwWa/GXbkkzG1QhNX6FtA9JoPn58yuokSQhZjdx5RvWt2xN1IacXCckLTEB7pCyzE0
         XnMSuEkISZe7AU9lS7pAWEtUdvMUiH4gnClw/F5sokeJM+4hF9XYWfD6vapAoZJvKE
         0SX+yzeTlIbfMP+wY6zUIOVDcXFJ2SvFlcxdqwIrwyURH/x3FY0luwIy2wKR2A5vx+
         YolOospbXJLPlpYTMH7mji9KH3g/0mkoRj0mHag/DN2eNGDX7vHAHqc53RQxCpLHRE
         F+wMU+4oju5AQ==
X-Nifty-SrcIP: [209.85.222.45]
Received: by mail-ua1-f45.google.com with SMTP id z13so31434226uaa.4;
        Sun, 04 Aug 2019 09:07:52 -0700 (PDT)
X-Gm-Message-State: APjAAAWkGIF7jkCPiE0vBgDOQu0Ue4DvAph6WvW4MwY4ec9XDvW/W1bE
        qfJoovsZ5l/VcGc0YTwNCEHPJcKMlReVGijM6hE=
X-Google-Smtp-Source: APXvYqy0NQpMeqVQl1BBp8X2pwkz+7//9nitQVX0aCDUe4umR4TwUaNdz6ur6u1npKrjHKZX5KpLpkAhUz5F8LDiso0=
X-Received: by 2002:ab0:234e:: with SMTP id h14mr3862298uao.25.1564934870996;
 Sun, 04 Aug 2019 09:07:50 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 5 Aug 2019 01:07:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNSjKcanh78mEJWeyO81xz9qBJ=_u=Dcqx+YcaT9pZig@mail.gmail.com>
Message-ID: <CAK7LNAQNSjKcanh78mEJWeyO81xz9qBJ=_u=Dcqx+YcaT9pZig@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.3-rc3
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

Please pull some more Kbuild fixes.
Thanks!


The following changes since commit 609488bc979f99f805f34e9a32c1e3b71179d10b:

  Linux 5.3-rc2 (2019-07-28 12:47:02 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.3-2

for you to fetch changes up to 0c5b6c28ed68becb692b43eae5e44d5aa7e160ce:

  kconfig: Clear "written" flag to avoid data loss (2019-08-04 12:44:15 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.3 (2nd)

 - detect missing missing "WITH Linux-syscall-note" for uapi headers

 - fix needless rebuild when using Clang

 - fix false-positive cc-option in Kconfig when using Clang

 - avoid including corrupted .*.cmd files in the modpost stage

 - fix warning of 'make vmlinux'

 - fix {m,n,x,g}config to not generate the broken .config on the second
   save operation.

 - some trivial Makefile fixes

----------------------------------------------------------------
M. Vefa Bicakci (1):
      kconfig: Clear "written" flag to avoid data loss

Masahiro Yamada (7):
      kbuild: detect missing "WITH Linux-syscall-note" for uapi headers
      kbuild: initialize CLANG_FLAGS correctly in the top Makefile
      kbuild: modpost: include .*.cmd files only when targets exist
      kbuild: modpost: handle KBUILD_EXTRA_SYMBOLS only for external modules
      kbuild: modpost: remove unnecessary dependency for __modpost
      kbuild: modpost: do not parse unnecessary rules for vmlinux modpost
      lib/raid6: fix unnecessary rebuild of vpermxor*.c

Stephen Boyd (1):
      kbuild: Check for unknown options with cc-option usage in
Kconfig and clang

 Makefile                   |  3 +-
 lib/raid6/Makefile         |  2 +-
 scripts/Kconfig.include    |  2 +-
 scripts/Makefile.modpost   | 82
+++++++++++++++++++++++++-----------------------
 scripts/headers_install.sh |  6 ++++
 scripts/kconfig/confdata.c |  4 +++
 scripts/link-vmlinux.sh    |  2 +-
 7 files changed, 58 insertions(+), 43 deletions(-)


-- 
Best Regards
Masahiro Yamada
