Return-Path: <linux-kbuild+bounces-2727-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7AB93F7ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 16:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7CFD7282D01
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Jul 2024 14:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2D9515A84D;
	Mon, 29 Jul 2024 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="R4BN3y01"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17089158DA9
	for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2024 14:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722262983; cv=none; b=tX38Mfndp/bE5HhlyA1DpQWPSs7sux5zuyx/p3Zts50VIPPCukBndaotOP9M7HjNghVIjMOIknnnZ70z0lVpHmHJV6vxvF4F1bd3V0eRJ8o1TD/wKt8naYtOSdZTd9TMkvWQZrPY7edMS2TNXEeEvzwqNWNv9nExG+MtvJ6XUNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722262983; c=relaxed/simple;
	bh=RX0RqNRyzzyoW/MQJOHkbfIcM2eu3kixAI50jtAtAag=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZvRKwWFtJPDbJO0lDyTT0270q/BxZY56ceo8o6PZ8olhMZOscT9HOTCO32ci6f3vJiV1IyOLBq29Bbi98nVP4bEH/7Qy3Vl7Jsmyg88FWVcBa2wrI/zvi/AWdsiyq9oechlB4lkygeRN0yLhwMhYihSkaGx7fKOWtTP+P2hQa/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=R4BN3y01; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6506bfeaf64so58966547b3.1
        for <linux-kbuild@vger.kernel.org>; Mon, 29 Jul 2024 07:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722262981; x=1722867781; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vfulPrfSicc+WNyOjayW5unzLu2GM9o7n+2trJ/3FuM=;
        b=R4BN3y01xyviaKYeAozT1p5Sqw70ZlC1CAGtJjkGJFFvYUpvL7+4FRa66frWqnNx3Y
         ppSRqhV0gHWI+6xirfEZC/hwSTrYo304bnMYxput6ExvKw+c1QkUn1u3x6h/K8wiUYsq
         6mD/crPAosYYakOChrpDv5VHlY9TRuHelZ+Bs2vKrNuM2CHq6aApejf6uVIPvA0zgVui
         JJzdhNOc9z13pGpEqLLWUo2esZ6XkK37jA7EVUCLZMR8ILaybBgrvPUFxzb++Imbgqcr
         XTYG/ojB4qh8WmvfyQIVjWlds02ZEOKieMoAspZcIUu/cyprLIxkxQvwsojcyKZ73SmQ
         iuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722262981; x=1722867781;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vfulPrfSicc+WNyOjayW5unzLu2GM9o7n+2trJ/3FuM=;
        b=m0mTb+JSgSjGCEngkM+8yyNIe2hYo5ySpEU3K/Pe/7HGYfFNwq2A5PQMFFnazy6E45
         OQ2s7sKDF2DPoyKPfmrrqwInFLymLimsQfEIUM1FiSVlNxc1emRZfkJ5D+DUbpD/2YOR
         qqm7L7U5bekg1pQPxJP10BhYzfftdvXvOkOAPwIE/aFIuCj6pAgam23ZjMJ1X8DyX+3F
         95qHpxqPIZ+2Jnzi1WD4hCXXCIF3lMTGhd8VkUIb2beEIFqzwz+mrlgfpXsoKi6DQgxb
         AnNwJBfgJwKQ2k54DxL+aPFKVKF01RJYxtI1JngcdCchaB6IKAkBvDSgAOe4BmmanY9m
         xvyw==
X-Forwarded-Encrypted: i=1; AJvYcCWRgHqnwoVx7o+QxZLrS1l00OnJ3wu+qWHEzsWQIt4a5mFFb2FW5yjvQBP98qNNxWFaFJFnlACDFdK65lCct3oPb9nBwIi6RYYa/vEE
X-Gm-Message-State: AOJu0Ywb4tdnFaMmwCybn/I4Ytr9UfkhCRexdJx7T1eocyKW+t/WKtTL
	ojGZ7l485L5oG2C3uAziKaotUZz/eeM0fEIzS89fBfw8cM3pfVgMT47H6YTRCjaSGpwJD+RxF1V
	pE9CFTsazqlAPUA==
X-Google-Smtp-Source: AGHT+IG1bISzjta4IGanTLnwN52d5QDMD5IDSQZWzKIOirqZWoAEkezelFYmM4/kNamX3YXHmq9SDd5H7LEll/E=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a81:b049:0:b0:669:f244:2ae5 with SMTP id
 00721157ae682-67a0625130amr1706417b3.3.1722262981080; Mon, 29 Jul 2024
 07:23:01 -0700 (PDT)
