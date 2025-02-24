Return-Path: <linux-kbuild+bounces-5872-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2F5A42075
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 14:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4B7B3AC15A
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Feb 2025 13:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55EB924889B;
	Mon, 24 Feb 2025 13:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oTYW7Pxv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF524EF7D
	for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 13:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740403320; cv=none; b=kJT5USGzQj1Mjtrf0ToKxi0KAovz3nVcA378siAQc2bGpMKhZy6u3gNpXw5qLGcn3jn8yhOR8pn/Y6YXZiH9KbUCXQoBbn6xU7EyTetSBa9KWREWzbLM+Q86Kv6zxecp+1yxo2ayyhHRKnQZm72JazBCTVU9Ct7p2fKbh5akvq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740403320; c=relaxed/simple;
	bh=sYx0U6dKdy9Z8hm6YI8HSfPtgU8dm5FNWnUJKigRqyw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jCcyuNRjF74TQdV4xWRlx/Gpyz7jejSSyFiUf2F4vXUVRTbeFhB4LqEy4sd1YVRqpBhsD1vN3VumoyISXcjuEEWK4Z155vkBv1/yQKtybDOZERISx7bkdO2J9BkRDVGFRQl3QXors31CrG8GkKYh/jfQ9LTbng2gOkWSvBqqaZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oTYW7Pxv; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4394c489babso24355205e9.1
        for <linux-kbuild@vger.kernel.org>; Mon, 24 Feb 2025 05:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740403316; x=1741008116; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3Lxf+Mt6Upf1dwmmRpB6u+V8v32vkZJiilK04eXPBU=;
        b=oTYW7PxvlaUGjXgY+cAhrKpDL0OwwGpfO3ILK0SQvAShIOSAjG/4Ee+ZkEN06vymsp
         etSlHJtgQhl3ER8GGXSPefxWdKG8T+pY1vNgb5WOhHyMSJ3ypHAz1bdUWxCK/9JU8BaV
         nF2dIq5Pt+Y0VnFpNER6VvI66SDBXW0eCdik24JAQhuDCw/TDDy0QrNsHjMWwN2eYJLj
         5NltNf1gMleviPNtwFp/5AYUUeiC1x+OqOvFOCmqHp01pw5xZCXUrSD88S5SDpji4vfz
         iOjRmtXQshEfMf5KEj3uyTFqJJTgyrsR6eS1IdCHK5H11iQKZdIRXVh2+wUjCgpJmVDk
         f5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403316; x=1741008116;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K3Lxf+Mt6Upf1dwmmRpB6u+V8v32vkZJiilK04eXPBU=;
        b=kUCuT9wB5frZqUyvwsITSSNMzdQlp+fj6tP1kGOug+/Pg0P2iLuRI4JIdp+6F7mlKg
         NldKlfKGtDk71EteHF4IQGNPSPJ96sJRj+8xVWT3oDSDlwSJAWG3SNq5qYLLhFbPXryr
         QXLCdAcaCybJU+tpgIwGwL+qynTvW5NBhbnDTh2cwhKgihsZ6fAWX6SjlsNEAK5UFGRT
         6fF+m24soG7A8ZB7u2DudgJ1MSXjmNs+LriWY3uVw03srolH2JWWTbf2CJ7LY070y8bB
         gvhTUs9rDzFc7IV7cvl7K87LJ419oTst9A/JwgFJtI6AHcv7MtJBv/Z+PQ49OqKAcTNV
         EySA==
X-Forwarded-Encrypted: i=1; AJvYcCXED3K/A3ZJ+Gu9wdC6zlNKlOaaUJhXOEvdnwaSlpxBmLGgHWVDRsxABdEREUNRXySbyeMYC4oGpxeBP68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsaJAZvLDxZSM1Te4IDC7RDvyWNojYcuHvFrU9QXHDeKYpIK7h
	FK+YEDNhx3+1mtW+GHWeizEAq8EjHyaKNZoAmbpQilJZ74NYzbA3LL1BuXvn0ouc3ZuWUg==
X-Google-Smtp-Source: AGHT+IG33+Xh8ssyQ1nJslAs6tRKw3YdmrlDrYBBqDT59wRm3YzOuPRvynP8l8ixy2gY9jLphYyZImsw
X-Received: from wmbek12.prod.google.com ([2002:a05:600c:3ecc:b0:439:93e2:dc87])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1e10:b0:439:88bb:d035
 with SMTP id 5b1f17b1804b1-439aecf3404mr110519385e9.5.1740403316831; Mon, 24
 Feb 2025 05:21:56 -0800 (PST)
