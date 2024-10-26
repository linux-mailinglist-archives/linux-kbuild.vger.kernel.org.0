Return-Path: <linux-kbuild+bounces-4327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9FD9B1503
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 07:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F60B2816E7
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 05:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D46991779A4;
	Sat, 26 Oct 2024 05:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pe8JvUJf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F8C17ADF8
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Oct 2024 05:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919663; cv=none; b=Nv7OIL4Lwg+N7wDS7LcuADhtQKOF80907T3zERLX066c1tjK/sXCHECwO/DfO0DK3Us+WPTDqvEkT3JIgj0WkJh6lSx0EbdE6KysTUcbM1s/j3eieTW+ZyzRfaDtajq5TRzAb/NZZ3aUn+Ck1HRXTvl3EHpmg2lNGKiQq8pI2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919663; c=relaxed/simple;
	bh=1XrUOxm67YWKXJl5eYiSXjUO7TsxxJAwupJPPiPx+ik=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZxLfCC+14TCvgxIrdbb9YW4zA/m2B9CXaFuE92qjVQS32nCDboN87P6/xH6CeonOqNvK8s3ext2xcdLtJbF+Iy+HZKnlnqQLklN40GRb7pk6Jon04/5dEf2zydPcpuZLY+mNtWX26v42WKSSWrVC5rIiViOzGxkX2iZvR/JgoGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pe8JvUJf; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e1159159528so5329651276.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2024 22:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919660; x=1730524460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CwocKGHgUXdsFOwFTTEG/FtIpm0PRyvg4LHAdc+/Z6Y=;
        b=pe8JvUJfSQVMJRDyPekPtRk1N50LnBlQEfmU8SXUpQnsBkdQXPibxXJn9SHkG8wMun
         jIn8UcEAJVrHmQmwXyF9bAski5PKeWbb9nPzD4+AonFGQUtx5pEmdvs0LlxMLe94UZJR
         3nOeT8UR7TNDfKfTU737+wUqbtL1XoMzOkj84d5tsi3N7EkQ+gjDLnwzp/H//xGm27uy
         g6oQ7WFovqeNxRA3f0eH4WU7rjeSXhFXUYyrNjfewlcgbqMCgsMN6MnKc8TIjxyP7TvI
         OU6MY9YXYK91dHgEg7pIymUKk7LwHVcw0gyzcp9Q0gcnUupgPiHJb8e8fcs5O6LtTIYu
         MMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919660; x=1730524460;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=CwocKGHgUXdsFOwFTTEG/FtIpm0PRyvg4LHAdc+/Z6Y=;
        b=XEEG8Z2pypRD+c9DioR/2SghaWPBH0CAg13gL1O02ZAmiuQx++iptKO/amuWetqptu
         HUAvy1s2GIK8ThJYRvUarJ152D+S9dN6cNOhsrU/sybB2sUrXND4QIEy/cPefcTb5Hdl
         UJnIGPZ88UwQ48QhmMUCn7qMunGIyTQt0gk3t1ibEnUc9JTdV96hXkX1rLGCZWa/4y7l
         oR/rZJGv+0dbGLfF+L6V0E+hbYT1G5+f5HSaHoYOtG/OafmGgon9bgiM1houG0jj44pt
         in9ZM8C0skhZGeyIG14aZ1Y2bL15Gj4sUs7n7Ovkvo7y6/n3F3DmJi6FkcCILYKzrlcd
         NfIw==
X-Forwarded-Encrypted: i=1; AJvYcCXybcnZmuNxCyr8BCHBZIBnhdmTllh/AFJT8F8+Bn/zJ2JbmLNG+hBpjE0aoosubUBXkcrqQqr38cJm6Ho=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Rz2FzDtg6OQsId0Cwj2dR9eu/3mo+WVynC5dzSxh9D0z8Pxj
	1i0HmaWz6qwRgJGidvKXtzFgi+mkj2BSMjGWoxndE4Upl1Lak8KwNAbt5EMrQa5Jyg==
X-Google-Smtp-Source: AGHT+IHOybZXxhNpcWagz27422zYFTJPt6BbXSY6n3vTTmRzykMssE9klEXOQCWXoubA4ZID9e6yGv8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:74c4:0:b0:e29:9c5:5fcb with SMTP id
 3f1490d57ef6-e2eb86c806dmr64101276.4.1729919659655; Fri, 25 Oct 2024 22:14:19
 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:05 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-4-xur@google.com>