Date: Mon, 29 Jul 2024 14:22:50 +0000
In-Reply-To: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240729-shadow-call-stack-v4-0-2a664b082ea4@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3399; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=RX0RqNRyzzyoW/MQJOHkbfIcM2eu3kixAI50jtAtAag=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmp6W7wE19VEoXfd9d7Bo4mIIcb77rX+tm389IC
 TcKknj6Ye+JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqeluwAKCRAEWL7uWMY5
 RlJJD/4zoQUSAdVgq/uz58fBHA6iQGG/4ockLdhyAueNkNmadzLCyF3t5un1s4DMvdqLDICjJ47
 GYg45pLRUiYN0OWG9rrx2S/a+EYStltg9aOvqtLgesvSUUQk2SHs7fpKMn2+61Yo56qFPSl26ju
 cIeGWunfkKTkqLjZ2Xv4szXNPTRlkGbBRWIXnzKWgRxypvl+cyir6qeDXivzfzrJkt9/gYrvCnR
 UzFjwXgAyzjZCxA9elABsZJ5N1Xnzmr7lJ7DhZtFqlaYbYPGm7mDTMa0LqM7wJvdkLGZ6kveNMD
 FAqqcMmk1T2+R04mdloAaRlKgHNJmSBJNtCxwPEnsVDKAJxFVlWJ3yZeIN0vB+h5uSoqWRaL1y6
 GywKJabv0aPZxJw6uN+BDNUtJuEFp9+XLwOYGbVwSLyOYTuWQIJCFFSyTcLh65ky69IDa2tWUDX
 XJtQVnrXJ8wZDPkU3fhRnVM7r/qUmGI34eMdb/wo4oVyvnYELUf8URPR/xkjfgWUXamVrK8ETSH
 2cH+V2Q966dMhrfSS3repxrr0I9rlb5A/Cl1EoLJTwSVzkmVOZLSsrZoHnsscBvvHY30W54QgsX
 E/91A1f6yI4iAfciIB4xrpegIOF7hZKp8xbyCBpewqmR0Np4K+GMNryX14r29XQA/rvwQEqcg5X NNBGNzVRCXiJ+Zg==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240729-shadow-call-stack-v4-2-2a664b082ea4@google.com>
Subject: [PATCH v4 2/2] rust: support for shadow call stack sanitizer
From: Alice Ryhl <aliceryhl@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="utf-8"

To use the shadow call stack sanitizer, you must pass special flags:

* On arm64, you must pass -ffixed-x18 to your compiler.
* On riscv, you must pass --no-relax-gp to your linker.

These requirements also apply to Rust code. When using Rust on arm64,
you must pass the -Zfixed-x18 flag to rustc, which has the same effect
as the -ffixed-x18 flag does for C code. The -Zfixed-x18 flag requires
rustc version 1.80.0 or greater.

There is no need to pass any flags to rustc on riscv as only the linker
requires additional flags on this platform.

On older versions of Rust, it is still possible to use shadow call stack
by passing -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18.
However, this flag emits a warning during the build, so this patch does
not add support for using it.

Currently, the compiler thinks that the aarch64-unknown-none target
doesn't support -Zsanitizer=shadow-call-stack, so the build will fail if
you enable shadow call stack in non-dynamic mode. See [1] for the
relevant feature request. To avoid this compilation failure, Kconfig is
set up to reject such configurations.

The `depends on` clause is placed on `config RUST` to avoid a situation
where enabling Rust silently turns off the sanitizer. Instead, turning
on the sanitizer results in Rust being disabled. We generally do not
want changes to CONFIG_RUST to result in any mitigations being changed
or turned off.

Link: https://github.com/rust-lang/rust/issues/121972 [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile            | 1 +
 arch/arm64/Makefile | 3 +++
 init/Kconfig        | 2 +-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 2b5f9f098b6f..66daca7a9b57 100644
--- a/Makefile
+++ b/Makefile
@@ -928,6 +928,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
 ifndef CONFIG_DYNAMIC_SCS
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
+KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
 endif
 export CC_FLAGS_SCS
 endif
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index f6bc3da1ef11..b058c4803efb 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -57,9 +57,11 @@ KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 ifneq ($(CONFIG_UNWIND_TABLES),y)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
 KBUILD_AFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=n
 else
 KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_AFLAGS	+= -fasynchronous-unwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y -Zuse-sync-unwind=n
 endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
@@ -114,6 +116,7 @@ endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
 KBUILD_CFLAGS	+= -ffixed-x18
+KBUILD_RUSTFLAGS += -Zfixed-x18
 endif
 
 ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
diff --git a/init/Kconfig b/init/Kconfig
index 914edf51b068..103957466cee 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1909,7 +1909,7 @@ config RUST
 	depends on !MODVERSIONS
 	depends on !GCC_PLUGINS
 	depends on !RANDSTRUCT
-	depends on !SHADOW_CALL_STACK
+	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
 	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
 	help
 	  Enables Rust support in the kernel.

-- 
2.46.0.rc1.232.g9752f9e123-goog


