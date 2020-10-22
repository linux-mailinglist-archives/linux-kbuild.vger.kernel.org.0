Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A5C29604A
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Oct 2020 15:48:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S367960AbgJVNs1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Oct 2020 09:48:27 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:44076 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S367958AbgJVNs1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Oct 2020 09:48:27 -0400
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 09MDm0cV019454;
        Thu, 22 Oct 2020 22:48:00 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 09MDm0cV019454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603374480;
        bh=bdgKUKGTFLj1NxEcDBwbJI28YF7AsYkR/nJVPefrafs=;
        h=From:Date:Subject:To:Cc:From;
        b=Kl3FBP/s/zTrnwsES99Nj2JESbqBSaZ7OF9J89a7UL2YUsM5/SbRIuGqV55314U8s
         G2rN9aleMbKU0tJ3bbsx2RiDGYbDmdJgl9Tmxf28H7zK8YOTtgbSDjMDfB4VvmANWq
         uZrqmNOyWujUSJjTzCziih3MCFBmdFFMOXf5U01UUMq2qSQCR50V2Eg4mRpzRbDukB
         J/dGbCU2UlPdvm1CiZ1nKsfkvYwNfdaN3A1TZio3LBMWScwoKsn1atsgSvgthUw4tK
         /wnPp8D5slXGIIxCzvyoM6wyFYDOnvgbXBchFXUAM0lkPkT545btGNawWOqj5V1/H/
         DaDHaMAfo5Yxg==
X-Nifty-SrcIP: [209.85.214.180]
Received: by mail-pl1-f180.google.com with SMTP id j5so603172plk.7;
        Thu, 22 Oct 2020 06:48:00 -0700 (PDT)
X-Gm-Message-State: AOAM533oAb1+1PNdZzEjhrH/Bcnwe5vo6v9v3IXVbt2nOgB+qi/d+5KO
        BgjxOhYvi8tfXiI0W0Tk9pfx3iOxxq6Njdp0Bjk=
X-Google-Smtp-Source: ABdhPJwkf8PZY8BfwjFnkzGLsXvs5wQ9ve6vJYhavJe8pPQq8VtgrDgyHa69wJY3EdU3uxLXgPj+TdOW4Lo8RHg8Ygs=
X-Received: by 2002:a17:90b:1b12:: with SMTP id nu18mr2479488pjb.153.1603374479383;
 Thu, 22 Oct 2020 06:47:59 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 22 Oct 2020 22:47:22 +0900
X-Gmail-Original-Message-ID: <CAK7LNATCRZ_dfrsSY9Kf-=JTBNsnkLyyqAbq_TXtXrkW5GsRBw@mail.gmail.com>
Message-ID: <CAK7LNATCRZ_dfrsSY9Kf-=JTBNsnkLyyqAbq_TXtXrkW5GsRBw@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.10
Thanks.


The following changes since commit ba4f184e126b751d1bffad5897f263108befc780:

  Linux 5.9-rc6 (2020-09-20 16:33:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.10

for you to fetch changes up to f9a825a7f65a1c94858667934c4ed59bc548dd1f:

  kconfig: qconf: create QApplication after option checks (2020-09-25
00:37:13 +0900)

----------------------------------------------------------------
Kconfig updates for v5.10

 - Remove unused for useless code from qconf

 - Allow to edit "int", "hex", "string" options in place, and remove the
   separate edit box from qconf

----------------------------------------------------------------
Masahiro Yamada (11):
      kconfig: qconf: reformat the intro message
      kconfig: qconf: update the intro message to match to the current code
      kconfig: qconf: remove unused ConfigItem::okRename()
      kconfig: qconf: move ConfigView::updateList(All) to ConfigList class
      kconfig: qconf: show data column all the time
      kconfig: qconf: allow to edit "int", "hex", "string" menus in-place
      kconfig: qconf: remove ConfigLineEdit class
      kconfig: qconf: move setShowName/Range() to ConfigList from ConfigView
      kconfig: qconf: remove ConfigView class
      kconfig: qconf: remove Y, M, N columns
      kconfig: qconf: create QApplication after option checks

 scripts/kconfig/qconf.cc | 368
+++++++++++++++++++++++++--------------------------------------
 scripts/kconfig/qconf.h  |  77 ++++---------
 2 files changed, 170 insertions(+), 275 deletions(-)


-- 
Best Regards
Masahiro Yamada
