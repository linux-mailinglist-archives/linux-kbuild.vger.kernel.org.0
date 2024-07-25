Return-Path: <linux-kbuild+bounces-2668-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C627493CB30
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Jul 2024 01:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B0A3281476
	for <lists+linux-kbuild@lfdr.de>; Thu, 25 Jul 2024 23:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29776149C7C;
	Thu, 25 Jul 2024 23:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EhfPFJ/i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E61314900B
	for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 23:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721949709; cv=none; b=hzqsP3d3JQkyDCklq0dv1A8tDqH9hTVl6abzLTGIwawwS17V1UQ1cjoVQYhBpK51Vgy/Ee3evUa9tebywKH/oSzvM7auJpzqUc5XgqGZPNM/Meq4SPBBpRF001Lzjpci5Ax0VNKo7jeb73AXJTMeCNyEGwy5ulRTnyF/UcNYwhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721949709; c=relaxed/simple;
	bh=qH2ob/GPMxW6QjGdFk/NsUTwDcqVg3OStezb0PUZxuM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kfyKRqAxJUKUwVGlvWmcN6s9+s3rWSWM3TcCexLUd+n9C0fHXXJ/eVPImvupCiFsBbo1eP92LrSGb5DHyON//khk+jsbr+e75OtnxO3836SEPmyGu7fp6I5/eDIgOm4awqfbecvk59+c4AZmS7KnlR0ej7PaKAAjAt0dNzW7gGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EhfPFJ/i; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-e0b2fb62a07so1917659276.0
        for <linux-kbuild@vger.kernel.org>; Thu, 25 Jul 2024 16:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1721949706; x=1722554506; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NIeg3QD3T42p/ZQnVld0CvS5klyquBslVZ8Cnqk2AWw=;
        b=EhfPFJ/iwj+esBuZUYJmS4jht5pSWcH9MfTXEkMQR9C72PhRc+nCdZm2/xtWc0A59a
         t4fu1eD+t63e6ijVwoU+8FJJ/Id5MJfyLcR4DHyvnASJ7kOZOu7GZBuZmfnvyHvbRoKh
         nwWv1SoP9xk9xYMjFVGL6BJrKeXhp51d15E0ERCKOGI+zuwigkUJ8Hn+CoZyr3TYZ28j
         iPOJv8KNs6Ioh5jxXDZsRq7Zm05Bxg4qs2Rtl/cXAil5uk0PceTMsaiJmE7s4v9BAJSw
         DMr4k2pWqAmwCEjtmfD81WMlRL+Nws6Ps8+yDoEWFnhGVy30OaEUDPOsqmRe61tpWVJ+
         wfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721949706; x=1722554506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIeg3QD3T42p/ZQnVld0CvS5klyquBslVZ8Cnqk2AWw=;
        b=MXJ9Waa99Lvst960WOtXf1Iiyegh/AVMo1hcvL+61p1GNDXcJ1LcYlXT57M1xHmT4g
         UzjoPMzAo8qNR/qCdisEicxyRJ1JQycCZmqTkeWz8T/hz3FXeg0iHYxZC6It69qH1/Xd
         hCb6YyDLy+uBKPktWqVTebBBNTw2WuMpeRSTX4AANHPnqwmCNg2ftNBcpznM/0qBfnsF
         diqR6krFFgj8Zuxb9RnvYC1nGhn29aH85sc+w4R4jsYlSp3m3bk6zRVp8fjw9uTw0nj5
         8sOMeEKTZOeQGp0jvuce7ob6pfaN8yEsWcgFOBbn1p0bPfGDktuHB0ZITh8BN6runHim
         4cXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4mRgM6V+Z/5pjhyN9ho4KWD53d1lfQd6ND780aKhBglu8u5fvk+NyNZot/8rnz0DAcavOAVeM8QdMCJaezV+s5iK/p0LZvsXVwVST
X-Gm-Message-State: AOJu0YySB5ts/9TXgB1d1Xtogay5gy7iHH8PCUKFZMkvSa5M6IDAaBy5
	dIRtVao4N4fRtsuB7PZPlWvKcFfToEXP4vp48GuqioCuvNqJKqmJQ0M0TqfswYoXI42fyQuFHg9
	ojsPwZw==
X-Google-Smtp-Source: AGHT+IGFgF07K78Xk6HyAkYV734bKuaNSlYnh+LI6ONN4gJdXx4TMFBTavf54CUZ0w26vWpdASB/dVOetoAt
X-Received: from anyblade.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1791])
 (user=mmaurer job=sendgmr) by 2002:a25:9bc1:0:b0:e08:6c33:7334 with SMTP id
 3f1490d57ef6-e0b2cd29922mr30221276.8.1721949706306; Thu, 25 Jul 2024 16:21:46
 -0700 (PDT)
Date: Thu, 25 Jul 2024 23:20:47 +0000
In-Reply-To: <20240725232126.1996981-1-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240725232126.1996981-1-mmaurer@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240725232126.1996981-3-mmaurer@google.com>
Subject: [PATCH 2/2] kbuild: rust: Enable KASAN support
From: Matthew Maurer <mmaurer@google.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alexander Potapenko <glider@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Nicolas Schier <nicolas@fjasle.eu>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Rust supports KASAN via LLVM, but prior to this patch, the flags aren't
set properly.

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 scripts/Makefile.kasan | 46 +++++++++++++++++++++++++++++++++++++++++-
 scripts/Makefile.lib   |  3 +++
 2 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/scripts/Makefile.kasan b/scripts/Makefile.kasan
