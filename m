Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F048A2CAEE5
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Dec 2020 22:41:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390159AbgLAVjg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Dec 2020 16:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390015AbgLAVjb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Dec 2020 16:39:31 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90A9C094242
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Dec 2020 13:37:30 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id v13so3969352ybe.18
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Dec 2020 13:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=9TLfWaf58UYL7wICLMCVVnhaOCpYf+H5DpQSRdiy6Cc=;
        b=ZHmcfGNpa7ZNviH3Lhbi7/0SDEQ3Jls1Fd4loR1GsDVBD7tyPoyw8FMMexSiO0w9DW
         9RjrozMTcLSgrBxEv1Vz8SoUuZs1OCJb++caQa3OdSsaiYW67cFBU7PQ9LNeGNpQOT/K
         9NZ2TIpPQb7/71Uv+3b78ioZtiLnITOk2KjhIvpWKQSdMkCVpud7TsnvOO4ORqlpu2u5
         nOj1pZxLhS/1QmdqjetYddIidvonWTCSBDRIzR5umGDHjrntwGXK/yd6oSDTP2uLIXdB
         crW36MjeZXAzVs/1lqNDI0q9ni6fGs696oymio04cAycbm2CdWTbsus3NowlMPBHIFwm
         bePw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=9TLfWaf58UYL7wICLMCVVnhaOCpYf+H5DpQSRdiy6Cc=;
        b=XcOJWUfT0grVvZDRD2QioDneXfSmndwCnLaPEiG3RHlluqCqewuhePcn5sWcQip9H1
         K7Tk0t+OYcHJlBWm2MMuoKyKmVBuw1giNy3zAv35/jegQ/2ZVb5nJoveUsEUNMQEj78D
         u+q1HWi5p6JDypYEeyBdg8kIpal8v29T4i/IrDg7PhsNhSGPxumH3KFuudiFCJUyxqwP
         BwReLuhO5+sAzobxFBzfxzI1RVtOz60jQAVgW9kU67tZOwoHaDS4VigyT5qc01JfsUcL
         TKWpGcHMFYsfw7k/haoiJk2lLfPptSYN8QBveboMW484utZzIjgshsWCasj6I4KZeSc/
         sDCw==
X-Gm-Message-State: AOAM531eGjD/RWruDnxa+mPtOolMUI0Oz3O3BKJyYj03SiXB8eTKgXNi
        oG+j7APaKbqdpAEk2C6WNAxBZONwexd0v8k3/QQ=
X-Google-Smtp-Source: ABdhPJznzlwtgR/lC41/SY0FFtURTSnCC2xOHrCPe7akB5kk2L1nv9Me4GAJGApMzwCD081JTdMBkBEIq4IXR3L5M2Q=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:cf0a:: with SMTP id
 f10mr7383764ybg.353.1606858650073; Tue, 01 Dec 2020 13:37:30 -0800 (PST)
Date:   Tue,  1 Dec 2020 13:36:59 -0800
In-Reply-To: <20201201213707.541432-1-samitolvanen@google.com>
Message-Id: <20201201213707.541432-9-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201201213707.541432-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
Subject: [PATCH v8 08/16] init: lto: fix PREL32 relocations
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

