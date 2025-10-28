Return-Path: <linux-kbuild+bounces-9299-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8555FC167AA
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 19:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E49550444B
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Oct 2025 18:29:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39904345CAC;
	Tue, 28 Oct 2025 18:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yjy9hv5y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6714534F24A
	for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761676121; cv=none; b=JF6NnTm23ZmxV/jgZswH0N47oU6+Q1me2PU9bAdNTax6KCovF6PvE1bupws8kxLWvMb9NeBe5DY6FiT7NWTiqoMGgdfXH9TsO+WSFZb1YtI23m1x7xv7iSKL4utgxT9eI4e3rKOM9zEoyAb8Vx1hDjszEeKnlOtNMQS8hh6204o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761676121; c=relaxed/simple;
	bh=WgKzjafwH7TVHq/wIftKYDsK8eXAkXDqosj1lO8Z+ss=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=muiOQZMOI8JzRHqcyMQn8qVfWrt0t7JLoYYCrNZFZuTtx43trsQjAo0VLZAvjWmU3JAZcJr4Y0wFIfTM7XagNLTrsgZzG86LZ85A8CmAvgKKawHuFLx6OThRFip+ZLyDse5X3OQZTm3DZhy1q4UH3q5BjjWpF6XPEt+PoXZWUR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yjy9hv5y; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee157b9c9so4851712a91.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Oct 2025 11:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761676119; x=1762280919; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/650juIRrFR+/zBE4AsJfIehjRLeu/NobhGC5TTIp60=;
        b=Yjy9hv5y6YEXiFjmqCaK8bd3Mdk2+a/BHFeeLWSri7G+dAkx1NzABNtAbMWiYWgsUI
         79Szul/WJ1nr/RgZXcFDRUK7F6TutT21hx2xlMD482BqckzBoMFIFXAkgZF/xIuF/Bm6
         Mm9ou7+fUkpyyIcz33oPLj3L44EgFnbEEyNAYaqrY/nyEFx4ybMFzh7arS6madnaa3u4
         sJo/LfsIB9muF4NAR5rHKx7fb0cY09jluo5drIgarcs1Gd7BWh5Iw8Z1n0M90mPaGACG
         t40/I+Fa3lTubDV5eM4C8TFl5xDd/S1m1fSO6Q4Ja8x1f9deZOTewbI085vjvep1Mtca
         ck2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761676119; x=1762280919;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/650juIRrFR+/zBE4AsJfIehjRLeu/NobhGC5TTIp60=;
        b=ebx8Uk3J7k14vMKkrmuRYFJCaL1RUSGaFLLph6h8/7UhOM66urV6AKjozZUa0D17Wu
         o3MvusEPfE3mqom/px27Wer5xLr3emr6M2N0F7rSoHU2mRKtalm40FYbht1btk2WQfdw
         uShwSvlafT9Kn+2wzOzGqhKEm/Y4tB6feedNIjTyUhHipZ17NNVMEe5JCtm6RjjfYqrT
         kxtd16bH8TI+Z0KsPVCIVQr8TZJWzGJsfv2pFvZ0cZGdqabqiC/w3h1hJ/KSSESCv3L1
         clM2yfZbj/phu6SSyXVJUhuVxjCwPKmydyRiJxwT5AeHUATyFGxkpDB1pp+dKIK5pv3W
         Ieag==
X-Forwarded-Encrypted: i=1; AJvYcCVFHl2kM12GAqhw6luFHf9WPN7N0zHoxXnualDQvmsjfGCq7z5THRs1KefxCiBvRhYTwoLpuEyPVEgSccI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJoSx1GX1Ddoae1RUBFpbMkUl+ZybCBCyAnwoJgomIH0xUaOEr
	tcbCiCJGqfhgVPJHfZuU5TkrJmdd257XdZoKrQMn0kmLjh8+vA0OXlwtiM1jrO25gO1bRw==
X-Google-Smtp-Source: AGHT+IEuaqPA4h6d9Z15XGnhnp3xsDJZ2pRkvpl/6jf0iWxm9m5r06Z5/t55EDVczMXO06zO/bVxqNA=
X-Received: from pjbru2.prod.google.com ([2002:a17:90b:2bc2:b0:33b:a0ae:940])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1c8a:b0:330:797a:f504
 with SMTP id 98e67ed59e1d1-3403a15d128mr7164a91.3.1761676118599; Tue, 28 Oct
 2025 11:28:38 -0700 (PDT)