Subject: [PATCH v6 3/7] Adjust symbol ordering in text output section
From: Rong Xu <xur@google.com>
To: Alice Ryhl <aliceryhl@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>, Borislav Petkov <bp@alien8.de>, 
	Breno Leitao <leitao@debian.org>, Brian Gerst <brgerst@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Li <davidxl@google.com>, 
	Han Shen <shenhan@google.com>, Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Juergen Gross <jgross@suse.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, "Mike Rapoport (IBM)" <rppt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Rong Xu <xur@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Wei Yang <richard.weiyang@gmail.com>, workflows@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Yonghong Song <yonghong.song@linux.dev>, Yabin Cui <yabinc@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>, Sriraman Tallam <tmsriram@google.com>, 
	Stephane Eranian <eranian@google.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

When the -ffunction-sections compiler option is enabled, each function
is placed in a separate section named .text.function_name rather than
putting all functions in a single .text section.

However, using -function-sections can cause problems with the
linker script. The comments included in include/asm-generic/vmlinux.lds.h
note these issues.:
  =E2=80=9CTEXT_MAIN here will match .text.fixup and .text.unlikely if dead
   code elimination is enabled, so these sections should be converted
   to use ".." first.=E2=80=9D

It is unclear whether there is a straightforward method for converting
a suffix to "..".

This patch modifies the order of subsections within the text output
section. Specifically, it repositions sections with certain fixed patterns
(for example .text.unlikely) before TEXT_MAIN, ensuring that they are
grouped and matched together. It also places .text.hot section at the
beginning of a page to help the TLB performance.

Note that the limitation arises because the linker script employs glob
patterns instead of regular expressions for string matching. While there
is a method to maintain the current order using complex patterns, this
significantly complicates the pattern and increases the likelihood of
errors.

This patch also changes vmlinux.lds.S for the sparc64 architecture to
accommodate specific symbol placement requirements.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Change-Id: I5202d40bc7e24f93c2bfb2f0d987e9dc57dec1b1
---
 arch/sparc/kernel/vmlinux.lds.S   |  5 +++++
 include/asm-generic/vmlinux.lds.h | 19 ++++++++++++-------
 2 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/sparc/kernel/vmlinux.lds.S b/arch/sparc/kernel/vmlinux.ld=
s.S
index d317a843f7ea9..f1b86eb303404 100644
--- a/arch/sparc/kernel/vmlinux.lds.S
+++ b/arch/sparc/kernel/vmlinux.lds.S
@@ -48,6 +48,11 @@ SECTIONS
 	{
 		_text =3D .;
 		HEAD_TEXT
+	        ALIGN_FUNCTION();
+#ifdef CONFIG_SPARC64
+	        /* Match text section symbols in head_64.S first */
+	        *head_64.o(.text)
+#endif
 		TEXT_TEXT
 		SCHED_TEXT
 		LOCK_TEXT
diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinu=
x.lds.h
index eeadbaeccf88b..fd901951549c0 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -553,19 +553,24 @@
  * .text section. Map to function alignment to avoid address changes
  * during second ld run in second ld pass when generating System.map
  *
- * TEXT_MAIN here will match .text.fixup and .text.unlikely if dead
- * code elimination is enabled, so these sections should be converted
- * to use ".." first.
+ * TEXT_MAIN here will match symbols with a fixed pattern (for example,
+ * .text.hot or .text.unlikely) if dead code elimination or
+ * function-section is enabled. Match these symbols first before
+ * TEXT_MAIN to ensure they are grouped together.
+ *
+ * Also placing .text.hot section at the beginning of a page, this
+ * would help the TLB performance.
  */
 #define TEXT_TEXT							\
 		ALIGN_FUNCTION();					\
+		*(.text.asan.* .text.tsan.*)				\
+		*(.text.unknown .text.unknown.*)			\
+		*(.text.unlikely .text.unlikely.*)			\
+		. =3D ALIGN(PAGE_SIZE);					\
 		*(.text.hot .text.hot.*)				\
 		*(TEXT_MAIN .text.fixup)				\
-		*(.text.unlikely .text.unlikely.*)			\
-		*(.text.unknown .text.unknown.*)			\
 		NOINSTR_TEXT						\
-		*(.ref.text)						\
-		*(.text.asan.* .text.tsan.*)
+		*(.ref.text)
=20
=20
 /* sched.text is aling to function alignment to secure we have same
--=20
2.47.0.163.g1226f6d8fa-goog


