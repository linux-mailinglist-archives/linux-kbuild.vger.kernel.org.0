Return-Path: <linux-kbuild+bounces-4813-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A069D6743
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 03:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 844292828FB
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 02:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 546881714CF;
	Sat, 23 Nov 2024 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OWShlzS2"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2639B1632EF
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 02:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732329744; cv=none; b=WS0go+Ia8A7+OZqKZI2rK6WRjUgkT430Hrz3JgesEdr6km+wK0HC82g9VzCT/WwiNdKVVyIV5EAgu+QUn1GoNXXP7aUI5ssPc2aISUVaiJzL4I+A78Rje76wUp+AafpD8vSfpFkYhAu/xEKmjPR2zTkCsbAPABUUki0lXJqnZq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732329744; c=relaxed/simple;
	bh=0yX0O56Cy9DjD1BN27Ou2NLL8xBazcNKqhkhwB+1Elo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=drnpEz66UxX/wJ8UaRNo6aBT6llZJqSHFMidIQHnz1cf/T+mWVlOaal1B7LZHyPqn5mjXP+VmhACt6n/1GSJcfoeKnXWQBTWKTK2JK1zPfC8jeYGWTt+SFOrIP7SYtqTX9pEsGZdHfF5x8lzZeOb9xIbMzUvto5u2zTtKfAd+J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OWShlzS2; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e38f6630bbbso2523609276.3
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2024 18:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732329741; x=1732934541; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp/DQHT9ajDejoGv2qWHIWzSG+xRkTc6NeDxcpejopM=;
        b=OWShlzS2MenLwWPyAhWZ5PE6BWWtBlqWKSulPtaZAT4fl7Oe1XFwgqU0y4eh4lYreW
         NBELSdUyC1h5KWZepyfK6a4C455YW/z4nviZAZbgXaypt1XdL71k5o0gKndDbFXT5dj9
         rZzx/04moHuTTjQ26hP+tUeBry3jSJOSDPTOz0ah9BO2BIT0cm0clxJPHR0iOb7kWGzC
         o4EqPdT8pd4r0nygrgKTurZzuf697iIkDP9I0/HX5eKZn777j9SG3M95n5I1gqliXXie
         ocRagSjbfnjXqrEiyN0DUYh7+T0hm0xzS/gqUGP5myAWokkTz+BcsS/6YlpVK5Co9n5z
         wePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732329741; x=1732934541;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lp/DQHT9ajDejoGv2qWHIWzSG+xRkTc6NeDxcpejopM=;
        b=K2tp1yIGQbccVfpYvhDqYy4JhaHs1PLZOuTJ5WkthTozzuipQyrU6FL+cimTNUN370
         rtFiWJIYstGYOPwEWOdIOObxbHI5jkr029r/XoqJh0Gyal5uhj0EZHho8s3M6N7atF7N
         AE9XIxa8wJ92ZQysH7dIb3gZaEDV4qcMcinLuO1knTycrSdInqy+orUH75kOkFXAd6Uq
         QJ+A2Lr4vvqYuqjd8hTjjK5G0IRBW9MPWn7Xka7iFVmDB8hMetXhwiLMF4RBjARXjHQm
         pEt3eOsgAdQbO205NAn+IQrQJFI3AsogV9nHRCmxHPKBeBY/P/+rj7lGjKKfOLmdGj1z
         ECBw==
X-Forwarded-Encrypted: i=1; AJvYcCWDlxiXCkmKrKiyRm8wwTAbVqlBppyAsdDhRszM4Xk7F3wnD0tKpMNGUYH9/32cq73mtVcmaJ+5aL78Zxk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3s61zK7jsJ/nnMuE3LHVPUMRZi8PgtTIK43nQ2djA9OCRCIaY
	IQj+GgnOLXx5VR9AjMq+uJsKG+jXVMc4sB7UAAiNsaFerhZdQCAJ/JqEJTjip4jcZbC+i95y0IE
	MEcVUsw==
