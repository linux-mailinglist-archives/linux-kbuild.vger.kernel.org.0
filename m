Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3501296051
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Oct 2020 15:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S367989AbgJVNt5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Oct 2020 09:49:57 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:47767 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S367986AbgJVNt4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Oct 2020 09:49:56 -0400
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 09MDngeH006919;
        Thu, 22 Oct 2020 22:49:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 09MDngeH006919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603374583;
        bh=NOuE2TCKNLxqGjPBwd+Y2aLSIW2xxRSdliJxRmCHdBw=;
        h=From:Date:Subject:To:Cc:From;
        b=PSkLzkLiZOIjfBRPeDQGKPLz76ewU7M55uXYUZCszAwX5uPmHFVtdLAkfQM8qH0oD
         slhfKRKA/+TT8Oir1hGWOzLxtKpfwppBcwdw5omPjVcIL2wf9trEUJTylCSXls1V5y
         Z6QkjWNrNHNevNAq03JSm9AD4YZ6mcMIWThWbxkEgayfbCeIsgbCSGPuJ84WFOA+cZ
         pudTyMiR1o85FXHCdypKhWT/BrZCP9Z64kLr2XqXj/P/VFiCaco0KnvWeYMutFXWs5
         mXH2Wj/AE7QBIPFy7nz11JZ471U0ExFJATJbfHdwFUtNW//PSC8+wI0fiPyeYZIUfk
         /NAn4PuT3YYVQ==
X-Nifty-SrcIP: [209.85.210.173]
Received: by mail-pf1-f173.google.com with SMTP id y14so1153726pfp.13;
        Thu, 22 Oct 2020 06:49:42 -0700 (PDT)
X-Gm-Message-State: AOAM530gglIXetdK+uXOtsLFe5vheAHXRnsqEgMxxtqZ+hI1j7pmBbs4
        bna1PesjNuySwMdJrtutFMoYCLGFVJ9H9q26CFM=
X-Google-Smtp-Source: ABdhPJxsysS9QFFwXQBzSMHrl3QaBA52KFEyeL/v2SOZUfU9Jt/US87bNgFcjUbARnc3ibMg6fDtyIBS2FiHR6NPdAA=
X-Received: by 2002:aa7:90cf:0:b029:156:2bff:5a87 with SMTP id
 k15-20020aa790cf0000b02901562bff5a87mr2768181pfk.63.1603374582121; Thu, 22
 Oct 2020 06:49:42 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 22 Oct 2020 22:49:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
Message-ID: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
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
