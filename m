Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DBD2C7082
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Nov 2020 19:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729397AbgK1SAK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 28 Nov 2020 13:00:10 -0500
Received: from condef-02.nifty.com ([202.248.20.67]:53986 "EHLO
        condef-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728883AbgK1R6K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 28 Nov 2020 12:58:10 -0500
Received: from conssluserg-01.nifty.com ([10.126.8.80])by condef-02.nifty.com with ESMTP id 0ASHOM2h010544;
        Sun, 29 Nov 2020 02:24:22 +0900
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0ASHO95r006960;
        Sun, 29 Nov 2020 02:24:10 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0ASHO95r006960
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606584250;
        bh=et9lDT3Zpqsx6VK/dEHvLLo0NKfFOQL29WE+Sz7lk58=;
        h=From:Date:Subject:To:Cc:From;
        b=GwjqHarwhXQTBgBPTvxqaDZcU+1KyQgomjmdO90oheTSfyVB1m34A6hWPImIqz7de
         DquFGpgfiZvQvBi+VZYtQM3Iy6E9hovq8Lv6JK70XUG+EoV8P6L0rucD8sb9hUqlUA
         f3BygZ/egCeNJzXx+rHxjpdR/DVK2X55VhGiPdjEfAGm5cawWTMumdYNFdtUi/8zaT
         frUeNA6K5JlCmT9xtFeb5VnwXRSJozsH7vNk7gY/UlFJEDQ+ED1xExzBrpFUn6KIa5
         FKzUpsUM4qVOO6vgF1gesb/4a8k02vTMTnm8vc+F9w1d91Lv8TyOepy/At5f+/GuFA
         0G4kLAjfuE16Q==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id w6so7225178pfu.1;
        Sat, 28 Nov 2020 09:24:10 -0800 (PST)
X-Gm-Message-State: AOAM530Lk2M/cOxsOgGiMOgg5rtiTnnGVR32qO5d1JvtO2fA5oio1nRu
        r+9aYsPuwIm+cxdxPazJJ3Y/ZIUWZLU3xqb8TTo=
X-Google-Smtp-Source: ABdhPJxLHATCxDFthaPmyQHJk9ERgGmh0Nur7u/gWRJ8TdGHA0l5vscTGNmxHlIReTc2aAxvgWrQckwaoWTH7/QKUms=
X-Received: by 2002:a17:90a:c209:: with SMTP id e9mr17248934pjt.87.1606584249298;
 Sat, 28 Nov 2020 09:24:09 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 29 Nov 2020 02:23:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS-j7MqrpKnM_GQS9KfL_8Dw9NJrpaghRO9D637cqrnaA@mail.gmail.com>
Message-ID: <CAK7LNAS-j7MqrpKnM_GQS9KfL_8Dw9NJrpaghRO9D637cqrnaA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.10-rc6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kbuild fixes for v5.10
Thanks.


The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.10

for you to fetch changes up to d1889589a4f54b2d1d7075d608b596d6fcfd3d96:

  builddeb: Fix rootless build in setuid/setgid directory (2020-11-02
11:31:00 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.10

 - Remove unused OBJSIZE variable.

 - Fix rootless deb-pkg build in a setgid directory.

----------------------------------------------------------------
Sven Joachim (1):
      builddeb: Fix rootless build in setuid/setgid directory

Vasily Gorbik (1):
      kbuild: remove unused OBJSIZE

 Documentation/kbuild/llvm.rst | 5 ++---
 Makefile                      | 4 +---
 scripts/package/builddeb      | 2 ++
 3 files changed, 5 insertions(+), 6 deletions(-)



-- 
Best Regards
Masahiro Yamada
