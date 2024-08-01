Return-Path: <linux-kbuild+bounces-2774-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB84944D3F
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 15:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 876F61F22042
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Aug 2024 13:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301291A4876;
	Thu,  1 Aug 2024 13:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DQa8333d"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB4C1A3BDC
	for <linux-kbuild@vger.kernel.org>; Thu,  1 Aug 2024 13:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519350; cv=none; b=V0T4fTbmDXUuGM5nJa3HuBP2P90WIP6Z1Yab6+MbOsYqH7vEC4od884mznmzHK/17i+SRH0rLk6p3bSH/CCvZgSYRoG8ZGExP0uOdOlH6DuaKLn1rkdHnFcIdUNzZrR3njUgXnBxSVygzDylaRwl1pciSmZ/U6mhjySkA3jFxl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519350; c=relaxed/simple;
	bh=g6xRP03AEmw2AlXHGBnOhcCWHSV0TgtiDn2YP/jCB3s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bzgUDTwusQWvWP5ybXpe0quypDgJurCBDA6B4YUJ4SIttWXUxzv0YvuLi4kDQCUW3eIN9DPluTXBeyuk9pMvP3XTH5JO1gCCT77FAMpzGYUGbL//qyTj7UV+txl2CX5PGC5gKqcCciM3suVpoouAYbzFuuks4SOq9h9eyDKJDVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DQa8333d; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-42808efc688so44138215e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Aug 2024 06:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722519347; x=1723124147; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dbWi1FpZZ2yBy3Kz3tZjACI1vgk/mZg9/Nmg6pdDZdI=;
        b=DQa8333d6FIdfUQA2HAQrSZMDTB+zqlV06R9LUEap7Cise+u9Fpe/3meG6NKiZFyIL
         4wEKQDrSoSE73aWb3oJQpEKE4JvDeJejjq7Pat/eLTlX76wHBlqRn4pDqzNlh9P77ES3
         uWT8qquif2RG0jcbWOCWOh18V4P7YqxORcPGMnAEXR7vPQ+5rSb3wM3RI1C6MuHvrpeR
         HRrdFisutG+wTYk+r5uK/Zuq2eVs17itOjhmPnQZ1+iXpXeiq3m9cQmeqFV9lLqVT4Fz
         kcO41HqpSJBHmk537F2KGvZ438lUfnEZIolcEAiOJ33nG/CBWcEgTK3xWB9gceS1tbyk
         pdWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722519347; x=1723124147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbWi1FpZZ2yBy3Kz3tZjACI1vgk/mZg9/Nmg6pdDZdI=;
        b=Rohi9iB31PG3WXW010pamVDFEZ6gIRwsrRGXTtHXR0IIr4BgNfWCgS1LY+7V79s4Ka
         WoU6vFPGOE5Rv7na9+rwkmdgzkJTMs6vNch/9s600THq4uMT+J8sNiTGaUTkEiBk5nCr
         1+C8UXmn/oFfFkjT1sdNXQacMpn/D8Nt8wUdIsulIPIyvmwsPzrjuUt7vwa6TcO0XtXh
         5IJ26SX48wZJ1hkPuW0c/aEyn2PgUxEI1Ukz5HvqW/TOxjW3tNE8q7fTAY5vHvVJuwv1
         KrdqU4KqTs6k/VHFfEzNQi5hGJlce3e9VuXkzryuNLYTK/Ga3iSw79DZjDtIj5ADNWNh
         oEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWU0pwLL1k5ns9KPqY7jBuiRk3+O11MocutSQWS52rUVRWKFmxr7+W3BIlRMhhyalh90DSPm1bMbPqRlSi6Y7AGCL+hs+K51/3adURw
X-Gm-Message-State: AOJu0Yw1LGsRdeveiOGplUXGC4i9VJbNPNTeiw6iW3e9R6C6QCEK/vAe
	iru1ax9h0F2V/dT3UWZcS96Htvpw3L499wiG77Dc1W5zieOkMEk74+gqHWcfnB8R5sRagonSVRp
	rp1zVCtPG7SbX9Q==
X-Google-Smtp-Source: AGHT+IGxf1GtVyZHRl7HaK5uRR1WLEE3Ju2POgiwKW/BWFMsP5oUnpxl0GBV2NRkby6X2k8BnllkS0z/o2InLt4=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:600c:3d86:b0:428:23c8:1e4f with SMTP
 id 5b1f17b1804b1-428bda66a81mr102455e9.7.1722519346740; Thu, 01 Aug 2024
 06:35:46 -0700 (PDT)
