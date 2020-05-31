Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17F801E96DC
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 May 2020 12:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726020AbgEaKMC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 May 2020 06:12:02 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:36506 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbgEaKMC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 May 2020 06:12:02 -0400
Received: from oscar.flets-west.jp (softbank126090202047.bbtec.net [126.90.202.47]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 04VABfDR010453;
        Sun, 31 May 2020 19:11:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 04VABfDR010453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590919902;
        bh=ewa6uoVN/7XPJ9nxxDkwaDkeF2aAIK7To8jlJxfmg1Y=;
        h=From:To:Cc:Subject:Date:From;
        b=Pdqd8TbRy2QSRQpK9KXTpvQ2DgVGpmCUSIHo88L5k/hpxkcE+CEAzIqzDsOyuGbm/
         nttfDZyYFbcHpWbzKqgv2Uko2nrOacgW2R1yk+iNXfgJgsFI8lb2ZYyZByNyCyDGnD
         nvUU5fXkI4D9ozCXe2s1NxwwdZe6IRxNIic0ysg5wdlLWJ658eGKFBNDxrcov2svzj
         IstfmcvO1nyr863bU/74dSpSWZ/wpkfL8J8MyZl2DP9zg1yGG/Yilwfqd/sP4eQstf
         aIhjH34M41zqlbVHWqDPzGsoY86KAiJEEhFUzs4AdT/WIYPSE2KWq0MjMGha4bQJ4K
         /5sG5mRQtRnAw==
X-Nifty-SrcIP: [126.90.202.47]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: merge two 'ifdef CONFIG_TRIM_UNUSED_KSYMS' blocks
Date:   Sun, 31 May 2020 19:11:39 +0900
Message-Id: <20200531101139.1242928-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This hunk has two 'ifdef CONFIG_TRIM_UNUSED_KSYMS ... endif' blocks
with no other code interleaved. Merge them.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index b856f84e28c9..44921d9cf3cf 100644
--- a/Makefile
+++ b/Makefile
@@ -1098,16 +1098,14 @@ vmlinux-deps := $(KBUILD_LDS) $(KBUILD_VMLINUX_OBJS) $(KBUILD_VMLINUX_LIBS)
 # Recurse until adjust_autoksyms.sh is satisfied
 PHONY += autoksyms_recursive
 ifdef CONFIG_TRIM_UNUSED_KSYMS
-autoksyms_recursive: descend modules.order
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
-	  "$(MAKE) -f $(srctree)/Makefile vmlinux"
-endif
-
 # For the kernel to actually contain only the needed exported symbols,
 # we have to build modules as well to determine what those symbols are.
 # (this can be evaluated only once include/config/auto.conf has been included)
-ifdef CONFIG_TRIM_UNUSED_KSYMS
-  KBUILD_MODULES := 1
+KBUILD_MODULES := 1
+
+autoksyms_recursive: descend modules.order
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh \
+	  "$(MAKE) -f $(srctree)/Makefile vmlinux"
 endif
 
 autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
-- 
2.25.1

