Return-Path: <linux-kbuild+bounces-3971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4DA9956F9
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:43:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0EDFF1F26A71
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BB2213EDD;
	Tue,  8 Oct 2024 18:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p8u5e+YE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9492C219CB0
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412750; cv=none; b=aiP0/AQdEqF+padMZ1/uj9GHFXaVUp4kul+9FwMHMf+exechK20t0n6C7I+0KFTqElgMWcyVFTR7zX8cpCDoxGIuilAZnuXaHHh5u8Xf4uHqTBSmRixhr7B8mfV1kuImwolb1zNGV5p8WYyOcfUTQ2V99ECKPQDy2C8CyrE8NLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412750; c=relaxed/simple;
	bh=63FTcQQsHnD0ujy7ldzffjez+nFzb+CbbWB4scUUBT4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZCHxjMPYP8rIeEUiXhFishSI3yFH1MTdZd374ykv4XxD8xcowLpiMs3wKizCD7wYJui7dME7peTyenC7q+RD0h7AO40lBcIf+3wLVWmseJYUn6uoRUsIG/tzkd+s06ZP4lzoUC49wjXPCG/QU+PlKShGY8n9OaukcAcy1wizqqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p8u5e+YE; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-20c5c43ecf0so7304325ad.2
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412748; x=1729017548; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4gdQj2kSzdcnDtZR+VagbT7f5UDOVpvc3nQ1NtsNEc=;
        b=p8u5e+YEr7Ld6yPVAF2ecfv/onOgI4H7LFYqq8rLWWNVtF21zjGzLzZzOP9qRE7afc
         fXxomKdHlO0tzm53bC+9HNJY8g3T1ZN6j4MFRtBH9Zxm8LUJB1I/Ua4GDCr9vuFLJ542
         Kk0bs0rEFeS2LUGVdqy+B319gXLfeM6hTZUjVwGpCmzP0+Q+QKRLa2ZwE/2OQUQen4vN
         m/1bEU9yE43A5oDcKZEPyWtGx6szqmg4eYTBt2IH9AfkCY8fLuRYdALYtDvNsavc4zQx
         nS9LI9IlZXZ5/zeYHWfzhKUsSX4aD/oqhtOIpyiuFvqNy2i5XNskwixz3l/axGOve7fo
         YffA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412748; x=1729017548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4gdQj2kSzdcnDtZR+VagbT7f5UDOVpvc3nQ1NtsNEc=;
        b=aF87Rquvjj9z2Ew+gyt9MIp8qtnI+ayIx3oZKN7YVaPettSubRv/JnWE5hX3bQ8FYL
         Uia5uNZRiFnUOUV4PJ6jiZzuAdZgEvewoPwiflq0/+Ed+ap+OSBGbJMUZv4vOvMBI9TQ
         PBPxEtueVErVb8qXG9EzPl6p8cmtwgSTqOhqbnjmHMyfV3At7WZoF+tc6TqN7pnb0DuX
         +ZpXl7YWtmNr/mcit/SevprBB5C78Fd56wJr1eoZUr3Nzk3jmbHbLIfxZCv2JiW5or73
         83OgZdX3A4bdYhSY458ahSL49Lg0qfJZMmorH3cej7sbNFdmBWWj5dPunmGgFZ1y6OCW
         G4Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWfNy3cwH0ABWBxhjT3wIGxHMSxDyg84tWWggMqXRxkGDNM9ZbyXSoC5dH3fkLKYlLP9d60X/q72ED8RjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM5Bm9ud79Q2XHab0Ru3UnLfxbGCuNR7ZskhKsULZiYYd8t0bu
	T/YXrfH0SkRMMCtGMmDNd+XR35q0OhN8xF+PKOYBO3EUDVQo01CHkmYrLTMYhqCCgScxzn/46+O
	I4wPLFaL6iVGMbsrrn8biIFf/jw==
X-Google-Smtp-Source: AGHT+IH4uDld0Ae+/fhGpS4rG8AsXui7zPcfmITo1sskAJxITEdUVNeC4NRhZvQwVt5ry3RgjuLHg8OC5hd+mt50H8Y=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:902:d491:b0:20b:984d:7000 with
 SMTP id d9443c01a7336-20bfd971431mr1757795ad.0.1728412746828; Tue, 08 Oct
 2024 11:39:06 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:41 +0000
In-Reply-To: <20241008183823.36676-21-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241008183823.36676-21-samitolvanen@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=2048; i=samitolvanen@google.com;
 h=from:subject; bh=63FTcQQsHnD0ujy7ldzffjez+nFzb+CbbWB4scUUBT4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNRpG/111u5W0hZqm1vFmmz/T2LbvG0O6QZZc0RW9h
 ILTJ2U6SlkYxDgYZMUUWVq+rt66+7tT6qvPRRIwc1iZQIYwcHEKwEQWfGFkOHiaqenqT3WXl0vZ
 +GRnuU789WO3+Yd7qalh/16/amCZrsrwV9qfp/aZoGsNo1j4m0elC4Q553GkOlgop/W/nZI70/M GHwA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-38-samitolvanen@google.com>
Subject: [PATCH v4 17/19] export: Add __gendwarfksyms_ptr_ references to
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
2.47.0.rc0.187.ge670bccf7e-goog


