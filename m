Return-Path: <linux-kbuild+bounces-4142-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ECF9799FC5C
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Oct 2024 01:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D3C31C2441B
	for <lists+linux-kbuild@lfdr.de>; Tue, 15 Oct 2024 23:21:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CC251FE0FB;
	Tue, 15 Oct 2024 23:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aetkJSJz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B2A1FDFA8
	for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 23:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729034401; cv=none; b=rEM0yQQVo2FZNDqe/rB1SIZ6Rybymkq9urJ2tu+xzXD1EqHq1XDxMGVo45lEP/BnU2txWlyW5Usw99062f0jhzoACJwX+CBT1p9aylkNWcOwCdBpSgfDqtwFmITmIik8AH8DWaHNmUSpjz6URlNR6nlm46Nr/MZIIYGTUJnO0GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729034401; c=relaxed/simple;
	bh=Kp5uggGbEJrPIVkqdlvJVT6U0SCrN+hpDOmeYYUT59w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UiaOxMxDF8PzSWKLp4tzpX13bBia6/RV9w8eyYrep+Lftrq3Nq2y4a8vm3x/zt2IK5jabiOqdPxUlYmLhVf5qSdsC+0tkhgvkCY58j8EfozX9L0e56q4dbLN2usDo+QM7f6bLdiucklW0ItegDAWfdvJWGSFLsbo1mZVKb2w8jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aetkJSJz; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6e32f43c797so3649837b3.1
        for <linux-kbuild@vger.kernel.org>; Tue, 15 Oct 2024 16:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729034398; x=1729639198; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xasC2bG4ku4iDrf29H3XucNRhtvas+BiYTJxtPjY34w=;
        b=aetkJSJzE6emuP+So9ibvLCPDzwF7Fq2cOR6yXqUAPhw9UmIaD9cFKb2Td3jJ00JHu
         iTTq3whxjkEowJoKiGf0VhDK6J8/tY1AtZB7vqbbF6fOw3UHCQ3Zc7ahH5tEPcasVwFR
         QzNFPwqDMq4abvOt7bva51XwTvQfvAMfhvmNK5p/iB832yLG/AJ23y5t/Xcjb1zdhBLX
         iiFHVmLPbnuVL8xKLvdZcrCZNIafp7IepylQjM8PryRz7f+rL79HJwEkXnBV6TK1DDhx
         OdDEjXAhIc/v54B/wvx6AG1ZWIdPrWJgYPThlSuIzS5XPIvNgnpurUcoTZuAMQ5IyBeG
         5xJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729034398; x=1729639198;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xasC2bG4ku4iDrf29H3XucNRhtvas+BiYTJxtPjY34w=;
        b=N9g4MHEcp8ZPg+WyjwyKGZ31PIi3ZgFUyc3Ko0ip17OGRlMUE1GaXTuFIFoIT/7aEh
         UGE4QmCNedwSv92YlfVomUomprGhNg85IqKBUUpQpyszaMsyJRC1nUI9EUyfpgionA2C
         3qbPkaN9xy1gUwDC7Pc5WBMDbWMxplFuI4Jtl2szV/+mzKsm6Pff0VKDUQybKWNS/Hwj
         ENM3739yLX+rN/qqM2f/IeU9/E6F+SqqrkrO2I0PrVouWvLK/6QOyt/6i3UL3X2z50rA
         oEMo13hrzztWMp5V/AEoUROkhZGYyYd1UJW/WLLRe6MdGWBYfmBn6/+GgjsUB/nEQ/6V
         zElw==
X-Forwarded-Encrypted: i=1; AJvYcCUmJqpDxGhi0QCIE4gvHA7T5l+75mnxwmrHCWBW7PDae3MurZYWZ82F2Kk4/gaS2HKoO7VfZpjiXSh+ULk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfclJ+dm+sdYO//+zWSTSg/N3dpS4tX6UdpzFXzvjTUUxRZxzb
	gwYVbKdZpCGGoqxcc8wiZAqAGqE1rNQcCr8JAwDjGKqgvZX2N6/0Xh7w8wBiufLthn8/yZHLteu
	myJsFog==
X-Google-Smtp-Source: AGHT+IEhM7UuM8n6j7x3Tn2NtgtBsdUObL6hxcYJG9U32wvNR7YuZK72mjGGNuHH/96W7Ib7Lctj8rOyPY/w
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a05:690c:3587:b0:68e:8de6:617c with SMTP
 id 00721157ae682-6e3d3aacfc0mr316117b3.5.1729034398638; Tue, 15 Oct 2024
 16:19:58 -0700 (PDT)
Date: Tue, 15 Oct 2024 23:18:59 +0000
In-Reply-To: <20241015231925.3854230-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241015231925.3854230-1-mmaurer@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241015231925.3854230-5-mmaurer@google.com>
Subject: [PATCH v6 4/5] modpost: Produce extended MODVERSIONS information
From: Matthew Maurer <mmaurer@google.com>
To: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org, 
	gary@garyguo.net, mcgrof@kernel.org, Alex Gaynor <alex.gaynor@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st, j@jannau.net, 
	asahi@lists.linux.dev, linux-modules@vger.kernel.org, samitolvanen@google.com, 
	Matthew Maurer <mmaurer@google.com>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"

Generate both the existing modversions format and the new extended one
when running modpost. Presence of this metadata in the final .ko is
guarded by CONFIG_EXTENDED_MODVERSIONS.

We no longer generate an error on long symbols in modpost if
CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
encoded in the extended section. These symbols will be skipped in the
previous encoding. An error will still be generated if
CONFIG_EXTENDED_MODVERSIONS is not set.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig |  8 ++++++++
 scripts/mod/modpost.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 7c6588148d42..a5de2b7f2758 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -177,6 +177,14 @@ config ASM_MODVERSIONS
 	  assembly. This can be enabled only when the target architecture
 	  supports it.
 
+config EXTENDED_MODVERSIONS
+	bool "Extended Module Versioning Support"
+	depends on MODVERSIONS
+	help
+	  This enables extended MODVERSIONs support, allowing long symbol
+	  names to be versioned. The most likely reasons you would enable
+	  this are for Rust usage or aggressive LTO configurations.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a..d18ff8a1109a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1840,15 +1840,56 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
+#ifdef CONFIG_EXTENDED_MODVERSIONS
+			/* this symbol will only be in the extended info */
+			continue;
+#else
 			error("too long symbol \"%s\" [%s.ko]\n",
 			      s->name, mod->name);
 			break;
+#endif
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
 	}
 
 	buf_printf(b, "};\n");
+
+	buf_printf(b, "#ifdef CONFIG_EXTENDED_MODVERSIONS\n");
+	buf_printf(b, "static const s32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t%#8x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			/*
+			 * We already warned on this when producing the legacy
+			 * modversions table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		}
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
+	buf_printf(b, "#endif\n");
 }
 
 static void add_depends(struct buffer *b, struct module *mod)
-- 
2.47.0.rc1.288.g06298d1525-goog


