Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06FAF36034D
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 09:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhDOH3F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 03:29:05 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:47809 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231241AbhDOH3F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 03:29:05 -0400
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp [133.32.232.101]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id 13F7REfJ011485;
        Thu, 15 Apr 2021 16:27:14 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 13F7REfJ011485
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1618471635;
        bh=GPI51iMTp+rZjdHBUUd0lGgRwM0zA9q+DXjFrCvC+fM=;
        h=From:To:Cc:Subject:Date:From;
        b=b5nA1iM/Oks6823MlddUQtJ60fJqh3e/lHQ+IuEL9UcsJ7edgt8Kd9WUXbygOBm8/
         Qywn4D8Sz+JAf6Etg9kjAaYc0zmnRqF5hngaGUqRSlsikXOcCVpaGb0WFHzsh++IZx
         VYS8OOM32n5HtG7I+R48CYBEq7VdLea042AsENr3dDS8z4tzIbICXFkcQgRtIFG3wK
         WtmW14nREubsNK+QuYv2aBos5UHXZW1Gif/iXKhIGDmLlAaH61um/yTc1wUvsnbT0B
         eJxihJpeyf5aOfQok/xUAqsgwKeJxFvydr1keFvRz0yhBTYGfX9qIZ51L9UTX3b4ML
         17VQSayRR7Dyg==
X-Nifty-SrcIP: [133.32.232.101]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Janosch Frank <frankja@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [PATCH 1/2] kbuild: remove TMPO from try-run
Date:   Thu, 15 Apr 2021 16:26:59 +0900
Message-Id: <20210415072700.147125-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

TMPO is only used by arch/x86/Makefile.

Change arch/x86/Makefile to use $$TMPO.o and remove TMPO from
scripts/Makefile.compiler.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/x86/Makefile         | 4 ++--
 scripts/Makefile.compiler | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 2d6d5a28c3bf..c55da2833fe8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -129,8 +129,8 @@ ifdef CONFIG_X86_X32
 	x32_ld_ok := $(call try-run,\
 			/bin/echo -e '1: .quad 1b' | \
 			$(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" - && \
-			$(OBJCOPY) -O elf32-x86-64 "$$TMP" "$$TMPO" && \
-			$(LD) -m elf32_x86_64 "$$TMPO" -o "$$TMP",y,n)
+			$(OBJCOPY) -O elf32-x86-64 "$$TMP" "$$TMP.o" && \
+			$(LD) -m elf32_x86_64 "$$TMP.o" -o "$$TMP",y,n)
         ifeq ($(x32_ld_ok),y)
                 CONFIG_X86_X32_ABI := y
                 KBUILD_AFLAGS += -DCONFIG_X86_X32_ABI
diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
index 3f2f3665216f..86ecd2ac874c 100644
--- a/scripts/Makefile.compiler
+++ b/scripts/Makefile.compiler
@@ -21,7 +21,6 @@ TMPOUT = $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/).tmp_$$$$
 # automatically cleaned up.
 try-run = $(shell set -e;		\
 	TMP=$(TMPOUT)/tmp;		\
-	TMPO=$(TMPOUT)/tmp.o;		\
 	mkdir -p $(TMPOUT);		\
 	trap "rm -rf $(TMPOUT)" EXIT;	\
 	if ($(1)) >/dev/null 2>&1;	\
-- 
2.27.0

