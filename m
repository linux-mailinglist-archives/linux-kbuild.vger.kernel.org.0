Return-Path: <linux-kbuild+bounces-5210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 816E09F86AB
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 22:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02B4F1881190
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Dec 2024 21:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CA3200127;
	Thu, 19 Dec 2024 21:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DBTjqzFB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2641FF613
	for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734642498; cv=none; b=kwiGr9rvcSJoCP622PMNReKjnDKcccGDm4fIg/8Z+KQW1CgHsX7Rg6nlhai77JLkF/pASX67R/EtOhngOfp6IDsA2GdWrGY+SQtXePm0m/bm76EFJZ+xks2nOc/qyaPsv69kKYroN2M2PoWR6pAABPax/DTF/2yrx5biogN0Lt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734642498; c=relaxed/simple;
	bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U3fi86CTioI1V5xdBmCqtq63somdcTBQWV9Le2XkAB7eVBMPu6emcxdbcNi2B4TskGMFHEi7hVvGknbhco/2MAHUZQsyByydlz1fkv1mE50kVW2UZ05tnBFBPQ1fb/w/LNToj4Chawr1tyJPybJ9BcmCfvKY2Jro60bJsAIQ3+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DBTjqzFB; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-7ea8c2b257bso834631a12.1
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Dec 2024 13:08:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734642496; x=1735247296; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=DBTjqzFB9cUlXBv+JhaOM3TbZRs+CLHHWMir38Pm7DMPiIUog5czwtL9iYxrCPWfpC
         y+YvPjXxTQRL0sMlBckBNSkiPNL7GqDnSOzR3Svr9CKlXU4FGQNzx55iHTBNn2DRcQni
         mA0d5W2sBwGzoFMuxMHRcf3yTCxzcvar5KSos9a5fZDVjFRp0r84KleayRgX4MiZTBFE
         i1XUnrDZ2DtbRXekJGcK8CFsHxgsmrfO3zxJNrOj6JtPiFQIRgKoD3juwdQMOynaao9y
         tUkvUVzzMTNdclFxg9BIVx2cb43Ls8mXC/PgqjNidJU8vea3zeiyM9FSJ1YpcMuX+GE5
         FLDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734642496; x=1735247296;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhebaHvwRpIK3ajuqUsaMJY6c1H8vjbSZoFxdXzqCTY=;
        b=tFJB5Gymt6PKJNkEt99bSRNILpvLW0D+vlI06SZz2DUY0YHspWC4nt6KWUgsEBVUey
         e8z8m5r3nGugC5vyKiS6Ihf+1hKuTHz3KP+sJbjwXf5D52vetIUzOww3DseoxNFqL8Rx
         95C+bLrbwYfZbo4p0fqK9GSor6KJty3gXNjsajvjlEzLdm8j/ZQAbcw8fEtrabudgeC8
         DXGpHQ/mXDmvf7tBlkSKtw2Cox4kz/1S3/1jc8/a3ptna7qII+YycGxdYUq+nHkILyDS
         YmJnKxTSPtCES+ccrowP75hNsagdWVuBJfcQV0mQXyafW5hhBMcczHLincSKlqGX3Pr/
         UMEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXObrSq83PwqFFggZoOOANGEB2mHxGEYuVjWaVgjhatURPhAfsC0E04zlMpVzWgGGMVtUZq8CfiikefWWI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1Fiw4kr8zGZkTn5e9tUEM6ziSotrDEKi9XBz/XiQymLubPlIG
	MQDjQP9d1Z8h62bRiFddfl6sHDvIen3vtT6lzvPJPNz9B3p3B1C4TamkJN09yVkTa4Hm3FkTFzD
	Qy5mCF/wFvMwFt/cDocqNNCmIuQ==
X-Google-Smtp-Source: AGHT+IFhC4Ah0P2LpeeGNVWwyHAZfHL11yB3Qlfn6u2eyEw2X2bDrlrkxGMrpOMsrenz4F16xpWQ4hhDijC681Gi99s=
X-Received: from pjbsc15.prod.google.com ([2002:a17:90b:510f:b0:2da:ac73:93e0])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2744:b0:2ee:d7d3:3008 with SMTP id 98e67ed59e1d1-2f452e205b2mr861955a91.12.1734642495981;
 Thu, 19 Dec 2024 13:08:15 -0800 (PST)
Date: Thu, 19 Dec 2024 21:07:53 +0000
In-Reply-To: <20241219210736.2990838-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241219210736.2990838-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=G8T+NnXPkjDtKGjHLSfjrDpCNmmPfEyUeqSk1ZhBztg=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkp3YrdtVHhySouOkF7m0o/qbT80J9sEuBUNadufYapv
 7naryUdpSwMYhwMsmKKLC1fV2/d/d0p9dXnIgmYOaxMIEMYuDgFYCL6mYwMC8QNvC5Va/C6soQc
 2nND0fFj1mrj2OxZJ382S7zpEX4XwfBPU+d02AeenJOZBg++HOXPnffloVHvtx28p1rmeYb8rvz ACAA=
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241219210736.2990838-36-samitolvanen@google.com>
Subject: [PATCH v7 16/18] export: Add __gendwarfksyms_ptr_ references to
 exported symbols
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

With gendwarfksyms, we need each TU where the EXPORT_SYMBOL() macro
is used to also contain DWARF type information for the symbols it
exports.  However, as a TU can also export external symbols and
compilers may choose not to emit debugging information for symbols not
defined in the current TU, the missing types will result in missing
symbol versions. Stand-alone assembly code also doesn't contain type
information for exported symbols, so we need to compile a temporary
object file with asm-prototypes.h instead, and similarly need to
ensure the DWARF in the temporary object file contains the necessary
types.

To always emit type information for external exports, add explicit
__gendwarfksyms_ptr_<symbol> references to them in EXPORT_SYMBOL().
gendwarfksyms will use the type information for __gendwarfksyms_ptr_*
if needed. Discard the pointers from the final binary to avoid further
bloat.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 include/linux/export.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/export.h b/include/linux/export.h
index 2633df4d31e6..a8c23d945634 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -52,9 +52,24 @@
 
 #else
 
+#ifdef CONFIG_GENDWARFKSYMS
+/*
+ * With CONFIG_GENDWARFKSYMS, ensure the compiler emits debugging
+ * information for all exported symbols, including those defined in
+ * different TUs, by adding a __gendwarfksyms_ptr_<symbol> pointer
+ * that's discarded during the final link.
+ */
+#define __GENDWARFKSYMS_EXPORT(sym)				\
+	static typeof(sym) *__gendwarfksyms_ptr_##sym __used	\
+		__section(".discard.gendwarfksyms") = &sym;
+#else
+#define __GENDWARFKSYMS_EXPORT(sym)
+#endif
+
 #define __EXPORT_SYMBOL(sym, license, ns)			\
 	extern typeof(sym) sym;					\
 	__ADDRESSABLE(sym)					\
+	__GENDWARFKSYMS_EXPORT(sym)				\
 	asm(__stringify(___EXPORT_SYMBOL(sym, license, ns)))
 
 #endif
-- 
2.47.1.613.gc27f4b7a9f-goog


