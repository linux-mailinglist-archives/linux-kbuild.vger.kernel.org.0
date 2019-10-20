Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F490DDF7B
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Oct 2019 18:18:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726482AbfJTQSj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Oct 2019 12:18:39 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:40851 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfJTQSj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Oct 2019 12:18:39 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id x9KGIYP0030051;
        Mon, 21 Oct 2019 01:18:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com x9KGIYP0030051
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1571588315;
        bh=QctcxxPWMqf5XXgvkO77D8RGam01Dbk6TfRZ1jgsDjg=;
        h=From:Date:Subject:To:Cc:From;
        b=PcAi5q8zyvwV3cxht3kYOrF6sVMPRFXcGLTC58oTEMDwn8yZtWEHm35E3m/axQign
         CBxD0VDD9cyRUiC6pUOq9XjnyKTgwP1vEbarvomrb+3oyIzmEwPaPBbzbSelNjYhuw
         mSqNH20NL0kLrNwHr6jUf4wD9V4rB7/7Lma4mJ//cwZKRnJ4Du7c6IU+o9LqNNlOiy
         RSPbyQsmXnf82YAdaBMnDlZeiZYAmKOYuGv72Ubny5FIXjBjzEn6/UNC9QqPITMFIu
         dwa31/8I5tcWyxzjQPR03SgqIu0eD21IT1neEzHcl1YPlgGP/RuEvbagjFXEGy9BAH
         1gc7qAqwZFlLg==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id b1so7274234vsr.10;
        Sun, 20 Oct 2019 09:18:35 -0700 (PDT)
X-Gm-Message-State: APjAAAXu85OGkVDvxskL+T3S2qMPPQyGcclFjV5s9v5tMx/Vcdf5D8CW
        RUY1s9pQCCWC+SuX/7/H28AotikRcj7+zVatRwc=
X-Google-Smtp-Source: APXvYqxsKFsRU8EhjhAh+/8XykBq6cfg9+fs4dKQaeeoN3dZkYYebbS5FZ4MUi0ubulYB+zeplUPM2kgcgpzz17R2ww=
X-Received: by 2002:a67:ff14:: with SMTP id v20mr11026053vsp.215.1571588314216;
 Sun, 20 Oct 2019 09:18:34 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 21 Oct 2019 01:17:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNAScdn6BuvdrVhW=We50f8_618+hh72d2q6rZbSP1u5Abg@mail.gmail.com>
Message-ID: <CAK7LNAScdn6BuvdrVhW=We50f8_618+hh72d2q6rZbSP1u5Abg@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.4-rc4
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

Please pull some Kbuild fixes. Thanks.



The following changes since commit 4f5cafb5cb8471e54afdc9054d973535614f7675:

  Linux 5.4-rc3 (2019-10-13 16:37:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.4-2

for you to fetch changes up to 700dea5a0bea9f64eba89fae7cb2540326fdfdc1:

  kheaders: substituting --sort in archive creation (2019-10-17 09:08:19 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.4 (2nd)

 - fix a bashism of setlocalversion

 - do not use the too new --sort option of tar

----------------------------------------------------------------
Dmitry Goldin (1):
      kheaders: substituting --sort in archive creation

Masahiro Yamada (1):
      kbuild: update comment about KBUILD_ALLDIRS

Randy Dunlap (1):
      scripts: setlocalversion: fix a bashism

 Makefile                |  2 +-
 kernel/gen_kheaders.sh  | 11 +++++++----
 scripts/setlocalversion |  2 +-
 3 files changed, 9 insertions(+), 6 deletions(-)


-- 
Best Regards
Masahiro Yamada
