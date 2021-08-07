Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A1593E35E2
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Aug 2021 16:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232357AbhHGO24 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Aug 2021 10:28:56 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17675 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232313AbhHGO2z (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Aug 2021 10:28:55 -0400
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 177ESFCU022029;
        Sat, 7 Aug 2021 23:28:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 177ESFCU022029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628346496;
        bh=g7N5TST2+uR3VDmC5otxY77NON+5K6nTRTk0gOuQSOk=;
        h=From:Date:Subject:To:Cc:From;
        b=GzCX6/kj4IrTMZOsoO++tm5YSIGbMnEOpljbLka51SkMelfF9IJSJZZjd/p5rUwWx
         2K1KhtIO5KhSCb2xO4G+34sBFkocDFtOmesyysiw9bQQHRY9VG+BfpFYXgBwaMkkqb
         jyykGSdSEgiFzymk+zbVlc6DmilqegDqBJyslDC4SJ/L5B2keco6tbqpwX3gLtrkoP
         7hPja6j6admw3g6B30CIg48jM9U1Tjrtg7LcZ/YzBKgx82hivf7tIzGIxNhPUeOgDA
         QrCCTnmxhw2EC6v3qoBtsMqzbTscUMAfIl59S1a4e39he7RAIUyZBBPkLutQjYfLBY
         oB9qvWkMCcGXA==
X-Nifty-SrcIP: [209.85.214.178]
Received: by mail-pl1-f178.google.com with SMTP id bh7so2397494plb.5;
        Sat, 07 Aug 2021 07:28:16 -0700 (PDT)
X-Gm-Message-State: AOAM533tyB9fmieMbvqlmLe0qr7gHXpexAhmforGfpvy5jKdg5CnWK90
        G23W2AUyjMe7Ke80ZRys2IwmOhsi9te0Po3IHiM=
X-Google-Smtp-Source: ABdhPJylTdEP2/PysoMiBmzkViD4vcp/GXjvIh/i09nEQA8Oym6L5aIIQpEzf1bZGDqK917pNW0vzud+aMM6lqkXo7o=
X-Received: by 2002:a17:90a:7384:: with SMTP id j4mr12030068pjg.153.1628346495411;
 Sat, 07 Aug 2021 07:28:15 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 7 Aug 2021 23:27:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ_j+c3q+y74HXFbbE1G4w3ug5t4Dk2H1BritppEi0sEA@mail.gmail.com>
Message-ID: <CAK7LNAQ_j+c3q+y74HXFbbE1G4w3ug5t4Dk2H1BritppEi0sEA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.14-rc5
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



The following changes since commit c500bee1c5b2f1d59b1081ac879d73268ab0ff17:

  Linux 5.14-rc4 (2021-08-01 17:04:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.14-2

for you to fetch changes up to 14ccc638b02f9ec500c17d9e39efe979145a4b61:

  kbuild: cancel sub_make_done for the install target to fix DKMS
(2021-08-05 20:56:35 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.14 (2nd)

 - Correct the Extended Regular Expressions in tools

 - Adjust scripts/checkversion.pl for the current Kbuild

 - Unset sub_make_done for 'make install' to make DKMS working again

----------------------------------------------------------------
H. Nikolaus Schaller (2):
      x86/tools/relocs: Fix non-POSIX regexp
      mips: Fix non-POSIX regexp

Masahiro Yamada (1):
      kbuild: cancel sub_make_done for the install target to fix DKMS

Randy Dunlap (1):
      scripts: checkversion: modernize linux/version.h search strings

 Makefile                | 10 ++++++++++
 arch/mips/Makefile      |  2 +-
 arch/x86/tools/relocs.c |  8 ++++----
 scripts/checkversion.pl | 18 +++++++++++-------
 4 files changed, 26 insertions(+), 12 deletions(-)


--
Best Regards
Masahiro Yamada
