Return-Path: <linux-kbuild+bounces-3753-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5079862C8
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 17:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 228A628A755
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Sep 2024 15:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D699C18E034;
	Wed, 25 Sep 2024 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P1KxEfU7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01AF18FDC9
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 15:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727276548; cv=none; b=WPHe1lagZ1czp3FHbPBd5QWtoP62jF9xQAuUnfio0o9rYdvgWuZqBaOHFlAGuUDrLXEh5j0VbIIAdXmCjprJqwkJJzd1tTEFIqLtEhQNGTw4kd7Hl/y7ORs54qGVFUMwrqjdImq6Of+i8X/gsFFXbrKOLv2biAc4tU/TeNR1N3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727276548; c=relaxed/simple;
	bh=vuy2srbwlGWCNhjJ429H+XQTUepQW5BfwFX52st1yXg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=J+A9kjD+lRv381W8pFV1yUKfho4AZkUY0EQ5+USCdyTCFpA6WtlX2OkMEmEYz867rnTxGNFH3WbiXfaos9RxZNpTclknB0//auGlOIAvFnpdQG+N5tYsTDABUou6MzA4Tca1oF49Vi5WjgVoq7Hpw2fCMkgXVbW2EQkrKL3bNK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P1KxEfU7; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e211e439a3so27384817b3.3
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Sep 2024 08:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727276546; x=1727881346; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TEh1/zkt2ebfm60sAnflL74oR8UqJJcIMQFWRvgC+dE=;
        b=P1KxEfU7NFI1FLa68htOn3FIemF2YoJ6ZngfHUhsKoFBRiXxiwVBOTYecj3iV5fXut
         Kp5pAy4MyYpTuIwIh1ul53pcejuye0feuUW/N2sSiiV23IoHpesKme5QnUN3QIRK9Scm
         jOJSpxVOtjp+R4vV2H1BXWolNHvOaltnkFQZO4b8HH+yxzEJYon4nNKIV9abmiJ3Qr6z
         MB45/dPAX38qoLlqeKxr2UzmTg6b3zQjOj2t0/4aKMhnPp9H0u99nESwyciFmWtxtP7X
         WlwMG8GRS226I1RCGZJjImxo/4LOik3jTeV5QqHXPPvoYIyhU83s5SKOqD4zhyJaMGyV
         AqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727276546; x=1727881346;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TEh1/zkt2ebfm60sAnflL74oR8UqJJcIMQFWRvgC+dE=;
        b=ZeWFnF7exTvRj9ePUsPtX6hXJxbJjW9UcaLNAMadmbAJfaPhDsZ8TBphqUNOO9Q4/R
         69QI2sKciW9f32GMrVrMXC4afIhVH7KindAgfCHn+hTGqadsBFe5MphqfTQTpsSTL7KP
         UpFf/339tIpGiyo7I2kr4WFN8iQMHM5VO+ZZ/pEomEaTGwGXi/iH8JWZxUBhaxdDOKXM
         uoIcF77aK0wmwrmMrnCXoKX+Lb3raVtDKY3r/HAkEse9NJl+cGr0YDPVVgIQVHEYjWsv
         IUQZ4W/wuehxpNxNaBj9BQfn7wfGmZ9mUM5qMFurSa6YwAE1geIsccubMvYfzKhQcfnu
         S93g==
X-Forwarded-Encrypted: i=1; AJvYcCURsZsKA2DOvK6jA9qHBSWvSKuFwf5YVq233Sfc93hWIjuVTrBKl3j9N1F8Rx1GdJzHV5TPcfD7PQQVolA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzJVHF/s5wOkzvi1a+s+gOJD7kwOYrl7g0ljVQ2A3E1wcNDj0Z
	Opzfkpuzpo1QEekCd64yxokoCTWGCFURzuEbTi3gH8Y8AR9hoYcfMuuTqfW2FNBOZ9QTmQ==
X-Google-Smtp-Source: AGHT+IGW5+6XYu5evov+Dvb+HROZj8E6YTyxVVP1a7XWDg5djajQJxqHbA/Whb8+5/ewCu11GBBmm/SO
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:7b:198d:ac11:8138])
 (user=ardb job=sendgmr) by 2002:a05:690c:438d:b0:6b1:8b74:978a with SMTP id
 00721157ae682-6e21d9d4ae9mr51697b3.4.1727276545723; Wed, 25 Sep 2024 08:02:25
 -0700 (PDT)
Date: Wed, 25 Sep 2024 17:01:14 +0200
In-Reply-To: <20240925150059.3955569-30-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240925150059.3955569-30-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=934; i=ardb@kernel.org;
 h=from:subject; bh=DJZDFnSYvzXqQFYRPN/gizuDfobz3ccWU866DGFdU/U=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIe2L6v7XV9cI3q9cJcJR8+Vf2+Fz2Wk/Dh/Y/X1ToOXyt
 a351cxsHaUsDGIcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiXdsZGZaErou6cPCEcv22
 Prcpp+bqHWznepHA8X6Z9Zn/83etFNBlZOg9+zlgLqMlq/AX9n2rM647K2+Mmvyn9GzNS4f81qf fJ/EAAA==
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
Message-ID: <20240925150059.3955569-44-ardb+git@google.com>
Subject: [RFC PATCH 14/28] x86/rethook: Use RIP-relative reference for return address
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Uros Bizjak <ubizjak@gmail.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Keith Packard <keithp@keithp.com>, 
	Justin Stitt <justinstitt@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, linux-doc@vger.kernel.org, 
	linux-pm@vger.kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-efi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-sparse@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Instead of pushing an immediate absolute address, which is incompatible
with PIE codegen or linking, use a LEA instruction to take the address
into a register.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/x86/kernel/rethook.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/rethook.c b/arch/x86/kernel/rethook.c
index 8a1c0111ae79..3b3c17ba3cd5 100644
--- a/arch/x86/kernel/rethook.c
+++ b/arch/x86/kernel/rethook.c
@@ -27,7 +27,8 @@ asm(
 #ifdef CONFIG_X86_64
 	ANNOTATE_NOENDBR	/* This is only jumped from ret instruction */
 	/* Push a fake return address to tell the unwinder it's a rethook. */
-	"	pushq $arch_rethook_trampoline\n"
+	"	leaq arch_rethook_trampoline(%rip), %rdi\n"
+	"	pushq %rdi\n"
 	UNWIND_HINT_FUNC
 	"       pushq $" __stringify(__KERNEL_DS) "\n"
 	/* Save the 'sp - 16', this will be fixed later. */
-- 
2.46.0.792.g87dc391469-goog


