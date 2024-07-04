Return-Path: <linux-kbuild+bounces-2371-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B5F92799E
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 17:09:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 313C61F24B63
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B981B14E8;
	Thu,  4 Jul 2024 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qUanNB8F"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f73.google.com (mail-lf1-f73.google.com [209.85.167.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FFF1B1437
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Jul 2024 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720105726; cv=none; b=a7IA1aeJ0qmy1z4//+qx+x+RBw+I0zFkrVYNLHI4Daa6XWOiRhTMaBrOXgZT5qgOcqzxaI9rN72neYOU/JMxLzJsBtAQIUWjXWv4y+uw/SUQQIs0tvYETFl/EFt4Y3UVWZbmoGZCU92EkNTHIMb7CGWFIr8ZgrhS5Bu8RsJmgjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720105726; c=relaxed/simple;
	bh=JuGBj/G53huERAYmOEJ7zt/Eif/6HD+856XFNofQJEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=V+BnWZugLxcKUbUY1QJIYEyoFJRT882Cmt5HnHinkWGf4dGU5J5u04A7E7Yi9O9EYhx10qqMtHt+48QAdCwWfbquZ07rLJQn8U11/dxdcyCjrkgL4QfVAVAIGeJQ/LUngOQ7+EyLpMdgk5u5RR94LDOBkKTkjITT7eV2sBy57oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qUanNB8F; arc=none smtp.client-ip=209.85.167.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-lf1-f73.google.com with SMTP id 2adb3069b0e04-52e9b773505so693924e87.1
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jul 2024 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1720105723; x=1720710523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz+EbBDOjmeMrGJd8QmvR0upRYw2Fmi/0lt2+1YTdQg=;
        b=qUanNB8FSRpjUgMYUq/bDi4zOvdNrV/FFLd0qI/16Z+lRVp+4CBXd4zkkax3SW2RgA
         P5xtrdUtzaOICzkrXeR3B6qt6soMxZgxDNzDFeIBZ7o2lawQdtK6kl6bgSSQr862Ua2R
         kOe+8vc+L8OPTC6LPKBwdTN0AS4SykBB8LRLU4U6pT/nPMUz2uY5eyD+a+Hqe2vmEUyU
         y/NYuVvJolfNUZB3ighoW4hLHjpp+VroPu+VONwEOmDC0Lg2IOeisaGNZNS8DvJlPbMo
         bG8TxJ+7/ew3N6xp2Jg34NYRkLTfkFEkTEyY9s6upK4F6bRB0wt3bBMb0tl1NbP7l0j5
         Iyxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720105723; x=1720710523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz+EbBDOjmeMrGJd8QmvR0upRYw2Fmi/0lt2+1YTdQg=;
        b=qv6lfutU3WNbj5NLhY9mFv743vhoNIYSZ/tzjABw44u3ZwnNS+qKh6W5jjVeXL7RfI
         7awljU4zmjLlYOLzoYbN1e/Sokr5FqxThpn6JdyzgB9qCwVRB1j6lvl4Ti4CHbdrnGVq
         Omcq6Xmp9/Wz3o0raTu32xMf65VxVNHExJrC5PacMusUCDUaSCcaQuNKmF+X+9k/b8jr
         UTy8QUpcIFUi5TWxsERVc2dHJmJNanrEX+9R2tnP4KvnbwItwaV0Y7X9dAqiSzepXnds
         mpzt559kSvm+yj65Z3Gye1OmBJNfYvINFEaikmXmtXzQTI8kBn9WT62DeSGaSh0MdKq5
         ZYFw==
X-Forwarded-Encrypted: i=1; AJvYcCWPmlGe3UgnH78XoB5US0m+d3Z58p07fr9T6Fpia5TopPxvMACRJolyuL3KVF3eIPWqG5I8xIu5I3tSUKek5mWLUpwTgj725vgBxJIL
X-Gm-Message-State: AOJu0YxAITr2LJzD+ojmRRudKHMHh5hQZYC/IkfvkFJGBnsB32Xrlcog
	MrJB2h61+DoPfVkpWm7aHz4G3ZodB1NcnSchxZH0ymbEmqrSGL+HDOLXFLJj6hV3Zle+udZmYIW
	T+PUvx2hJgfALkQ==
X-Google-Smtp-Source: AGHT+IE03aDhat/nctBL3TSUjtF7n0/BH4Iv3XWnyA2/KfN0iRZTIP1nm3dzjP2dil5/BZGhl8862qWvC2IkeAc=
X-Received: from aliceryhl2.c.googlers.com ([fda3:e722:ac3:cc00:68:949d:c0a8:572])
 (user=aliceryhl job=sendgmr) by 2002:ac2:51c5:0:b0:52c:7f96:81d1 with SMTP id
 2adb3069b0e04-52ea063536dmr1741e87.6.1720105722612; Thu, 04 Jul 2024 08:08:42
 -0700 (PDT)
