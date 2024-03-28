Return-Path: <linux-kbuild+bounces-1149-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 96531870281
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 14:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D89F2897ED
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Mar 2024 13:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16D473FB0A;
	Mon,  4 Mar 2024 13:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ufs5iE8T"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lj1-f201.google.com (mail-lj1-f201.google.com [209.85.208.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A8B3D96A
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Mar 2024 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709558261; cv=none; b=MYlxgAraqOlHtv8bBkMNd65aG2MPzzIHT2TWp/J/b7vjwDIBU1agtgLkobtX2eO2Gm8TTsPkRFuxIm795Ew00pVvvYjiiKLuAm37ZmEc6vVqsHOmY8dVilXdEhfWEdmBOW3K2AbLGFxpuRyUfNgqNJtKZNq/ul2B1ul/03qG1xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709558261; c=relaxed/simple;
	bh=xtpb796Eef+Npkk8DkktAG30VJMlry1p+CcpmAvgVko=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=FLBR+PxfVW9VXaBVKzWw58kQRmQ7ArTNgukk8/RSjOcUqsSl92BOEvq6Mnzat9T6w0O1qBhgWHcZUgkdk0SeJEIRYtkOp6wXUnhNmDW9tMOJIIf01z1dzN9lsSA5DrFXeiPfZvEcmEo2aK2SvyE0b2Vqo+fIpBZhJ0BRfyQqF7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ufs5iE8T; arc=none smtp.client-ip=209.85.208.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-lj1-f201.google.com with SMTP id 38308e7fff4ca-2d33e6f838dso30360901fa.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Mar 2024 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709558256; x=1710163056; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i/4QirR95nn8mSCBchMjwJLywe8ez0yluKn1k2WVJGo=;
        b=ufs5iE8T6SUM3SxJMxhWI0ybjsXRRp2vGhz5W1ch5QMDnow2amdS4OJmgF1CYN73x0
         s5bZxS7AY0+2EJtBh1HTs1IH+rilss3dkPi3B1uHxL15j+DeZqX7BGoR9EZd4BnHXUNB
         h/989pXqS7bRblfHQSXPYhacV+EOFyr9I/HVuNePDgZzjdbdcGiU0utSK1I8k14IISAQ
         tAFodPJaHbSc/p54J3E+KZBNQeyTVltyznkCLcw/vIilrYALyxECKLmwSQO2+qMzoEic
         pdaMZcyC0CRK1RMcIsXh0u9mFgxH9IsKKNE1ysiMWrgVSPM5ubCm6LIo4JLdLp+g1JGa
         nUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709558256; x=1710163056;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i/4QirR95nn8mSCBchMjwJLywe8ez0yluKn1k2WVJGo=;
        b=AozgftuZbPgeciqXbfnV9SUr6IvIMJcAVCtxXghjDGNGIEGVdVzvxr5eUaxDk0lv6o
         FfkC9b2Y02JznCqBuOLGlGSljemc40Of/12j7SDtWS+Syl+5zhblC4p1Q06ZttERKHSE
         U3/cXbJFWpn9hDL5n0zyK8QIjWPQoHgYvC+B9vNwcuRF2t1Xfyr3Y8qF2T3mmZoAPNr2
         p4y2E3MefjLqF8wg+uHHPr59m17AnU5YuLLUvVy/WI7W/AlhbXaQbLmCXdne494Xrz+P
         p9P56lqMTebiMfBfpNQrP9+NJJjAT84DI11qvk7LwiieNClVINwU0Bl9tnGUvp5jJn6Z
         2zpw==
X-Forwarded-Encrypted: i=1; AJvYcCV2hfg3QqdoijGHQadk3+BUaybiQDhMbQFQ1Tgx0se3GdWgg380lWX5CG0fe8MPIBgcjMCLupGUXLsb+IsKdYG0fdyY+jLvN+OHZJRR
X-Gm-Message-State: AOJu0Yz/gbQwJMExa1iYsKTNrBT5nRiyB8gCNStW/dXq+IxmzpMPFYHn
	pgyH7dhB0Rjdn8d85AD/1TBNciS66Y/szKx0jXZ4td2PPiHFHlRosGHbCyhKo5UwUSBEFSB9Wpt
	JvgSdEsTRWbSNeg==
X-Google-Smtp-Source: AGHT+IE3TSw/DMbeWqZTscAHYFV6PqSINRRFR7klJO+aWhvKus14mEj/KzxhySNAYvfuSA12AxXSHcowxOCgESU=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a2e:98cb:0:b0:2d3:4f3:d40a with SMTP id
 s11-20020a2e98cb000000b002d304f3d40amr8010ljj.10.1709558256206; Mon, 04 Mar
 2024 05:17:36 -0800 (PST)
