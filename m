Return-Path: <linux-kbuild+bounces-4041-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1922799922C
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 21:24:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB5DD284BCF
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 19:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB9761CB528;
	Thu, 10 Oct 2024 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qs5hkC9D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D468A1CF7D6
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 19:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728588251; cv=none; b=bJcsRacwtCA/5LqsCjbHsm7Q6R1TdtL1LKpiZVyLY4HDPe40lJIoiy7t08iWTmFyiIKzuu67VxjCA/WgSD5nM23k71pdV0/t/2QHWocjrjHnJOJ5GaEaU+9qRQmBSRYdFiQ1K0tw3njPze+LDG1/KLAaF1dCfhe+/PCCpTu18Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728588251; c=relaxed/simple;
	bh=B/fTpCzd8QlJMQ3iEfz2aTZvNZTM1lTyUzt5b6yEoHA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yy6XZw4KoRqdOFWvhGuFSpS3TNH7T451kTLqFugg9siqAqOr0r8Rm6Y7WFYQnqo3mOMib3F78vE+JGN7U9gWEoKjdSdRD05aiwuSkmD7JhRnjVLGv7pi3LLYFr8VkyCtuCu/pxsLsXMUyz42wf4kgDX2dA9hFRWKlh2B038KKog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qs5hkC9D; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e2913beeddaso699871276.0
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 12:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728588249; x=1729193049; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pwVGeNhEiYELCNV51bxA2EzTaJbA2K5Fr027Br3jO4Q=;
        b=qs5hkC9DxaPqNC52LcXmgLYggJaqQWSGbKzkQ45ToHblTiJPSYXLIQIzZbZg5jNgTi
         z/NTFdYp8ufpUA7vRvPtnYnlNEOwNi74wqSF4nDmJsnkmTlHPfG0lh7Ns9a50fyhaFbu
         jF6xnNLBVPbLQ0r8ueDs+/W6Qf8yYBrxx0YUBK9jCHiyW1UMW6LkSeBnFArdtpcE7U48
         zV7TEQq2kpj/DPwKjbMBKG+ZpQ5eoK1htw3FCFqTPAQDb7/WqF5LRuTI5ApS7XGuj35B
         HIHDRlsa0yIk3XMf8gS4Wbz9HltVsTq6zF0zgDtAouu2sX9G5BQYSF5rsVwXC2bKBKju
         ZsGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728588249; x=1729193049;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pwVGeNhEiYELCNV51bxA2EzTaJbA2K5Fr027Br3jO4Q=;
        b=YlQdyDT+S4puBStXVIYrUsYyPGJMYhxpeLz379UU0bnATlJOhk1b6Gp8NgRujaw54w
         z8lMdWYbAhPHt1L9jsXb47zwbDWNCyFXMGENbq0IbmpdIsGJCzMkc2eX5PsKCOOO4Xw3
         yYWVXlTfnOQI49yB8U3KAico2tC8n8DER6NIR4RIaAxVD0u8qyJ3pEmDWr/IAcdbHHVd
         CJ60pyLD4sXgK/PqsCoTd0kxySqde/U91H89m6j/t2+FPaUeSfaQhb3D9JUq4HfkDlPp
         Vsv/41C8GRZ1w1ebF0UE3zNfeXJsbZW6ogodnn5SLuWCmWuDgcrV/qC1N7rXlQThzGbK
         D+kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRRvpihP8K0Nks+3Ce5gSaz7w5q+s9JAW8rTozVNmwc4G4di7fsbjkyZds7rHb6J+kdvmqn+5Vx2wUmhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK73b0ckT6ebJqXFufT7Xg4HSIY6fHJPc5pdq6E9hOKigx3PIZ
	7xyUlyId26ZAP1OiJy+vZ5gDkzbnrViXBKhFRDkXlrTdO7j3i2JiVczyf2XZlS90DA==
X-Google-Smtp-Source: AGHT+IET7ynYxoh2WLaFTqujq1dsN8li9OFmo1T7KNB2xR5JtuPPo+YvvfF+NvnbjuFxvNf7cf4DObk=
X-Received: from xur.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:2330])
 (user=xur job=sendgmr) by 2002:a25:b104:0:b0:e29:a86:fd0d with SMTP id
 3f1490d57ef6-e290bb40627mr73646276.5.1728588248551; Thu, 10 Oct 2024 12:24:08
 -0700 (PDT)
Date: Thu, 10 Oct 2024 12:23:54 -0700
In-Reply-To: <20241010192400.451187-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010192400.451187-1-xur@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010192400.451187-3-xur@google.com>
Subject: [PATCH v3 2/6] objtool: Fix unreachable instruction warnings for weak funcitons
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
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maksim Panchenko <max4bolt@gmail.com>
Cc: x86@kernel.org, linux-arch@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, Sriraman Tallam <tmsriram@google.com>, 
	Krzysztof Pszeniczny <kpszeniczny@google.com>
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
---
 tools/objtool/elf.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
index 3d27983dc908..6f64d611faea 100644
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
2.47.0.rc1.288.g06298d1525-goog


