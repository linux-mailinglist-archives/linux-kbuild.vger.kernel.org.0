Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8754E2F09B5
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Jan 2021 21:31:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbhAJUbM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 Jan 2021 15:31:12 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45037 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726267AbhAJUbM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 Jan 2021 15:31:12 -0500
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 10AKU7bt014421;
        Mon, 11 Jan 2021 05:30:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 10AKU7bt014421
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610310608;
        bh=AhCDVhmRfaca1ufeJsiXcwnl8shZXxBKRbDxaNWQgUk=;
        h=From:Date:Subject:To:Cc:From;
        b=g+b2H1miGo5Kb8gA/lbD9Fi41aukFhx57sJbEFZ31E26N0Xg/pDHFT5mv8Z/m5pdE
         zUXClqDBpfRXwtfZgm5ZE4wncZswx4Bq1lPtx6YwLe5F1Iiw3HykqiKwFjVtTa8Nv+
         MYj71WowDzoDrlCV3BVBwdz+ipTVxkEWRpgnhWJOqg5excjCB6sgPaJgEwwVVm1Sz+
         IULvY+YGsQPlfEHZZ4PrY8nOOUoUept6wQigiRgccX66nPH01/mlanx8//R2tYX3lz
         Abvr3WKOJV9Rdzs1krxdM8M7M97sZTI012DgBQJgQsOd9Af7XO+K+RtEK+Bdf/t2gG
         713pzGxnW/mVQ==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id be12so8417637plb.4;
        Sun, 10 Jan 2021 12:30:08 -0800 (PST)
X-Gm-Message-State: AOAM531eseqtKrPZ4S/TkFqGkRV+WqL67hMpAE31I4Eq8VbplkqPHYbV
        IbKFkmAteLNQQj606o80LLM+yUJh6im5qK/UedQ=
X-Google-Smtp-Source: ABdhPJyL7Uqs5OEcmW3q93ue0CTf+DEZmz9j/SDnbl/t+kvhKofQYJ2rzKNKMlqlDLdiPAI5qspAgzJ5lUW+6DVOlxw=
X-Received: by 2002:a17:902:b415:b029:dc:42b1:9b26 with SMTP id
 x21-20020a170902b415b02900dc42b19b26mr13420259plr.71.1610310607343; Sun, 10
 Jan 2021 12:30:07 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 11 Jan 2021 05:29:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR6zJnAo7KwdeghJZk8x8BivXWb2F5Gpxb90LDgP9D4dg@mail.gmail.com>
Message-ID: <CAK7LNAR6zJnAo7KwdeghJZk8x8BivXWb2F5Gpxb90LDgP9D4dg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.11-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes for v5.11-rc3
Thanks.



The following changes since commit e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62:

  Linux 5.11-rc2 (2021-01-03 15:55:30 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.11

for you to fetch changes up to 5625dcfbbcf892e40e8d60abbb5f56701a1d031c:

  Documentation: kbuild: Fix section reference (2021-01-11 05:14:38 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.11

 - Search for <ncurses.h> in the default header path of HOSTCC

 - Tweak the option order to be kind to old BSD awk

 - Remove 'kvmconfig' and 'xenconfig' shorthands

 - Fix documentation

----------------------------------------------------------------
John Millikin (2):
      kconfig: Support building mconf with vendor sysroot ncurses
      lib/raid6: Let $(UNROLL) rules work with macOS userland

Lukas Bulwahn (1):
      MAINTAINERS: adjust GCC PLUGINS after gcc-plugin.sh removal

Masahiro Yamada (1):
      kconfig: remove 'kvmconfig' and 'xenconfig' shorthands

Randy Dunlap (1):
      kconfig: config script: add a little user help

Viresh Kumar (1):
      Documentation: kbuild: Fix section reference

 Documentation/kbuild/makefiles.rst |  2 +-
 MAINTAINERS                        |  1 -
 lib/raid6/Makefile                 |  2 +-
 scripts/config                     |  1 +
 scripts/kconfig/Makefile           | 10 ----------
 scripts/kconfig/mconf-cfg.sh       |  4 +++-
 6 files changed, 6 insertions(+), 14 deletions(-)

--
Best Regards
Masahiro Yamada
