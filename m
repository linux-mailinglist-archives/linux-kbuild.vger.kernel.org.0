Return-Path: <linux-kbuild+bounces-6802-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 402F2AA44C3
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 10:04:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D1D21C02675
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Apr 2025 08:05:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AF12212FBD;
	Wed, 30 Apr 2025 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="piekgDcY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745682185B8
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 08:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000244; cv=none; b=YEOSz89dilKfmpHzeR+v/mNmm3y53HNPACgfti220fJpyJK/DqM2RAt6Bq4kdRtmZNQ0sN7HcZv7xJggWW+axB3pXC9VFMECno8ZclSp0XLY92gut1JuwIRRGttBKtwxB8hZ1qjaM2PpUynrQnXsaeyNFO7o1KAX/PJNqSdEi10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000244; c=relaxed/simple;
	bh=DKnudNd/9zBWW3fHL+84dgzzzUZDXPxTFrPLc0mlmb4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=DcTO3cjEF7v0diRKl4PqnBByJ525qh5VuOOCnbLL6WiprYx7cpRfqCr/fgz0gt2s634kOdthSPrl/XVjmpmua9mbwT/bc/5Cb3qA5CXbQbBlh78lMdYAfs4BhbnwZdFMf6FCOxn7CgzDai9JU8YxpQtc+aJLokOMf5rFWmOM/Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=piekgDcY; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so49699925e9.1
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Apr 2025 01:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746000240; x=1746605040; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WpWRPKZTrgVHckN4fyywT4debJCD4sQBNo0HtHYOfx4=;
        b=piekgDcYFApNd3imBxoZ4MKCi80HPthsYfw9jBS1tnXb3RvS8NBP1Bc/4tsZ6zXTE2
         o9W0avrWCExyGCQtzNM22miFAymoh9A8qRkCHo+Mhk2lqbnVponsOk8WtlcP86LBjy52
         udkUczFUHekeKR0MJEd6PqgWfVN0er5FfZLwMlE9f4MoeBuqdHN0wIaCmqyyhkNfYoHB
         KY+NsMIVSN6luuVosa2ZFqgks4qD5uURUVVutfBUR3ipQNjgW2A7Wj+0M6T8gJ5mM180
         KgzbVNvSQWRSJ1U6/hwW61yDQaEOWIWCKY7QmwfUsgV3yPG+DzS9VoQYs3j2qnIJRLxB
         3Ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000240; x=1746605040;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpWRPKZTrgVHckN4fyywT4debJCD4sQBNo0HtHYOfx4=;
        b=YcDnxVT8R2QOPnARjmCnbMtbGDDY9A+66oQo6e3kUVttPy0qgAWur3on0B0y0p0bzf
         UJGQGuOQhOECe87LnPWVS1e4mVbZ/gu+fEtP0wft2j/yS5u/WbejPvKadXD1zbKZ6d80
         yAwl0xg+Y+tZOyfspex5LxW5ENKB+C401MFv1JhbyUYOwbjjc7XdcE3POpbB+hUm9fmM
         J768IaGzb8565Mew+7Nfmy9s6u3/OrzFzS4xypFaaQssDCwQzpkwYFV5CXd+MaKwYl2Q
         KF0u08+35xIWvCCknKGgcdK0jwELCJuhLUeOwuwBVvSiLoFOM36IpilRq1Jw8W7/4dZI
         vVCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBVO//L2WLijXM77IQV5KW7jQX4lpcaWMVlWBzdlMTEL3XE7ReeydsnRayUIhg9NjC5bz2hpL+cTwp3/k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2objbwq6TYgP5MOqS5u77SwcKfSGNmuQfZeDcWUysGJj2XL/V
	dVQymQOE1Zuq24tcncLkHrawTEgQxdW0kjXnFjE+UYTf4tAKQZX7s8umzK9f1L19gSOVlBgKzsa
	irLgEZkJIes+S/w==
X-Google-Smtp-Source: AGHT+IEI2dIRyOiB0HL4tKwAkhWBl9UQLV5gBiXGbTGepKML2h3DJ3RmB/CkPYBC9G6m8mr7/DPfag2VQKdaGKE=
X-Received: from wmbeu5.prod.google.com ([2002:a05:600c:81c5:b0:43d:b30:d2df])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a4e:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-441b1f30feemr17935465e9.6.1746000239963;
 Wed, 30 Apr 2025 01:03:59 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:03:54 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGrZEWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE2MD3aLS4hLd7OT8Ml2zZHOTtBSDNMM0AzMloPqCotS0zAqwWdGxtbU ALAxa6FsAAAA=
