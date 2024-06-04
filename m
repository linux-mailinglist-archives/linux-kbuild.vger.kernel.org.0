Return-Path: <linux-kbuild+bounces-1989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4641E8FBF1B
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 00:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B05071F21BB5
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Jun 2024 22:41:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DEBD14B97A;
	Tue,  4 Jun 2024 22:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K0OaYR3i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D01384B3
	for <linux-kbuild@vger.kernel.org>; Tue,  4 Jun 2024 22:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717540885; cv=none; b=Ho1l2LBdqq3Rl2Abhrke7Dtjv5tvI2MQrbxkVmS+nY9tYlUSGKzLdunDyVU6SZCZuUiPnOUiRmb+p5bJw49pD/vYZr8TZmPC3rS/YZmbhPo1+vz9jNicMIhCQlcImKv7IH4aynx9NuQA7B+gUYYSW4Ftqlw0/qvzdYZQKL+tPP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717540885; c=relaxed/simple;
	bh=48X2qgdP1gIxKDJW40AJ3Odff8DBYT35+62pDzTjg8s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=RHUc/CaSVmfk5T8UyZAug93zCMC3JGnaaThliOXD8B/vmekP7DvH2YE9qVmYQ8KDVm0bZ1yBF25U2lKaoq1jBg1EsnWPjfj8SqRZoLZdI976u2O4lgRRHDv7w533oBvrZMVvDMCUHhArKFpg+kixjBC/wjxhlSGdH1lR3O1agqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K0OaYR3i; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--davidgow.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dfabcc256cdso2083950276.2
        for <linux-kbuild@vger.kernel.org>; Tue, 04 Jun 2024 15:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717540882; x=1718145682; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5BFhMURlOxwbCZPlt3t+cMRvFnuBznLgUYvajgNDozE=;
        b=K0OaYR3i07zq5e5v5zpwIGXGynOZVzDIE3GP5tlL2EcCO09llUjrJvzCgrAN4/i/aM
         IIC4mDBqZ5yKXk6+m4qNMa/CWLymETiW7D6VaDoUznE+NAReuY7MrBJzUhdN7U6n5fV8
         qqp6MfVLt2DAOUaSuPCTdmXmx+mPzWRq9UZ7MxOrGVE7lVq7nQcWdo+1SK56r5/kP8Te
         NyUXcrT5QtwN+fB2/lvDLMK9bvmM4FY6xeFwtANSwD3sFo2CStl9x/RkyukL0eWUDC7b
         NyDIfNTAQa+e8vwYWgh6l5tdO2kgTTuqKSHHp3lnsP7lF/u6WDd+wdjNBHOr/4AAPQl5
         GJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717540882; x=1718145682;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5BFhMURlOxwbCZPlt3t+cMRvFnuBznLgUYvajgNDozE=;
        b=bFF1fiMPcpviC3K3u5RcIdAy21GSCZpr/Z8Fjpasj0TyjZ9u4MBc647VXlXB9FDFJ+
         weKxvo2EreWLcWY+KykK/AmAT8HqBc/t6R5klFJoi8It5NgY+bjzY7Dud60w/mhYLn59
         +nxsGGUIGkyPAIU3UWiBKxJVS4U6tdmWUGGYNHxOPXTv9TgM4nD0EEweq03U4grtJclF
         NFRgQhdcPxstEFiN0tUv4rYToFVLcpKF2hDzHbfH1PBMoSYlbXOMeQhvrMV+tg0OYEIp
         N1Bczr8cdMXoCbk1VquK6VxsV4FmhcQrHQh+3HEdSaUqGkJDH9a+Ls45TClwyevKnZ4/
         HCsw==
X-Forwarded-Encrypted: i=1; AJvYcCXlQAdzi58xCZYz/b+MtXaTrvyMlHud2/KmWJGfxuqt8cRK+Du4UK/ehmpDjfhSm6Co+mtbOZbZtZf9CS6Qk9XOOHfpvfWfFoK2nT9h
X-Gm-Message-State: AOJu0YwBTTlbjoGExY4n9NRCklea6DhGYtO3hku5Lqq/JbpK/cSsGQMV
	+otLUflmFvM6Yx6LjYp+QSe7tI7Zs5+mM4xDDvCMR+pW2q4qC/kodvuxt8frCkZ0IgODrxne/sV
	iQ7jMh/B/uw==
X-Google-Smtp-Source: AGHT+IFe9doWPRL9bdOBiprw606KPAUV1/yCDGjKHg9/0f16jSpDeFrPKk08bm1aGwBuEsC7VjTpzn499oFw4w==
X-Received: from slicestar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:20a1])
 (user=davidgow job=sendgmr) by 2002:a05:6902:120d:b0:dcb:e982:4e40 with SMTP
 id 3f1490d57ef6-dfacad28c85mr236994276.12.1717540882585; Tue, 04 Jun 2024
 15:41:22 -0700 (PDT)
