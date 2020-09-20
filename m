Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18322711F4
	for <lists+linux-kbuild@lfdr.de>; Sun, 20 Sep 2020 06:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgITECT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 20 Sep 2020 00:02:19 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31530 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbgITECT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 20 Sep 2020 00:02:19 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 08K424E7004449;
        Sun, 20 Sep 2020 13:02:04 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 08K424E7004449
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600574525;
        bh=Wa3KUda/n9V5QenLQvNQJmVfwyqNjY1oIGQXeyq+QYg=;
        h=From:Date:Subject:To:Cc:From;
        b=sVDUHyV5vIBU7P+CBdwW0mt8sP0DaIpnLqwuazcTa043CZGCq4yq69ySrzKMMYgdb
         aIgJbd17f3g9Mevt4efEKlCgO3GuziUtyriJ8fZ80BqWi/kqAtaYqs77n9H9m9Jiuu
         Q2rA7G3iERyD6V2U0AqasmindKuAMgBrzZiIIiDjJAJsqtW/Te63sTpDnSDHy8pllz
         xMIe5YJGdgmR1Ohr36UBARJKTii8x6vg25NJWHraGOjqKI0YYQivGL+xoyWQ+Ono4e
         jY5GUE5OD3G5JogbLPBbAy/xxeD9XcG+/q3/WHbhIV18vkWMvaQ1CtFDe+69exWwXO
         kISF0Sk5mYZ/w==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id d19so5159499pld.0;
        Sat, 19 Sep 2020 21:02:04 -0700 (PDT)
X-Gm-Message-State: AOAM531sgMqxaR4XPc4qDRACIedsT2CSIfkcOKlHfRIR76FfJYk4L+Bn
        kR6UIpRDEPpwCp4dr//WZ7/yzUr8X9f80uAs3ow=
X-Google-Smtp-Source: ABdhPJzwj+dAD+WWv6NRA0MG1jdWIK7fmIg9frgpKy2FYGWrXg6STRB0xmbQQY5sLKtT7dxxiMFLCjhAVCT4AmkyaI8=
X-Received: by 2002:a17:90b:360a:: with SMTP id ml10mr18902509pjb.198.1600574523871;
 Sat, 19 Sep 2020 21:02:03 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 20 Sep 2020 13:01:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPTUCWVk=xDr9bv6X+TANOZHfr4YKenP64Mq+sgFTmDw@mail.gmail.com>
Message-ID: <CAK7LNAQPTUCWVk=xDr9bv6X+TANOZHfr4YKenP64Mq+sgFTmDw@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.9-rc6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull more fixes.
Thanks.




The following changes since commit 856deb866d16e29bd65952e0289066f6078af773:

  Linux 5.9-rc5 (2020-09-13 16:06:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.9-3

for you to fetch changes up to a46afd11414758233f23798cc5be51e554d04efe:

  kconfig: qconf: revive help message in the info view (2020-09-20
12:58:54 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.9 (3rd)

 - fix qconf warnings and revive help message

----------------------------------------------------------------
Masahiro Yamada (3):
      kconfig: qconf: use delete[] instead of delete to free array (again)
      kconfig: qconf: fix incomplete type 'struct gstr' warning
      kconfig: qconf: revive help message in the info view

 scripts/kconfig/lkc.h       | 47
++++++++++++++++++++++++++++++-----------------
 scripts/kconfig/lkc_proto.h | 14 --------------
 scripts/kconfig/qconf.cc    | 13 +++++++++----
 3 files changed, 39 insertions(+), 35 deletions(-)


-- 
Best Regards
Masahiro Yamada
