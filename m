Return-Path: <linux-kbuild+bounces-6052-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DAFA5BE81
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 12:07:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F143B1EF9
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 11:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35EE2254AE2;
	Tue, 11 Mar 2025 11:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lWRYUF93"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCAD254851
	for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 11:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691198; cv=none; b=Bc+Ggg7tP3iRNxifNV8SF3mrl7FsjT+62F2mV5oh2VePpqlnhnzLRyl1b/8ZfGX7fgqfx34o7FMGzOes8KrZrDtAJHnlLxi4jVjSf+SfzJ47JCkFyIbYBM6sI/kRHdBoUs1weCq7C1cXCHWwqfnHCGKmdBcGEDKjJUvADhAE5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691198; c=relaxed/simple;
	bh=fYVShNRhRRvjgjpqBNaT7nBmZtLTM8WQfXXA2LkV77I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AiWnDfkyiDNbXvxYvE8a9vF2obN62Hx2zl46LD/lsbe2KjL4h+oZkUfNh4iGPmhk08j9Y6HUbrv9KnkMkRRgnSR0IUQnXE0OapDVdkoYMOchoh10QXSvQa0tzTCNyk0szjJUQB0dTVPImZjwoBZ4wRvwtZGhODedColiaNBkt/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lWRYUF93; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3913d8d7c3eso1634168f8f.0
        for <linux-kbuild@vger.kernel.org>; Tue, 11 Mar 2025 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741691195; x=1742295995; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8MFH+i67GnmGnNC8lrUwJ/qqT7je+AVkRDqP4sbMvY=;
        b=lWRYUF93slmRjyr4U7nDU5ThrZHQ5OFtmzoS1XOKkbej0FSkzblI1Jstwpl9g/LCa5
         dst5k+60irm5SOJ61/djlcLw6YAN7LTFowuoDgKtYKYZHpS4+EQAxxxqyHgEyJYWztFN
         KE2tbshFiQVQPBfnZRU48kQ5EULtmlPLkhjwghnSRCFQd247ub4qw3yq9YIOg+Zoswrx
         oZNCHqCFZX0M/nbIhBNw/K/UqZtPSPGPerFFxxYchDSG5cScExGTYn4HOILH6VaFBKnJ
         rlkgVVYs88hFR4r8ezQz2DtzcAOHGF/+CGkE/odCpgd/fWSk9YB7JnjR3i4CNBML5l1b
         1W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691195; x=1742295995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i8MFH+i67GnmGnNC8lrUwJ/qqT7je+AVkRDqP4sbMvY=;
        b=Zsxc77anDxijnV7tb3NrtGXEP3ePNEJSpB/BIKIlUml0BGaBFbN4KnH0b8RAblzNTT
         E9dwRk7aSYBjBvczQlYMX3M3qGgDzVpREfrXK8LvHjb1pQMi9fZeZIRF6DmlqHc1epoF
         yv5QO8o293IW6y+8wUNy/NNRQlVb7UxaYA63XMaV8cEk8xwt8iZp6bmdGDvArK7NugFW
         l6VXx3u9gRF+MAorIMaIlrHaF1X88GajyaddSozlzlLyhE63Kqm911+J+U2V19mGeo78
         66dz+8M+1Pah9q686c+OBS5mbjvGyGdgioE0DPDwoVF+4n8xKWwW8Xx14tLzqmpy+ZP8
         9cEw==
X-Gm-Message-State: AOJu0Yz/6314f3sYQhQWMK77Nz38w2u2J04gnETBsaT6yVQfdGi21xo0
	b9xUXhtvQiaE23aK0uCkt5DyNTg35hWBXFrkEG+v5X2+EIE+Vj/zH+Oo2rruMgCnqoRpUw==
