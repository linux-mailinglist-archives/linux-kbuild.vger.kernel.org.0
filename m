Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46AA388C03
	for <lists+linux-kbuild@lfdr.de>; Sat, 10 Aug 2019 17:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726451AbfHJPyo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 10 Aug 2019 11:54:44 -0400
Received: from conuserg-11.nifty.com ([210.131.2.78]:34528 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726407AbfHJPyo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:44 -0400
Received: from grover.flets-west.jp (softbank126125143222.bbtec.net [126.125.143.222]) (authenticated)
        by conuserg-11.nifty.com with ESMTP id x7AFrG91009713;
        Sun, 11 Aug 2019 00:53:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-11.nifty.com x7AFrG91009713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565452402;
        bh=onIwv+EPa0vqTk5X0M3CLvg0Iqo4Rrn5M+XnMa8Ijkk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VtnhKUHGBT4dINwbjKo6kNYQrELeiwUJgxX5AFtXBdxP37BTxsEekORBVFduJoqm3
         woCF/1iagd3EWNMT9APsRPNF7CvcETCsBQ5LXiemYsUBYqWJy8p+H3bTzWs5FmyZEs
         /aAQJQWl0gdSRyOdrnjRveH6BUImYRiUp4A4qEfxFqsWEA3zUvMfp7BCG8VAQqnOuV
         V0jeVA2NSz0FPanqvxmAzyk/8CIN4lQRNS8muWfxMI4VwoYzoEfGwR+nkrNjfZim20
         YhUFjERsgcWrVjCiR3YG9W/GaGYTytoxSB+dJc2J2uBF3D2ISVpyAHwyE5rUaDCuVP
         vEC+FnK3fxOZw==
X-Nifty-SrcIP: [126.125.143.222]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] kbuild: do not descend to ./Kbuild when cleaning
Date:   Sun, 11 Aug 2019 00:53:02 +0900
Message-Id: <20190810155307.29322-7-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

'make clean' descends into ./Kbuild, but does not clean anything
since everything is added to no-clean-files.

There is no need to descend to ./Kbuild in the first place.
We can drop the no-clean-files assignment.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Kbuild   | 3 ---
 Makefile | 2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Kbuild b/Kbuild
index d40366e967d7..3109ac786e76 100644
--- a/Kbuild
+++ b/Kbuild
@@ -57,6 +57,3 @@ quiet_cmd_atomics = CALL    $<
 
 old-atomics: scripts/atomic/check-atomics.sh FORCE
 	$(call cmd,atomics)
-
-# Keep these three files during make clean
-no-clean-files := $(bounds-file) $(offsets-file) $(timeconst-file)
diff --git a/Makefile b/Makefile
index 86afce391582..3c186f59f152 100644
--- a/Makefile
+++ b/Makefile
@@ -1396,7 +1396,7 @@ DISTCLEAN_FILES += tags TAGS cscope* GPATH GTAGS GRTAGS GSYMS
 #
 clean: rm-dirs  := $(CLEAN_DIRS)
 clean: rm-files := $(CLEAN_FILES)
-clean-dirs      := $(addprefix _clean_, . $(vmlinux-alldirs))
+clean-dirs      := $(addprefix _clean_, $(vmlinux-alldirs))
 
 PHONY += $(clean-dirs) clean archclean vmlinuxclean
 $(clean-dirs):
-- 
2.17.1