Date: Thu, 04 Jul 2024 15:07:58 +0000
In-Reply-To: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240704-shadow-call-stack-v3-0-d11c7a6ebe30@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=2683; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=JuGBj/G53huERAYmOEJ7zt/Eif/6HD+856XFNofQJEM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmhrrxeD87TT9nOZdZlSkM9Ug38Lq8pSNUKPjWV
 S8NfW1wCauJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZoa68QAKCRAEWL7uWMY5
 RuclEACRYz+o0orQSxwv7q+/d5rq3VqoTqZslfFT+l8/uynAxKQaS04uT9n0J3p20m905uf+kbA
 jyxYAe8B1qxiRcLwgxRbrHbKCHdch+xHTn/Qr2mV9q3bNPwwM79X3rvjaVOVhYkRL5JtYZMUuLq
 Z1BsoS7Nb89E01i8mTQhua3kOSrs3sjneafcmOushtO6IJxXiznFxXssUNaHctx4rHNQIvi94Bs
 RsNZ950OQZjq9mPNFZ6ZPetrlDGFFcM9Fiy3o8QwzLQUsSJ+zb8FgN6bBnucaHg1EVplZQzYj/y
 UHd6j4p9PzDXvWho+jfoV3LVuKBFkmyB8wfGYWbAoAIgKsPef5TSHKErkmKV4Cd7MsSe6JeVE4j
 NR0qFvEw9zjxUG3Mt8tYEoSpG5XTFwdqd+cpZCn+cScG+F2olTofTbx+f81TS45rrQ58EsHhZyu
 AHDBIVcrQ5x39H5d0RZMLPOStirm749G3soSpvBZo6+zYk8lxPaRmOZwuDn+EapYreKrtLFEcKY
 rLsd87PNhxDelvB35f8h8er05euI9yQSbucbYlJCE2kOmqRJ/VBdNFoBRaMb+9B7/M+ppoxPTq2
 OhnZJy1a3hf5nYwjnjqWSOpL1i50mUIrWLxSw+zmnVzGFQfWaqywlsFX2HbImPn9kPkvibqf+A9 7v/oXvrs1CicloQ==
X-Mailer: b4 0.13-dev-26615
Message-ID: <20240704-shadow-call-stack-v3-2-d11c7a6ebe30@google.com>
Subject: [PATCH v3 2/2] rust: add flags for shadow call stack sanitizer
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

As of rustc 1.80.0, the Rust compiler supports the -Zfixed-x18 flag, so
we can now use Rust with the shadow call stack sanitizer.

On older versions of Rust, it is possible to use shadow call stack by
passing -Ctarget-feature=+reserve-x18 instead of -Zfixed-x18. However,
this flag emits a warning, so this patch does not add support for that.

Currently, the compiler thinks that the aarch64-unknown-none target
doesn't support -Zsanitizer=shadow-call-stack, so the build will fail if
you enable shadow call stack in non-dynamic mode. See [2] for the
feature request to add this. Kconfig is not configured to reject this
configuration because that leads to cyclic Kconfig rules.

Link: https://github.com/rust-lang/rust/issues/121972 [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 Makefile            | 1 +
 arch/Kconfig        | 2 +-
 arch/arm64/Makefile | 3 +++
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c11a10c8e710..4ae741601a1c 100644
--- a/Makefile
+++ b/Makefile
@@ -945,6 +945,7 @@ ifdef CONFIG_SHADOW_CALL_STACK
 ifndef CONFIG_DYNAMIC_SCS
 CC_FLAGS_SCS	:= -fsanitize=shadow-call-stack
 KBUILD_CFLAGS	+= $(CC_FLAGS_SCS)
+KBUILD_RUSTFLAGS += -Zsanitizer=shadow-call-stack
 endif
 export CC_FLAGS_SCS
 endif
diff --git a/arch/Kconfig b/arch/Kconfig
index 238448a9cb71..5a6e296df5e6 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -690,7 +690,7 @@ config SHADOW_CALL_STACK
 	bool "Shadow Call Stack"
 	depends on ARCH_SUPPORTS_SHADOW_CALL_STACK
 	depends on DYNAMIC_FTRACE_WITH_ARGS || DYNAMIC_FTRACE_WITH_REGS || !FUNCTION_GRAPH_TRACER
-	depends on !RUST
+	depends on !RUST || RUSTC_VERSION >= 108000
 	depends on MMU
 	help
 	  This option enables the compiler's Shadow Call Stack, which
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 3f0f35fd5bb7..bbf313ddd700 100644
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

-- 
2.45.2.803.g4e1b14247a-goog


