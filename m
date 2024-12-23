Return-Path: <linux-kbuild+bounces-5234-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D40859FB4F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 21:14:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E8801667B7
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 20:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AC281D318B;
	Mon, 23 Dec 2024 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DfHKNlVm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728061C9DC6
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 20:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734984821; cv=none; b=WvBaC+UATjm49Fq3mF2rcAHddqRJTmQbrRHHpbISaasmutRzQzvnxmdpp+SUP9BoqDUcv1Kh+qt23fhias0OEXl55grsBSfXv72ejp4A3bA9EXY2ued5WB8Ui5ACtLD/M/LJDRyw1LoEPjQrNQVHZfDxz9ZN7WVAu7CZAoi4Td4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734984821; c=relaxed/simple;
	bh=+pGdWw9dCP4TIIYqcXyKB+6q5rytt9oeO6oqK97XBeg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C1Fc3jQUr9Qe1PglR2DhYXeoMAj4QiS/BEEm7ckDsASnMfgycVpgzCo/Fm7k3JOO6f0NrcZeT0Se1rXdTpGTYK72qBe9aInLM8zlF946YL4pNmFz7o0shUXeyOu+zVzxXZrtR8iEOIAG2FEi0nliradQYk6E5aM3y3gZaHUOLpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DfHKNlVm; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2163dc0f689so67281145ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 12:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734984818; x=1735589618; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm8B/9CMerVHPJIle0PHCkEtY10ODvfRfmKMnultoak=;
        b=DfHKNlVmjCDxyMV9276ORrCNSCAHlAhUPzWO5vzXMoU7TEoCBej2xjTWYsAEQX7Noy
         jr+sLsZ3dKkOgLNr7lfGXX0+wKXM2VPc4npDlOwK1tKStnjBX3FTGF+tR3cFEEzivEgc
         i4g5os+XH1ms5p0jvkkMyeAd47aE4z/70AJwKy/yNOzFk2Izv5rZdnZYK16K8KnnBm1e
         BDyX7EDhKFpC0k6TlyKHsp+pWthgSiatnVbha40nZLE1HF3Ko9vaYjU4lAxWe7Wxsmfi
         4IaMR8OSRG/G/DYacR0lYmMO7HNiJ/sK4q6egwa4KLAkFqMsK0CpmOLa7HQNTwd47qc0
         YWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734984818; x=1735589618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm8B/9CMerVHPJIle0PHCkEtY10ODvfRfmKMnultoak=;
        b=cfFCkLma2Xv8XMYGOpRGzov1XRdhE3HaxS7Y9vHIChsl/VaxDjXMWhrg09k1NVXklz
         0jzz3I3ljeGV4MBmyFSCpmuAggrhaLq80n49PD2smsGe/XsfABe+sq9BQnKosFJTWUV3
         jVJndttpsf2J0z3VFJ3iw4aDUyNGfgZ6OZhcxAHp3zFoEHYTuhdUpE7xEO6fiEnqFAmL
         NQ8GSx8jnJVL0B0MPjwzEfz2UloMnh3tXeRKI/qhubiVLLG+zsISXxBG8h37JhvrpBUg
         ndAmgOB8pZiXlhR7MZhcKVjN+E7i6RT89NIR6SRcM9h40/V4Qex9obWZuqUepxr4OxOl
         AeQg==
X-Forwarded-Encrypted: i=1; AJvYcCV0OrDhRQY6yiPuav90Pf+jzHoCQFPBDIusEXXIc7zT1zYVOfyPqBOWAUSWjd3KKuSm8444YUjClD8hEqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfFsB60TIDpeo0417kjh722mGbAzfxcaoJvmBSeEERk5HQc1jk
	k5BoMCad5+3Z0SlqlkwRgUkvS1QqLZ3w+ZpVLng7eqAP1WAoXvL6IgIX6ZQpWnae6heconJ7wkM
	XJdlO5w==
X-Google-Smtp-Source: AGHT+IF/CSACGuQIODdBatw3qoH5oZKqR5KjGsMU23n8bvd3AqVBxh4DpdMuET/yVzNegGW+DtQIzSp6IxGh
X-Received: from plot20.prod.google.com ([2002:a17:902:8c94:b0:216:7952:a32a])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e746:b0:216:6769:9ee7
 with SMTP id d9443c01a7336-219e6f13c5dmr185546905ad.41.1734984817690; Mon, 23
 Dec 2024 12:13:37 -0800 (PST)
Date: Mon, 23 Dec 2024 20:13:31 +0000
In-Reply-To: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241223-extended-modversions-v11-2-221d184ee9a7@google.com>
Subject: [PATCH v11 2/5] modpost: Produce extended MODVERSIONS information
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
index fb787a5715f5e8b37713162979ca45355770dc73..c58f08681fc1e37929333ba3a3e0989c4db5a79d 100644
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
@@ -1804,6 +1806,52 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
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
@@ -1827,9 +1875,14 @@ static void add_versions(struct buffer *b, struct module *mod)
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
@@ -1960,6 +2013,7 @@ static void write_mod_c_file(struct module *mod)
 	add_header(&buf, mod);
 	add_exported_symbols(&buf, mod);
 	add_versions(&buf, mod);
+	add_extended_versions(&buf, mod);
 	add_depends(&buf, mod);
 
 	buf_printf(&buf, "\n");
@@ -2125,7 +2179,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2174,6 +2228,9 @@ int main(int argc, char **argv)
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


