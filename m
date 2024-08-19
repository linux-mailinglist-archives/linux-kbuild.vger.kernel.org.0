Return-Path: <linux-kbuild+bounces-3100-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6169576A7
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 23:36:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 979DF2841AD
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2024 21:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FE81DC48B;
	Mon, 19 Aug 2024 21:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fO4mlgJu"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E576E1D6191
	for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2024 21:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724103348; cv=none; b=SUWGuKWpkJICfUgwjdNdSUwpHHL0rJ5WuKuaecAHb+5Eu/LNHJyzP3BHchWVHUNihxKxH7q3+FQhgGPOFyYRvf6PZmU8ZtwBrGTvkiXddsO5qW+CozL8zDJD7XMf/vaelfvjCJXS6LcLYP0Ag7IXkUZWhI1dWNydsdlA9bv0fSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724103348; c=relaxed/simple;
	bh=atblaYVjzmd5nzvgdp3enhMJfBjfEELlRe2/Ce0zq2I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Qh09C8M1bU/gzBQh/07btoykxGby8v8NYSA7j0SMXS1fABXAFQD9t7GyLlJbNEB4NJCNAcJa+24tKyi6FIRK2DmItbDDWsr8imbKvlSvl9cqlt+VqS4mRNHK9jDYPBb1quUKk5XhBLy8CuISK2oplr/LyWE04qxR/8uzmk4UjK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fO4mlgJu; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-e0353b731b8so7763960276.2
        for <linux-kbuild@vger.kernel.org>; Mon, 19 Aug 2024 14:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724103346; x=1724708146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aFJ5TYFEs+yR5IdjkZAHXbLg1gl48k9ppZEG1vmVjrs=;
        b=fO4mlgJu2Z/3PdShaIiTxgqsgJJLOH+2uOEJMBAxxZ1WII6F3paiRooxJ6TpuBF0zX
         iUBRSCYna76QuspQ+Cz8/QB91ykg28C3iNoEvLcQVXdPAozFGuOqUD2Mk/p8EK4/bir0
         qa25fj2EvYluKjsLZdEVVpPjC+ZIdHOMofXby4DMBiKQCxEwQNBKtDw2mxAdGXpx/8Ly
         c2sER4RNAhhbOSPAd++dYYNk1tCfL01Ruu8rgj8mMzXkeDbbfjSoNcevpGSSYiXzFk92
         FP/xTArReem/j/rcASjaAdBWqWXAxB3ebYIH1wnfJsUULCGOR90qZJ6z1riEWekt2IyA
         rI+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724103346; x=1724708146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFJ5TYFEs+yR5IdjkZAHXbLg1gl48k9ppZEG1vmVjrs=;
        b=keIiKsfwHWTEPPL9YM4gbnRJW2Xljc8kDSGi7yZSaJ8YfqRUug1L7vmd29TIM6CKcQ
         pne9SUCEJCKABQVChjPSE/GEySURX3Wd53BYQEKClVPNPVW1VWRpjbDp3B/tg0JGWX+B
         Gs+iQMRVuumGiQqc6vNWIEMhJ27N1K3+uPM4Id3LlOd/qJ6IHsb0sW2f+IqJYEJylMjw
         vfLb12aD3FmORAHKbrT8JLaginbVS/Jby4rzPfsoEHkXcVHPqiaVwij65KjG0aYwWFRe
         wJIe1oh2juRPLBb9QNaPZC3yWMWdaGI3RPvX2D1eC+ui1oobnISmmA7TYJZYNLDP0rFk
         LEeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH4zHacqv+1PJ0cyl6g6Fdw6xenbP1dfi2VRiuKkTgpH7jDLGR/mjNUx9InhFZT6jQdoERfKWfXAFA5x8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+MMnwrk6W9tLAcT2AIXZ49lt1YnfkAH12Ac7LNdERmF0lvUT2
	A961qrcVEqOp+82YKTGAEW7RUMmtc1EWLdkAH6ZedDyCeGEJ0SJWOQWBCmKa0BiK1Tz52a+GBJy
	Y7c57lQ==
X-Google-Smtp-Source: AGHT+IG2tKNbtNYlkOTrRuz31J4vbeiBAaW0c0yUYXPPm8A2joe/19hudxJlIbHojlpceaLwmhCZjbn/6/KR
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a5b:4cb:0:b0:e11:7a38:8883 with SMTP id
 3f1490d57ef6-e1180f71f9dmr21204276.7.1724103345780; Mon, 19 Aug 2024 14:35:45
 -0700 (PDT)
Date: Mon, 19 Aug 2024 21:35:20 +0000
In-Reply-To: <20240819213534.4080408-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240819213534.4080408-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
Message-ID: <20240819213534.4080408-3-mmaurer@google.com>
Subject: [PATCH v3 2/4] kbuild: rust: Enable KASAN support
From: Matthew Maurer <mmaurer@google.com>
To: dvyukov@google.com, ojeda@kernel.org, andreyknvl@gmail.com, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>
Cc: aliceryhl@google.com, samitolvanen@google.com, kasan-dev@googlegroups.com, 
	linux-mm@kvack.org, glider@google.com, Matthew Maurer <mmaurer@google.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
set properly.

