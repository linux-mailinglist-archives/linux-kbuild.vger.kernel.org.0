Return-Path: <linux-kbuild+bounces-4805-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548FC9D66C1
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 01:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 156F9282DF3
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 Nov 2024 00:19:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22F5CC148;
	Sat, 23 Nov 2024 00:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LQZvHXrE"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDBB217588
	for <linux-kbuild@vger.kernel.org>; Sat, 23 Nov 2024 00:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732321166; cv=none; b=P0k1wRHUdsnbPHVymsaVrmnEADjFXmllC3TEqvF78W+i5Iuhh6oIoTV0bq1G7ZFlM4GLZhYm8nUhqx/TNyzIppgEvTTpg8V2qINpuHVR8pbQ0jfJR89IrFCERn9BT9B775zPPbwTD67o/nAzhbA0KWji3u3U9Bl6WihcdZGln8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732321166; c=relaxed/simple;
	bh=PFsRPgfALpTbRTuLMpabLk0zLjqO/JEeJzPP7CytMHQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cDpUCQf69u82TovQ22NgYjbGFKsvrZWRkI4ET19VwSEOYUH3v/G/IFRnnLeR0GSCQMV1e/IOEMIUIK/YCU6e1/2hwEupQsbsHhbVRBvbylg5mqHHR2lXvtDN7yZGGcvo/zA9O5YboqkE+SayhNmlTr8iyQj1i6yZBcZYq2/iLLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LQZvHXrE; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e3884e5e828so4796365276.3
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Nov 2024 16:19:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732321163; x=1732925963; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AGHbLLYrxflWFAyRL+X6Y3k1G4gJ9BGqllsnUNJ/Q14=;
        b=LQZvHXrEDMXHNDwyVBipABef4yS/kKzHd4tWd/Oe28SfGenCSo+N+DePJtHiPLq0A2
         rjBFaCZSeLW0xgh8laXiJgZe5tfD81BMaHyECmrixQRr8fcVz/c0Tcfkm4ZaMjP1fAU+
         /AH3rjUIh4PzYh+yDE6KSWs9ml6Fi4GPfChXHWOO34Xg2hySsSctBd4JXE7ZF33NpFHy
         us072Lcb7Vh0f70RpbSMSi4cAsZFyRAbEXFL0lm0GpVfw4MZAnCP+/xvbyn4Vu30/0V8
         xFYOPpWUVx2S0dgTH+MM5oYYi6qFYcWi0Dxj9oLuUb5bvhBxbvwtMktlYpAaXT3oSLTY
         iMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732321163; x=1732925963;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AGHbLLYrxflWFAyRL+X6Y3k1G4gJ9BGqllsnUNJ/Q14=;
        b=rHukK01EnAsETntkXvP+tw5IDlfXJC4PBcXUntulzeJBOr+5+XDjZoCNv8ny9QQYqP
         vlnR7rvjKXdiNOCfILSqSBkDu2TVWMfqOlJB7UFtnBnjQbiILEoO0QjMm2OlMGJsSsb7
         3IslNEP9lvlfbuBAAz8juS3Uze2EKH/4Aq3uRP8RjWmrkbaCzYPr7bnuT6i5unAjqubj
         8ZJdXsRuvAATsymdX7jZHNO9xPlEieTa5aN4t3CnhAg1yYzIVgrkwCev6eT3M1q1D7ho
         +N1hSOv/mwkF+KOGtLVaAUbCaObbKgO7yMjqR23NJPBUTkaqoSdhEkmUrZ3NGLV7LpoO
         ZzRA==
X-Forwarded-Encrypted: i=1; AJvYcCUrx/zHRS+jwQ7DC0WWJ4WDViS1Kyj37OQFGInl5K41L6efmyAEQrf11tPZQGlPX4wnWAlbzPrcSkOJgiQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoZqVnlA8enRwsOTjYt7hetmlV9KdyAyGpiXQccukeibdEcnk7
	PsuwZtOGUqaIW4ML3cbDpWwLr/K6ec1WLXU51x2+7D6+OZDyuw6Bn8Fst2NZIogkqZLfsenJyi6
	yyQP5tw==
X-Google-Smtp-Source: AGHT+IEtK1/wRGyl0Pc7FSLfwBs7O3ptOYSzb8Nq4J6ksG2wF/qf3EUyEy1i+1nN2DSPI99CUH2s5glJvJGe
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:6dd6:0:b0:e30:d61e:b110 with SMTP id
 3f1490d57ef6-e38f8ba279amr6573276.5.1732321162811; Fri, 22 Nov 2024 16:19:22
 -0800 (PST)
