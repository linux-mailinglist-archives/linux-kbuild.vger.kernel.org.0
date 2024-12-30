Return-Path: <linux-kbuild+bounces-5271-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4249FEB5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2024 23:31:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1EB247A19AC
	for <lists+linux-kbuild@lfdr.de>; Mon, 30 Dec 2024 22:30:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 658FA1A2398;
	Mon, 30 Dec 2024 22:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BhI/KgFn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740E919DF62
	for <linux-kbuild@vger.kernel.org>; Mon, 30 Dec 2024 22:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735597836; cv=none; b=WhluwMM+F1ldstmyh09+VipPctVdSqdTLVILudfXgKg4A5LppsWTHannSfB86PJryBnClB7cWT6hE6vKuWhOmW7TfcHpPtJbyA4FjQbnhFhUE1Cgsnyyhx7gm8gRjSfhy1wpOvIVDpMwiEwQqvyER0njRVbzh89NWsmed31eBms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735597836; c=relaxed/simple;
	bh=LzZzjYtMrjAIOilGNqPDi1aMo2B8A5UAsk+7N50tLOQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=howPaawPuytQg1WHNAzlQI/08nFYusZ77vr9SLjrcedokEdLTW66PY/6gFDDQuPNcla6S5JO097vhAeFMf7MGK6Q1rEls8AZ7/1hg/vNFdVZM1k4WQ2QeDb/mVsUM3bjGf11Pzd4yLAOt0FwcE11rZigfCPEEHNV3kMHJIFE8Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BhI/KgFn; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f46b7851fcso15616952a91.1
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Dec 2024 14:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735597834; x=1736202634; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
        b=BhI/KgFnwjyhrwR6lhVwhbJrH3zlwInQwQjlqfg21vE0a8pndA+lwUvDpl+950dPJn
         a1Czmm0q9EfcYS4AQpilwu48uYPj7VvSRKb5o2QUH3OxpCE9i/31uq5FVHbwqZzA/WpI
         DcLgZ2JVfElEAqv2uzCGnkN+tXUQQsMn52Pc0VpYSmvmkSq+JJeFSwTSH5F315+Vt7t6
         fYtlobE8ifDlJtmRsCK0elydRV/q8bEj01KdF4qGNibKCCMAhJmYFyRBK/bhe5nx950F
         tPawHnbhSvyPGx7BKRljhY3S3ylLbjDxzLrZ5KepZ+4qS3hhdGyjXewSmROQlwYouT+y
         8AfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735597834; x=1736202634;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KIRcbYHGQmiiiWpSG/HYzoKu7yqD3/iQMyIqYWEujyM=;
        b=t/7d0lnjL9BZwDGB+FBR00c7F5uwmMgogVuHttA0kb/vRbMZZx+nKAeUQQnV3nP6QG
         jCDtl7zX7K6KSIC0uNP3zDAF2NCkEtx2i0O3EOTb5K+Pmv9SOpJkdiZdjgRVutHbTOBa
         uMJNc7gsFeye5Xcg4mM/fAnTFm2tV0iaKqg60QP/nI9O7FViqGkO1XgubNP5YG1aCtjf
         Xm5VSjj3AGHS/sdlAWe7iNotta34x3QFZk/RSOCs2923MfVkWIdqsq0ZCJeUd53CWvT6
         tFMhSIEaUFAltTvbYQ0LyPHev/eKfjPtYJ64+WMiOtOvGyGOuKYzk6DcznxuJB7P1GoU
         3QsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq4VRlVBmGadRrFlNfFFDoKHv1jEjCJxbYqkF8xlQ9QuNJl0rFAEnZbzEV8kSi8wbB3nCaCbG9R2NOEmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvDPQ1A4W+SRXqU3Q1O2FyMluvOXNjxrXYpmJmMAr0Pmfw7kGE
	aDxQio4RKvchpfVsdcM9m1J/xzZzUaqN0f9kYwoodoppDElzr2FgWjdOOrYXGvAIe5szDIuwVxb
	z1N9V9g==
