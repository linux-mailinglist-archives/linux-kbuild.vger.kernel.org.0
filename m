Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A04F390B1
	for <lists+linux-kbuild@lfdr.de>; Fri,  7 Jun 2019 17:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731637AbfFGPxp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 7 Jun 2019 11:53:45 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:60736 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731635AbfFGPxo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Jun 2019 11:53:44 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x57FrX3q006174;
        Sat, 8 Jun 2019 00:53:33 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x57FrX3q006174
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1559922813;
        bh=dRixWfLZ7SzgcepcHFcC37ckogGIK76yARpWp2NLO9o=;
        h=From:Date:Subject:To:Cc:From;
        b=fjJ0UvNMrIc0crb412Fdm6ENuLvowMAwXj/pRw6DhDw0p6JbYZXnHG6MLsI4sTWmj
         FlxaWCsUhv8QzmbpCdS3BkEjq+xHDPS0lvH5VLcTmRiuKTkK7/ktSD+eIWAjarQmvY
         OO6DKtoEpv+tyE5TURRv26M7HYnDCYE2UeGOvWC52QKWTgJIy9Av6+PbNXwde1TRyl
         xMGbjWJgznSAAsTrIIbeoUK2g4Eu7NUxACRV1gzwmfBAEVAUNmhTSzTvi4UjhAxWz8
         QZ/qfGMLNb3J91GR0cmPKrcJ8dsUzo8BtRDvGuZM0/Z4zGKqCfrf+LOMnAQjbFlyks
         DFP2jDcD8yuug==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id c24so1431486vsp.7;
        Fri, 07 Jun 2019 08:53:33 -0700 (PDT)
X-Gm-Message-State: APjAAAV+9Uw76SB1ZQAUVg6dRjfqGJEL3Nz4V9jDvnrCDFmaXBF+VHrj
        B2itRNBhUBmf6pVS0UpnDSv7Hd/PW0jOEKvaC/c=
X-Google-Smtp-Source: APXvYqy59eu7M81YqfHo3Tzr2QVpEsq2twQ88Qqs3e3wKUfg6+Eny6o+8BA34I/XUFvrWrqsI4PuLMTJ8Cih8y6PzKI=
X-Received: by 2002:a67:ed04:: with SMTP id l4mr10531967vsp.179.1559922812584;
 Fri, 07 Jun 2019 08:53:32 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 8 Jun 2019 00:52:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQZ2FAZcc367eCPqhwYRVvP+65hDa5hx6qfTwh2qVGL=w@mail.gmail.com>
Message-ID: <CAK7LNAQZ2FAZcc367eCPqhwYRVvP+65hDa5hx6qfTwh2qVGL=w@mail.gmail.com>
Subject: [GIT PULL] Kbuild fixes for v5.2-rc4
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        masahiroy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

Please pull some Kbuild fixes.
Thanks.



The following changes since commit f2c7c76c5d0a443053e94adb9f0918fa2fb85c3a:

  Linux 5.2-rc3 (2019-06-02 13:55:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
tags/kbuild-fixes-v5.2-2

for you to fetch changes up to 913ab9780fc021298949cc5514d6255a008e69f9:

  kbuild: use more portable 'command -v' for cc-cross-prefix
(2019-06-08 00:38:47 +0900)

----------------------------------------------------------------
Kbuild fixes for v5.2 (2nd)

 - fix kselftest-merge to find config fragments in deeper directories

 - fix kconfig unit test, which was broken by SPDX tag addition

 - add + prefix to buildtar to suppress jobserver unavailable warning

 - fix checkstack.pl to recognize arch=arm64

 - suppress noisy warning from cc-cross-prefix

----------------------------------------------------------------
Dan Rue (1):
      kbuild: teach kselftest-merge to find nested config files

George G. Davis (1):
      scripts/checkstack.pl: Fix arm64 wrong or unknown architecture

Masahiro Yamada (2):
      kconfig: tests: fix recursive inclusion unit test
      kbuild: use more portable 'command -v' for cc-cross-prefix

Trevor Bourget (1):
      kbuild: tar-pkg: enable communication with jobserver

 Makefile                                                | 5 ++---
 scripts/Kbuild.include                                  | 7 ++++++-
 scripts/checkstack.pl                                   | 2 +-
 scripts/kconfig/tests/err_recursive_inc/expected_stderr | 6 +++---
 scripts/package/Makefile                                | 2 +-
 5 files changed, 13 insertions(+), 9 deletions(-)


-- 
Best Regards
Masahiro Yamada
