Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 169D159035
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Jun 2019 04:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbfF1CGP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 27 Jun 2019 22:06:15 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:58777 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725770AbfF1CGP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Jun 2019 22:06:15 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id x5S24bLt004905;
        Fri, 28 Jun 2019 11:04:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x5S24bLt004905
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1561687479;
        bh=yjzub9I4CsKXLSVnhexVECUsjlcS8Xskdwg+YsVHiTs=;
        h=From:To:Cc:Subject:Date:From;
        b=f9i63ToXZF6WKlaT5nMAm7ALq+7kZeHOKPTmzXC1eWQPWP/qlEO1mYUJvoS5Z2H+F
         YnPDFA4qjbN5T2kxl+BubSe5kaE9WiEL3xUbfQUdIeDHPL3a01IJm5gTpr9oj9vpnZ
         81vKm+2TuMUy4OW1A9prEPWQXKqnh6ay8PxZE+/TrvhDZg2NUJJtf2aOw9UhYfTm1P
         +zy+r3hGML1VjgbI2hShAuONiN39xZdHQBFzpQgcmDCdlet67xZ2aVNqkru8iXZgPn
         bImL8vmbrj2lUUvlQDarblWlPXAW//lyDmfUvXCo6zRTQAOBGv/PP0Kc3LNYQsfLs2
         RSIeAuWVo6W9A==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
To:     linux-kbuild@vger.kernel.org
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH] kbuild: get rid of misleading $(AS) from documents
Date:   Fri, 28 Jun 2019 11:04:33 +0900
Message-Id: <20190628020433.19156-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The assembler files in the kernel are *.S instead of *.s, so they must
be preprocessed. Hence, we always use $(CC) as an assembler driver.

$(AS) is almost unused in Kbuild. As of writing, there is just one user.

  $ git grep '$(AS)' -- :^Documentation
  drivers/net/wan/Makefile:  AS68K = $(AS)

The documentation about *_AFLAGS* sounds like the flags were passed
to $(AS). This is somewhat misleading since we do not invoke $(AS)
directly.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Documentation/kbuild/kbuild.txt    |  5 ++---
 Documentation/kbuild/makefiles.txt | 12 ++++++------
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 9c230ea71963..7a7e2aa2fab5 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -31,12 +31,11 @@ Additional options to the assembler (for built-in and modules).
 
 AFLAGS_MODULE
 --------------------------------------------------
-Additional module specific options to use for $(AS).
+Additional module specific options to use for assembler.
 
 AFLAGS_KERNEL
 --------------------------------------------------
-Additional options for $(AS) when used for assembler
-code for code that is compiled as built-in.
+Additional options when used for assembling code that is compiled as built-in.
 
 KCFLAGS
 --------------------------------------------------
diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index d65ad5746f94..f0b3a30b985d 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -306,7 +306,7 @@ more details, with real examples.
 	variable $(KBUILD_CFLAGS) and uses it for compilation flags for the
 	entire tree.
 
-	asflags-y specifies options for assembling with $(AS).
+	asflags-y specifies options for assembling.
 
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
+    KBUILD_AFLAGS_KERNEL	assembler options specific for built-in
 
 	$(KBUILD_AFLAGS_KERNEL) contains extra C compiler flags used to compile
 	resident kernel code.
 
-    KBUILD_AFLAGS_MODULE   Options for $(AS) when building modules
+    KBUILD_AFLAGS_MODULE   Options for assembler when building modules
 
 	$(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
-	are used for $(AS).
+	are used for assembler.
 	From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
 
     KBUILD_CFLAGS_KERNEL	$(CC) options specific for built-in
-- 
2.17.1

