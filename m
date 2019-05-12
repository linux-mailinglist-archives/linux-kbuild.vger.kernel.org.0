Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F272A1A9FD
	for <lists+linux-kbuild@lfdr.de>; Sun, 12 May 2019 04:14:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfELCOG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 11 May 2019 22:14:06 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:42085 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726128AbfELCOF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 May 2019 22:14:05 -0400
Received: from grover.flets-west.jp (softbank126125154139.bbtec.net [126.125.154.139]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x4C2Du0v027760;
        Sun, 12 May 2019 11:13:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x4C2Du0v027760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1557627236;
        bh=HT7N5KQynOISRob2nuhdaPV2dSqCV0OywG41XQ0vP2I=;
        h=From:To:Cc:Subject:Date:From;
        b=jOFtMHrZ+Asp8XqMopIcuYEZaGneI6siKLcl/FmuXUBKAMAZtFlhWzz6o5XNYJ28r
         8FO8AyAHghhxmDXzPisJY56udfj44pyeXg9pCp78GFFmAvftwFvwoU4R8OTkQe2//c
         6r25S2j0AhMcX+uWPJ5rKifZApH4e8jAZBLKukKEhpVsHlzJLsuX8UY+tOUf1R5y7b
         iibDms3yVxl2Z6CiJObMKXfgLGa6QT1OG0CE29eA1pN8OD7JUQN9e8gkh+WFvG7u/d
         roG62hPHufaroyQHEJ/Wn7P+EaxUKpXm0XgN9TCsJrfv6ClGxjHdOPTRgXNM4mi2CV
         6BJAwq+6sN8dg==
X-Nifty-SrcIP: [126.125.154.139]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: turn auto.conf.cmd into a mandatory include file
Date:   Sun, 12 May 2019 11:13:48 +0900
Message-Id: <1557627228-28896-1-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

syncconfig is responsible for keeping auto.conf up-to-date, so if it
fails for any reason, the build must be terminated immediately.

However, since commit 9390dff66a52 ("kbuild: invoke syncconfig if
include/config/auto.conf.cmd is missing"), Kbuild continues running
even after syncconfig fails.

You can confirm this by intentionally making syncconfig error out:

  diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
  index 08ba146..307b9de 100644
  --- a/scripts/kconfig/confdata.c
  +++ b/scripts/kconfig/confdata.c
  @@ -1023,6 +1023,9 @@ int conf_write_autoconf(int overwrite)
          FILE *out, *tristate, *out_h;
          int i;

  +       if (overwrite)
  +               return 1;
  +
          if (!overwrite && is_present(autoconf_name))
                  return 0;

Then, syncconfig fails, but Make would not stop:

  $ make -s mrproper allyesconfig defconfig
  $ make
  scripts/kconfig/conf  --syncconfig Kconfig

  *** Error during sync of the configuration.

  make[2]: *** [scripts/kconfig/Makefile;69: syncconfig] Error 1
  make[1]: *** [Makefile;557: syncconfig] Error 2
  make: *** [include/config/auto.conf.cmd] Deleting file 'include/config/tristate.conf'
  make: Failed to remake makefile 'include/config/auto.conf'.
    SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
    SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
    SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
    SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  [ continue running ... ]

The reason is in the behavior of the pattern rule with multi-targets.

  %/auto.conf %/auto.conf.cmd %/tristate.conf: $(KCONFIG_CONFIG)
          $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig

GNU Make knows this rule is responsible for making all the three target
files simultaneously. As far as exampled, the target in question when
this rule is invoked is auto.conf.cmd probably because it is included
(line 654) below the inclusion of auto.conf (line 603).

The inclusion of auto.conf is mandatory, while that of auto.conf.cmd
is optional. GNU Make does not care about the failure during updating
optional include files.

I filed this issue (https://savannah.gnu.org/bugs/?56301) in case this
behavior could be improved somehow. Anyway, it is quite easy to fix
our Makefile.

Given that auto.conf is already a mandatory include file, there is no
reason to stick auto.conf.cmd optional. Make it mandatory as well.

Fixes: 9390dff66a52 ("kbuild: invoke syncconfig if include/config/auto.conf.cmd is missing")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 3b93010..9542165 100644
--- a/Makefile
+++ b/Makefile
@@ -651,7 +651,7 @@ ifeq ($(may-sync-config),1)
 # Read in dependencies to all Kconfig* files, make sure to run syncconfig if
 # changes are detected. This should be included after arch/$(SRCARCH)/Makefile
 # because some architectures define CROSS_COMPILE there.
--include include/config/auto.conf.cmd
+include include/config/auto.conf.cmd
 
 $(KCONFIG_CONFIG):
 	@echo >&2 '***'
-- 
2.7.4

