Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1767E2D7E99
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 19:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406215AbgLKSso (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 11 Dec 2020 13:48:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406213AbgLKSsj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Dec 2020 13:48:39 -0500
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CB5C0619DC
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:46:52 -0800 (PST)
Received: by mail-qt1-x849.google.com with SMTP id a11so6093609qto.16
        for <linux-kbuild@vger.kernel.org>; Fri, 11 Dec 2020 10:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=9TLfWaf58UYL7wICLMCVVnhaOCpYf+H5DpQSRdiy6Cc=;
        b=HYjrQ1sMOOn7ObkUbybc+wvc4I5EDo2ggFgwIjqmySqyqvcxKUz9U7SM7Iku6XAD3L
         MaZfkgEgX8bO5VzFU2gtMQNWgcu/wOnkSTwXPIFeVvlEzpMkLiHIbHpRj8g4yDu1jHZA
         3CxXJVzpzKe4SOfBmr81hNI0UbqvcB2S9srss5KkoPp6DWrNCN9YKq4L3D8K0njH4hkb
         YiZREXyM6H7MRSRk5aoMuIbQJAGK7qyIC/Vh6N5H5PAnKudPsvjj6Xkm2vgSii8TALn6
         7lDbS9j6fQNA0FCLEENh5zRwh0RcunHnF5d9mlF3zyS30HlqX3tlEMim0v00ijfjLPOW
         Ri5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9TLfWaf58UYL7wICLMCVVnhaOCpYf+H5DpQSRdiy6Cc=;
        b=ZQ/GkCrCOt5YHJROhWU55F8L71NNRi7B9oYPnJkzdHDD1QOd3UAi9YCSCmPt1AoM2q
         O8pt5AxLBMhIJNOxSfnLau9YzaxY+LcYtp8tai/Fquy9H3FvhwRrcW/vNz8KmvsMZ2MO
         wZV1ZihuHkIEa7LlQ/9F3YmEP/Jz+BIE7MzSluWpmoqGEkzt6pH8VTzMA6XTha3rFHxW
         kEvBK3dRRCXoOR90ob2owWo4N72y1oGVk3QdMNiYpdNjP6Q5u2X5+TYuDP2ex1gnD/AL
         r6vIF7Tgp8x6XuNKbUE31tJ2BSF8gIPBFQiP0bNW4gnPI5CJRE/SSwPRffPyKv2xa9aG
         +ewQ==
X-Gm-Message-State: AOAM530lf4uPNGfD4jJDoHe4gI5Q1SqfRmfYo20UhgjWZnElU664xMSj
        vvBvkYqmDRCDLA+MiD7JKBbg0UTtD/3N0JYBmE4=
X-Google-Smtp-Source: ABdhPJxOTg1pZ6kKhg4/TLTiKW5mUxnxwTfGU0xF4tIiotwCBx+K30YxUBmIUhBVi6sN8mztOiZkcgmhCe/rnpjaMvs=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a05:6214:302:: with SMTP id
 i2mr1391507qvu.14.1607712411329; Fri, 11 Dec 2020 10:46:51 -0800 (PST)
Date:   Fri, 11 Dec 2020 10:46:25 -0800
In-Reply-To: <20201211184633.3213045-1-samitolvanen@google.com>
Message-Id: <20201211184633.3213045-9-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201211184633.3213045-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v9 08/16] init: lto: fix PREL32 relocations
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Will Deacon <will@kernel.org>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With LTO, the compiler can rename static functions to avoid global
naming collisions. As initcall functions are typically static,
renaming can break references to them in inline assembly. This
change adds a global stub with a stable name for each initcall to
fix the issue when PREL32 relocations are used.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
---
 include/linux/init.h | 31 +++++++++++++++++++++++++++----
 1 file changed, 27 insertions(+), 4 deletions(-)

diff --git a/include/linux/init.h b/include/linux/init.h
index d466bea7ecba..27b9478dcdef 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -209,26 +209,49 @@ extern bool initcall_debug;
  */
 #define __initcall_section(__sec, __iid)			\
 	#__sec ".init.." #__iid
+
+/*
+ * With LTO, the compiler can rename static functions to avoid
+ * global naming collisions. We use a global stub function for
+ * initcalls to create a stable symbol name whose address can be
+ * taken in inline assembly when PREL32 relocations are used.
+ */
+#define __initcall_stub(fn, __iid, id)				\
+	__initcall_name(initstub, __iid, id)
+
+#define __define_initcall_stub(__stub, fn)			\
+	int __init __stub(void);				\
+	int __init __stub(void)					\
+	{ 							\
+		return fn();					\
+	}							\
+	__ADDRESSABLE(__stub)
 #else
 #define __initcall_section(__sec, __iid)			\
 	#__sec ".init"
+
+#define __initcall_stub(fn, __iid, id)	fn
+
+#define __define_initcall_stub(__stub, fn)			\
+	__ADDRESSABLE(fn)
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_PREL32_RELOCATIONS
-#define ____define_initcall(fn, __name, __sec)			\
-	__ADDRESSABLE(fn)					\
+#define ____define_initcall(fn, __stub, __name, __sec)		\
+	__define_initcall_stub(__stub, fn)			\
 	asm(".section	\"" __sec "\", \"a\"		\n"	\
 	    __stringify(__name) ":			\n"	\
-	    ".long	" #fn " - .			\n"	\
+	    ".long	" __stringify(__stub) " - .	\n"	\
 	    ".previous					\n");
 #else
-#define ____define_initcall(fn, __name, __sec)			\
+#define ____define_initcall(fn, __unused, __name, __sec)	\
 	static initcall_t __name __used 			\
 		__attribute__((__section__(__sec))) = fn;
 #endif
 
 #define __unique_initcall(fn, id, __sec, __iid)			\
 	____define_initcall(fn,					\
+		__initcall_stub(fn, __iid, id),			\
 		__initcall_name(initcall, __iid, id),		\
 		__initcall_section(__sec, __iid))
 
-- 
2.29.2.576.ga3fc446d84-goog

