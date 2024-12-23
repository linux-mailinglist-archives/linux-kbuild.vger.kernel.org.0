Return-Path: <linux-kbuild+bounces-5235-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DFEE9FB4FC
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 21:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84782188349A
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Dec 2024 20:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F220D1D5162;
	Mon, 23 Dec 2024 20:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yNvOE5BN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9E91CDFDC
	for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 20:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734984821; cv=none; b=u5myK5NEYvcx4lrljQ5ykmsJGJZwbMehIfbbTf6pdUfA4gXoDaMtMx6mlda0Bwb8pOkIPBG1LS2ucc4/A/r6xsAdeTFgrA3ENq6WKk30j17J5Z1yb/5wnSm/zUT+Ll1KcCDclWwXl5BCcktx/ukk4/ZCi2QXLYmT1tMCCcMAvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734984821; c=relaxed/simple;
	bh=RjukP2CQnO/TZxDoNcJm3Ea2UnLYWI4ZmTxJOgCi4mU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=auuKAT32rpr1JHYUrU3qF6nsvEBZrHF+zXxeKBAJZstLAwEz9ijlprLboQ02v4UYw/5pbFt206DXUmsAOY5dtNdVrMyPrH/cINXawULCpcqNrGkEtqlztix3RnUD49LeMV0iRmBYIfZ0GZepf0akflcIiezZbATWAnl4A/kEwfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yNvOE5BN; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-218ad674181so47687225ad.1
        for <linux-kbuild@vger.kernel.org>; Mon, 23 Dec 2024 12:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734984819; x=1735589619; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=On1WZKdx98ADO/7Heas/21kozOIUfUi4pVgpzWkLyb8=;
        b=yNvOE5BNlgl+0eWi8IOLu/cDSg5wv2aJq8UzeFNfZmMCggWNYMRHokcjjMMj7c8tjU
         dUz+iFisZ7jXqc/kreVhQuzzRd/qujiVKpMHboi6eJANtTVY+IwWfq/niwJX4QWwjzIi
         0/EF+CfLt9DorJWDZxXhHZFoZa/M8HyEaVd3H8V5FeOqnnYKzZ15mFT/0qw9OM0sKEqg
         /nd4Pk8updTlEceyyCdzBVNKd4lipdZy4Y0cxe2edjvX1x5ywjJHgJdW4oTjPpQwtMKS
         AmJhv9QFYcYMB8/B90XjWZIs70k6rkmSKopMfLBMSYpFP1DStOuY5LDOgYxH4xP1pyLK
         OwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734984819; x=1735589619;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=On1WZKdx98ADO/7Heas/21kozOIUfUi4pVgpzWkLyb8=;
        b=BL5ue1emgbP2rXhz7MEXZtG5CJspZlherND+wmXsaimttDYbngEPxFTtoZN3V7JHUO
         08hjUgTlX/QehFBKA84JeJIfprULAew1TI06XzVvRGjDGi3TjH6/4NDGt/0leagJp/ZT
         OrVLkgmehJAzx6wpAs0my9XvIYg+zLjgSEkRno8WoL6M7Fy92al8xLBg39YIUWbN7ZXL
         uFXOaAsDfFBaCXK7Lm4tNyDVc9bbUAqB5GD9VOPPE1mUygSvg3crN5JPBbtFOtZ6FfSF
         KTEwWfW2lg47/PnW7lAKpUHEjvVh9BpHV97RG7hu8VMmufruxakgoahsnCdurxJ8YImS
         3Vgw==
X-Forwarded-Encrypted: i=1; AJvYcCUsnCbe/JQPGLJvM5hMf1KwCE4t7s3k4V9G/pk9Ypqs1OOeRMxLkbGlZkpcKwReb5hUzN1NFthE/IN8ktc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZMZzAp5GvFBOcd/2OC4JSjW7/4bak3v801cgU13S0ICafqNQP
	Nh1v9BzKC2vc5/PDtJ0vjyUVkn7UAg48v9ObIC++3wC0f3tm9jKeqKEKv+IXQvwAQMBxSoe6IzN
	DTTyFKw==
X-Google-Smtp-Source: AGHT+IGE9QNRZS/47usgacyywk7VqHL13GPydkc9VQX1I2h7hJC6BSGbzv80ZSOChZmA73HolHBhU5N9WmQP
X-Received: from pfbay17.prod.google.com ([2002:a05:6a00:3011:b0:725:1ef3:c075])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3382:b0:1e1:9e9f:ae4
 with SMTP id adf61e73a8af0-1e5e1e87c5bmr17167226637.13.1734984819276; Mon, 23
 Dec 2024 12:13:39 -0800 (PST)
Date: Mon, 23 Dec 2024 20:13:32 +0000
In-Reply-To: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241223-extended-modversions-v11-0-221d184ee9a7@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241223-extended-modversions-v11-3-221d184ee9a7@google.com>
Subject: [PATCH v11 3/5] modules: Allow extended modversions without basic MODVERSIONS
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
index 9568b629a03ce8289d3f3597eefc66fc96445720..5f701391ab12c7d1b3ca496c9b3443c5a76a8745 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -217,6 +217,21 @@ config EXTENDED_MODVERSIONS
 	  The most likely reason you would enable this is to enable Rust
 	  support. If unsure, say N.
 
+config BASIC_MODVERSIONS
+	bool "Basic Module Versioning Support"
+	depends on MODVERSIONS
+	default MODVERSIONS
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
index c58f08681fc1e37929333ba3a3e0989c4db5a79d..d13d10bf534a4c15fa76fffb2a1dc9832bd0e95a 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -33,6 +33,8 @@ static bool module_enabled;
 static bool modversions;
 /* Is CONFIG_MODULE_SRCVERSION_ALL set? */
 static bool all_versions;
+/* Is CONFIG_BASIC_MODVERSIONS set? */
+static bool basic_modversions;
 /* Is CONFIG_EXTENDED_MODVERSIONS set? */
 static bool extended_modversions;
 /* If we are modposting external module set to 1 */
@@ -1823,10 +1825,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
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
@@ -1840,8 +1840,8 @@ static void add_extended_versions(struct buffer *b, struct module *mod)
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
@@ -1859,7 +1859,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
 
-	if (!modversions)
+	if (!basic_modversions)
 		return;
 
 	buf_printf(b, "\n");
@@ -2179,7 +2179,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2228,6 +2228,9 @@ int main(int argc, char **argv)
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
2.47.1.613.gc27f4b7a9f-goog