Date: Mon, 04 Mar 2024 13:17:03 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM7J5WUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYwMT3eKMxJT8ct3kxJwc3eKSxORsXctkQ0vzRBNjM8MUSyWgvoKi1LT MCrCZ0bG1tQDLQfwIYwAAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2936; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=xtpb796Eef+Npkk8DkktAG30VJMlry1p+CcpmAvgVko=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBl5cnnan4HCUgQZK98UVHzHWp5YlRy0EkNKXtgR
 fcLYhZxYkyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZeXJ5wAKCRAEWL7uWMY5
 RkUQEACaNXLGAZlgkY/g6CPmuS89btY9VsUchSYrg1LQQ6qqMvUjUR7Sprx1CYA5BkzAa8wtz65
 w5wu1qbNoHofrngfIBizdwolmUgwx5isnQoybKDryw9qYK9XHpWF7c9u1ZoaQ8YPHXrYGVd7OPy
 5Q6VncTyN+Ma0mLiONueGNkfVZyyvM8kTvtMLPHGpIGv9JHC8KdH91n2+pMj453EqXJcVpbbCuX
 qOsA7Ae0hfNIkVAgyK9aD+/5uD/BbnhJyJbQjcwEyH4RylV2ssqxWKHLCokWMEg5J7jTIlRBT7h
 FMokdSSchf1TMMs9k8bIVrjia4k8gKSFFSHdJF0rdu+Qaz31/4N4I1D68RSzPP1/k12e5jbqUtO
 LD1BnN4/rSGOUVgsGghHGQzTFQq+rk5xqAy1r3lElmakFtKjjMoibXpUc7WHc/NxI3lY0o8z9LK
 9k4jf7/k4iX2VILL7yYBzKM/B3xNtJ5VaKm2/AQIkpGb0ys0+iCSi+FWZixSK2qJ/HDi5n2Abi/
 6R1lGLD1RIIMgFgW8uOPmOBPDIgxBGc/wfqWMo2243VHDKuNOYhiF6KIfSye4cCq5e+OeICxPuh
 YKHQrJauDLHq39pm/mLZRg6b4DJzX3yuyLli47NpxQ5g4intn3WdH9OpRKYK4Cv82aZwicHTg/B TxMNArNkHPF2yqg==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com>
Subject: [PATCH] rust: add flags for shadow call stack sanitizer
From: Alice Ryhl <aliceryhl@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jamie Cunliffe <Jamie.Cunliffe@arm.com>, Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Kees Cook <keescook@chromium.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Add flags to support the shadow call stack sanitizer, both in the
dynamic and non-dynamic modes.

Right now, the compiler will emit the warning "unknown feature specified
for `-Ctarget-feature`: `reserve-x18`". However, the compiler still
passes it to the codegen backend, so the flag will work just fine. Once
rustc starts recognizing the flag (or provides another way to enable the
feature), it will stop emitting this warning. See [1] for the relevant
issue.

Currently, the compiler thinks that the aarch64-unknown-none target
doesn't support -Zsanitizer=shadow-call-stack, so the build will fail if
you enable shadow call stack in non-dynamic mode. However, I still think
it is reasonable to add the flag now, as it will at least fail the build
when using an invalid configuration, until the Rust compiler is fixed to
list -Zsanitizer=shadow-call-stack as supported for the target. See [2]
for the feature request to add this.

I have tested this change with Rust Binder on an Android device using
CONFIG_DYNAMIC_SCS. Without the -Ctarget-feature=+reserve-x18 flag, the
phone crashes immediately on boot, and with the flag, the phone appears
to work normally.

Link: https://github.com/rust-lang/rust/issues/121970 [1]
Link: https://github.com/rust-lang/rust/issues/121972 [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
It's not 100% clear to me whether this patch is enough for full SCS
support in Rust. If there is some issue where this makes things compile
and work without actually applying SCS to the Rust code, please let me
know. Is there some way to verify that it is actually working?

This patch raises the question of whether we should change the Rust
aarch64 support to use a custom target.json specification. If we do
that, then we can fix both the warning for dynamic SCS and the
build-failure for non-dynamic SCS without waiting for a new version of
rustc with the mentioned issues fixed.
---
 Makefile            | 1 +
 arch/arm64/Makefile | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 0e36eff14608..345066643a76 100644
--- a/Makefile
+++ b/Makefile
@@ -936,6 +936,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
 ifndef CONFIG_DYNAMIC_SCS
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
+KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
 endif
 export CC_FLAGS_SCS
 endif
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index a88cdf910687..df3f21370165 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -103,6 +103,7 @@ endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK), y)
 KBUILD_CFLAGS	+= -ffixed-x18
+KBUILD_RUSTFLAGS += -Ctarget-feature=+reserve-x18
 endif
 
 ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)

---
base-commit: 90d35da658da8cff0d4ecbb5113f5fac9d00eb72
change-id: 20240304-shadow-call-stack-9c197a4361d9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