index 390658a2d5b7..84572c473e23 100644
--- a/scripts/Makefile.kasan
+++ b/scripts/Makefile.kasan
@@ -12,6 +12,7 @@ endif
 KASAN_SHADOW_OFFSET ?= $(CONFIG_KASAN_SHADOW_OFFSET)
 
 cc-param = $(call cc-option, -mllvm -$(1), $(call cc-option, --param $(1)))
+rustc-param = $(call rustc-option, -Cllvm-args=-$(1),)
 
 ifdef CONFIG_KASAN_STACK
 	stack_enable := 1
@@ -28,6 +29,7 @@ else
 endif
 
 CFLAGS_KASAN_MINIMAL := -fsanitize=kernel-address
+RUSTFLAGS_KASAN_MINIMAL := -Zsanitizer=kernel-address -Zsanitizer-recover=kernel-address
 
 # -fasan-shadow-offset fails without -fsanitize
 CFLAGS_KASAN_SHADOW := $(call cc-option, -fsanitize=kernel-address \
@@ -36,13 +38,36 @@ CFLAGS_KASAN_SHADOW := $(call cc-option, -fsanitize=kernel-address \
 			-mllvm -asan-mapping-offset=$(KASAN_SHADOW_OFFSET)))
 
 ifeq ($(strip $(CFLAGS_KASAN_SHADOW)),)
+	KASAN_SHADOW_SUPPORTED := n
+else
+	KASAN_SHADOW_SUPPORTED := y
+endif
+
+ifdef CONFIG_RUST
+	RUSTFLAGS_KASAN_SHADOW := $(call rustc-option $(RUSTFLAGS_KASAN_MINIMAL) \
+				  -Cllvm-args=-asan-mapping-offset=$(KASAN_SHADOW_OFFSET))
+	ifeq ($(strip $(RUSTFLAGS_KASAN_SHADOW)),)
+		KASAN_SHADOW_SUPPORTED := n
+	endif
+endif
+
+ifeq ($(KASAN_SHADOW_SUPPORTED),y)
 	CFLAGS_KASAN := $(CFLAGS_KASAN_MINIMAL)
+	ifdef CONFIG_RUST
+		RUSTFLAGS_KASAN := $(RUSTFLAGS_KASAN_MINIMAL)
+	endif
 else
 	# Now add all the compiler specific options that are valid standalone
 	CFLAGS_KASAN := $(CFLAGS_KASAN_SHADOW) \
 	 $(call cc-param,asan-globals=1) \
 	 $(call cc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
 	 $(call cc-param,asan-instrument-allocas=1)
+	ifdef CONFIG_RUST
+		RUSTFLAGS_KASAN := $(RUSTFLAGS_KASAN_SHADOW) \
+		 $(call rustc-param,asan-globals=1) \
+		 $(call rustc-param,asan-instrumentation-with-call-threshold=$(call_threshold)) \
+		 $(call rustc-param,asan-instrument-allocas=1)
+	endif
 endif
 
 CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
@@ -52,6 +77,11 @@ CFLAGS_KASAN += $(call cc-param,asan-stack=$(stack_enable))
 # memintrinsics won't be checked by KASAN on GENERIC_ENTRY architectures.
 CFLAGS_KASAN += $(call cc-param,asan-kernel-mem-intrinsic-prefix=1)
 
+ifdef CONFIG_RUST
+	RUSTFLAGS_KASAN += $(call rustc-param,asan-stack=$(stack_enable))
+	RUSTFLAGS_KASAN += $(call rustc-param,asan-kernel-mem-intrinsic-prefix=1)
+endif
+
 endif # CONFIG_KASAN_GENERIC
 
 ifdef CONFIG_KASAN_SW_TAGS
@@ -73,6 +103,20 @@ ifeq ($(call clang-min-version, 150000)$(call gcc-min-version, 130000),y)
 CFLAGS_KASAN += $(call cc-param,hwasan-kernel-mem-intrinsic-prefix=1)
 endif
 
+ifdef CONFIG_RUST
+	ifdef CONFIG_KASAN_INLINE
+		rust_instrumentation_flags := $(call rustc-param,hwasan-mapping-offset=$(KASAN_SHADOW_OFFSET))
+	else
+		rust_instrumentation_flags := $(call rustc-param,hwasan-instrument-with-calls=1)
+	endif
+	RUSTFLAGS_KASAN := -Zsanitizer=kernel-hwaddress -Zsanitizer-recover=kernel-hwaddress \
+			   $(call rustc-param,hwasan-instrument-stack=$(stack_enable)) \
+			   $(call rustc-param,hwasan-use-short-granules=0) \
+			   $(call rustc-param,hwasan-inline-all-checks=0) \
+			   $(call rustc-param,hwasan-kernel-mem-intrinsic-prefix=1) \
+			   $(instrumentation_flags)
+endif
+
 endif # CONFIG_KASAN_SW_TAGS
 
-export CFLAGS_KASAN CFLAGS_KASAN_NOSANITIZE
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
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


