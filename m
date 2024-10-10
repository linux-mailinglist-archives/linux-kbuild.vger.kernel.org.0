Return-Path: <linux-kbuild+bounces-4029-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9A4998284
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 11:39:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE268287335
	for <lists+linux-kbuild@lfdr.de>; Thu, 10 Oct 2024 09:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 533DE1C0DD2;
	Thu, 10 Oct 2024 09:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sNBVSsNn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2EC1BF818
	for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553124; cv=none; b=WqRKrXnNOVTVNkRf99xN8erglW4+mrcInSWq8kpKr0+S0OVVjw24c3eoWVgHvD0PyGuoGn+Tolbgnpx545JL9l2GJSl7I+xF4bVmLLgpBiWtDCPG15l0haWIIQRkR4Z3SBhrmjCg/34TIMHrZgE647Pg51QKpbZ+xfbP0ED/tRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553124; c=relaxed/simple;
	bh=VT2SuDcWVnMzBAVEldlhHzTMoIA8IDGupx5zZhlV3n0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z8AZntQNl6BwIrWHi55iA/PoWOItEeR/Mo6e7MPNNKBHSX1fIzAljTIH5c9mibAFTkmNtPOrdDv0oZ7BBr88bEwHrCbzeLt3BRoTEZ5DxjQ7QRCFqg5QX1llisIe9regdrYig1cJXRglH/TUmIsJDEEYoT2w9baclXA3W3f0o7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sNBVSsNn; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6e0082c1dd0so14747827b3.3
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2024 02:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728553120; x=1729157920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eACD4XRROaCtgnocFX5+RB0Y2dfNcR6e9CG+8sSoYh4=;
        b=sNBVSsNnhylM6WSpK6/6EfmclcZZOAZ9BnNhGA2O77iUB009VHT/xu/XxxDvpAt5m7
         trH3PXmyh+6XRaRmJs7anXJZs7lvdkrIFPnKo9jkUNeNnZysLjGSXVBIWnVleF827YAM
         /McQGfpp3zPsBN35xjFcrboXnnApx0TraY+HEUChqCpKfjp6GzaY3fUtv2lHbSKSdvTN
         JrlKCn0eOVytHgrnBEL9q/K4i5ApyTNuFV7Jb18rmqLcnJVrg/tkF/zeHA1BziLwMgey
         3GZPSBeeuaTk+4cJr9le7F8epoJzzoJ//InvmDUC02peRx2P7LkLvW4XheNVRQ8hMVH/
         TH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553120; x=1729157920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eACD4XRROaCtgnocFX5+RB0Y2dfNcR6e9CG+8sSoYh4=;
        b=vsib3iPSkNJyyMMz2IkVrCLRpCyAfi/iF6d5fJDw3MZ9Y01eJ18cEO8gGOnFNcVjnM
         M4FSHCPrWpyzVa29aBnD/v1UddjhhGATBofVj4xwmGK21paUk7RDM06MFX+6+kE4yVW3
         i2RhnWM2vf31+L3nQgWgw4crlgJ+lpwWw0BCmsHAYk0Cb2CVBczjKWp3RvT2fnf20e1C
         OG8e34HSwJ3vVzL0U3Atwh69fJfGCZgbKpbCp1Lmkj7Hr8/2Hf3mstrorXBvzmMdPai2
         Dmp2i5WYxtjalX137mqpHg/l0lxF0NZhQaTM8f3yxlKazQKOQYWTC8vlqHypCpp0OvF+
         GPfQ==
X-Forwarded-Encrypted: i=1; AJvYcCURJfnb/GdQPQ4AlnFc6bz4xydGNGo0Up9H8HsqqQO5hC1qSG62bTO2JlHNzXK0vNF3TdSVNbe+LeMymt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXNmJ8MXSlHa3Mu0d4u5SQJvJmZSgi+3knQgRFUm598sRx/q8g
	EExbchJfAgL318LYcxFO1I+nfzr7upRTQeXFMmNUQwPIYv5Eqnf7knMS3EOSh6eukxAR05Cqq/n
	bcyV3XnPNY/NRzA==
X-Google-Smtp-Source: AGHT+IEGcui+HlgSNQoktbhQh3A2G5+Kd6G/NcYjKQUmJw3bmKVSjI3w7gKgtE/Edkv8/1W9cri6mLPryjmTGjI=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:690c:2c01:b0:6db:d257:b98 with SMTP
 id 00721157ae682-6e32215253bmr516967b3.3.1728553120372; Thu, 10 Oct 2024
 02:38:40 -0700 (PDT)
