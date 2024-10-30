Return-Path: <linux-kbuild+bounces-4432-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E02449B7045
	for <lists+linux-kbuild@lfdr.de>; Thu, 31 Oct 2024 00:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EED01C2156C
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 23:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5F6B21766F;
	Wed, 30 Oct 2024 23:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PfwDeRod"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1221E378D
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 23:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730329512; cv=none; b=HQz/D7w7oMr3Uq9qMfpm1CG0SEP5I2ET/ofyhtion6eyGLM99QcMdc3ReiQ5ZGG2GWF5pXh5bzDDDuCaABh5ofggtkUn49swzovz+LlXW0rZxVYf2ip/V1oqWoSxrSvrNqNcmkjM9weUbqEXIAFia0ZfpVAHDDCp9YlQJlX2x1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730329512; c=relaxed/simple;
	bh=NtLMxTWzg8A6ddRuBfeXKLMlTjPwJlOC6sG3G44LhJc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iej2i10lqUtFGN/kipwGb6dnEsPq6aisvRL9PklHCCJkjMPW9JM2RDSVRxCVBGwoF1NdwJn3TXKleSzKO55QTsw59lnbmelWgf9kQ7DmBP7K9HwBAurJCgw7xyCTLQowwwyOSjn1242gqcZtrehsDX0cujwtLaLOUc61pKUXoMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PfwDeRod; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e02fff66a83so574772276.0
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 16:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730329509; x=1730934309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf2RaH8Zu4NEwKY7+VQ2i/VDOOS80VSf3H4AZvHUtmw=;
        b=PfwDeRodWfXI9sGttu3yEFZT77TTc29o0c44EfS4kVIexC/pJ9ahmubLFL51izuLzX
         7RtzLesu10fVONcYRoxVEdErIm5nSdLFyYs6C8Ri3wMIEE5vH+gq9i1lFLBxML3QNNi2
         upx2w0b1RmXiw706a88pJ5GVSXL3i45BRph07wRwhNvdcIgPqK73wLncjtyqWMu3wVtD
         XHeJK2xcb/n/spY1ZL8VcH1ypOLYGMqwvEd51sEE8xBsyyxtZkNyJo/KUXJdBp+RthJv
         0JK5GhF2v0INiGw1FkZ8dePBRcE0f5W6wXQITjC7CdOdPytcUnk711+0F9+A3sME27Ru
         h9ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730329509; x=1730934309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf2RaH8Zu4NEwKY7+VQ2i/VDOOS80VSf3H4AZvHUtmw=;
        b=pXNW0Ar29Ypb41+bW5spcuH1FzJ34bQnf4VWxx0lxsa4DnT+vctdoFb/faah9LJCd6
         IaeQO+TdytExnABnuYX3D7cZZs1BnLUaHnxvl34tOn/x8UOi0NWGyHGzxjdB1jfno+6O
         4dQqCwWEnVexw4W/BFZZiF44UurKPaJLBcmKnejVCZ/DYtpt+mF4yxcPVCtt/cmJa6WO
         C6EpI7CkLb8HkbgsoKk8asp6zAXxUCHh9+0QB+LsAjm2UH/9KUJ5N9WS2hekYUPyaNHQ
         j24a9ulRKhvyFFiGB1irNU6TkUPRdS0fyhKQNh72KgtOmPbt0WA0J0u2vUXoLcl3w7z4
         K5Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUDawTtdSCWM7PE+MQWhl9/hs0s8JC3+X1dS/A6wDRzPVkAZGRWQaWCAi0G70q32Nz3SH0WW1RsLXjfvlo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/GxWK1K2OyUvMR7zuUlyUv33rdksTkqzfpYhuzWCp3Lhf3Gh
	Db94IlmOqDe+oOJSxb55Us7vhmwoyXNq4sckJDBMuNrfqerm+NpbAcsCJXO0kU2aRpUNZ6QC6+S
	+I82POg==
X-Google-Smtp-Source: AGHT+IFDzETx1IxdRbLAIqaAPyxx98KHviaDO/FFlJlj8jY3I21JzThgEVbqar+FfXYCF0IIpT6jB+iiISBC
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:a3e6:0:b0:e30:be64:f7e6 with SMTP id
 3f1490d57ef6-e30e5a3cb05mr632276.3.1730329509506; Wed, 30 Oct 2024 16:05:09
 -0700 (PDT)
Date: Wed, 30 Oct 2024 23:05:03 +0000
In-Reply-To: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241030-extended-modversions-v8-2-93acdef62ce8@google.com>
Subject: [PATCH v8 2/3] modpost: Produce extended MODVERSIONS information
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
	Trevor Gross <tmgross@umich.edu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
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
index 44936ebad161e914cbcc40ac74a2d651596d7b07..765da63d592be56fe93c0f4a35f1bfbcb924541a 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,6 +43,7 @@ MODPOST = scripts/mod/modpost
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
2.47.0.163.g1226f6d8fa-goog


