Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4CD938D90B
	for <lists+linux-kbuild@lfdr.de>; Sun, 23 May 2021 06:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbhEWE6l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 23 May 2021 00:58:41 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:39497 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230304AbhEWE6l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 23 May 2021 00:58:41 -0400
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 14N4usLE007853;
        Sun, 23 May 2021 13:56:55 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 14N4usLE007853
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621745815;
        bh=IASU2u89nPn2zPq6/24cQQZTdqsTxV/4XCDISiD7udE=;
        h=From:Date:Subject:To:Cc:From;
        b=IvKJox/Nyxnp/Qi6qSCQ7IwHskJWZgGw1OdFlyOBSbN2yz2y/TSYJyjhfFPOa+FS8
         5TEZaL1eOB2NoWC1SQ+asv7VJnH+nkIfkR3NsPkjLuQ/uX8/BCrKB0tLgaPdnA0Fxg
         xaXJvA/mgmx56eqqWFtGoO30hD1bMqW5WUeZ6YbEb/EcnX+kW3FfAGSavMlygBeA8s
         4oEZmdaL6IAWQgNdByccw47pShDeKb1l11cfRJ6umJjXxPx2fYcpGgaUlrM06fuQkz
         UhHSTKqHnkhmv6p9g/mQnQb3BrRXdLRPr/M+WmLD18m2wRUfPzKIjdFKj5ytgAheFb
         uOWsQtv7Dq3yg==
X-Nifty-SrcIP: [209.85.215.174]
Received: by mail-pg1-f174.google.com with SMTP id j12so17602877pgh.7;
        Sat, 22 May 2021 21:56:55 -0700 (PDT)
X-Gm-Message-State: AOAM5300NxSBy2HFUmNKsKFpFqbXTD6295PBUldJaLteQBtAB7V9yF3S
        5yNkv1lT84Sz4BCrWkb39qyGQ45ZR4v432ZUXtw=
X-Google-Smtp-Source: ABdhPJwrPEVAHEZjrKKE8UFFyeC6HbS8hrdTXqkHJRD8OTA2/FdPREagD1/CH5cYRYz42bf2PiB5ajf2EXdXKFlBki0=
X-Received: by 2002:a62:ab14:0:b029:2db:b3d9:1709 with SMTP id
 p20-20020a62ab140000b02902dbb3d91709mr17830604pff.80.1621745814487; Sat, 22
 May 2021 21:56:54 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 23 May 2021 13:56:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ-fcQGRFEAeQazDdi+Aq3+4FLDpuFotmMaSx0L9qAk5g@mail.gmail.com>
Message-ID: <CAK7LNAQ-fcQGRFEAeQazDdi+Aq3+4FLDpuFotmMaSx0L9qAk5g@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.13-rc3
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Linus,

Please pull some Kbuild fixes.
Thanks.


The following changes since commit d07f6ca923ea0927a1024dfccafc5b53b61cfecc=
:

  Linux 5.13-rc2 (2021-05-16 15:27:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.13

for you to fetch changes up to c93db682cfb213501881072a9200a48ce1dc3c3f:

  kbuild: dummy-tools: adjust to stricter stackprotector check
(2021-05-17 12:10:03 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.13

 - Fix short log indentation for tools builds

 - Fix dummy-tools to adjust to the latest stackprotector check

----------------------------------------------------------------
Jonathan Neusch=C3=A4fer (1):
      scripts/jobserver-exec: Fix a typo ("envirnoment")

Kees Cook (1):
      tools build: Fix quiet cmd indentation

Michal Kubecek (1):
      kbuild: dummy-tools: adjust to stricter stackprotector check

 scripts/dummy-tools/gcc        |  6 +++++-
 scripts/jobserver-exec         |  2 +-
 tools/build/Makefile.build     | 22 +++++++++++-----------
 tools/scripts/Makefile.include | 30 +++++++++++++++---------------
 4 files changed, 32 insertions(+), 28 deletions(-)


--=20
Best Regards
Masahiro Yamada
