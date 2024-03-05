Return-Path: <linux-kbuild+bounces-1166-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83681871E62
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 12:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A77FE1C22421
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Mar 2024 11:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993BE5917F;
	Tue,  5 Mar 2024 11:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xnx657rB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B4456758
	for <linux-kbuild@vger.kernel.org>; Tue,  5 Mar 2024 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709639936; cv=none; b=ByQ8OKY98itdAOsyU9kPsrEoB/xKmV1yhoc6/WiF3YZGAsoxbTqPXX+O3MSQ60+PfM07CW2pJm4NEvgMSijKxkqVWh5QKX8iXQ9V1TE19wNUyOJnbZUc0P9utxTwOw/wcFkKHkx8AbbiRwRmqGPj3ftb5ZsFQHtKSjdQs/YK1DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709639936; c=relaxed/simple;
	bh=7PxlTkj360DZ8nVuDS7rKHmqSVpwgjXZS4/4TNCTeKw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=fH+KmhmPdfyg44n/9123dJOhS35XgMgeQ6y5TAarzcRJr+ewaATbn6DeidPFu0UcHmjIdyxopKc8ATQaz8EZxGvDIu7XA0aU0eG5Nst69/o5j6ptRrBqZ0KT+w77gwPlsrTQzmYu93EGZv6VqsyWtHIH1NLYd/MWnpqA4w+Cr04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xnx657rB; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-5ee22efe5eeso85285567b3.3
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Mar 2024 03:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709639933; x=1710244733; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Hozc51XP3BO0o1BYePnyEPgabGPbvjIMHS8HEHlaKbA=;
        b=Xnx657rBaMiBX6jYcDXgyextEpC94ydCQENbgsOkoYkdS+hJcNF+rxZIplP681EUeh
         IeRPXPsjH7OpyDmXpZWX5lsLzEZcCjktBoaVScUK4/Pi/RvPZhQfyyTfX28N60G7c8iz
         sFAqNNi1nXcxP+eHGa7hG3jnpbwK/1u4Amr9/9Oml2kgU1S/qj8tLoxNxc3iELIjotS6
         vGzKPgfcUxTX6SO1BGPFkwFLHYyeEtiMCPFtWqQZHeAYQi7jNpXenNcOjx/8bpvsHPJ8
         R69J3xXs5qxSvkP2jjmhRKB0hTTAXZciyvCMzBad/e1gw55fdLbuDguKrldjgVRShToU
         r15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709639933; x=1710244733;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Hozc51XP3BO0o1BYePnyEPgabGPbvjIMHS8HEHlaKbA=;
        b=FFf8pOpocWe7VOTYupaN6Pdi7m9wYBqUkEj5YMNzX18XIbO9IrbjgI8HqKw1K+FFWe
         f0cc9yWsaDxn9u1/7sRXxnr9KLIWQvw4IGmj1fMn239TLxGqPgN3DNb84EmKCC5+mJ+k
         1qOd1X79fjRIdYCIpf/U5B5h0ej4/yHMq69OrZECMoy7vADEscs567Vn1YzCDMjstubb
         Rp/m9xq0DADzJGuXMyITCnWLPF8n0L4zc6Ff8AdoQeYdPm30m9Mur4l8nirazhZL68/+
         h5lAs7zso7alDFVI7pmY6UgLNqX6UYmb9EgvM0nYc/iidpRdgs1aDVI9Qxw+OjD2vV9Q
         73ew==
X-Forwarded-Encrypted: i=1; AJvYcCULAJXGL0SRGwsaFjqZSuHOsdje8IwGykvoW7wibUyuj/Eb4FP9h70aPHj7IRo7MBTETWXL8DzehmOgZRtFuJrt/gNU32Gf/pw65YMN
X-Gm-Message-State: AOJu0Ywobvt+r3yoh4ymbyExER0JYSI9ik7DEZP5i25vmJdL6JWBjbDJ
	fqZA/Re2Zv2SOR6Hiq3nDt1FkmoAHf2LkB75eibLwPvO2Vm6KxhVrg1/B4/jU/beGtZYJMbbO15
	tzu8JVVYWe2+i6w==
X-Google-Smtp-Source: AGHT+IGtkyRjezXpYuKLv219plL2ChUtQcYNxwWKysP9iLUmgqXXI4qu/9Fzh+shZ2KYFCoqcQICZQfvC50NeFc=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:f02:b0:dcc:53c6:1133 with SMTP
 id et2-20020a0569020f0200b00dcc53c61133mr387214ybb.13.1709639933402; Tue, 05
 Mar 2024 03:58:53 -0800 (PST)