X-Google-Smtp-Source: AGHT+IHQjRyzySbtwdkoOt1T+PXutilkqG1SAxMngtM5pPPrJVREzuPlfAX2R4ZeNZDhw6d4BpoiRwRNwvFZ
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:b181:0:b0:e38:7b5e:56bb with SMTP id
 3f1490d57ef6-e38f8b2c145mr1936276.3.1732329741018; Fri, 22 Nov 2024 18:42:21
 -0800 (PST)
Date: Sat, 23 Nov 2024 02:42:16 +0000
In-Reply-To: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241123-extended-modversions-v10-0-0fa754ffdee3@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v10-2-0fa754ffdee3@google.com>
Subject: [PATCH v10 2/5] modpost: Produce extended MODVERSIONS information
From: Matthew Maurer <mmaurer@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Generate both the existing modversions format and the new extended one
when running modpost. Presence of this metadata in the final .ko is
guarded by CONFIG_EXTENDED_MODVERSIONS.

We no longer generate an error on long symbols in modpost if
CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
encoded in the extended section. These symbols will be skipped in the
previous encoding. An error will still be generated if
CONFIG_EXTENDED_MODVERSIONS is not set.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 10 ++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    | 65 +++++++++++++++++++++++++++++++++++++++++++++---
 3 files changed, 72 insertions(+), 4 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index e6b2427e5c190aacf7b9c5c1bb57fca39d311564..a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -208,6 +208,16 @@ config ASM_MODVERSIONS
 	  assembly. This can be enabled only when the target architecture
 	  supports it.
 
+config EXTENDED_MODVERSIONS
+	bool "Extended Module Versioning Support"
+	depends on MODVERSIONS
+	help
+	  This enables extended MODVERSIONs support, allowing long symbol
+	  names to be versioned.
+
+	  The most likely reason you would enable this is to enable Rust
+	  support. If unsure, say N.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index ab0e94ea62496e11dbaa3ffc289ce546862795ca..40426fc6350985780c0092beb49c6cc29b9eff62 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,6 +43,7 @@ MODPOST = $(objtree)/scripts/mod/modpost
 modpost-args =										\
 	$(if $(CONFIG_MODULES),-M)							\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
+	$(if $(CONFIG_EXTENDED_MODVERSIONS),-x)						\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
 	$(if $(KBUILD_MODPOST_WARN),-w)							\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 107393a8c48a5993dbe456702fec0652a967ee86..bd38f33fd41fbd98bce34f8924b2fb0ac04297ee 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -32,6 +32,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_EXTENDED_MODVERSIONS set? */
+static bool extended_modversions;
 /* If we are modposting external module set to 1 */
 static bool external_module;
 /* Only warn about unresolved symbols */
@@ -1817,6 +1819,52 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 	}
 }
 
+/**
+ * Record CRCs for unresolved symbols, supporting long names
+ */
+static void add_extended_versions(struct buffer *b, struct module *mod)
+{
+	struct symbol *s;
+
+	if (!extended_modversions)
+		return;
+
+	buf_printf(b, "\n");
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
+}
+
 /**
  * Record CRCs for unresolved symbols
  **/
@@ -1840,9 +1888,14 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			if (extended_modversions)
+				/* this symbol will only be in the extended info */
+				continue;
+			else {
+				error("too long symbol \"%s\" [%s.ko]\n",
+				      s->name, mod->name);
+				break;
+			}
 		}
 		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
 			   s->crc, s->name);
@@ -1972,6 +2025,7 @@ static void write_mod_c_file(struct module *mod)
 	add_header(&buf, mod);
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
+	add_extended_versions(&buf, mod);
 	add_depends(&buf, mod);
 	add_moddevtable(&buf, mod);
 	add_srcversion(&buf, mod);
@@ -2130,7 +2184,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2179,6 +2233,9 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'x':
+			extended_modversions = true;
+			break;
 		default:
 			exit(1);
 		}

-- 
2.47.0.371.ga323438b13-goog