Date: Sat, 23 Nov 2024 00:19:00 +0000
In-Reply-To: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241123-extended-modversions-v9-0-bc0403f054bf@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241123-extended-modversions-v9-3-bc0403f054bf@google.com>
Subject: [PATCH v9 3/5] modules: Allow extended modversions without basic MODVERSIONS
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

If you know that your kernel modules will only ever be loaded by a newer
kernel, you can disable BASIC_MODVERSIONS to save space. This also
allows easy creation of test modules to seee how tooling will respond to
modules that only have the new format.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 15 +++++++++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    | 19 +++++++++++--------
 3 files changed, 27 insertions(+), 8 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index a31c617cd67d3d66b24d2fba34cbd5cc9c53ab78..f28b361494c4b4cc2446d683589f9452a0043b2b 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -161,6 +161,7 @@ config MODULE_UNLOAD_TAINT_TRACKING
 config MODVERSIONS
 	bool "Module versioning support"
 	depends on !COMPILE_TEST
+	selects BASIC_MODVERSIONS
 	help
 	  Usually, you have to use modules compiled with your kernel.
 	  Saying Y here makes it sometimes possible to use modules
@@ -218,6 +219,20 @@ config EXTENDED_MODVERSIONS
 	  The most likely reason you would enable this is to enable Rust
 	  support. If unsure, say N.
 
+config BASIC_MODVERSIONS
+	bool "Basic Module Versioning Support"
+	depends on MODVERSIONS
+	help
+	  This enables basic MODVERSIONS support, allowing older tools or
+	  kernels to potentially load modules.
+
+	  Disabling this may cause older `modprobe` or `kmod` to be unable
+	  to read MODVERSIONS information from built modules. With this
+	  disabled, older kernels may treat this module as unversioned.
+
+	  This is enabled by default when MODVERSIONS are enabled.
+	  If unsure, say Y.
+
 config MODULE_SRCVERSION_ALL
 	bool "Source checksum for all modules"
 	help
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index 40426fc6350985780c0092beb49c6cc29b9eff62..d7d45067d08b94a82451d66a64eae29b6826e139 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -43,6 +43,7 @@ MODPOST = $(objtree)/scripts/mod/modpost
 modpost-args =										\
 	$(if $(CONFIG_MODULES),-M)							\
 	$(if $(CONFIG_MODVERSIONS),-m)							\
+	$(if $(CONFIG_BASIC_MODVERSIONS),-b)						\
 	$(if $(CONFIG_EXTENDED_MODVERSIONS),-x)						\
 	$(if $(CONFIG_MODULE_SRCVERSION_ALL),-a)					\
 	$(if $(CONFIG_SECTION_MISMATCH_WARN_ONLY),,-E)					\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index bd38f33fd41fbd98bce34f8924b2fb0ac04297ee..ed52f9aa45a490bba706ffb2caa3e238e4697814 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -32,6 +32,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_BASIC_MODVERSIONS set? */
+static bool basic_modversions;
 /* Is CONFIG_EXTENDED_MODVERSIONS set? */
 static bool extended_modversions;
 /* If we are modposting external module set to 1 */
@@ -1836,10 +1838,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
 		if (!s->module)
 			continue;
 		if (!s->crc_valid) {
-			/*
-			 * We already warned on this when producing the legacy
-			 * modversions table.
-			 */
+			warn("\"%s\" [%s.ko] has no CRC!\n",
+				s->name, mod->name);
 			continue;
 		}
 		buf_printf(b, "\t%#8x,\n", s->crc);
@@ -1853,8 +1853,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
 			continue;
 		if (!s->crc_valid) {
 			/*
-			 * We already warned on this when producing the legacy
-			 * modversions table.
+			 * We already warned on this when producing the crc
+			 * table.
 			 * We need to skip its name too, as the indexes in
 			 * both tables need to align.
 			 */
@@ -1872,7 +1872,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
 
-	if (!modversions)
+	if (!basic_modversions)
 		return;
 
 	buf_printf(b, "\n");
@@ -2184,7 +2184,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2233,6 +2233,9 @@ int main(int argc, char **argv)
 		case 'd':
 			missing_namespace_deps = optarg;
 			break;
+		case 'b':
+			basic_modversions = true;
+			break;
 		case 'x':
 			extended_modversions = true;
 			break;

-- 
2.47.0.371.ga323438b13-goog


