Return-Path: <linux-kbuild+bounces-4328-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526AC9B1508
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 07:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16F85282DF7
	for <lists+linux-kbuild@lfdr.de>; Sat, 26 Oct 2024 05:14:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E40318BC03;
	Sat, 26 Oct 2024 05:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qKwCPbm0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07431178CEC
	for <linux-kbuild@vger.kernel.org>; Sat, 26 Oct 2024 05:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729919664; cv=none; b=EYfGRj48mDbab5YceoPfKPj1Hmnr00UGyEJPeE78Robtd6fl1xVIWCq5CvNhwANuMhwD2Z55XRZeLBPOduipg51eq2lsnALTzHhrYcoZXkoe+0aRj+OxvGWfcKyUZcqUY4F4miCXr6sqtWk2XG8aOphXTuCwRjw9kd1qeUyjfL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729919664; c=relaxed/simple;
	bh=Q9RzV1qCGVrMb6LAeR7cFFh2RG554NMIU/BK470X3jM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Jiz5GCMnyKia3JULLysZl9QfwTNo7R8gZ/w7u7qPjnRbAWVePtolCucvuI3qOaXXsytpxf1PqjtiSMyE06W7A+yUTMxIvrBkKWyHwzOm8UFjVJgvwmPWrInD419h0VCr2Q2ulZWR+gey17Zy670oV0XUZ/+b7D9ScshvXK0O0sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qKwCPbm0; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e0082c1dd0so56788827b3.3
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Oct 2024 22:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729919658; x=1730524458; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7kYFsOVpPnUjYIKUaua2wnEWHay18U0XiUGnm1LQcBI=;
        b=qKwCPbm0s/Ct5/MdoczSOVykrZJzITFJJDGt24nq6ymRSTWwq3AYm6eOODy/XNux9/
         UHYVt2khUt5qu2COpnbfo+D0JFmcE/6bEdJdaMyN6cymDkbujmyQLo98QuzhQpXMvbkd
         xX/uhVYirwLEIIRHG4HSXeXPnwWjfmM90PzsOwNo/HP75FSmWQCP4ewmx1Ho1deB+plu
         4kYTmvUNUwMtECD/+MRsqzGLDL3XgABNNkyXtRfU5R51C1k4bBhDk2u/ctzJhwS8feCK
         7XkUqICNxaCWocyhrhqpHLiHn/vz3Mo5BuAdzuRzUNUwrUHNQR7pQyH7Kpl8yiQbDHEU
         ii8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729919658; x=1730524458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7kYFsOVpPnUjYIKUaua2wnEWHay18U0XiUGnm1LQcBI=;
        b=LQD+cXL2R31TryeWvbz+4eGNzG7DJAZIOaSj27HFVVzTtoWYz8PhzG1x3enKrw7HPD
         J7TgRXpL+3y3EU7hXiAzYh0lk+QuuxNhNzaMIeag0/zBQmZU7CMMKkiPyQRNiGQsS/nE
         U5lnog82wFLSbqD/c7K5APElpkNgkxDc+I+pbE4QkZuIuBSJAHSAsu1flojlLJdXSYEL
         frEOgWXaGQmXV6bWu3U8+3HFVt8XV2qH8HLSYQIvZcGSckqCjU5kpRE+nXSXxXQ72VvS
         VIjgpaxAlxKCLT94WwSm8IL7ueQ6hdNiKQt5XoL0onMxo7646tB3QnsmdL47JeJGWh6b
         lcMA==
X-Forwarded-Encrypted: i=1; AJvYcCVaXncxDcE87op3djo2w5PweXNOfie2BTLMpb9/aDgZav8lbDnydQJCKVKO2YbNYU7Su1bMgJrk9ic5QDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBt+t8z/lKr0rUiec5Mm2tuAO4ovVuUYxa61CEhCFk9+DaJ7+/
	JnjlX7LnM1M5ncEqrsKhQLSMPSUVHw85ym3x+k/l6vO3Vh0O0ESpWzl6dwJwR0fvJQ==
X-Google-Smtp-Source: AGHT+IEk8vUuSuqRki7LGdU/vmd4z0u2mMux+ctpByzh8QxC1iVodNKbzUGif3YLI3VZDHQrTILJeT8=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a05:690c:6f89:b0:6e7:e3e4:9d83 with SMTP id
 00721157ae682-6e9d8b5d877mr449357b3.8.1729919657990; Fri, 25 Oct 2024
 22:14:17 -0700 (PDT)
Date: Fri, 25 Oct 2024 22:14:04 -0700
In-Reply-To: <20241026051410.2819338-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241026051410.2819338-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241026051410.2819338-3-xur@google.com>
Subject: [PATCH v6 2/7] objtool: Fix unreachable instruction warnings for weak functions
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

In the presence of both weak and strong function definitions, the
linker drops the weak symbol in favor of a strong symbol, but
leaves the code in place. Code in ignore_unreachable_insn() has
some heuristics to suppress the warning, but it does not work when
-ffunction-sections is enabled.

Suppose function foo has both strong and weak definitions.
Case 1: The strong definition has an annotated section name,
like .init.text. Only the weak definition will be placed into
.text.foo. But since the section has no symbols, there will be no
"hole" in the section.

Case 2: Both sections are without an annotated section name.
Both will be placed into .text.foo section, but there will be only one
symbol (the strong one). If the weak code is before the strong code,
there is no "hole" as it fails to find the right-most symbol before
the offset.

The fix is to use the first node to compute the hole if hole.sym
is empty. If there is no symbol in the section, the first node
will be NULL, in which case, -1 is returned to skip the whole
section.

Co-developed-by: Han Shen <shenhan@google.com>
Signed-off-by: Han Shen <shenhan@google.com>
Signed-off-by: Rong Xu <xur@google.com>
Suggested-by: Sriraman Tallam <tmsriram@google.com>
Suggested-by: Krzysztof Pszeniczny <kpszeniczny@google.com>
Tested-by: Yonghong Song <yonghong.song@linux.dev>
Tested-by: Yabin Cui <yabinc@google.com>
Change-Id: Ib3a484b6f056db8ba4f8e91e567e3165bbeb51ea
---
 tools/objtool/elf.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908d..6f64d611faea9 100644
--- a/tools/objtool/elf.c
+++ b/tools/objtool/elf.c
@@ -224,12 +224,17 @@ int find_symbol_hole_containing(const struct section *sec, unsigned long offset)
 	if (n)
 		return 0; /* not a hole */
 
-	/* didn't find a symbol for which @offset is after it */
-	if (!hole.sym)
-		return 0; /* not a hole */
+	/*
+	 * @offset >= sym->offset + sym->len, find symbol after it.
+	 * When hole.sym is empty, use the first node to compute the hole.
+	 * If there is no symbol in the section, the first node will be NULL,
+	 * in which case, -1 is returned to skip the whole section.
+	 */
+	if (hole.sym)
+		n = rb_next(&hole.sym->node);
+	else
+		n = rb_first_cached(&sec->symbol_tree);
 
-	/* @offset >= sym->offset + sym->len, find symbol after it */
-	n = rb_next(&hole.sym->node);
 	if (!n)
 		return -1; /* until end of address space */
 
-- 
2.47.0.163.g1226f6d8fa-goog