Date: Tue, 05 Mar 2024 11:58:45 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPQI52UC/32NQQ7CIBBFr9LM2jFAqaauvIfpYgJTIGIx0FRN0
 7uLPYDL95L//gqFc+ACl2aFzEsoIU0V1KEB42lyjMFWBiWUFq3QWDzZ9EJDMWKZydyxN7I/k25
 P0vZQd8/MY3jvzdtQ2Ycyp/zZLxb5s/9qi0SJo+g6plELUubqUnKRjyY9YNi27Qu11U05swAAA A==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3571; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=7PxlTkj360DZ8nVuDS7rKHmqSVpwgjXZS4/4TNCTeKw=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBl5wj2Nz7DwoaN21odkmrdYihFSQ09qs4VB8MPj
 FpmgQm0ExKJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZecI9gAKCRAEWL7uWMY5
 Rs3ID/4oaO+LZxloHPGCoqFKPWlzfItOuEOtdeeU0RXJy7AFuvU46WHtf5LmMCTFx21GbRMctzM
 lXiTlnvg+NParm1UlZRTYcSI2fT3ffsuNZ7a+eUDHT1/VcYLJEG2iRqPir4JfKcQfwD8qWspIZb
 xFRuc0oibWDAw5+3BQfBucrriRhsektrObfPcZ9fK+9U/LCPCDCjQ/arfo3ezaF1g1OPk5UlRDc
 CqA2yCabuxDwhsXmoapOJPdaCR/vssc+a1tOnDLoDgqCOxub5ijuOpF9H8LrH0XHiStj2+nOeS1
 Wt1mk9UmPZG96xCcTb1EzKnGGYc7pJAW+V/GfYbVao26Ts/Jp/7GBJazP8m6s7MuJtaYBP/Iju8
 Ne7kzcI3zhGo5uietKjBmkRYmYadS70sgALRLc8K8fsSyWsBAnX9bficLF881wbl8bxcXItqCCb
 GZH4vYCdepHU+P0hcftGgrdNaGS2HBKeP1ebN3ZlP3ce368NxI9vvMe7cpyEhjK6YeLqOlYiHmD
 g0B2i7urc5sg/d1+8CY3GuAknH5sEoAj0oRMQSNbqIumMpAA6BeU3JtooBbT6Z20rgW4AYwpyOY
 81J4C56kflgYLvy8ZjABiuVgHzN0RmY//KX+QpCt3erqq6DD893efurBgfQkTb93d5EC4JrUtYK ixKX+pqjxnEuEIQ==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240305-shadow-call-stack-v2-1-c7b4a3f4d616@google.com>
Subject: [PATCH v2] rust: add flags for shadow call stack sanitizer
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
	Andreas Hindborg <a.hindborg@samsung.com>, Valentin Obst <kernel@valentinobst.de>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
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

This contains a TODO to add the -Zuse-sync-unwind=n flag. The flag
defaults to n, so it isn't a problem today, but the flag is unstable, so
the default could change in a future compiler release.

Link: https://github.com/rust-lang/rust/issues/121970 [1]
Link: https://github.com/rust-lang/rust/issues/121972 [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
This patch raises the question of whether we should change the Rust
aarch64 support to use a custom target.json specification. If we do
that, then we can fix both the warning for dynamic SCS and the
build-failure for non-dynamic SCS without waiting for a new version of
rustc with the mentioned issues fixed.
---
Changes in v2:
- Add -Cforce-unwind-tables flag.
- Link to v1: https://lore.kernel.org/r/20240304-shadow-call-stack-v1-1-f055eaf40a2c@google.com
---
 Makefile            | 1 +
 arch/arm64/Makefile | 4 ++++
 2 files changed, 5 insertions(+)

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
index a88cdf910687..9bd5522c18e9 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -48,9 +48,12 @@ KBUILD_AFLAGS	+= $(call cc-option,-mabi=lp64)
 ifneq ($(CONFIG_UNWIND_TABLES),y)
 KBUILD_CFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
 KBUILD_AFLAGS	+= -fno-asynchronous-unwind-tables -fno-unwind-tables
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=n
 else
 KBUILD_CFLAGS	+= -fasynchronous-unwind-tables
 KBUILD_AFLAGS	+= -fasynchronous-unwind-tables
+# TODO: Pass -Zuse-sync-unwind=n once we upgrade to Rust 1.77.0
+KBUILD_RUSTFLAGS += -Cforce-unwind-tables=y
 endif
 
 ifeq ($(CONFIG_STACKPROTECTOR_PER_TASK),y)
@@ -103,6 +106,7 @@ endif
 
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