Date: Mon, 24 Feb 2025 14:21:36 +0100
In-Reply-To: <20250224132132.1765115-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250224132132.1765115-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=7868; i=ardb@kernel.org;
 h=from:subject; bh=OqJ5393/FS9cobJ3jWOwWHVsfGfjPgQpup4iA5mMahA=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIX1PUaLz7nZuy00PP2hdf+nYz3I/Zo1CMp+HhrLvgX09t
 heeR4V3lLIwiHEwyIopsgjM/vtu5+mJUrXOs2Rh5rAygQxh4OIUgIm4tTL8D5XPjHI0Cpp9+sXs
 aQ1tn9z/mmarrKvKenq2c8PV4OX7FjIy/OMW9J0lr7LV5WRYo3bP2bxf9w/dj1D+y3h7rW1h88I FnAA=
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250224132132.1765115-9-ardb+git@google.com>
Subject: [RFC PATCH 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

The imperative paradigm used to build vmlinux, extract some info from it
or perform some checks on it, and subsequently modify it again goes
against the declarative paradigm that is usually employed for defining
make rules.

In particular, the Makefile.postlink files that consume their input via
an output rule result in some dodgy logic in the decompressor makefiles
for RISC-V and x86, given that the vmlinux.relocs input file needed to
generate the arch-specific relocation tables may not exist or be out of
date, but cannot be constructed using the ordinary Make dependency based
rules, because the info needs to be extracted while vmlinux is in its
ephemeral, non-stripped form.

So instead, for architectures that require the static relocations that
are emitted into vmlinux when passing --emit-relocs to the linker, and
are subsequently stripped out again, introduce an intermediate vmlinux
target called vmlinux.unstripped, and organize the reset of the build
logic accordingly:

- vmlinux.unstripped is created only once, and not updated again
- build rules under arch/*/boot can depend on vmlinux.unstripped without
  running the risk of the data disappearing or being out of date
- the final vmlinux generated by the build is not bloated with static
  relocations that are never needed again after the build completes.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/mips/Makefile.postlink  |  2 +-
 arch/riscv/Makefile.postlink | 11 +--------
 arch/riscv/boot/Makefile     |  5 +---
 arch/s390/Makefile.postlink  |  4 +---
 arch/x86/Makefile.postlink   |  8 +++----
 scripts/Makefile.lib         |  2 +-
 scripts/Makefile.vmlinux     | 25 ++++++++++++++------
 7 files changed, 26 insertions(+), 31 deletions(-)

diff --git a/arch/mips/Makefile.postlink b/arch/mips/Makefile.postlink
index 6cfdc149d3bc..ea0add7d56b2 100644
--- a/arch/mips/Makefile.postlink
+++ b/arch/mips/Makefile.postlink
@@ -22,7 +22,7 @@ quiet_cmd_relocs = RELOCS  $@
 
 # `@true` prevents complaint when there is nothing to be done
 
-vmlinux: FORCE
+vmlinux vmlinux.unstripped: FORCE
 	@true
 ifeq ($(CONFIG_CPU_LOONGSON3_WORKAROUNDS),y)
 	$(call if_changed,ls3_llsc)
diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index 6b0580949b6a..0e4cf8ad2f14 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -10,26 +10,17 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
-include $(srctree)/scripts/Makefile.lib
 
 quiet_cmd_relocs_check = CHKREL  $@
 cmd_relocs_check = 							\
 	$(CONFIG_SHELL) $(srctree)/arch/riscv/tools/relocs_check.sh "$(OBJDUMP)" "$(NM)" "$@"
 
-ifdef CONFIG_RELOCATABLE
-quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
-cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
-
-endif
-
 # `@true` prevents complaint when there is nothing to be done
 
-vmlinux: FORCE
+vmlinux vmlinux.unstripped: FORCE
 	@true
 ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
-	$(call if_changed,cp_vmlinux_relocs)
-	$(call if_changed,strip_relocs)
 endif
 
 clean:
diff --git a/arch/riscv/boot/Makefile b/arch/riscv/boot/Makefile
index b25d524ce5eb..bfc3d0b75b9b 100644
--- a/arch/riscv/boot/Makefile
+++ b/arch/riscv/boot/Makefile
@@ -32,10 +32,7 @@ $(obj)/xipImage: vmlinux FORCE
 endif
 
 ifdef CONFIG_RELOCATABLE
-vmlinux.relocs: vmlinux
-	@ (! [ -f vmlinux.relocs ] && echo "vmlinux.relocs can't be found, please remove vmlinux and try again") || true
-
-$(obj)/Image: vmlinux.relocs FORCE
+$(obj)/Image: vmlinux.unstripped FORCE
 else
 $(obj)/Image: vmlinux FORCE
 endif
diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
index 1ae5478cd6ac..c2b737500a91 100644
--- a/arch/s390/Makefile.postlink
+++ b/arch/s390/Makefile.postlink
@@ -11,7 +11,6 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
-include $(srctree)/scripts/Makefile.lib
 
 CMD_RELOCS=arch/s390/tools/relocs
 OUT_RELOCS = arch/s390/boot
@@ -20,9 +19,8 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
 	mkdir -p $(OUT_RELOCS); \
 	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
 
-vmlinux: FORCE
+vmlinux.unstripped: FORCE
 	$(call cmd,relocs)
-	$(call cmd,strip_relocs)
 
 clean:
 	@rm -f $(OUT_RELOCS)/relocs.S
diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
index 8b8a68162c94..445fce66630f 100644
--- a/arch/x86/Makefile.postlink
+++ b/arch/x86/Makefile.postlink
@@ -11,23 +11,21 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
-include $(srctree)/scripts/Makefile.lib
 
 CMD_RELOCS = arch/x86/tools/relocs
 OUT_RELOCS = arch/x86/boot/compressed
-quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
+quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/vmlinux.relocs
       cmd_relocs = \
 	mkdir -p $(OUT_RELOCS); \
-	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
+	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/vmlinux.relocs; \
 	$(CMD_RELOCS) --abs-relocs $@
 
 # `@true` prevents complaint when there is nothing to be done
 
-vmlinux: FORCE
+vmlinux vmlinux.unstripped: FORCE
 	@true
 ifeq ($(CONFIG_X86_NEED_RELOCS),y)
 	$(call cmd,relocs)
-	$(call cmd,strip_relocs)
 endif
 
 clean:
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index cad20f0e66ee..7a023f17a21d 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -377,7 +377,7 @@ quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
 quiet_cmd_strip_relocs = RSTRIP  $@
-cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $< $@
 
 # Gzip
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 3523ce3ce3dc..1e3ea8e4b4b0 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -9,6 +9,17 @@ include $(srctree)/scripts/Makefile.lib
 
 targets :=
 
+ifdef CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
+vmlinux-final := vmlinux.unstripped
+
+vmlinux: $(vmlinux-final) FORCE
+	$(call if_changed,strip_relocs)
+
+targets += vmlinux
+else
+vmlinux-final := vmlinux
+endif
+
 %.o: %.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
@@ -47,7 +58,7 @@ targets += .builtin-dtbs-list
 
 ifdef CONFIG_GENERIC_BUILTIN_DTB
 targets += .builtin-dtbs.S .builtin-dtbs.o
-vmlinux: .builtin-dtbs.o
+$(vmlinux-final): .builtin-dtbs.o
 endif
 
 # vmlinux
@@ -55,11 +66,11 @@ endif
 
 ifdef CONFIG_MODULES
 targets += .vmlinux.export.o
-vmlinux: .vmlinux.export.o
+$(vmlinux-final): .vmlinux.export.o
 endif
 
 ifdef CONFIG_ARCH_WANTS_PRE_LINK_VMLINUX
-vmlinux: arch/$(SRCARCH)/tools/vmlinux.arch.o
+$(vmlinux-final): arch/$(SRCARCH)/tools/vmlinux.arch.o
 
 arch/$(SRCARCH)/tools/vmlinux.arch.o: vmlinux.o FORCE
 	$(Q)$(MAKE) $(build)=arch/$(SRCARCH)/tools $@
@@ -72,11 +83,11 @@ cmd_link_vmlinux =							\
 	$< "$(LD)" "$(KBUILD_LDFLAGS)" "$(LDFLAGS_vmlinux)" "$@";	\
 	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
 
-targets += vmlinux
-vmlinux: scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
+targets += $(vmlinux-final)
+$(vmlinux-final): scripts/link-vmlinux.sh vmlinux.o $(KBUILD_LDS) FORCE
 	+$(call if_changed_dep,link_vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF
-vmlinux: $(RESOLVE_BTFIDS)
+$(vmlinux-final): $(RESOLVE_BTFIDS)
 endif
 
 # module.builtin.ranges
@@ -92,7 +103,7 @@ modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
 			modules.builtin vmlinux.map vmlinux.o.map FORCE
 	$(call if_changed,modules_builtin_ranges)
 
-vmlinux.map: vmlinux
+vmlinux.map: $(vmlinux-final)
 	@:
 
 endif
-- 
2.48.1.601.g30ceb7b040-goog


