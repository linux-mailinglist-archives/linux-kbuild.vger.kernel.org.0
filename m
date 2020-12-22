Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A80712E0D8C
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Dec 2020 17:50:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727084AbgLVQtk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Dec 2020 11:49:40 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:64881 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727844AbgLVQtj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Dec 2020 11:49:39 -0500
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 0BMGmWT5023148;
        Wed, 23 Dec 2020 01:48:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 0BMGmWT5023148
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608655712;
        bh=x1tnfiPN6W9cdaNaJK7MVlfRuAUdVikoJdzn1wAK29o=;
        h=From:Date:Subject:To:Cc:From;
        b=o6B9KWk/rG3OUBmqOFk6cCHhoMnWt/9ZIIo/sXSvkRJ2Iu4jLRmUjmihkDsMmXsd5
         sJpNcyIjLGA/oxnXeQNRxgOrSrwvQc9cdBdR9pPzP12Gzq4yXCgKbAUAT0gdkpG0G0
         1JvLsn/MSGJ/UkKRX4Ry6rXQVCzI6z/EZNnXb4GpwpxyDOi8OumVuPWvtS0MKB0UOa
         EVZzoMMD9sbg5H3fJ2t2xAjcHOsFjnHUqTfk46A9Ft6VBS/CsPfLymyX1urln+yThO
         Xahi48ZfF9u2XkHSwLY05IYZ0F9xvmrby/rZqqZ65xuofA4K6XUekUL3q4rsItnRWL
         uiRO0+LJfXVgA==
X-Nifty-SrcIP: [209.85.215.173]
Received: by mail-pg1-f173.google.com with SMTP id c22so8698638pgg.13;
        Tue, 22 Dec 2020 08:48:32 -0800 (PST)
X-Gm-Message-State: AOAM531BiJM8tODrFaNuF3hVmGtE/rPgVhhNPTKYOWijzoQ7WSyHqORC
        ig8p1w1zq0bAzUb+fbV2vHmamINhZ8Yuz66Rbpk=
X-Google-Smtp-Source: ABdhPJzSD1x01p8O0z31C8Yw5wXyLGj88hxzkl7jYf8K3AqQd3CUANznU3IYBcVvSvGUZgCG524xGgtwgGIbB9gkIGU=
X-Received: by 2002:a62:d142:0:b029:19e:62a0:ca1a with SMTP id
 t2-20020a62d1420000b029019e62a0ca1amr20393091pfl.80.1608655711782; Tue, 22
 Dec 2020 08:48:31 -0800 (PST)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 23 Dec 2020 01:47:55 +0900
X-Gmail-Original-Message-ID: <CAK7LNARRsx+bTOW+y-u8z91NvBZfC9HMbB0i1if+SbjMh=vNpA@mail.gmail.com>
Message-ID: <CAK7LNARRsx+bTOW+y-u8z91NvBZfC9HMbB0i1if+SbjMh=vNpA@mail.gmail.com>
Subject: [GIT PULL 2/2] Kconfig updates for v5.11-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull Kconfig updates for v5.11
Thanks.


The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:

  Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kconfig-v5.11

for you to fetch changes up to 90d39628ac799e93c0f7a56763eed5029632f1ba:

  kconfig: doc: fix $(fileno) to $(filename) (2020-12-21 16:01:44 +0900)

----------------------------------------------------------------
Kconfig updates for v5.11

 - Support only Qt5 for qconf

 - Validate signal/slot connection at compile time of qconf

 - Sanitize header includes

----------------------------------------------------------------
Boris Kolpackov (2):
      kconfig: make lkc.h self-sufficient #include-wise
      kconfig: clean up header inclusion

Masahiro Yamada (6):
      kconfig: qconf: drop Qt4 support
      kconfig: qconf: use a variable to pass packages to pkg-config
      kconfig: qconf: convert to Qt5 new signal/slot connection syntax
      kconfig: qconf: show Qt version in the About dialog
      kconfig: fix return value of do_error_if()
      kconfig: doc: fix $(fileno) to $(filename)

 Documentation/kbuild/kconfig-macro-language.rst |   2 +-
 scripts/kconfig/conf.c                          |   1 -
 scripts/kconfig/confdata.c                      |   1 +
 scripts/kconfig/lexer.l                         |   1 -
 scripts/kconfig/lkc.h                           |   4 +
 scripts/kconfig/preprocess.c                    |   2 +-
 scripts/kconfig/qconf-cfg.sh                    |  14 +--
 scripts/kconfig/qconf.cc                        | 145 +++++++++++++---------
 scripts/kconfig/symbol.c                        |   2 +-
 9 files changed, 95 insertions(+), 77 deletions(-)

-- 
Best Regards
Masahiro Yamada
