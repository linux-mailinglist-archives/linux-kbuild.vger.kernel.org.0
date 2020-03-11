Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 023F318252E
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Mar 2020 23:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730128AbgCKWvJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Mar 2020 18:51:09 -0400
Received: from conuserg-07.nifty.com ([210.131.2.74]:25403 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729739AbgCKWvJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 18:51:09 -0400
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 02BMokLp002840;
        Thu, 12 Mar 2020 07:50:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 02BMokLp002840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583967046;
        bh=0Vt1nVDrdmNESFwk/471/53biTBdyQDTg17uRdVxnhM=;
        h=From:To:Cc:Subject:Date:From;
        b=cvOVCSDNMpmhRoq5eu9oaBkLCGEw9ndqehD5AXlIbRlPNn6veWT3TnNsPElworQ+U
         5f0oDtfRtCscXt34nYa60hbn0X9EbYiu/XaNTSLtNYJRWgIs8oTjuIoW502xg5o4k4
         NQ2TfFwP3s9kJeE447N3UxDr5v8t4afV5teU0yXTVoYZMmWSAlg2h08MlqME1HxpPQ
         T5kItQkCQjJwQiwufRfK445OC+gT5iyeZ4KzjI0iXSEThJbHYMB1qdy2lkdcQWjZCU
         wqV0IvJFfAz+cQYwl3uI6XB9g3bff//lallgf3jDx9YSrIY5gZBfA2NRDb6WXJ/hQV
         VsrRCSCHz+4Ow==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH] kbuild: fix references to other documents
Date:   Thu, 12 Mar 2020 07:50:44 +0900
Message-Id: <20200311225044.29502-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

All the files in Documentation/kbuild/ were converted to reST.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/kbuild.rst                 | 2 +-
 Documentation/kbuild/kconfig-macro-language.rst | 2 +-
 Documentation/kbuild/makefiles.rst              | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index f1e5dce86af7..510f38d7e78a 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -237,7 +237,7 @@ This is solely useful to speed up test compiles.
 KBUILD_EXTRA_SYMBOLS
 --------------------
 For modules that use symbols from other modules.
-See more details in modules.txt.
+See more details in modules.rst.
 
 ALLSOURCE_ARCHS
 ---------------
diff --git a/Documentation/kbuild/kconfig-macro-language.rst b/Documentation/kbuild/kconfig-macro-language.rst
index 35b3263b7e40..8b413ef9603d 100644
--- a/Documentation/kbuild/kconfig-macro-language.rst
+++ b/Documentation/kbuild/kconfig-macro-language.rst
@@ -44,7 +44,7 @@ intermediate::
             def_bool y
 
 Then, Kconfig moves onto the evaluation stage to resolve inter-symbol
-dependency as explained in kconfig-language.txt.
+dependency as explained in kconfig-language.rst.
 
 
 Variables
diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index 6bc126a14b3d..04d5c01a2e99 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -924,7 +924,7 @@ When kbuild executes, the following steps are followed (roughly):
 	$(KBUILD_AFLAGS_MODULE) is used to add arch-specific options that
 	are used for assembler.
 
-	From commandline AFLAGS_MODULE shall be used (see kbuild.txt).
+	From commandline AFLAGS_MODULE shall be used (see kbuild.rst).
 
     KBUILD_CFLAGS_KERNEL
 	$(CC) options specific for built-in
@@ -937,7 +937,7 @@ When kbuild executes, the following steps are followed (roughly):
 
 	$(KBUILD_CFLAGS_MODULE) is used to add arch-specific options that
 	are used for $(CC).
-	From commandline CFLAGS_MODULE shall be used (see kbuild.txt).
+	From commandline CFLAGS_MODULE shall be used (see kbuild.rst).
 
     KBUILD_LDFLAGS_MODULE
 	Options for $(LD) when linking modules
@@ -945,7 +945,7 @@ When kbuild executes, the following steps are followed (roughly):
 	$(KBUILD_LDFLAGS_MODULE) is used to add arch-specific options
 	used when linking modules. This is often a linker script.
 
-	From commandline LDFLAGS_MODULE shall be used (see kbuild.txt).
+	From commandline LDFLAGS_MODULE shall be used (see kbuild.rst).
 
     KBUILD_LDS
 
-- 
2.17.1