X-Google-Smtp-Source: AGHT+IGr4pBlREZRzI4udDWiMwtONQvCGuNBzOUGHy+3FRwj4HpKdXxCmicRA0i10u6oQ1mFMoPwhHqn
X-Received: from wmsp32.prod.google.com ([2002:a05:600c:1da0:b0:43c:f3b7:f2d7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:adf:8b1d:0:b0:391:1652:f0bf
 with SMTP id ffacd0b85a97d-39132d8dc66mr10651642f8f.33.1741691194886; Tue, 11
 Mar 2025 04:06:34 -0700 (PDT)
Date: Tue, 11 Mar 2025 12:06:20 +0100
In-Reply-To: <20250311110616.148682-6-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250311110616.148682-6-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=8886; i=ardb@kernel.org;
 h=from:subject; bh=mTEKuMK3k7KiZecHKGHf2bV38KclCiT+gr5VTPl7TVk=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIf2CpPaBm19Mnks4qR4/7ThpI7uZllzUyzOCr1e8uuv2Y
 gb/t5TujlIWBjEOBlkxRRaB2X/f7Tw9UarWeZYszBxWJpAhDFycAjARZnaGPxzz/pso3qw8am1c
 L2tmpfxklvTLFHNHXqe1jbuNt7z/z8fIsHvOuzeHzDl7BBf+C9R/fumAz4IwseuthqtWvtvKbKR dyQQA
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250311110616.148682-9-ardb+git@google.com>
Subject: [PATCH v2 3/4] Kbuild: Create intermediate vmlinux build with
 relocations preserved
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org, x86@kernel.org, 
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
 .gitignore                   |  1 +
 Makefile                     |  2 +-
 arch/mips/Makefile.postlink  |  2 +-
 arch/riscv/Makefile.postlink | 11 +-------
 arch/riscv/boot/Makefile     |  5 +---
 arch/s390/Makefile.postlink  |  4 +--
 arch/x86/Makefile.postlink   |  8 +++---
 scripts/Makefile.lib         |  3 ---
 scripts/Makefile.vmlinux     | 28 +++++++++++++++-----
 9 files changed, 30 insertions(+), 34 deletions(-)

diff --git a/.gitignore b/.gitignore
index 5937c74d3dc1..f2f63e47fb88 100644
--- a/.gitignore
+++ b/.gitignore
@@ -65,6 +65,7 @@ modules.order
 /vmlinux.32
 /vmlinux.map
 /vmlinux.symvers
+/vmlinux.unstripped
 /vmlinux-gdb.py
 /vmlinuz
 /System.map
diff --git a/Makefile b/Makefile
index a3302dce56de..c07295a980a0 100644
--- a/Makefile
+++ b/Makefile
@@ -1560,7 +1560,7 @@ endif # CONFIG_MODULES
 # Directories & files removed with 'make clean'
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
-	       modules.builtin.ranges vmlinux.o.map \
+	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
                .builtin-dtbs-list .builtin-dtb.S
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
index cad20f0e66ee..6abfefd1bd31 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -376,9 +376,6 @@ quiet_cmd_ar = AR      $@
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
-quiet_cmd_strip_relocs = RSTRIP  $@
-cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
-
 # Gzip
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index 3523ce3ce3dc..dd744551a896 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -9,6 +9,20 @@ include $(srctree)/scripts/Makefile.lib
 
 targets :=
 
+ifdef CONFIG_ARCH_VMLINUX_NEEDS_RELOCS
+vmlinux-final := vmlinux.unstripped
+
+quiet_cmd_strip_relocs = RSTRIP  $@
+      cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $< $@
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
 
@@ -47,7 +61,7 @@ targets += .builtin-dtbs-list
 
 ifdef CONFIG_GENERIC_BUILTIN_DTB
 targets += .builtin-dtbs.S .builtin-dtbs.o
-vmlinux: .builtin-dtbs.o
+$(vmlinux-final): .builtin-dtbs.o
 endif
 
 # vmlinux
@@ -55,11 +69,11 @@ endif
 
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
@@ -72,11 +86,11 @@ cmd_link_vmlinux =							\
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
@@ -92,7 +106,7 @@ modules.builtin.ranges: $(srctree)/scripts/generate_builtin_ranges.awk \
 			modules.builtin vmlinux.map vmlinux.o.map FORCE
 	$(call if_changed,modules_builtin_ranges)
 
-vmlinux.map: vmlinux
+vmlinux.map: $(vmlinux-final)
 	@:
 
 endif
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


