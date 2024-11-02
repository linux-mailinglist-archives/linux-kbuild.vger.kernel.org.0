Return-Path: <linux-kbuild+bounces-4470-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3974E9BA1E7
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 18:52:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9E217B21728
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Nov 2024 17:52:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295E31AC429;
	Sat,  2 Nov 2024 17:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZNPqYsIK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530AA1AB53F
	for <linux-kbuild@vger.kernel.org>; Sat,  2 Nov 2024 17:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730569886; cv=none; b=QkfHRHplpdrAha6+a05fZdF+SzFNUGq6qtVaATwu6jR1cFsHTs//txANw+l78cfa/RNujfNAoWgKaObstwg/XYOTj3jDMhZNy+Yvxt+CQ6eYMLd0I6h2nkv0WUqwpl/+I+bSBN+9sjv0+0nO8esoAveZ52bTBY2AMhc/naJlSyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730569886; c=relaxed/simple;
	bh=Qds4NA90wa7TDHswITaOk/cdYok8wTYQZzXcL+D4NoI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=diLmvfT+ucxYdRG7Tev1P+ZsGZgVDVCoQDKl8zH8NLiziqBx1RVkL1CfHJJZlMpqivGU9bpXHgAR2ujX8gvo4BQ+UphBZa6xKwhaXapViJRVGvBjd+NyiCnNnAZBwME6Pw6A24uT/+24bi49apGp0+bQOEjQMV12hRQtmZjzPKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZNPqYsIK; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e33152c8225so2085658276.0
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Nov 2024 10:51:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730569882; x=1731174682; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AdNJKHFZmgNekvTR2PzJwqsJcKVDg6QKteiEhFTxb0g=;
        b=ZNPqYsIKljogWIQoMhvPX4eRPz820+1nB8/HaWdT9yLaD00cNZZPH2rVMEnbpp5JTm
         68alPtu5421mqLpdXcV/TAR51Y4qo1Vuk6xxFMeGxFQwra6XaZ86TC/zMuSYdCsMwRgb
         LfwIi3izHxnmeeL06/ONuRG9yxiXRUfPsGnsNiiSWMssnn1p1PFrmEiXbEGUUjHY/eFP
         PH/K5Y76kbI/NE8uPWxNSqO19nLFCJSZwSf34sP6pW6SP199rQew9COunY8rKzjiCc1X
         bXP+6ft7bieWaiftX4kSC9gMIc2Ey+dVTDP4LNaywRqpSKXm1NH4u4VZw6IS8VMLV8ta
         3JJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730569882; x=1731174682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdNJKHFZmgNekvTR2PzJwqsJcKVDg6QKteiEhFTxb0g=;
        b=d5bWH3WYz2/VjRGQJdc3NtnvZBHcUqkF6CUS6uaxfcyvAD45j9UUK+HL98S1p+PJ6v
         nDMAG/UmaqMLSgFRVHWV2LY7qm7QekJ8/MEbNkNM5UXF0s9GUQoO58MLGUAs4/9mrfDw
         nhthjyUBaBQhRxdYjX18MK3DEPYFPmFSykjCOgWmOUKT0/fXwC3qb1l2IZYlLj3kLVPg
         L4CJQjvCapEB6LrwgRy0frF+Mbpvu8YjBDt0/bGB5QLca9LFtbdQHcJmFqIrKQOxo7Gp
         VVlMUzkIj5MG1OB7yq3rolSxoXqy6Z/95b8qeuKW6CdIWAHH3quD2TentPTPZe7Bnypv
         sSqw==
X-Forwarded-Encrypted: i=1; AJvYcCUc5TA8Nh2wHlzwzCV+1Yk4EuoWORO07456N9/eHry/zvSUvermJQ+MwEbQ39yzHGgH4W01UAJPh2R73Qo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNbjFaWRocvU3IYpN8I63LXYWwv8o82auf6US3bB8g7/picA9d
	qSn9Xspps9wKxm/lJVBSXUNNMAUvFgRUgvTi1H3o+gpBi6/Ni933YWz+jWMLCXHlmA==
X-Google-Smtp-Source: AGHT+IFrvTh9yGQeIC99rDaSyohlIWmY/cd98cXWXWBBtOnvULrh4CKCoiBDwd6yf44KtAXaT7swZbs=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:a291:0:b0:e28:e510:6ab1 with SMTP id
 3f1490d57ef6-e33026b3c56mr4382276.8.1730569882127; Sat, 02 Nov 2024 10:51:22
 -0700 (PDT)
Date: Sat,  2 Nov 2024 10:51:09 -0700
In-Reply-To: <20241102175115.1769468-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241102175115.1769468-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241102175115.1769468-3-xur@google.com>
Subject: [PATCH v7 2/7] objtool: Fix unreachable instruction warnings for weak functions
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
Tested-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Kees Cook <kees@kernel.org>
Acked-by: Josh Poimboeuf <jpoimboe@kernel.org>
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