Date: Thu, 10 Oct 2024 09:38:27 +0000
In-Reply-To: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241010-icall-detect-vers-v1-0-8f114956aa88@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4239; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=VT2SuDcWVnMzBAVEldlhHzTMoIA8IDGupx5zZhlV3n0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnB6CYs0u7blh+ZX5hDv0dKotrih6IeVcBm5Vhp
 EN1T0iq4B2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwegmAAKCRAEWL7uWMY5
 RhQFEACswAkfF3tGCsn7bv37wtSYjM0N0Gh3kSpV81MBZrV8NDPZJKdw5njIOrmlRvMtiVqZ0vn
 uaGVEOCtCJnJQgfUF3OVzu2Q5yBB54S1oXq3f3DNEuB2R9hHIexEM5E2QvXxNOvYPXR6REEwBR9
 xyXVgO0l6/Lx2O4GHUULGr2aULI7kGBqJMUQOt21mp1PS6lGMaWVeUq8OpmdBWOGQmPbXj0slsc
 XRVgymT4v5Nf1kWcQmQnZ6+w5ZfAMhw/CikqMwDIRlvV0cx8YgXvIDsJDDDcua0FR3MDhn84xFL
 jisqTVf+0h+1A9BRgwMz5wbgDvr/uUogd6A4nM32lL4tUBMl0KeruMKA8qIw+SfMYO21XmTrosy
 1WmuqELMXSwO28R/oPaIdH+OS7Po874Nin7ktneBKuPIS6UPhdZuIXEBrf1tYs6t46AvdhHEktO
 AWkfHpXQCRiZ7LWiEngFArYMRDNCOfSKXBmEt4re54CTQOWvu2Qw2DI+EcOkvuUDIye+j7KEAVG
 Lb9b+s2UBP6k3+2DD2NKRlPPnors/rPhp7vRzBH2YKAujl1zfmCCl1OlqWyGwXI8Wg7FsPxeWZ3
 4ItweSD98EgjTVkS/xw9FeweugxAKS6Z9ryfioYx1l8lVqsoyPacr4/LA3Uz6WSQC3HRtfi0Yl+ ISH/VMpZbdy3FoA==
X-Mailer: b4 0.13.0
Message-ID: <20241010-icall-detect-vers-v1-2-8f114956aa88@google.com>
Subject: [PATCH 2/2] cfi: fix conditions for HAVE_CFI_ICALL_NORMALIZE_INTEGERS
From: Alice Ryhl <aliceryhl@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

The HAVE_CFI_ICALL_NORMALIZE_INTEGERS option has some tricky conditions
when KASAN or GCOV are turned on, as in that case we need some clang and
rustc fixes [1][2] to avoid boot failures. The intent with the current
setup is that you should be able to override the check and turn on the
option if your clang/rustc has the fix. However, this override does not
work in practice. Thus, use the new RUSTC_LLVM_VERSION to correctly
implement the check for whether the fix is available.

Additionally, remove KASAN_HW_TAGS from the list of incompatible
options. The CFI_ICALL_NORMALIZE_INTEGERS option is incompatible with
KASAN because LLVM will emit some constructors when using KASAN that are
assigned incorrect CFI tags. These constructors are emitted due to use
of -fsanitize=kernel-address or -fsanitize=kernel-hwaddress that are
respectively passed when KASAN_GENERIC or KASAN_SW_TAGS are enabled.
However, the KASAN_HW_TAGS option relies on hardware support for MTE
instead and does not pass either flag. (Note also that KASAN_HW_TAGS
does not `select CONSTRUCTORS`.)

Link: https://github.com/llvm/llvm-project/pull/104826 [1]
Link: https://github.com/rust-lang/rust/pull/129373 [2]
Fixes: 4c66f8307ac0 ("cfi: encode cfi normalized integers + kasan/gcov bug in Kconfig")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 arch/Kconfig | 26 ++++++++++++--------------
 init/Kconfig |  2 +-
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8af374ea1adc..00163e4a237c 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -838,7 +838,7 @@ config CFI_CLANG
 config CFI_ICALL_NORMALIZE_INTEGERS
 	bool "Normalize CFI tags for integers"
 	depends on CFI_CLANG
-	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
+	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
 	help
 	  This option normalizes the CFI tags for integer types so that all
 	  integer types of the same size and signedness receive the same CFI
@@ -851,21 +851,19 @@ config CFI_ICALL_NORMALIZE_INTEGERS
 
 	  This option is necessary for using CFI with Rust. If unsure, say N.
 
-config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
-	def_bool !GCOV_KERNEL && !KASAN
-	depends on CFI_CLANG
+config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
+	def_bool y
 	depends on $(cc-option,-fsanitize=kcfi -fsanitize-cfi-icall-experimental-normalize-integers)
-	help
-	  Is CFI_ICALL_NORMALIZE_INTEGERS supported with the set of compilers
-	  currently in use?
+	# With GCOV/KASAN we need this fix: https://github.com/llvm/llvm-project/pull/104826
+	depends on CLANG_VERSION >= 190000 || (!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
-	  This option defaults to false if GCOV or KASAN is enabled, as there is
-	  an LLVM bug that makes normalized integers tags incompatible with
-	  KASAN and GCOV. Kconfig currently does not have the infrastructure to
-	  detect whether your rustc compiler contains the fix for this bug, so
-	  it is assumed that it doesn't. If your compiler has the fix, you can
-	  explicitly enable this option in your config file. The Kconfig logic
-	  needed to detect this will be added in a future kernel release.
+config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
+	def_bool y
+	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS_CLANG
+	depends on RUSTC_VERSION >= 107900
+	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull/129373
+	depends on (RUSTC_LLVM_VERSION >= 190000 && RUSTC_VERSION >= 108200) || \
+		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config CFI_PERMISSIVE
 	bool "Use CFI in permissive mode"
diff --git a/init/Kconfig b/init/Kconfig
index 98cf859d58c2..c521e1421ad4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1950,7 +1950,7 @@ config RUST
 	depends on !GCC_PLUGIN_RANDSTRUCT
 	depends on !RANDSTRUCT
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
-	depends on !CFI_CLANG || RUSTC_VERSION >= 107900 && HAVE_CFI_ICALL_NORMALIZE_INTEGERS
+	depends on !CFI_CLANG || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI_CLANG
 	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
 	depends on !KASAN_SW_TAGS

-- 
2.47.0.rc0.187.ge670bccf7e-goog