Rust hasn't yet enabled software-tagged KWHASAN (only regular HWASAN),
so explicitly prevent Rust from being selected when it is enabled.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Makefile.kasan          | 54 +++++++++++++++++++++++----------
 scripts/Makefile.lib            |  3 ++
 scripts/generate_rust_target.rs |  1 +
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index aab4154af00a..163640fdefa0 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -12,6 +12,11 @@ endif
 KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
 cc-param = $(call cc-option, -mllvm -$(1), $(call cc-option, --param $(1)))
+rustc-param = $(call rustc-option, -Cllvm-args=-$(1),)
+
+check-args = $(foreach arg,$(2),$(call $(1),$(arg)))
+
+kasan_params :=
 
 ifdef CONFIG_KASAN_STACK
 	stack_enable := 1
@@ -41,39 +46,56 @@ CFLAGS_KASAN := $(call cc-option, -fsanitize=kernel-address \
 		$(call cc-option, -fsanitize=kernel-address \
 		-mllvm -asan-mapping-offset=$(KASAN_SHADOW_OFFSET)))
 
-# Now, add other parameters enabled similarly in both GCC and Clang.
-# As some of them are not supported by older compilers, use cc-param.
-CFLAGS_KASAN += $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
-		$(call cc-param,asan-stack=$(stack_enable)) \
-		$(call cc-param,asan-instrument-allocas=1) \
-		$(call cc-param,asan-globals=1)
+# The minimum supported `rustc` version has a minimum supported LLVM
+# version late enough that we can assume support for -asan-mapping-offset
+RUSTFLAGS_KASAN := -Zsanitizer=kernel-address \
+		   -Zsanitizer-recover=kernel-address \
+		   -Cllvm-args=-asan-mapping-offset=$(KASAN_SHADOW_OFFSET)
+
+# Now, add other parameters enabled similarly in GCC, Clang, and rustc.
+# As some of them are not supported by older compilers, these will be filtered
+# through `cc-param` or `rust-param` as applicable.
+kasan_params += asan-instrumentation-with-call-threshold=$(call_threshold) \
+		asan-stack=$(stack_enable) \
+		asan-instrument-allocas=1 \
+		asan-globals=1
 
 # Instrument memcpy/memset/memmove calls by using instrumented __asan_mem*()
 # instead. With compilers that don't support this option, compiler-inserted
 # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures.
-CFLAGS_KASAN += $(call cc-param,asan-kernel-mem-intrinsic-prefix=1)
+kasan_params += asan-kernel-mem-intrinsic-prefix=1
 
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
 
 ifdef CONFIG_KASAN_INLINE
-	instrumentation_flags := $(call cc-param,hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET))
+	kasan_params += hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET)
 else
-	instrumentation_flags := $(call cc-param,hwasan-instrument-with-calls=1)
+	kasan_params += hwasan-instrument-with-calls=1
 endif
 
-CFLAGS_KASAN := -fsanitize=kernel-hwaddress \
-		$(call cc-param,hwasan-instrument-stack=$(stack_enable)) \
-		$(call cc-param,hwasan-use-short-granules=0) \
-		$(call cc-param,hwasan-inline-all-checks=0) \
-		$(instrumentation_flags)
+kasan_params += hwasan-instrument-stack=$(stack_enable) \
+		hwasan-use-short-granules=0 \
+		hwasan-inline-all-checks=0
+
+CFLAGS_KASAN := -fsanitize=kernel-hwaddress
+RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress \
+		   -Zsanitizer-recover=kernel-hwaddress
 
 # Instrument memcpy/memset/memmove calls by using instrumented __hwasan_mem*().
 ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
-	CFLAGS_KASAN += $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=1)
+	kasan_params += hwasan-kernel-mem-intrinsic-prefix=1
 endif
 
 endif # CONFIG_KASAN_SW_TAGS
 
-export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
+# Add all as-supported KASAN LLVM parameters requested by the configuration
+CFLAGS_KASAN += $(call check-args, cc-param, $(kasan_params))
+
+ifdef CONFIG_RUST
+	# Avoid calling `rustc-param` unless Rust is enabled.
+	RUSTFLAGS_KASAN += $(call check-args, rustc-param, $(kasan_params))
+endif # CONFIG_RUST
+
+export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE RUSTFLAGS_KASAN
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 9f06f6aaf7fc..4a58636705e0 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -167,6 +167,9 @@ ifneq ($(CONFIG_KASAN_HW_TAGS),y)
 _c_flags += $(if $(patsubst n%,, \
 		$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object)), \
 		$(CFLAGS_KASAN), $(CFLAGS_KASAN_NOSANITIZE))
+_rust_flags += $(if $(patsubst n%,, \
+		$(KASAN_SANITIZE_$(target-stem).o)$(KASAN_SANITIZE)$(is-kernel-object)), \
+		$(RUSTFLAGS_KASAN))
 endif
 endif
 
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index ced405d35c5d..c24c2abd67db 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -192,6 +192,7 @@ fn main() {
         }
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
+        ts.push("supported-sanitizers", ["kernel-address"]);
         ts.push("target-pointer-width", "64");
     } else if cfg.has("LOONGARCH") {
         panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
-- 
2.46.0.184.g6999bdac58-goog


