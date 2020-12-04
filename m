Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A7C2CE4BC
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Dec 2020 02:13:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727434AbgLDBMO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 3 Dec 2020 20:12:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbgLDBMO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Dec 2020 20:12:14 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7900C061A51
        for <linux-kbuild@vger.kernel.org>; Thu,  3 Dec 2020 17:11:33 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id z29so4873832ybi.23
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Dec 2020 17:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=mVi6jSBmFVAKiMXM22iiShJp9PIGsqVPfbrrwSDhpYM=;
        b=rEB7RJTS0e1Do7KzWLMGCwB+yCK0XYYX60hd8zM7Ryv0DNS2oqJpn8AmU31jiUeiBr
         Zxlc2Gv+dhkGj9xgfb6q/Rs4DCfRkBsFYPlEa6dDkcmpuqk5SJ+2XV1OEvFcMC5aPcnM
         4+BdIII51f9vsU2Z1YfA3xqC1kaOh9B4T7ZUrQ/Lt4KWs0z1I6K/9CWxn8lDwtZwfFBb
         C6zruZ6zufjaXsawaEDxB0fHB24rEEbNDKEBR4PsvxQjlHN0HPeaZnrY3P8glWZqUUvE
         kjBGd5x8UhTo/i67kPfOOi9ESZczbG6qJbGWB1zYpbz5AglNZ18VUu6kZVBteP3Vrn6K
         zWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=mVi6jSBmFVAKiMXM22iiShJp9PIGsqVPfbrrwSDhpYM=;
        b=retSraTzwSAPgpzSBeb8QBDzE5Msqd6uM215Dju1axoZIm8EPNZ6CT15pkAyupCfUc
         yb9p8qBF6/bE+OcK+4UfU74Qvidp3JVrJeE3fVhn8jcAFUbWrK6Y/175zjjNgtl0ijOB
         vUeWZSCbeFhxjVjpRmvDufdjggl4dXcPOR9wDQqoGqkAnVS3+IrMaQB3p17wQYfIc9tj
         CTVmXoceXonRUge3ObojHBqPDOhPt+ecs56qPF/2cCYV7fU9pU06S/NzDuiM15wGsxiq
         AXef8aEbyP4dA/zx2RwRWbeBcNuk/vkk+qq/RWL2rhVn7en7NcVLVaR6OXdODFJ+hSvH
         L50Q==
X-Gm-Message-State: AOAM533Nxb2wtzMzOTnjrxdBE0QGd2U/AP2lTAkRJDA1MGHJWZ5CA6bg
        t4XWB98NvlX6m0iQFa2wY7Y3ZpdNXKCtnIAE0pI=
X-Google-Smtp-Source: ABdhPJw31i2+ox4I22GK3+tGKzx9YCYTWjmnqMtPA7cG7WPJytLNNPf1diOuAMBFmkhphZ8BAuCsYYOxTgPKXlsfUt0=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a25:4c4:: with SMTP id
 187mr2850833ybe.181.1607044293117; Thu, 03 Dec 2020 17:11:33 -0800 (PST)
Date:   Thu,  3 Dec 2020 17:11:26 -0800
Message-Id: <20201204011129.2493105-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v3 1/2] Kbuild: make DWARF version a choice
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Arvind Sankar <nivedita@alum.mit.edu>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        clang-built-linux@googlegroups.com,
        Nick Clifton <nickc@redhat.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Changbin Du <changbin.du@intel.com>,
        "peterz@infradead.org" <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Modifies CONFIG_DEBUG_INFO_DWARF4 to be a member of a choice. Adds an
explicit CONFIG_DEBUG_INFO_DWARF2, which is the default. Does so in a
way that's forward compatible with existing configs, and makes adding
future versions more straightforward.

Suggested-by: Fangrui Song <maskray@google.com>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Makefile          | 14 ++++++++------
 lib/Kconfig.debug | 21 ++++++++++++++++-----
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/Makefile b/Makefile
index a2ded5029084..2430e1ee7c44 100644
--- a/Makefile
+++ b/Makefile
@@ -826,12 +826,14 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
-ifneq ($(LLVM_IAS),1)
-KBUILD_AFLAGS	+= -Wa,-gdwarf-2
-endif
-
-ifdef CONFIG_DEBUG_INFO_DWARF4
-DEBUG_CFLAGS	+= -gdwarf-4
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
+DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
+ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
+# Binutils 2.35+ required for -gdwarf-4+ support.
+dwarf-aflag	:= $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y))
+DEBUG_CFLAGS	+= $(dwarf-aflag)
+KBUILD_AFLAGS	+= $(dwarf-aflag)
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 0c7380e36370..04719294a7a3 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -256,14 +256,25 @@ config DEBUG_INFO_SPLIT
 	  to know about the .dwo files and include them.
 	  Incompatible with older versions of ccache.
 
+choice
+	prompt "DWARF version"
+	help
+	  Which version of DWARF debug info to emit.
+
+config DEBUG_INFO_DWARF2
+	bool "Generate DWARF Version 2 debuginfo"
+	help
+	  Generate DWARF v2 debug info.
+
 config DEBUG_INFO_DWARF4
-	bool "Generate dwarf4 debuginfo"
+	bool "Generate DWARF Version 4 debuginfo"
 	depends on $(cc-option,-gdwarf-4)
 	help
-	  Generate dwarf4 debug info. This requires recent versions
-	  of gcc and gdb. It makes the debug information larger.
-	  But it significantly improves the success of resolving
-	  variables in gdb on optimized code.
+	  Generate DWARF v4 debug info. This requires gcc 4.5+ and gdb 7.0+.
+	  It makes the debug information larger, but it significantly
+	  improves the success of resolving variables in gdb on optimized code.
+
+endchoice # "DWARF version"
 
 config DEBUG_INFO_BTF
 	bool "Generate BTF typeinfo"
-- 
2.29.2.576.ga3fc446d84-goog