X-Change-Id: 20250430-rust-kcov-6c74fd0f1f06
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2361; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=DKnudNd/9zBWW3fHL+84dgzzzUZDXPxTFrPLc0mlmb4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoEdltHctz9D+GQdMdpsulmMJUFsQjQ4TdJk+NW
 R8aFYqqGmuJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaBHZbQAKCRAEWL7uWMY5
 RkM8EACNQ+B2tYSbeUNKxBIjv1jFJCJsBOD4ZIW9UXYWnSamDV6d+85oW4gtrz/3sNyWC6BrxIb
 ef162AJCYx1p0heTqIwEuhhUfWddFwW8WqmZvYRMcMFm3LyVpaA9BvsXuVe4v4t5bTeaFeuPRHL
 MIczft0hFYyp0T3j2jFuSaFNIHP8CTt9FcRG2AiZeSf0klb1Kmsx9G0ZwArLD8cnVuXeKGQz+Vy
 h42QeKg6ZVhmd46p7FBUgX8RH0xbPpkELYz6YeMkHwp0jxx2zM6EoaJizuLFTE8SkPw4sLpM9XZ
 iYiwS125lIVSnSzWYRpJj0CuSdM9+QekWXREltJD5MvAeTODPdBBp6nS9z+K1A96Q85awr6jqYg
 1suryL9Pkq+gMOdf7vbQ1iB+nKo/TdTDIAyfalAtu4vo6UKyaqWR4uZ2vLzAvON7cWKO3lkowKq
 Qdw9z8eFTyKAX0a5oqadcrknlSEzZPboyuVxdAyDyiwQMG1dGcPJxeGl44z6UZF8U7xa3toy0Tc
 /jFXxkxBlC8m4pJqUK3F/Ep8vSTPQpHpM1wQWhaqg24PS8cqW6aDgRdItMy59S1zmYcVc7WQ2cu
 bDjzwYoDPQEMESBIbaTCK9GyNptDtJzA5a8oV9YxUprBaiSmLy0OGe3JxLeieWSVVZ685AqDZKR FoiAzOAkF+2jjLg==
X-Mailer: b4 0.14.2
Message-ID: <20250430-rust-kcov-v1-1-b9ae94148175@google.com>
Subject: [PATCH] kcov: rust: add flags for KCOV with Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Aleksandr Nogikh <nogikh@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, kasan-dev@googlegroups.com, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Rust code is currently not instrumented properly when KCOV is enabled.
Thus, add the relevant flags to perform instrumentation correctly. This
is necessary for efficient fuzzing of Rust code.

The sanitizer-coverage features of LLVM have existed for long enough
that they are available on any LLVM version supported by rustc, so we do
not need any Kconfig feature detection.

The coverage level is set to 3, as that is the level needed by trace-pc.

Co-developed-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Matthew Maurer <mmaurer@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 scripts/Makefile.kcov | 6 ++++++
 scripts/Makefile.lib  | 3 +++
 2 files changed, 9 insertions(+)

diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
index 67e8cfe3474b7dcf7552e675cffe356788e6c3a2..ddcc3c6dc513e1988aeaf07b8efa106e8dffa640 100644
--- a/scripts/Makefile.kcov
+++ b/scripts/Makefile.kcov
@@ -3,4 +3,10 @@ kcov-flags-$(CONFIG_CC_HAS_SANCOV_TRACE_PC)	+= -fsanitize-coverage=trace-pc
 kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
 kcov-flags-$(CONFIG_GCC_PLUGIN_SANCOV)		+= -fplugin=$(objtree)/scripts/gcc-plugins/sancov_plugin.so
 
+kcov-rflags-y					+= -Cpasses=sancov-module
+kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-level=3
+kcov-rflags-y					+= -Cllvm-args=-sanitizer-coverage-trace-pc
+kcov-rflags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -Cllvm-args=-sanitizer-coverage-trace-compares
+
 export CFLAGS_KCOV := $(kcov-flags-y)
+export RUSTFLAGS_KCOV := $(kcov-rflags-y)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 2fe73cda0bddb9dcf709d0a9ae541318d54754d2..520905f19a9b19631394cfb5e129effb8846d5b8 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -169,6 +169,9 @@ ifeq ($(CONFIG_KCOV),y)
 _c_flags += $(if $(patsubst n%,, \
 	$(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
 	$(CFLAGS_KCOV))
+_rust_flags += $(if $(patsubst n%,, \
+	$(KCOV_INSTRUMENT_$(target-stem).o)$(KCOV_INSTRUMENT)$(if $(is-kernel-object),$(CONFIG_KCOV_INSTRUMENT_ALL))), \
+	$(RUSTFLAGS_KCOV))
 endif
 
 #

---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250430-rust-kcov-6c74fd0f1f06

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


