Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 321B328C659
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Oct 2020 02:37:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727653AbgJMAer (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 12 Oct 2020 20:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727639AbgJMAdM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Oct 2020 20:33:12 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77506C0613E6
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 17:32:41 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id k3so19106828ybk.16
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Oct 2020 17:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=ljsItlz/aE0P1FDke8OIPGTsfsgvR6SCQ5aAaAr+FuY=;
        b=oum/rjpLgBIXRzOc38bbhKmbjYdpUPokaueoFkr6scrVzuU9bSims44TwDZ3YQ5/wo
         tyFgp4XcVUbaCRTIJ7WyMGcJzX9IUYyY8SHh85axKohx3B9YKTYssK7rD/sd+9Gs6OYS
         5pLTO9ddpancYtucgKle3gEvEszXKuKKjECSTrvhHvUa0sTQkJ9oAv6nDZgXB2iqzs6F
         HaozULUdcqCQOaO/g6JRs136BCvSZm6oYr/J1aF/vZtIWA1niCkH+rLYrArccBedjSyb
         5JHkueqtTR75zT9X9nD843dXt6Ntpa7oVvhDLRM/xKFRBTH7orAGCLXgpiwYxg5ODzqW
         hhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=ljsItlz/aE0P1FDke8OIPGTsfsgvR6SCQ5aAaAr+FuY=;
        b=AuieS1hQ/38qGkdfhVz4r2ifc3efFf+AQgMVY8Lpoa4CvZV0c7jNRzxjltSxhGn21f
         2/MhQitTplmOXwntzlx5ki7cdNBqDrKDVGr7azfGBfGOOtQxOBfKBPTnIpIK2Bo0eJGJ
         NY13/Z+AgC290+2gIDt5Mw90TAdVlfPEx/mV+X9fHkAnF6RstClx3PBM5CTQpnXMje2C
         tDJwSG4ddOdgWemzG5JKWGY/7T948Kf3tTkDMu/qwMzSY4+wdU+C1kTYywMfm/Zbq3oC
         b6JqdNAemGfotnCIdSj1VGPRKvJQxztC5lWRWcOabNIYCLeGM7hHsiwR2wSzvfSD4pgG
         s1dQ==
X-Gm-Message-State: AOAM5314RAAN6/BBsd/cc5CyEe5PfKJTMs6eSoKMzeyxHm/MvtVxONmV
        5GMZGHVKJ3ThUawwxV9gTgPGXP6qICWQG/KNrJc=
X-Google-Smtp-Source: ABdhPJwD9pFtxRfETVm7J2JNUfN/ppBHwqDfCtEerXB7/Jkt+07t8oFntbLZxmanhpG4ZYrTFeVoYv7CKCtYGxrwXzg=
Sender: "samitolvanen via sendgmr" 
        <samitolvanen@samitolvanen1.mtv.corp.google.com>
X-Received: from samitolvanen1.mtv.corp.google.com ([2620:15c:201:2:f693:9fff:fef4:1b6d])
 (user=samitolvanen job=sendgmr) by 2002:a25:37c2:: with SMTP id
 e185mr20091375yba.401.1602549160656; Mon, 12 Oct 2020 17:32:40 -0700 (PDT)
Date:   Mon, 12 Oct 2020 17:31:54 -0700
In-Reply-To: <20201013003203.4168817-1-samitolvanen@google.com>
Message-Id: <20201013003203.4168817-17-samitolvanen@google.com>
Mime-Version: 1.0
References: <20201013003203.4168817-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
Subject: [PATCH v6 16/25] init: lto: fix PREL32 relocations
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
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
index af638cd6dd52..cea63f7e7705 100644
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
2.28.0.1011.ga647a8990f-goog

