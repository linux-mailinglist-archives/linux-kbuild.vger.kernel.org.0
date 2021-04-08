Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C802E358C61
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Apr 2021 20:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232967AbhDHS3k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Apr 2021 14:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232933AbhDHS3X (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Apr 2021 14:29:23 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70DD9C0613D9
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Apr 2021 11:28:59 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id w7so2887530ybq.4
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Apr 2021 11:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qNLGON3mLEW9otlCYITUwcgh/bW+ooEbGJnw36Nqnno=;
        b=jj7kg+VOYnwmWzkTWEHiW28jPkIwiSNlmYCpDvaVmnqrHmBOyAOIMYPWJ9h864B4wy
         Tzp0pjqCpebrLADZgh91W+KKB8eGueD1VwBS6L7cebE7ZSkkUJu44191T9NS6Rskdh0h
         8KxnMbVMi9us5lmvFv05UFsGi1dICU0/jOW35jW1yFDSqWjFoKWggx118j+DDE3/RxML
         zsfSf8gO1o/pVNO2RMm+vd+3gL61iabM9gmKVtTjnQFryvd6INtxjocfZiBVqnr7RGy/
         cE5ecHhNG8V4CRTzylPDxAIUG1JiZs88nEOCENsfA99dniQCG6exDwniRiS5DuiKcDZa
         k0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qNLGON3mLEW9otlCYITUwcgh/bW+ooEbGJnw36Nqnno=;
        b=kDGyhbub9xFM0R22Y/ezc/3pgV4QUpTb8IpKBmZZGsbUMxJgO5BKVePSd1HnML7Smz
         fJIVCjt5sw4uo3Lytd2avZcu5JEQQ7lCgwJSBYGlEdn42+1dO0LUi5HtxW1NgnIYZi1D
         vYdVkduHlDIZ6ABmQcs4UxJLRdtovcfMt3hooco1Cb9tdEkkhPlW+0FjpIV+tHENAurg
         jV2J30QV/y46EF9KgYbQMOTr/v4w/kopCYVTb0GM8n+RxsV6xMjnIOyjJk64g0yCXhO9
         dG+O9zYAQ4pBkBu95Bb0qriQVP7IFLDKbNhCMrsHfh1ah7p3/EvW/UVxbBmt4D1YjoCn
         JlPw==
X-Gm-Message-State: AOAM530MhyDjnww2w9puQx5T+Tujyo3sdhRZu/EiZBVDebCm9vGWG6du
        RhHVgyWgZW2xv+uoqOSJsqluVEsuILg6b6QDMSY=
X-Google-Smtp-Source: ABdhPJxUVsuqAxqz+Uc34PB7dmpMvtjLBCQlu4buaoD1UTMPY6dYbIzL2DM8WBBiz1+HV0EZ0aw7CIFzq9DHWz0IVJg=
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:3560:8505:40a2:e021])
 (user=samitolvanen job=sendgmr) by 2002:a25:360a:: with SMTP id
 d10mr13411630yba.473.1617906539163; Thu, 08 Apr 2021 11:28:59 -0700 (PDT)
Date:   Thu,  8 Apr 2021 11:28:32 -0700
In-Reply-To: <20210408182843.1754385-1-samitolvanen@google.com>
Message-Id: <20210408182843.1754385-8-samitolvanen@google.com>
Mime-Version: 1.0
References: <20210408182843.1754385-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
Subject: [PATCH v6 07/18] kallsyms: strip ThinLTO hashes from static functions
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Christoph Hellwig <hch@infradead.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>, bpf@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_CFI_CLANG and ThinLTO, Clang appends a hash to the names
of all static functions not marked __used. This can break userspace
tools that don't expect the function name to change, so strip out the
hash from the output.

