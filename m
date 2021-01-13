Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F113B2F40AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 01:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393622AbhAMAnC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 19:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392433AbhAMAeJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 19:34:09 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9967C0617A5
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 16:32:51 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id x17so564116ybs.12
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 16:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=uqIln+HstZctFggtrRu2n6nxYwh4ZFHKHHQOBI++guI=;
        b=pvdFGS6OG2KgZMUrZd158HXq4dc4tWjUyc78+KbjfGWlFFk1MJrL+jUE9o7jJLc1Hj
         t2TCiMIZKwBGThTs2NswSLciBDyKsrsSxS1Ll6lBF1snZ9sZR93tiExU0dIipgFDeRun
         0fW7Vrisk711AmpujZzLhlMZldz4VaGa66ZtXLkHUfXQ31Zr9hRz4qliyXzhIFm7xBSJ
         hIhUapntVkuUk4GDDrnUUbskeYNnIH42HwwqT8cu1ppIykqr+j/rE0pXTS/f7IV1TjHF
         i92XgCYDkUoX3kpSs4/BTH+3h0uIxGYsuyuRmZF0wo64a5WZ4Yy1eAaVThcKVClYEG3q
         eC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=uqIln+HstZctFggtrRu2n6nxYwh4ZFHKHHQOBI++guI=;
        b=l2So8XnHT6C1unbChNvm19f43PfNEp3Y9YhkHUYhnoOlmpWASt5hfbPL4KXdyYTOd0
         hnlfcPq7rBDFncIDf1HNb0oYWC2pTQnksW7O8KFpjZdbKgW7w38XIHBxEUXyUgXy/MzH
         +qAsaeDCGv6wAyXhEQxtY+WQf8LyRU0xKu9UQYEWuyhTaowkaZfu6kFK4S4JvKF7NNTP
         8qZ2zOBmHQOctAizxJ7BTNzeEDAmKSFxr2Uta9SPJ4o7pOn851mNocxYmt61fOaNeIU3
         fx2AAvnsnIGYClbQU5ByMd6PUp70XTyvlXZK49G/ksgzWigQ2R0OqFK6fGCSU2Kax9Rj
         sJYA==
X-Gm-Message-State: AOAM531o+bqF2Q+LzCWH4Ib032I09wa63Ri+hcVtiCGKbYrAbgMYIXoY
        w0mVqJI5kHIVKYEPT+grgLTU3/gohH+lHwGk8ok=
X-Google-Smtp-Source: ABdhPJxJm9HtYy+kYsBH/PWQjN06dKOIWrIF4tKGocsrMidrfwb4fDMqj6pOBPLr6bEVyRjV9m5PQoN+3rKI/fbp5qk=
Sender: "ndesaulniers via sendgmr" 
        <ndesaulniers@ndesaulniers1.mtv.corp.google.com>
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a5b:2cf:: with SMTP id
 h15mr2951368ybp.475.1610497971198; Tue, 12 Jan 2021 16:32:51 -0800 (PST)
Date:   Tue, 12 Jan 2021 16:32:34 -0800
In-Reply-To: <20210113003235.716547-1-ndesaulniers@google.com>
Message-Id: <20210113003235.716547-3-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210113003235.716547-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v4 2/3] Kbuild: make DWARF version a choice
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        Nick Clifton <nickc@redhat.com>,
        Nick Desaulniers <ndesaulniers@google.com>
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
 Makefile          | 14 +++++++++-----
 lib/Kconfig.debug | 21 ++++++++++++++++-----
 2 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index d49c3f39ceb4..656fff17b331 100644
--- a/Makefile
+++ b/Makefile
@@ -826,12 +826,16 @@ else
 DEBUG_CFLAGS	+= -g
 endif
 
-ifneq ($(LLVM_IAS),1)
-KBUILD_AFLAGS	+= -Wa,-gdwarf-2
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF2) := 2
+dwarf-version-$(CONFIG_DEBUG_INFO_DWARF4) := 4
+DEBUG_CFLAGS	+= -gdwarf-$(dwarf-version-y)
+ifneq ($(dwarf-version-y)$(LLVM_IAS),21)
+# Binutils 2.35+ required for -gdwarf-4+ support.
+dwarf-aflag	:= $(call as-option,-Wa$(comma)-gdwarf-$(dwarf-version-y))
+ifdef CONFIG_CC_IS_CLANG
+DEBUG_CFLAGS	+= $(dwarf-aflag)
 endif
-
-ifdef CONFIG_DEBUG_INFO_DWARF4
-DEBUG_CFLAGS	+= -gdwarf-4
+KBUILD_AFLAGS	+= $(dwarf-aflag)
 endif
 
 ifdef CONFIG_DEBUG_INFO_REDUCED
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index dd7d8d35b2a5..e80770fac4f0 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -256,13 +256,24 @@ config DEBUG_INFO_SPLIT
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
2.30.0.284.gd98b1dd5eaa7-goog