Date: Wed,  5 Jun 2024 06:40:50 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240604224052.3138504-1-davidgow@google.com>
Subject: [PATCH] arch: um: rust: Add i386 support for Rust
From: David Gow <davidgow@google.com>
To: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	"H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>
Cc: David Gow <davidgow@google.com>, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, linux-um@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, x86@kernel.org, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

At present, Rust in the kernel only supports 64-bit x86, so UML has
followed suit. However, it's significantly easier to support 32-bit i386
on UML than on bare metal, as UML does not use the -mregparm option
(which alters the ABI), which is not yet supported by rustc[1].

Add support for CONFIG_RUST on um/i386, by adding a new target config to
generate_rust_target, and replacing various checks on CONFIG_X86_64 to
also support CONFIG_X86_32.

We still use generate_rust_target, rather than a built-in rustc target,
in order to match x86_64, provide a future place for -mregparm, and more
easily disable floating point instructions.

With these changes, the KUnit tests pass with:
kunit.py run --make_options LLVM=1 --kconfig_add CONFIG_RUST=y
--kconfig_add CONFIG_64BIT=n --kconfig_add CONFIG_FORTIFY_SOURCE=n

An earlier version of these changes was proposed on the Rust-for-Linux
github[2].

[1]: https://github.com/rust-lang/rust/issues/116972
[2]: https://github.com/Rust-for-Linux/linux/pull/966

Signed-off-by: David Gow <davidgow@google.com>
---
 Documentation/rust/arch-support.rst |  2 +-
 arch/um/Kconfig                     |  2 +-
 rust/Makefile                       |  2 +-
 scripts/Makefile                    |  2 +-
 scripts/generate_rust_target.rs     | 17 +++++++++++++++++
 5 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index b13e19d84744..750ff371570a 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -18,7 +18,7 @@ Architecture   Level of support  Constraints
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        ``riscv64`` only.
-``um``         Maintained        ``x86_64`` only.
+``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
 
diff --git a/arch/um/Kconfig b/arch/um/Kconfig
index 93a5a8999b07..b6ac49fec5bb 100644
--- a/arch/um/Kconfig
+++ b/arch/um/Kconfig
@@ -31,7 +31,7 @@ config UML
 	select TRACE_IRQFLAGS_SUPPORT
 	select TTY # Needed for line.c
 	select HAVE_ARCH_VMAP_STACK
-	select HAVE_RUST			if X86_64
+	select HAVE_RUST
 
 config MMU
 	bool
diff --git a/rust/Makefile b/rust/Makefile
index f70d5e244fee..83f675adbfab 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -426,7 +426,7 @@ $(obj)/core.o: private rustc_objcopy = $(foreach sym,$(redirect-intrinsics),--re
 $(obj)/core.o: private rustc_target_flags = $(core-cfgs)
 $(obj)/core.o: $(RUST_LIB_SRC)/core/src/lib.rs FORCE
 	+$(call if_changed_dep,rustc_library)
-ifdef CONFIG_X86_64
+ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 $(obj)/core.o: scripts/target.json
 endif
 
diff --git a/scripts/Makefile b/scripts/Makefile
index fe56eeef09dd..dccef663ca82 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -12,7 +12,7 @@ hostprogs-always-$(CONFIG_SYSTEM_EXTRA_CERTIFICATE)	+= insert-sys-cert
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_builder
 hostprogs-always-$(CONFIG_RUST_KERNEL_DOCTESTS)		+= rustdoc_test_gen
 
-ifdef CONFIG_X86_64
+ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)
 always-$(CONFIG_RUST)					+= target.json
 filechk_rust_target = $< < include/config/auto.conf
 
diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
index 641b713a033a..87f34925eb7b 100644
--- a/scripts/generate_rust_target.rs
+++ b/scripts/generate_rust_target.rs
@@ -169,6 +169,23 @@ fn main() {
         ts.push("features", features);
         ts.push("llvm-target", "x86_64-linux-gnu");
         ts.push("target-pointer-width", "64");
+    } else if cfg.has("X86_32") {
+        // This only works on UML, as i386 otherwise needs regparm support in rustc
+        if !cfg.has("UML") {
+            panic!("32-bit x86 only works under UML");
+        }
+        ts.push("arch", "x86");
+        ts.push(
+            "data-layout",
+            "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128",
+        );
+        let mut features = "-3dnow,-3dnowa,-mmx,+soft-float".to_string();
+        if cfg.has("MITIGATION_RETPOLINE") {
+            features += ",+retpoline-external-thunk";
+        }
+        ts.push("features", features);
+        ts.push("llvm-target", "i386-unknown-linux-gnu");
+        ts.push("target-pointer-width", "32");
     } else if cfg.has("LOONGARCH") {
         panic!("loongarch uses the builtin rustc loongarch64-unknown-none-softfloat target");
     } else {
-- 
2.45.1.288.g0e0cd299f1-goog