Suggested-by: Jack Pham <jackp@codeaurora.org>
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>
---
 kernel/kallsyms.c | 55 ++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 8043a90aa50e..c851ca0ed357 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -161,6 +161,27 @@ static unsigned long kallsyms_sym_address(int idx)
 	return kallsyms_relative_base - 1 - kallsyms_offsets[idx];
 }
 
+#if defined(CONFIG_CFI_CLANG) && defined(CONFIG_LTO_CLANG_THIN)
+/*
+ * LLVM appends a hash to static function names when ThinLTO and CFI are
+ * both enabled, i.e. foo() becomes foo$707af9a22804d33c81801f27dcfe489b.
+ * This causes confusion and potentially breaks user space tools, so we
+ * strip the suffix from expanded symbol names.
+ */
+static inline bool cleanup_symbol_name(char *s)
+{
+	char *res;
+
+	res = strrchr(s, '$');
+	if (res)
+		*res = '\0';
+
+	return res != NULL;
+}
+#else
+static inline bool cleanup_symbol_name(char *s) { return false; }
+#endif
+
 /* Lookup the address for this symbol. Returns 0 if not found. */
 unsigned long kallsyms_lookup_name(const char *name)
 {
@@ -173,6 +194,9 @@ unsigned long kallsyms_lookup_name(const char *name)
 
 		if (strcmp(namebuf, name) == 0)
 			return kallsyms_sym_address(i);
+
+		if (cleanup_symbol_name(namebuf) && strcmp(namebuf, name) == 0)
+			return kallsyms_sym_address(i);
 	}
 	return module_kallsyms_lookup_name(name);
 }
@@ -303,7 +327,9 @@ const char *kallsyms_lookup(unsigned long addr,
 				       namebuf, KSYM_NAME_LEN);
 		if (modname)
 			*modname = NULL;
-		return namebuf;
+
+		ret = namebuf;
+		goto found;
 	}
 
 	/* See if it's in a module or a BPF JITed image. */
@@ -316,11 +342,16 @@ const char *kallsyms_lookup(unsigned long addr,
 	if (!ret)
 		ret = ftrace_mod_address_lookup(addr, symbolsize,
 						offset, modname, namebuf);
+
+found:
+	cleanup_symbol_name(namebuf);
 	return ret;
 }
 
 int lookup_symbol_name(unsigned long addr, char *symname)
 {
+	int res;
+
 	symname[0] = '\0';
 	symname[KSYM_NAME_LEN - 1] = '\0';
 
@@ -331,15 +362,23 @@ int lookup_symbol_name(unsigned long addr, char *symname)
 		/* Grab name */
 		kallsyms_expand_symbol(get_symbol_offset(pos),
 				       symname, KSYM_NAME_LEN);
-		return 0;
+		goto found;
 	}
 	/* See if it's in a module. */
-	return lookup_module_symbol_name(addr, symname);
+	res = lookup_module_symbol_name(addr, symname);
+	if (res)
+		return res;
+
+found:
+	cleanup_symbol_name(symname);
+	return 0;
 }
 
 int lookup_symbol_attrs(unsigned long addr, unsigned long *size,
 			unsigned long *offset, char *modname, char *name)
 {
+	int res;
+
 	name[0] = '\0';
 	name[KSYM_NAME_LEN - 1] = '\0';
 
@@ -351,10 +390,16 @@ int lookup_symbol_attrs(unsigned long addr, unsigned long *size,
 		kallsyms_expand_symbol(get_symbol_offset(pos),
 				       name, KSYM_NAME_LEN);
 		modname[0] = '\0';
-		return 0;
+		goto found;
 	}
 	/* See if it's in a module. */
-	return lookup_module_symbol_attrs(addr, size, offset, modname, name);
+	res = lookup_module_symbol_attrs(addr, size, offset, modname, name);
+	if (res)
+		return res;
+
+found:
+	cleanup_symbol_name(name);
+	return 0;
 }
 
 /* Look up a kernel symbol and return it in a text buffer. */
-- 
2.31.1.295.g9ea45b61b8-goog

