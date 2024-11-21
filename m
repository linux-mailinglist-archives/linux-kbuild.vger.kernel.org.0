Return-Path: <linux-kbuild+bounces-4782-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 294C59D543E
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ACE881F21883
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1033F1DF997;
	Thu, 21 Nov 2024 20:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S38/b6dN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BE41DF74F
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221785; cv=none; b=jqCo9+PjBkT7raP0/G2wmA9GDtF2o6ammGLv7AGWhLizN/KHHNMqh6Pd4cjPHUKuIKSazdDUhT5X0TKaeeZYB6h4iQbP5Kg7akHM8nwKtLtgvc4a9R1pRK6+k13nScrwE0Bac4hK3PLybzsa+ml69aWzMq/oyfMUxc9Q+4YL4jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221785; c=relaxed/simple;
	bh=xtaSIvxHknHitZ36vqFnUTb8roe1ES/1Z1TTODMFmEs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=G80m5wPTe3+y9VvL3jkNFT473L8+ZGRXpqvkLG6dlxKpBVy3bfTgmwWlqlI6d6gQLv7Dq0LTiPjMcWXsGND5GI3cv7gyfrir90uLtJhdqrUX31bq72pKsOuZ0iOKl+fusKO9sh+65FzlMlcPP1JE3vLBHL9NAmxYWRXV/82WzLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S38/b6dN; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-20d417fc584so14365965ad.1
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221783; x=1732826583; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BV+aUvfqJMcZq8xGaB9yJiMSnj11evO//RiyZr5bI/4=;
        b=S38/b6dNAR/mRk63yOTZVUW4y/viR1xVPg5QkwAouQqD+CwPoLwuMINSL14i3KEMZc
         IKPfwYy178GEVWs/kCurYHokn+hEW/H3BgkN9YRufqFbkNtzUM/XmP2TRpuPAdJExg89
         A8qU7LJfXGn2Dp9vZww8HOhm59/P1x6NXUOLB/fowTp+qw6/OqfW07r6EO4i3LS7BGf8
         EoP5vrLYXcOqjN2blmSJsO5HRCgpTTSRs/29fP1LpFwCf74SYqiJteI8UWj436c9wxt8
         ZrjVU/SI/tezhwZE3Ai3UPtz+8H9cV03WNRHNAnR/6LP98axX++CFqV5AJrbSLXU7L5G
         Ei4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221783; x=1732826583;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BV+aUvfqJMcZq8xGaB9yJiMSnj11evO//RiyZr5bI/4=;
        b=fzPcfVbz8qR4dev0GXY3GNnLz2Ln0L6TqMNG7gxgHS+i0lownt/bMIke9u34k0bX+I
         2WfKVye5kKpK4VA3fsiNFrk4Xmqay9WH+Zl0nJWA06SzqmhSF/MGfPVG4C2DV8SLEzRj
         5/8qegePhLi5RpPP/FSAPc2PFmS5MkkId67tSAk00Os9exs6u08ZPKEp1QUCkZmTv77/
         oG5hJzJ9i48GhpTvOzkCSgKAOmWvSfy78pccZmi5hxfWr+etDUSkLM6Aqo/9Zsl03asW
         z3R5tpUHL3uF5hNHZSJu+pgX1p1mrOZeQHiHrWAqiJdz01uoBemurTdfUUrjI5nBTvsz
         EDMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHOYGTo9piuH+Tk7z+nrLggucraMzDvFrA+/jBUaec+ao3boRcCz4kc7kfnZPyCakD8lcgDJ3C+cApPwg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3o2F0r7kZmReFgpTE7aJvgAYulUp8XK4p9qRTvcbFTcMcYCH
	JkmefevgRrfMYHjKa9EdBo9CTTisfzr+HCzwvfdDfOp7GjK0fmRP9steMePu7Spnp+5UbDDfK3d
	W15QG3JbPzuEu79ycrvEv6EULfw==
X-Google-Smtp-Source: AGHT+IEL8dfJrjeB7OOZP3DGVEJNUwuVUxTwOq2yx0IpeIeDGWPIyVAbuB88MKF3tMDhLZ35CoQVhQdB25OFLx22EmU=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:facc:b0:212:673a:c18e with
 SMTP id d9443c01a7336-2129f20e86dmr2275ad.2.1732221783527; Thu, 21 Nov 2024
 12:43:03 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:37 +0000
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2005; i=samitolvanen@google.com;
 h=from:subject; bh=xtaSIvxHknHitZ36vqFnUTb8roe1ES/1Z1TTODMFmEs=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s01DnoisXl+/y+usjtDHjTJL9TPntS5fHLCojZMtu
 Pxch01XRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIPgmGf3p2aUsZb0SxHjge
 XHf1TNqhRoH9OVde/Tj/1sjBfJd3dCDDP8vyeRd2KClw+Lw69uqgzdFf80++vRYtvHvjk2+5AUZ LmpgA
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-36-samitolvanen@google.com>
Subject: [PATCH v6 16/18] export: Add __gendwarfksyms_ptr_ references to
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
index 0bbd02fd351d..cf71d3202e5b 100644
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
2.47.0.371.ga323438b13-goog


