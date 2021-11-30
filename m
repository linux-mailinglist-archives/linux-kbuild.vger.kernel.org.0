Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25BE463324
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Nov 2021 12:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241126AbhK3LuQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Nov 2021 06:50:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241176AbhK3Ltm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Nov 2021 06:49:42 -0500
Received: from mail-wr1-x449.google.com (mail-wr1-x449.google.com [IPv6:2a00:1450:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B15DC061373
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:46:01 -0800 (PST)
Received: by mail-wr1-x449.google.com with SMTP id u4-20020a5d4684000000b0017c8c1de97dso3521818wrq.16
        for <linux-kbuild@vger.kernel.org>; Tue, 30 Nov 2021 03:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1F+MofKXejp7ry8lfe8Rm0bUxzdx8s4N4hiT9E57RpU=;
        b=AxG+zGUAuQz1+vXIOQ6DG6QRjOq3T51cJb6xki7f4JHpONQpFZJx8GE/b7CRWzPCsG
         OLRaS1SxhNRItDJ+4oOUU5VmP/nYksafcZlT3TVFS1SWFBK3vno6Gg3Jm9z1cK6Zuest
         ui1H7XkT5tngcQHFEK6CC8n6Ghp1ypFOZCz94aNFgLZvN+GCnNenOMRE9+mty4qRXv1N
         2qGht/8T/o21I4oyxH8o4aKxIfvvRVeX0nUK1yVoam9e7llKFicSRQUZiaWijAt560uq
         Dg7b5UU9ZIUcjYU29xL3ofX78AIwM6oIKYpH7LDX2euCle6y9eO4jBbsvtISE16oErOr
         I/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1F+MofKXejp7ry8lfe8Rm0bUxzdx8s4N4hiT9E57RpU=;
        b=e3BiaIX5m2qItElmuyO4KLXpniTi/tHmijmK5S/NMFNAaQxdY5ijNMU0tervrQjoWU
         R0nXq6ST+M1QJOuKJzwfu44Q82a3zuMiCIPte+NbIhSElXZQSipQ/v+FZwWPm1mZNX6J
         b3S80sCsobMsmfirnG+b14cqelvOAuzYCQjxlUHE+YUSyBvJ9E9f7i6Yzo6tIjs/QCJd
         aEFnksZkl7FGxE7u2BVuToxKlH4BEwYndHsRx7U+n9FvlWetXdor2Ug1QW3XHIaJ/8/c
         dJ24Aqiu+lUFv7aXCoRLsamjIXFjxjcZ28AZ5K4XKqm3NUWsJ2dTrE/WQ+u3W7TeQiB7
         IQhg==
X-Gm-Message-State: AOAM531EWuwJhSSjp2BKA4+VJDrWkQgJuvACr9OwEmnOK3jQX9Qg5EvX
        jBrefm1pE+kzVnAemaau8R451CeQYA==
X-Google-Smtp-Source: ABdhPJyPWvl8zulDnZGqXZ4CGIOsIfQU/gfUk/ZE53ZBn+QfJqlzKFrFzo/IqOCXSYJaXQPpXS6SD3dG+A==
X-Received: from elver.muc.corp.google.com ([2a00:79e0:15:13:86b7:11e9:7797:99f0])
 (user=elver job=sendgmr) by 2002:a05:600c:1d1b:: with SMTP id
 l27mr624656wms.1.1638272759191; Tue, 30 Nov 2021 03:45:59 -0800 (PST)
Date:   Tue, 30 Nov 2021 12:44:31 +0100
In-Reply-To: <20211130114433.2580590-1-elver@google.com>
Message-Id: <20211130114433.2580590-24-elver@google.com>
Mime-Version: 1.0
References: <20211130114433.2580590-1-elver@google.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH v3 23/25] objtool, kcsan: Remove memory barrier
 instrumentation from noinstr
From:   Marco Elver <elver@google.com>
To:     elver@google.com, "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, llvm@lists.linux.dev, x86@kernel.org,
        Josh Poimboeuf <jpoimboe@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Teach objtool to turn instrumentation required for memory barrier
modeling into nops in noinstr text.

The __tsan_func_entry/exit calls are still emitted by compilers even
with the __no_sanitize_thread attribute. The memory barrier
instrumentation will be inserted explicitly (without compiler help), and
thus needs to also explicitly be removed.

Signed-off-by: Marco Elver <elver@google.com>
Acked-by: Josh Poimboeuf <jpoimboe@redhat.com>
---
v3:
* s/removable_instr/profiling_func/ (suggested by Josh Poimboeuf)
* s/__kcsan_(mb|wmb|rmb|release)/__atomic_signal_fence/, because
  Clang < 14.0 will still emit these in noinstr even with __no_kcsan.
* Fix and add more comments.

v2:
* Rewrite after rebase to v5.16-rc1.
---
 tools/objtool/check.c               | 37 ++++++++++++++++++++++++-----
 tools/objtool/include/objtool/elf.h |  2 +-
 2 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 61dfb66b30b6..a9a1f7259d62 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -1072,11 +1072,11 @@ static void annotate_call_site(struct objtool_file *file,
 	}
 
 	/*
-	 * Many compilers cannot disable KCOV with a function attribute
-	 * so they need a little help, NOP out any KCOV calls from noinstr
-	 * text.
+	 * Many compilers cannot disable KCOV or sanitizer calls with a function
+	 * attribute so they need a little help, NOP out any such calls from
+	 * noinstr text.
 	 */
-	if (insn->sec->noinstr && sym->kcov) {
+	if (insn->sec->noinstr && sym->profiling_func) {
 		if (reloc) {
 			reloc->type = R_NONE;
 			elf_write_reloc(file->elf, reloc);
@@ -1991,6 +1991,31 @@ static int read_intra_function_calls(struct objtool_file *file)
 	return 0;
 }
 
+/*
+ * Return true if name matches an instrumentation function, where calls to that
+ * function from noinstr code can safely be removed, but compilers won't do so.
+ */
+static bool is_profiling_func(const char *name)
+{
+	/*
+	 * Many compilers cannot disable KCOV with a function attribute.
+	 */
+	if (!strncmp(name, "__sanitizer_cov_", 16))
+		return true;
+
+	/*
+	 * Some compilers currently do not remove __tsan_func_entry/exit nor
+	 * __tsan_atomic_signal_fence (used for barrier instrumentation) with
+	 * the __no_sanitize_thread attribute, remove them. Once the kernel's
+	 * minimum Clang version is 14.0, this can be removed.
+	 */
+	if (!strncmp(name, "__tsan_func_", 12) ||
+	    !strcmp(name, "__tsan_atomic_signal_fence"))
+		return true;
+
+	return false;
+}
+
 static int classify_symbols(struct objtool_file *file)
 {
 	struct section *sec;
@@ -2011,8 +2036,8 @@ static int classify_symbols(struct objtool_file *file)
 			if (!strcmp(func->name, "__fentry__"))
 				func->fentry = true;
 
-			if (!strncmp(func->name, "__sanitizer_cov_", 16))
-				func->kcov = true;
+			if (is_profiling_func(func->name))
+				func->profiling_func = true;
 		}
 	}
 
diff --git a/tools/objtool/include/objtool/elf.h b/tools/objtool/include/objtool/elf.h
index cdc739fa9a6f..d22336781401 100644
--- a/tools/objtool/include/objtool/elf.h
+++ b/tools/objtool/include/objtool/elf.h
@@ -58,7 +58,7 @@ struct symbol {
 	u8 static_call_tramp : 1;
 	u8 retpoline_thunk   : 1;
 	u8 fentry            : 1;
-	u8 kcov              : 1;
+	u8 profiling_func    : 1;
 	struct list_head pv_target;
 };
 
-- 
2.34.0.rc2.393.gf8c9666880-goog

