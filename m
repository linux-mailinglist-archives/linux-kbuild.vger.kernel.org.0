Return-Path: <linux-kbuild+bounces-10590-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 27406D210D9
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 20:37:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BEDAA3015461
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jan 2026 19:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBCA34D922;
	Wed, 14 Jan 2026 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z7A8N232"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0826F23184F
	for <linux-kbuild@vger.kernel.org>; Wed, 14 Jan 2026 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768419447; cv=none; b=h9NTldz6Sr/DjyuS63bSNPGgtm+Pv78Fddxbc+nQtZZ/vyB7AOeFZw4raIgdAnRH1LnmGJZOlj6FbqbZr475slsW886+RY6Ca/gfrCs1p6cXMBG/RD2ZbBYMQMQphLE5FLzoZkUnmeSiC6aJnh4x/JEjq2i/Ovl+AspB3viXF/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768419447; c=relaxed/simple;
	bh=EQdSM0yOXS8C3leRvmeb2QGrjb/3aaIMy7AzLXYJTsQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 Cc:Content-Type; b=L8yfaPqA17e5Hgmi9HO6wjyOIvOLk806jjqQWNvi43ebBND9TggdUsV5s4tZ12zPZNOjxszkiojgR+jyjj71bFzXUgAgqT67fBsX/i+eJQ0PlmDtan/nGbZNJxayuwRNcBwlgc5TYLNuWAm/vqwt/tEK0pww1scppJhp8JcqJGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z7A8N232; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--morbo.bounces.google.com
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c5269fcecdeso99812a12.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Jan 2026 11:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768419445; x=1769024245; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJ1Oy9t9P+wnGwZGZn0q3AykJg67xBsGj9QaYqlCMiU=;
        b=z7A8N232L456+7aKqdZMR7IV2lngaQQ1Qda+5ci5SPpwgSYCFaLyqEHGzgLqJEk0J2
         QB2o4k3Iip8W6NQi6//LK47ZAp/PhN4VQ2f7jtEp+vO4S0F7zc0adUwDmg7lMemNWH38
         8GiU658LcyJVVMdCNrCh/lYaBx9G9I7XjYXOTr+zMvpqMTm4g1nAvYe2oRNDJW7eo9qe
         nsvVoaiOuW7X96fKr12yt+WPdlZtdeXvQo6MRhIfs3/BU4W+A2r8YzIs8y4q0FDecqjI
         WSTqIVQ6KgV+xAaE3mBfM28AvVsVwqGqDOf6mrl0zx99mnkfjVcV7QnYT3pbDdk3GLCj
         PVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768419445; x=1769024245;
        h=content-transfer-encoding:cc:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PJ1Oy9t9P+wnGwZGZn0q3AykJg67xBsGj9QaYqlCMiU=;
        b=QCZPB3n+SxN8vSkf3pOBJ4GKCB8BcdbbjYv5N/Ev8UxUd/ApE/e3Y4DWyzcJT0sevd
         rmb1olOZ6TgbZc3Bey/34bXugskp1XtadtJfYG7EdS5tx0J+koylcuZPCl/Yxszi/JNU
         JR7esY93r6uKVomALH3SrRnIje1pYNEHftT5FLQR7vQot3K8JrcPgmK70XQfT6yqObbu
         mY/ptvdj4hDq6dlbuUGawH8VSz3zRaXEPOB2gbTv9l5gssrI7kxF5/iT8aJMTds5DpTy
         aUXnzIfHjoR/WbvtoZbg232TXTK/dkBnRTMylSpNRxIyYoQsRCZQY8uFlVqPWBnUrDOl
         Fxow==
X-Forwarded-Encrypted: i=1; AJvYcCVe2gBtIbBZekivBihkfTyM9iGVwkQHN69HCj2+3wZyj6lx940XN9CpQ3QWICtAZv4GnkZaZXALCI0hpbc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj0fVLmw/aml7lHxXggTxutwUUcExwIxDGopdJa0mtz5q/D0Hf
	SJ5vnXAzWjEDeMW+b1QhNnFWVZurar11lUvpEWxZ7RfYGBngAY09Rhl30UKQAVA6l03QhhBIe0e
	N