Date: Thu, 01 Aug 2024 13:35:18 +0000
In-Reply-To: <20240801-kcfi-v2-0-c93caed3d121@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240801-kcfi-v2-0-c93caed3d121@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4686; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=+lqmUF30WYAoZ/BdGmYCbU1auClzkGJgWqTZCh5uhMk=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmq48rQlPXbLqr6/0hL4XByzgKidSQ3xvfC85uK
 fZrkNxCgxOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZquPKwAKCRAEWL7uWMY5
 RpxBD/9NV1DoY4UTpSVocf3p/FMOxDkDA+CWazPg+TdFq6lZ6rzgjr7YnM4LK+tkJ2uRPyNKVH7
 Gn1QjrEi15Z/RuhGKNTRG/Uin/KLOVWA/krnCJzYdujAATyST8rUZIV+vDkP0Ry3n/wLppqVy5c
 2YkdEyJ5QG2A91Tz8aN3x2EaQnJciQ/1lPWcEyqeot/6grGuzCAM5F/UKksGK5Apwr0OUnIgSzQ
 4Rh2gJ7CcgI4fYd70GYt0xfQ6nPnqs18I6wyx8m3tGiEq2oTDhOnPiF37+JfA3QMxgXtysjlBWz
 K55bJV7FGlLRJB2LyQdt57u52zh37/Nm0nxNNBOCcI6kKDfy1e8W5fxf1fuUKRM4w99M/rycXR5
 4KdwuQDx2y3iBGDaesio6XfIZxzAJbvhr8axmu/zZ/KdDkomGcWiSqOhlQrGJwVYaV6kdKtDX6h
 QXW1xAtLVi1yFjwAF7A7MIsbxVv5SSEkmU+mmV+DI/avXNH/XD+aGD8/9pLVOe+ecBMso+epdh1
 tMAEuC0+e5ECkkZYgj0C8lBHV42tH7Wo4zZVBkNEVZgfkQP92KMVIaVWhqZPcufrDTGOL8xiRj0
 aFKxFYs5N7RWGLKn7URVcO9su5Yyg6VrU9zvwg2D74F5s7ukAft6cHYUG/fc+D8YP/SNzpwPe0f Ee/myO/r7R2knUQ==
X-Mailer: b4 0.13.0
Message-ID: <20240801-kcfi-v2-2-c93caed3d121@google.com>
Subject: [PATCH v2 2/2] rust: cfi: add support for CFI_CLANG with Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Matthew Maurer <mmaurer@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

From: Matthew Maurer <mmaurer@google.com>

Make it possible to use the Control Flow Integrity (CFI) sanitizer when
Rust is enabled. Enabling CFI with Rust requires that CFI is configured
to normalize integer types so that all integer types of the same size
and signedness are compatible under CFI.

Rust and C use the same LLVM backend for code generation, so Rust KCFI
is compatible with the KCFI used in the kernel for C. In the case of
FineIBT, CFI also depends on -Zpatchable-function-entry for rewriting
the function prolouge, so we set that flag for Rust as well. The flag
for FineIBT requires rustc 1.80.0 or later, so include a Kconfig
requirement for that.

Enabling Rust will select CFI_ICALL_NORMALIZE_INTEGERS because the flag
is required to use Rust with CFI. Using select rather than `depends on`
avoids the case where Rust is not visible in menuconfig due to
CFI_ICALL_NORMALIZE_INTEGERS not being enabled. One disadvantage of
select is that RUST must `depends on` all of the things that
CFI_ICALL_NORMALIZE_INTEGERS depends on to avoid invalid configurations.

Alice has been using KCFI on her phone for several months, so it is
reasonably well tested on arm64.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile                        | 7 +++++++
 arch/x86/Makefile               | 4 ++++
 init/Kconfig                    | 4 +++-
 rust/Makefile                   | 2 +-
 scripts/generate_rust_target.rs | 1 +
 5 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 484c6900337e..2dc39a23005d 100644
--- a/Makefile
+++ b/Makefile
@@ -955,6 +955,13 @@ CC_FLAGS_CFI	:= -fsanitize=kcfi
 ifdef CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
 	CC_FLAGS_CFI	+= -fsanitize-cfi-icall-experimental-normalize-integers
 endif
+ifdef CONFIG_RUST
+	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST selects
+	# CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
+	RUSTC_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers
+	KBUILD_RUSTFLAGS += $(RUSTC_FLAGS_CFI)
+	export RUSTC_FLAGS_CFI
+endif
 KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
 export CC_FLAGS_CFI
 endif
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 801fd85c3ef6..e9b2ee3c8a71 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -237,6 +237,10 @@ ifdef CONFIG_CALL_PADDING
 PADDING_CFLAGS := -fpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
 KBUILD_CFLAGS += $(PADDING_CFLAGS)
 export PADDING_CFLAGS
+
+PADDING_RUSTFLAGS := -Zpatchable-function-entry=$(CONFIG_FUNCTION_PADDING_BYTES),$(CONFIG_FUNCTION_PADDING_BYTES)
+KBUILD_RUSTFLAGS += $(PADDING_RUSTFLAGS)
+export PADDING_RUSTFLAGS
 endif
 
 KBUILD_LDFLAGS += -m elf_$(UTS_MACHINE)
diff --git a/init/Kconfig b/init/Kconfig
index b0238c4b6e79..306af56a22df 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1905,11 +1905,13 @@ config RUST
 	bool "Rust support"
 	depends on HAVE_RUST
 	depends on RUST_IS_AVAILABLE
-	depends on !CFI_CLANG
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
+	depends on !CFI_CLANG || RUSTC_VERSION >= 107900 && $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
+	select CFI_ICALL_NORMALIZE_INTEGERS if CFI_CLANG
+	depends on !FINEIBT || RUSTC_VERSION >= 108000
 	help
 	  Enables Rust support in the kernel.
 
diff --git a/rust/Makefile b/rust/Makefile
index f6b9bb946609..a2c9a3e03a23 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -305,7 +305,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
 quiet_cmd_exports = EXPORTS $@
       cmd_exports = \
 	$(NM) -p --defined-only $< \
-		| awk '/ (T|R|D) / {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
+		| awk '$$2~/(T|R|D)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
 
 $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
 	$(call if_changed,exports)
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index c31657380bf9..9b184099278a 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -192,6 +192,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
+        ts.push("supported-sanitizers", ["kcfi"]);
         ts.push("target-pointer-width", "64");
     } else if cfg.has("X86_32") {
         // This only works on UML, as i386 otherwise needs regparm support in rustc

-- 
2.46.0.rc1.232.g9752f9e123-goog


