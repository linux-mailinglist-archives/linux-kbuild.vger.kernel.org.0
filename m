Return-Path: <linux-kbuild+bounces-5344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA6BA00CD9
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 18:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBDC67A1027
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 17:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31861FCCE0;
	Fri,  3 Jan 2025 17:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l7GbldsO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B21FBEB5
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735925832; cv=none; b=Ojom87X/Q2mQENp98p4pz9oCLeZ0n4JWUXtbmSJfiCq5RugMVYKu3wFWYLwMaadhnqrtDJZRRyLw3H+6CSMOVy5eSzhnvHJD5JPIVd4ZH4Niqq8pcTXDYsLUDkzWCAkitywBcCbTwU5n0qVtj/MnvGtP/AEgQ9ZH6gXQYk0tdkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735925832; c=relaxed/simple;
	bh=HpSfhEQsmJDhbi0WozEpulnow31LpruRGqzOvEDchYg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Gjt9zMURuVAK3Y8kvNKdbua2XWNcPLC6cwG6SHFbdfQ/ZKmN/jHpqIp5pbCcABU/zXJOwG1EHr2v4enoecpcmgECQhKrkhm8laBRDd/bKoaNq89PmTdrzPIk9PLxcLexMSlvAPGTFDO29UoB+annAn30YQn6i/oBocsyGGH1r+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l7GbldsO; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-216405eea1fso160267945ad.0
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 09:37:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735925830; x=1736530630; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
        b=l7GbldsOROJ75c9WcAbrDHo/1FRayCGSkYGg33OlkcP2PhWLuNB40rpRyz4v1W8kie
         hD/FVQPj47JaXlPgq9Nf0k3dmklnNY9iB9sTRK71X9mnDkyqsvcdF7OmmZmqDd744f7Z
         m9rCFODt91U9swKl1LuX7dKLt3jnJwwLzZKQJNHQLbs/4K7HQq66roO8gbKeJ/6ahTdl
         RmAcDBeRZ2fXSfLdjLA+L5hRy+Iwa1V+H9+kHhyRVmcfEkIQdZjUI55hylAZcpDUA3FH
         f3wo5m43EnzX5VA6/iGc8dFTlN8K0Ryxzqfda9Ayqu3KjUsU4uwmefcvPmeCV96330LA
         VC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735925830; x=1736530630;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7SdIG/Q/6InqG6fGpzelEgOUniqS646q8n2Ou3Fvqw0=;
        b=MOrV636FjqyuYWTQlvcQ2rytmIczYm4Cnvy5lJs03t9nx29AOfF/KwGjBNyTW+yIvH
         LWNQ/lu2C6vxcphXmdAQG8hGb+vrU8RqmV3QEI8eOVLF36uDD1b7vx7yJfQzzJDIOSKH
         X/fu6kEvVGj5QfSDjzIRSZkeOptv+l3UJBKL8uj3RwMZUBrfLrrhNOIOdn3DsJgJbu60
         nAdwGqJr38XXTevqnNadpdry675h6UXwb6gutYsdEseEX0CpdnseYPaGUDHzDBeJGDNE
         mJg3D9djXiLXGQCkyRB2jd7diZr2RhQ3Cn/MUVd9xauvE0Av5I7yN+rizcj7SAOQGeHa
         hpKg==
X-Forwarded-Encrypted: i=1; AJvYcCUssg84PWXfe1C/8TGG7fdbHpneZkDILvzNuNUeiFu/0YGqGJuYgf8/pQZSqsQ1vmzdzyVTAJu19axmNNk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0ez/tjGzmD5QQJAvWBpkAUjw6EcGalimc4Wq4T4c40O7cDGU+
	Xq7jZMzat9q3u2AX7G3ewBqjze8/v/H22hpTE9+i93eCpK4cmVrsu17YWeGgZ9d1jQsEm1eA2Oh
	aioqz+Q==
X-Google-Smtp-Source: AGHT+IFrtYrresc72g1EPbVSjnnAxbZgASkfGLXtNRuZVoaMhZSpsR5pVXgEh5K9AwTzrhB2vL2Vl0V3UGWc
X-Received: from pfbbw14.prod.google.com ([2002:a05:6a00:408e:b0:725:de13:91b6])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3189:b0:1e1:ab8b:dda1
 with SMTP id adf61e73a8af0-1e5e080c4a2mr86778339637.35.1735925829742; Fri, 03
 Jan 2025 09:37:09 -0800 (PST)
Date: Fri, 03 Jan 2025 17:37:03 +0000
In-Reply-To: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250103-extended-modversions-v13-0-35d87c65ee04@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250103-extended-modversions-v13-3-35d87c65ee04@google.com>
Subject: [PATCH v13 3/5] modules: Allow extended modversions without basic MODVERSIONS
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
allows easy creation of test modules to see how tooling will respond to
modules that only have the new format.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 kernel/module/Kconfig    | 15 +++++++++++++++
 scripts/Makefile.modpost |  1 +
 scripts/mod/modpost.c    |  9 +++++++--
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index 9568b629a03ce8289d3f3597eefc66fc96445720..4538f3af63e1ca531d0f74ef45a6f5268e505aec 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -217,6 +217,21 @@ config EXTENDED_MODVERSIONS
 	  The most likely reason you would enable this is to enable Rust
 	  support. If unsure, say N.
 
+config BASIC_MODVERSIONS
+	bool "Basic Module Versioning Support"
+	depends on MODVERSIONS
+	default y
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
index 6324b30f6b97ac24dc517b9229f227c6c369f7d5..3784f1e08104dc2ca1da10d45ed92bb8adf4826a 100644
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
@@ -1856,7 +1858,7 @@ static void add_versions(struct buffer *b, struct module *mod)
 {
 	struct symbol *s;
 
-	if (!modversions)
+	if (!basic_modversions)
 		return;
 
 	buf_printf(b, "\n");
@@ -2176,7 +2178,7 @@ int main(int argc, char **argv)
 	LIST_HEAD(dump_lists);
 	struct dump_list *dl, *dl2;
 
-	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:x")) != -1) {
+	while ((opt = getopt(argc, argv, "ei:MmnT:to:au:WwENd:xb")) != -1) {
 		switch (opt) {
 		case 'e':
 			external_module = true;
@@ -2225,6 +2227,9 @@ int main(int argc, char **argv)
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


