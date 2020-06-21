Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89488202BAE
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Jun 2020 19:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730441AbgFURHx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Jun 2020 13:07:53 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:46949 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730425AbgFURHw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Jun 2020 13:07:52 -0400
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 05LH7ZBL016733;
        Mon, 22 Jun 2020 02:07:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 05LH7ZBL016733
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592759255;
        bh=dmolLOJlywaSglqxknwfQfBBia1cZw0OJiADvj1SeMs=;
        h=From:Date:Subject:To:Cc:From;
        b=MBzXXcrLrAiDeNTIKiYsWrYI87IISkEwSp3QHKYC/0mqxcR9yj3zhlK0LgXMfCVWR
         7p06waEXKi+SdE7QtvP2RNFhPMguM0UpJKCeGPNijiSRZGNNkuVwPS+Lh04tNNZDRc
         HhEOB6YUCB+Ko3Ak0Cc87QyQeL0qa6M5uFGukTJJ7iHKBp/G3Rm6QNFrQiQBimgI0/
         feLC2nrMRTKC+0UPkcw3hxwUJbh0b4PbSq2Zl5o8kddnStPZpDyUAELYhItbQ0ecEB
         OlhRecOD0qm8MXNDw0TWT4tat8d8C5L7ZNqI0h9MXlAWSoYg2oCg9rSDUQDD+PuEwu
         cXTc04M0z36Vg==
X-Nifty-SrcIP: [209.85.221.178]
Received: by mail-vk1-f178.google.com with SMTP id d64so725152vke.4;
        Sun, 21 Jun 2020 10:07:35 -0700 (PDT)
X-Gm-Message-State: AOAM530S9u2UgYIe/S6n2mmSCTSqkgXPBwH6KqzIyCYA2i113ZA5Cwyf
        c8A8L/954zTmi4QiMWaXCOhFiSuW/WBfLFJLVdQ=
X-Google-Smtp-Source: ABdhPJwCjNvV1CWA0AKd+GVzhV18wBBaQLvcb9cCOVwlmW3uoBWAIjGM3sjS2sQ60W0/M6wen/dXyhKKYNGK51kzk+o=
X-Received: by 2002:ac5:c94e:: with SMTP id s14mr529044vkm.96.1592759254302;
 Sun, 21 Jun 2020 10:07:34 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 22 Jun 2020 02:06:58 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT6C26gEHyT17cwHkvjx3NgvjtuFuuhqYWwH5fSz7R6wA@mail.gmail.com>
Message-ID: <CAK7LNAT6C26gEHyT17cwHkvjx3NgvjtuFuuhqYWwH5fSz7R6wA@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.8-rc2
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


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.8

for you to fetch changes up to 214377e9b7e3185abf5998b8a90450e01bab21a7:

  samples: watch_queue: build sample program for target architecture
(2020-06-22 01:56:09 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.8

 - fix -gz=zlib compiler option test for CONFIG_DEBUG_INFO_COMPRESSED

 - improve cc-option in scripts/Kbuild.include to clean up temp files

 - improve cc-option in scripts/Kconfig.include for more reliable compile
   option test

 - do not copy modules.builtin by 'make install' because it would break
   existing systems

 - use 'userprogs' syntax for watch_queue sample

----------------------------------------------------------------
Arvind Sankar (1):
      Makefile: Improve compressed debug info support detection

Masahiro Yamada (4):
      kbuild: improve cc-option to clean up all temporary files
      kconfig: unify cc-option and as-option
      Revert "Makefile: install modules.builtin even if CONFIG_MODULES=n"
      samples: watch_queue: build sample program for target architecture

Masanari Iida (1):
      scripts: Fix typo in headers_install.sh

 Makefile                     | 16 ++++------------
 arch/arm64/Kconfig           |  2 +-
 lib/Kconfig.debug            |  1 -
 samples/Kconfig              |  2 +-
 samples/watch_queue/Makefile | 10 ++++------
 scripts/Kbuild.include       | 11 ++++++-----
 scripts/Kconfig.include      |  8 +-------
 scripts/headers_install.sh   |  2 +-
 8 files changed, 18 insertions(+), 34 deletions(-)


--
Best Regards
Masahiro Yamada
