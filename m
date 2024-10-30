Return-Path: <linux-kbuild+bounces-4424-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0694F9B6A7B
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 163D61F25190
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:12:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F5623AA66;
	Wed, 30 Oct 2024 17:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H9ggQVr4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A81B235A00
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307717; cv=none; b=gOHnxx6uzyb7Q3oP9wTRLvwekQGtGakVXkzrDc5sThhtIdMNHGCXmzbTRTIfYz6pgwep7gZoO+q9yu37F+pVbSz2kx89RhnYJcxAtKqMutas5Mn4pg+zCjYVek7sdkZ0wY/pzx7zAixaXNNL9wuUYH33Ux3VAHb8nXFQVqWm85U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307717; c=relaxed/simple;
	bh=rksEvC6HZ/MrrqljgbD4UQU0K86C0fyQIL1Xtq9Es3w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b3+tPHN9Wiv63VynwjcsCttjFb0tI6W2H1cXk3js6v85NcQ4X000t5KoGxnN/UBxhxiBag+KL1hAuxN8fmZiF2YaD04GP4c6pIb3MJ+nF/Cl95qcEFevUdklZdfimQTkEdMlTwEmAwi++WFZX4ojQ+4ln+tZTOH/7/vpf4Th4sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H9ggQVr4; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-210d5ea3cf5so468535ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307712; x=1730912512; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K7eFA8HtUgZFV05J7QoEMTMnbx6tYPL9kZjt/pwvBV0=;
        b=H9ggQVr40WHUySbWGhCGULrEDKClOEiHXoCas9FRu6KjmY2U2NBKOrsvtepincrCB6
         wYFE7C+NZlG3c7jlundUVcS5nnexchQ5uSX58McROSCTp73uv+enbcVwuhEV0Z7TkdG4
         gvIeSlGWv9WDvPEnAxqRtVp4lHdRIczIIrxwJL9z1SknJD1jHn8XmrAHWYC2hhc/KaLD
         jNcSpPFee03hqHeQLXqrotFBZjmL8jiQ85g6Dp1jRH9Xw2uuWp1983sWaZDAxHaxTmxh
         V4aK+bAz1wLRBL1H0lRxjY/In/t3W5sGKrodcv07mLNDzzcUcxDjV7hA3yEKk3WcP5eP
         BCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307712; x=1730912512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7eFA8HtUgZFV05J7QoEMTMnbx6tYPL9kZjt/pwvBV0=;
        b=pnJDffYjrQODyqJvI58BYEdxyq+Yh0E/MUtiNbfNzHQMQzmO29Eb5j1vN6rz4Vq+RU
         3vAa0DvukVNB7ymiwI+HM8cZ3+12d50G9s2zAt3pFZk5xK2gP+tYeLAhF6I1sZ1a9raR
         8h+ecM6GWA6g24+XhGqc9y3CqisyC3m3NulR9fYsfoO98n4tm+uvQzryfSXuFVOh8k/M
         tLZdLMD3TpAKgmoE9rsmrA9IxH9KUNAFR1LLYX7T2D86Jo1h84OTCJur/VpV0eQcnV9v
         YA5pD/camgYncUGjUiICdZ7KI52QTBGMW09RgxFH5v/eGthIHEMxQCxnJJ4b2+87BHMg
         LXcA==
X-Forwarded-Encrypted: i=1; AJvYcCUY1KP0xuMHAxeKvaPbnJDhHVarWIBOb4TAbK6CWdxE/6YcKSifSTRrQ6a37m/A9MgavOj0fOeNgm10baQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnTyD5cy6hlty1NGGAqVbC3U5Xp0sP7lxiooL8d36WKkJVBAyc
	Y3pjlR6C7nGhCveviWlsOozvCJ1GIIy2aRPgZJ7M+WujjUQP3OjkGs6B5+zCaF75TZpvteFqgM4
	NjwO9KfC4l64WTaPLGxUMJArkYA==
X-Google-Smtp-Source: AGHT+IFeuji1GvoYInueYeA2WpLljEcP1b95Twypfv+fPllRTgDVEPi5y36JJdk4mGTm6hE159syArTxkGm4qK6S4mY=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:903:32d0:b0:209:dc6d:769e with
 SMTP id d9443c01a7336-210ed3e47afmr348575ad.0.1730307712375; Wed, 30 Oct 2024
 10:01:52 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:24 +0000
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=samitolvanen@google.com;
 h=from:subject; bh=rksEvC6HZ/MrrqljgbD4UQU0K86C0fyQIL1Xtq9Es3w=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKadESFw9Lm7oed/RRtkqsu5E/5f5WozXTDVWmHDAqW
 iFQ8+RURykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZjIVAlGhs37+tc8uJK4WkvL
 z7N+VlXd3DmaWw4IPPWsz7uRlDvJ6hDDL+YpDQonlhzcKr4mp6rr80JBw9w/zK+cC3ufa17P2VT nwA0A
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-38-samitolvanen@google.com>
Subject: [PATCH v5 17/19] export: Add __gendwarfksyms_ptr_ references to
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
Acked-by: Neal Gompa <neal@gompa.dev>
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
2.47.0.163.g1226f6d8fa-goog