Date: Tue, 28 Oct 2025 18:28:21 +0000
In-Reply-To: <20251028182822.3210436-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251028182822.3210436-1-xur@google.com>
X-Mailer: git-send-email 2.51.1.851.g4ebd6896fd-goog
Message-ID: <20251028182822.3210436-2-xur@google.com>
Subject: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
From: xur@google.com
To: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stafford Horne <shorne@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Piotr Gorski <piotrgorski@cachyos.org>, Rong Xu <xur@google.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Rong Xu <xur@google.com>

From: Masahiro Yamada <masahiroy@kernel.org>

Move the build rule for vmlinux.a to a separate file in preparation
for supporting distributed builds with Clang ThinLTO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Tested-by: Rong Xu <xur@google.com>
---
 Makefile                   | 16 +++++--------
 scripts/Makefile.vmlinux_a | 46 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 52 insertions(+), 10 deletions(-)
 create mode 100644 scripts/Makefile.vmlinux_a

diff --git a/Makefile b/Makefile
index b34a1f4c03967..89a25bac2bbab 100644
--- a/Makefile
+++ b/Makefile
@@ -1198,7 +1198,7 @@ export ARCH_DRIVERS	:= $(drivers-y) $(drivers-m)
 KBUILD_VMLINUX_OBJS := built-in.a $(patsubst %/, %/lib.a, $(filter %/, $(libs-y)))
 KBUILD_VMLINUX_LIBS := $(filter-out %/, $(libs-y))
 
-export KBUILD_VMLINUX_LIBS
+export KBUILD_VMLINUX_OBJS KBUILD_VMLINUX_LIBS
 export KBUILD_LDS          := arch/$(SRCARCH)/kernel/vmlinux.lds
 
 ifdef CONFIG_TRIM_UNUSED_KSYMS
@@ -1207,16 +1207,12 @@ ifdef CONFIG_TRIM_UNUSED_KSYMS
 KBUILD_MODULES := y
 endif
 
-# '$(AR) mPi' needs 'T' to workaround the bug of llvm-ar <= 14
-quiet_cmd_ar_vmlinux.a = AR      $@
-      cmd_ar_vmlinux.a = \
-	rm -f $@; \
-	$(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
-	$(AR) mPiT $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+PHONY += vmlinux_a
+vmlinux_a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vmlinux_a
 
-targets += vmlinux.a
-vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
-	$(call if_changed,ar_vmlinux.a)
+vmlinux.a: vmlinux_a
+	@:
 
 PHONY += vmlinux_o
 vmlinux_o: vmlinux.a $(KBUILD_VMLINUX_LIBS)
diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
new file mode 100644
index 0000000000000..9774f02b43b2f
--- /dev/null
+++ b/scripts/Makefile.vmlinux_a
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+PHONY := __default
+__default: vmlinux.a
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
+
+# Link of built-in-fixup.a
+# ---------------------------------------------------------------------------
+
+# '$(AR) mPi' needs --thin to workaround the bug of llvm-ar <= 14
+quiet_cmd_ar_builtin_fixup = AR      $@
+      cmd_ar_builtin_fixup = \
+	rm -f $@; \
+	$(AR) cDPrS --thin $@ $(KBUILD_VMLINUX_OBJS); \
+	$(AR) mPi --thin $$($(AR) t $@ | sed -n 1p) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
+
+targets += built-in-fixup.a
+built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
+	$(call if_changed,ar_builtin_fixup)
+
+# vmlinux.a
+# ---------------------------------------------------------------------------
+
+targets += vmlinux.a
+vmlinux.a: built-in-fixup.a FORCE
+	$(call if_changed,copy)
+
+# Add FORCE to the prerequisites of a target to force it to be always rebuilt.
+# ---------------------------------------------------------------------------
+
+PHONY += FORCE
+FORCE:
+
+# Read all saved command lines and dependencies for the $(targets) we
+# may be building above, using $(if_changed{,_dep}). As an
+# optimization, we don't need to read them if the target does not
+# exist, we will rebuild anyway in that case.
+
+existing-targets := $(wildcard $(sort $(targets)))
+
+-include $(foreach f,$(existing-targets),$(dir $(f)).$(notdir $(f)).cmd)
+
+.PHONY: $(PHONY)
-- 
2.51.1.851.g4ebd6896fd-goog


