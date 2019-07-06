Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD116122D
	for <lists+linux-kbuild@lfdr.de>; Sat,  6 Jul 2019 18:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfGFQ0P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 6 Jul 2019 12:26:15 -0400
Received: from conuserg-12.nifty.com ([210.131.2.79]:38596 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726522AbfGFQ0P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 Jul 2019 12:26:15 -0400
Received: from grover.flets-west.jp (softbank126026094249.bbtec.net [126.26.94.249]) (authenticated)
        by conuserg-12.nifty.com with ESMTP id x66GPBsN009054;
        Sun, 7 Jul 2019 01:25:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com x66GPBsN009054
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1562430312;
        bh=X6cih5B3K2ei50R7X1Bl4X3Q5BgxxbeaDmtWdcAgytM=;
        h=From:To:Cc:Subject:Date:From;
        b=GB2BXtfeXIx3aQHmtoCkIutsS3zwmBEq76NmgPcHEhZBjOWNsBx2L+MziWBruk7NH
         12ywrIxdo1fWios7cK8sjwd0UcIavrJqfw1HRhuPnGtGL0Dk3Xc+Fwq88Nw20C4AJM
         T3yK6L3q45/MHsST+jLPn92s+jTCCyJQxU1XpzrFDoLZa811vkAnYnWzKqAKTnOnfG
         /VRtJUTpCa3x1YjZkjS9nAwXs8gc46wXmCoeN+0fi9AlIn76WhUv1LKddhuZnq0HDE
         RZ4Jm9tyYElZ4EbvVaz/x7dcXHWVe8EFyLzM22SKj4ty55VOIsRLAX6e6IbG591SEs
         zqqouvEgQRy/w==
X-Nifty-SrcIP: [126.26.94.249]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v2] kbuild: get rid of misleading $(AS) from documents
Date:   Sun,  7 Jul 2019 01:25:08 +0900
Message-Id: <20190706162508.8529-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The assembler files in the kernel are *.S instead of *.s, so they must
be preprocessed. Since 'as' of GNU binutils is not able to preprocess,
we always use $(CC) as an assembler driver.

$(AS) is almost unused in Kbuild. As of writing, there is just one place
that directly invokes $(AS).

  $ git grep -e '$(AS)' -e '${AS}' -e '$AS' -e '$(AS:' -e '${AS:' -- :^Documentation
  drivers/net/wan/Makefile:  AS68K = $(AS)

The documentation about *_AFLAGS* sounds like the flags were passed
to $(AS). This is somewhat misleading.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
---

Changes in v2:
  - Rephrase without using "assembling"

 Documentation/kbuild/kbuild.txt    |  5 ++---
 Documentation/kbuild/makefiles.txt | 12 ++++++------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 9c230ea71963..2c6188abb213 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -31,12 +31,11 @@ Additional options to the assembler (for built-in and modules).
 
 AFLAGS_MODULE
 --------------------------------------------------
-Additional module specific options to use for $(AS).
+Additional assembler options for modules.
 
 AFLAGS_KERNEL
 --------------------------------------------------
-Additional options for $(AS) when used for assembler
-code for code that is compiled as built-in.
+Additional assembler options for built-in.
 
 KCFLAGS
 --------------------------------------------------
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index d65ad5746f94..895bbbf38a0c 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -306,7 +306,7 @@ more details, with real examples.
 	variable $(KBUILD_CFLAGS) and uses it for compilation flags for the
 	entire tree.
 
-	asflags-y specifies options for assembling with $(AS).
+	asflags-y specifies assembler options.
 
 	Example:
 		#arch/sparc/kernel/Makefile
@@ -441,7 +441,7 @@ more details, with real examples.
 	as-instr checks if the assembler reports a specific instruction
 	and then outputs either option1 or option2
 	C escapes are supported in the test instruction
-	Note: as-instr-option uses KBUILD_AFLAGS for $(AS) options
+	Note: as-instr-option uses KBUILD_AFLAGS for assembler options
 
     cc-option
 	cc-option is used to check if $(CC) supports a given option, and if
@@ -814,7 +814,7 @@ When kbuild executes, the following steps are followed (roughly):
 	In this example, the binary $(obj)/image is a binary version of
 	vmlinux. The usage of $(call if_changed,xxx) will be described later.
 
-    KBUILD_AFLAGS		$(AS) assembler flags
+    KBUILD_AFLAGS		assembler flags
 
 	Default value - see top level Makefile
 	Append or modify as required per architecture.
@@ -853,15 +853,15 @@ When kbuild executes, the following steps are followed (roughly):
 	The first example utilises the trick that a config option expands
 	to 'y' when selected.
 
-    KBUILD_AFLAGS_KERNEL	$(AS) options specific for built-in
+    KBUILD_AFLAGS_KERNEL	Assembler options specific for built-in
 
 	$(KBUILD_AFLAGS_KERNEL) contains extra C compiler flags used to compile
 	resident kernel code.
 
-    KBUILD_AFLAGS_MODULE   Options for $(AS) when building modules
+    KBUILD_AFLAGS_MODULE   Assembler options specific for modules
 
 	$(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
-	are used for $(AS).
+	are used for assembler.
 	From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
 
     KBUILD_CFLAGS_KERNEL	$(CC) options specific for built-in
-- 
2.17.1