X-Received: from pgnd16.prod.google.com ([2002:a63:7350:0:b0:bfe:d576:aabd])
 (user=morbo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:7f97:b0:38b:d95d:efd7
 with SMTP id adf61e73a8af0-38bed1b9f0emr4607629637.44.1768419445289; Wed, 14
 Jan 2026 11:37:25 -0800 (PST)
Date: Wed, 14 Jan 2026 19:36:47 +0000
In-Reply-To: <20251121195504.1661783-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251121195504.1661783-1-morbo@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260114193716.1740684-1-morbo@google.com>
Subject: [PATCH 1/2] Compiler Attributes: Add __counted_by_ptr macro
From: Bill Wendling <morbo@google.com>
Cc: Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Heiko Carstens <hca@linux.ibm.com>, 
	Marc Herbert <Marc.Herbert@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Tejun Heo <tj@kernel.org>, Jeff Xu <jeffxu@chromium.org>, 
	"=?UTF-8?q?Michal=20Koutn=C3=BD?=" <mkoutny@suse.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	"=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?=" <thomas.weissschuh@linutronix.de>, John Stultz <jstultz@google.com>, 
	Christian Brauner <brauner@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Brian Gerst <brgerst@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Nicolas Schier <nsc@kernel.org>, Tamir Duberstein <tamird@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Naman Jain <namjain@linux.microsoft.com>, Eric Dumazet <edumazet@google.com>, 
	Simon Horman <horms@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Introduce __counted_by_ptr(), which works like __counted_by(), but for
pointer struct members.

struct foo {
	int a, b, c;
	char *buffer __counted_by_ptr(bytes);
	short nr_bars;
	struct bar *bars __counted_by_ptr(nr_bars);
	size_t bytes;
};

Because "counted_by" can only be applied to pointer members in very
recent compiler versions, its application ends up needing to be distinct
from flexibe array "counted_by" annotations, hence a separate macro.

Note that Clang's support for "void *" members will be in version 22.
So, when using Clang, you'll need to wait until its release before using
the feature with "void *". No such restriction applies to GCC's version
16.

This is a reworking of Kees' previous patch [1].

Link: https://lore.kernel.org/all/20251020220118.1226740-1-kees@kernel.org/=
 [1]
Co-developed-by: Kees Cook <kees@kernel.org>
Signed-off-by: Bill Wendling <morbo@google.com>
---
Cc: Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Marc Herbert <Marc.Herbert@linux.intel.com>
Cc: Uros Bizjak <ubizjak@gmail.com>
Cc: Tejun Heo <tj@kernel.org>
Cc: Jeff Xu <jeffxu@chromium.org>
Cc: "Michal Koutn=C3=BD" <mkoutny@suse.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
Cc: John Stultz <jstultz@google.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Brian Gerst <brgerst@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: linux-hardening@vger.kernel.org
Cc: llvm@lists.linux.dev
---
v3 - Replace the previous code with a modified version of Kees' previous pa=
tch
     [1].
   - The question about the naming of the macro was considered, but we deci=
ded
     to keep the original naming (__counted_by_ptr), because it mirrors the=
 current
     macros like "__counted_by_{le,be}".
v2 - Add support for GCC.
---
 Makefile                       |  6 ++++++
 include/linux/compiler_types.h | 18 +++++++++++++++++-
 include/uapi/linux/stddef.h    |  4 ++++
 init/Kconfig                   |  7 +++++++
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 9d38125263fb..6b029f694bc2 100644
--- a/Makefile
+++ b/Makefile
@@ -952,6 +952,12 @@ KBUILD_CFLAGS	+=3D $(CC_AUTO_VAR_INIT_ZERO_ENABLER)
 endif
 endif
=20
+ifdef CONFIG_CC_IS_CLANG
+ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+KBUILD_CFLAGS	+=3D -fexperimental-late-parse-attributes
+endif
+endif
+
 # Explicitly clear padding bits during variable initialization
 KBUILD_CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
=20
diff --git a/include/linux/compiler_types.h b/include/linux/compiler_types.=
h
index d3318a3c2577..e597c814d60b 100644
--- a/include/linux/compiler_types.h
+++ b/include/linux/compiler_types.h
@@ -369,7 +369,7 @@ struct ftrace_likely_data {
  * Optional: only supported since clang >=3D 18
  *
  *   gcc: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
- * clang: https://github.com/llvm/llvm-project/pull/76348
+ * clang: https://clang.llvm.org/docs/AttributeReference.html#counted-by-c=
ounted-by-or-null-sized-by-sized-by-or-null
  *
  * __bdos on clang < 19.1.2 can erroneously return 0:
  * https://github.com/llvm/llvm-project/pull/110497
@@ -383,6 +383,22 @@ struct ftrace_likely_data {
 # define __counted_by(member)
 #endif
=20
+/*
+ * Runtime track number of objects pointed to by a pointer member for use =
by
+ * CONFIG_FORTIFY_SOURCE and CONFIG_UBSAN_BOUNDS.
+ *
+ * Optional: only supported since gcc >=3D 16
+ * Optional: only supported since clang >=3D 21.1
+ *
+ *   gcc: https://gcc.gnu.org/pipermail/gcc-patches/2025-April/681727.html
+ * clang: https://github.com/llvm/llvm-project/pull/137250
+ */
+#ifdef CONFIG_CC_HAS_COUNTED_BY_PTR
+#define __counted_by_ptr(member)	__attribute__((__counted_by__(member)))
+#else
+#define __counted_by_ptr(member)
+#endif
+
 /*
  * Optional: only supported since gcc >=3D 15
  * Optional: not supported by Clang
diff --git a/include/uapi/linux/stddef.h b/include/uapi/linux/stddef.h
index 9a28f7d9a334..111b097ec00b 100644
--- a/include/uapi/linux/stddef.h
+++ b/include/uapi/linux/stddef.h
@@ -72,6 +72,10 @@
 #define __counted_by_be(m)
 #endif
=20
+#ifndef __counted_by_ptr
+#define __counted_by_ptr(m)
+#endif
+
 #ifdef __KERNEL__
 #define __kernel_nonstring	__nonstring
 #else
diff --git a/init/Kconfig b/init/Kconfig
index fa79feb8fe57..dc27b998d111 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -143,6 +143,13 @@ config CC_HAS_COUNTED_BY
 	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D108896
 	default y if CC_IS_GCC && GCC_VERSION >=3D 150100
=20
+config CC_HAS_COUNTED_BY_PTR
+	bool
+	# supported since clang 21.1.0
+	default y if CC_IS_CLANG && CLANG_VERSION >=3D 210100
+	# supported since gcc 16.0.0
+	default y if CC_IS_GCC && GCC_VERSION >=3D 160000
+
 config CC_HAS_MULTIDIMENSIONAL_NONSTRING
 	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__)) =3D=
 { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
=20
--=20
2.52.0.457.g6b5491de43-goog


