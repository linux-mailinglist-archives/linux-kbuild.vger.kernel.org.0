Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CE72245799
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Aug 2020 14:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgHPMdG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 Aug 2020 08:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726389AbgHPMdD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Aug 2020 08:33:03 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 920C1C061786;
        Sun, 16 Aug 2020 05:33:01 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g8so11119074wmk.3;
        Sun, 16 Aug 2020 05:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MfCToj5fbHI7JRT/feY7+qoIZofsnRKXYm4oWvFRch4=;
        b=HAuYll2nnzgU1Tfo7xD18oUdMvsHaPU6eKUbwXNzPm/QUlmzMMWood1PHXqnbFx2Cz
         9zLLodjcx04CfDTkmmUGonOBO1KdFagbBc9xCq8aEHtT6TaKHTEZiDauWNnuOsaf7azg
         0K+BMP4grebvKJ1hIhbwVlOXI6C1PmDfGAMBv3a4ixRTDO/R0y9JmrUXM1y4dcOWQ1Je
         BkCFs9vquwMP0M+r5anjTKQbNbClByAstk5N7SbNW5M3HfaPZ0fBKBpgtf1rwXg5Po/Q
         1vt20yv1oFC4OIK+kaC2VjtgJ1FYJnMjJv6rMYWd7XwYko04u+Mw5TGsxD6UPozYHPju
         LS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MfCToj5fbHI7JRT/feY7+qoIZofsnRKXYm4oWvFRch4=;
        b=V13WyxWPfEE54KromkizstONoSK+AhgIbh250tGiyFqVEYbhH2nhDheV2pkOU7XzsV
         c653/rIjsWrY5qn8lZT2Rb6Ii1C4KZ+lh51CRrHnZgu3CsdgT6hbKVdeAhjEOfvf66HS
         Ug1CkRZ6NrP7lgiyxywmLxKo0Ih9mGOUD29Ey/JtZWGD7Ovsc6VBG96k9bIlV7DJcHG3
         am/w0x+S0agDDor0shWZuKbQyIMk7G1aA3j61KiJXnneLcwlqNqXFjIJc/qTjiL4QTmE
         GRkm0nRrl8EO4C4jF7HVWMhtcf8V8cSCGVu4FFptg+7H/n9PY9TIu656pppVqT0i6F/O
         20Yw==
X-Gm-Message-State: AOAM533YplcXglHPeVJiM1TPjnJYJJxhrhkRHhGhQP1s9+BGx4GUqxSc
        T8tyIwjDHJV7NUUEVsimxMs=
X-Google-Smtp-Source: ABdhPJxLoC9lFKgiyLxbjUbz3yk6gT7ft+gGuse8oAgP4890Msgi7dHR2dr8183b1N5iblKh47yz4A==
X-Received: by 2002:a1c:a54e:: with SMTP id o75mr11015587wme.181.1597581180276;
        Sun, 16 Aug 2020 05:33:00 -0700 (PDT)
Received: from localhost.localdomain ([46.114.106.58])
        by smtp.gmail.com with ESMTPSA id 111sm26304515wrc.53.2020.08.16.05.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2020 05:32:59 -0700 (PDT)
From:   Sedat Dilek <sedat.dilek@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH] kbuild: Simplify DEBUG_INFO Kconfig handling
Date:   Sun, 16 Aug 2020 14:32:44 +0200
Message-Id: <20200816123248.97770-1-sedat.dilek@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

While playing with [1] I saw that the handling
of CONFIG_DEBUG_INFO can be simplified.

[1] https://patchwork.kernel.org/patch/11716107/

Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
---
 Makefile          |  6 +++++-
 lib/Kconfig.debug | 10 ++++------
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/Makefile b/Makefile
index 24a4c1b97bb0..f7af83393a49 100644
--- a/Makefile
+++ b/Makefile
@@ -810,13 +810,15 @@ endif
 DEBUG_CFLAGS	:= $(call cc-option, -fno-var-tracking-assignments)
 
 ifdef CONFIG_DEBUG_INFO
+
 ifdef CONFIG_DEBUG_INFO_SPLIT
 DEBUG_CFLAGS	+= -gsplit-dwarf
 else
 DEBUG_CFLAGS	+= -g
 endif
+
 KBUILD_AFLAGS	+= -Wa,-gdwarf-2
-endif
+
 ifdef CONFIG_DEBUG_INFO_DWARF4
 DEBUG_CFLAGS	+= -gdwarf-4
 endif
@@ -832,6 +834,8 @@ KBUILD_AFLAGS	+= -gz=zlib
 KBUILD_LDFLAGS	+= --compress-debug-sections=zlib
 endif
 
+endif # CONFIG_DEBUG_INFO
+
 KBUILD_CFLAGS += $(DEBUG_CFLAGS)
 export DEBUG_CFLAGS
 
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ad9210d70a1..19930c412b93 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -212,9 +212,10 @@ config DEBUG_INFO
 
 	  If unsure, say N.
 
+if DEBUG_INFO
+
 config DEBUG_INFO_REDUCED
 	bool "Reduce debugging information"
-	depends on DEBUG_INFO
 	help
 	  If you say Y here gcc is instructed to generate less debugging
 	  information for structure types. This means that tools that
@@ -227,7 +228,6 @@ config DEBUG_INFO_REDUCED
 
 config DEBUG_INFO_COMPRESSED
 	bool "Compressed debugging information"
-	depends on DEBUG_INFO
 	depends on $(cc-option,-gz=zlib)
 	depends on $(ld-option,--compress-debug-sections=zlib)
 	help
@@ -243,7 +243,6 @@ config DEBUG_INFO_COMPRESSED
 
 config DEBUG_INFO_SPLIT
 	bool "Produce split debuginfo in .dwo files"
-	depends on DEBUG_INFO
 	depends on $(cc-option,-gsplit-dwarf)
 	help
 	  Generate debug info into separate .dwo files. This significantly
@@ -259,7 +258,6 @@ config DEBUG_INFO_SPLIT
 
 config DEBUG_INFO_DWARF4
 	bool "Generate dwarf4 debuginfo"
-	depends on DEBUG_INFO
 	depends on $(cc-option,-gdwarf-4)
 	help
 	  Generate dwarf4 debug info. This requires recent versions
@@ -269,7 +267,6 @@ config DEBUG_INFO_DWARF4
 
 config DEBUG_INFO_BTF
 	bool "Generate BTF typeinfo"
-	depends on DEBUG_INFO
 	depends on !DEBUG_INFO_SPLIT && !DEBUG_INFO_REDUCED
 	depends on !GCC_PLUGIN_RANDSTRUCT || COMPILE_TEST
 	help
@@ -279,7 +276,6 @@ config DEBUG_INFO_BTF
 
 config GDB_SCRIPTS
 	bool "Provide GDB scripts for kernel debugging"
-	depends on DEBUG_INFO
 	help
 	  This creates the required links to GDB helper scripts in the
 	  build directory. If you load vmlinux into gdb, the helper
@@ -288,6 +284,8 @@ config GDB_SCRIPTS
 	  instance. See Documentation/dev-tools/gdb-kernel-debugging.rst
 	  for further details.
 
+endif # DEBUG_INFO
+
 config ENABLE_MUST_CHECK
 	bool "Enable __must_check logic"
 	default y
-- 
2.28.0