X-Google-Smtp-Source: AGHT+IE9p8I6DZqBUWsXi6TTTO1Du1TPnaF76RNXWmaCOjw5OZ2yqbaR7GBLXXiOJWn9aGXAtnMGxhoY2n1/
X-Received: from pjm7.prod.google.com ([2002:a17:90b:2fc7:b0:2ef:abba:8bfd])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2e50:b0:2ea:7cd5:4ad6
 with SMTP id 98e67ed59e1d1-2f452eeda66mr50815387a91.32.1735597833878; Mon, 30
 Dec 2024 14:30:33 -0800 (PST)
Date: Mon, 30 Dec 2024 22:30:29 +0000
In-Reply-To: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241230-extended-modversions-v12-0-296a6a0f5151@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241230-extended-modversions-v12-2-296a6a0f5151@google.com>
Subject: [PATCH v12 2/5] modpost: Produce extended MODVERSIONS information
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
 scripts/mod/modpost.c    | 62 ++++++++++++++++++++++++++++++++++++++++++++----
 3 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index d443fc504ffca0d1001f880ec496ab1f21fe979e..9568b629a03ce8289d3f3597eefc66fc96445720 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -207,6 +207,16 @@ config ASM_MODVERSIONS
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
index e489983bb8b2850c0f95bcbdfd82f684d4e7f0c3..6324b30f6b97ac24dc517b9229f227c6c369f7d5 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -33,6 +33,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_EXTENDED_MODVERSIONS set? */
+static bool extended_modversions;
 /* If we are modposting external module set to 1 */
 static bool external_module;
 /* Only warn about unresolved symbols */
@@ -1804,6 +1806,49 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
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
+	buf_printf(b, "static const u32 ____version_ext_crcs[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_crcs\") = {\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid) {
+			warn("\"%s\" [%s.ko] has no CRC!\n",
+				s->name, mod->name);
+			continue;
+		}
+		buf_printf(b, "\t0x%08x,\n", s->crc);
+	}
+	buf_printf(b, "};\n");
+
+	buf_printf(b, "static const char ____version_ext_names[]\n");
+	buf_printf(b, "__used __section(\"__version_ext_names\") =\n");
+	list_for_each_entry(s, &mod->unresolved_symbols, list) {
+		if (!s->module)
+			continue;
+		if (!s->crc_valid)
+			/*
+			 * We already warned on this when producing the crc
+			 * table.
+			 * We need to skip its name too, as the indexes in
+			 * both tables need to align.
+			 */
+			continue;
+		buf_printf(b, "\t\"%s\\0\"\n", s->name);
+	}
+	buf_printf(b, ";\n");
+}
+
 /**
  * Record CRCs for unresolved symbols
  **/
@@ -1827,9 +1872,14 @@ static void add_versions(struct buffer *b, struct module *mod)
 			continue;
 		}
 		if (strlen(s->name) >= MODULE_NAME_LEN) {
-			error("too long symbol \"%s\" [%s.ko]\n",
-			      s->name, mod->name);
-			break;
+			if (extended_modversions) {
+				/* this symbol will only be in the extended info */
+				continue;
+			} else {
+				error("too long symbol \"%s\" [%s.ko]\n",
+				      s->name, mod->name);
+				break;
+			}
 		}
 		buf_printf(b, "\t{ 0x%08x, \"%s\" },\n",
 			   s->crc, s->name);
@@ -1960,6 +2010,7 @@ static void write_mod_c_file(struct module *mod)
 	add_header(&buf, mod);
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
+	add_extended_versions(&buf, mod);
 	add_depends(&buf, mod);
 
 	buf_printf(&buf, "\n");
@@ -2125,7 +2176,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2174,6 +2225,9 @@ int main(int argc, char **argv)
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
2.47.1.613.gc27f4b7a9f-goog


