Return-Path: <linux-kbuild+bounces-12327-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHztCgQtx2nlTwUAu9opvQ
	(envelope-from <linux-kbuild+bounces-12327-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 02:21:08 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEF934CE21
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 02:21:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67D8B305C8CF
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Mar 2026 01:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87F6C32D7FB;
	Sat, 28 Mar 2026 01:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gWYtO3bl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716C6319852
	for <linux-kbuild@vger.kernel.org>; Sat, 28 Mar 2026 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774660785; cv=none; b=spFPpMP6PBv29jKEUM1bWKJcjPK+an70dooCcHmtJJGJ2LhEhph8N2V/gMPm7b4UCrv4WfTdtLh/Uc1sWiAqTEewvMNnz/755Mm6adUcWxA1iv2fCjRDubcHOtQXmjIkT0KMgh1vkrfnJchlwBpggD6bNm9XBkmq9bE7BkDltZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774660785; c=relaxed/simple;
	bh=bN1aQp4RmHyt6y+39k5lqC1qWcGoTsZjLTpaAyTYfU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=lyeAa4rJKZ6a4IG1sIjTvPeg+XaOelfuhk3KsNZOV9JzoEXibUTQnknYZBctf0KjCxF6oVivIdQoty0b6gc1tRDsN4yaNg0HMPsgtzB93UWWgjfqNtyBWaMtvtEJBFe1YkzyM+agQfKdRVukJXYnSFQAhdkVhRWpGCDMpTarCQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--xur.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gWYtO3bl; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--xur.bounces.google.com
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2c166ac27c6so2908803eec.0
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Mar 2026 18:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774660776; x=1775265576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1InN92hTP72ZvblxNpK6DClYj/Fsngf8AFZhilT54iM=;
        b=gWYtO3blwfMQyCPSwK3NCoSFbsC+gUNU2kBI269N/xnEgbu+MECw/S0gZWfd0i66Cm
         qZqPpb47BeDhHshqvyhsWVdOoReNw2vFy0f59znAH6ZMdUOCmfWV8NuUYOVmnF8QzzvR
         Z9KmcmF19ft5oF5S/g9eM04Z6ImfKX6QU3PquU8pz9sUWNtfgYIkdnrf61IGnyjPqyFj
         YB35llcT5B0pOtbSC+6fLMACvfaRvJxQmK7TZmqtYNt9XRw6B3Vevmg7ShQZKo3TRexs
         XjoX90qVY2ZY0BhjMn+OTpC+3PgmKWS9YuZqilDTSHrFPp5GePnc6fCVn0tj+z1O4Rft
         m0HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774660776; x=1775265576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1InN92hTP72ZvblxNpK6DClYj/Fsngf8AFZhilT54iM=;
        b=A68O+T6EtA9FI3KgntS22CHdWcO6Z4c38UzYEb020U0rc4rNnm7pW58NSplQnpiMru
         BqKVcxpJYn/uv50GDCehGQOo0ouTCIk6IFexYvPeSLlc6n9qnk3/UrNw7mkEiqyUdXTk
         n+8T3daoaCrUfkaEGTIpLqVCKJHZTalFtVP7k5jUBTvayR9KI0lrviW5J77WeTBMw+z/
         kcEsLA61RGTMPH3QHzYjZevcBx4Nif6CnISo6+hj0mIfcvBlOjV7nqYBOM6waRInO73m
         mrwzaPeOHtPYIC7iHvd9SNfP4JqEJ288v7vrjGkKyalRmZYvuPYqY24eOy3epyYBbNkO
         /nwA==
X-Forwarded-Encrypted: i=1; AJvYcCVTrZmnq2ViQgk84eo5VuA8dMsxTL5XvtJoVT9Vj/O4+pVR0uGttBMLwvi56G9idFUpJh+lcdQvPuXH1OI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5F4QK/LS79ZJh6lEayx6CpbCVZZNTvA798S8h5b/kCQNw/LO3
	50S4tFNQP/vkWfIlfX7mvmz1mpwnZC+LZ2V/g8kJK6DJkih3WsvFYCKWsPK4ipe/j/FUmw==
X-Received: from dlbvv4.prod.google.com ([2002:a05:7022:5f04:b0:128:d48f:6f7d])
 (user=xur job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:4589:b0:11b:ceee:a49f
 with SMTP id a92af1059eb24-12ab284bfa1mr2501929c88.8.1774660775661; Fri, 27
 Mar 2026 18:19:35 -0700 (PDT)
Date: Sat, 28 Mar 2026 01:19:27 +0000
In-Reply-To: <20260328011927.3569802-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260328011927.3569802-1-xur@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260328011927.3569802-4-xur@google.com>
Subject: [PATCH v7 3/3] kbuild: distributed build support for Clang ThinLTO
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
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	Teresa Johnson <tejohnson@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NEQ_ENVFROM(0.00)[xur@google.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12327-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[google.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,llvm.org:url]
X-Rspamd-Queue-Id: 7FEF934CE21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rong Xu <xur@google.com>

Add distributed ThinLTO build support for the Linux kernel.
This new mode offers several advantages: (1) Increased
flexibility in handling user-specified build options.
(2) Improved user-friendliness for developers. (3) Greater
convenience for integrating with objtool and livepatch.

Note that "distributed" in this context refers to a term
that differentiates in-process ThinLTO builds by invoking
backend compilation through the linker, not necessarily
building in distributed environments.

Distributed ThinLTO is enabled via the
`CONFIG_LTO_CLANG_THIN_DIST` Kconfig option. For example:
 > make LLVM=1 defconfig
 > scripts/config -e LTO_CLANG_THIN_DIST
 > make LLVM=1 oldconfig
 > make LLVM=1 vmlinux -j <..>

The build flow proceeds in four stages:
  1. Perform FE compilation, mirroring the in-process ThinLTO mode.
  2. Thin-link the generated IR files and object files.
  3. Find all IR files and perform BE compilation, using the flags
    stored in the .*.o.cmd files.
  4. Link the BE results to generate the final vmlinux.o.

NOTE: This patch currently implements the build for the main kernel
image (vmlinux) only. Kernel module support is planned for a
subsequent patch.

Tested on the following arch: x86, arm64, loongarch, and
riscv.

The earlier implementation details can be found here:
https://discourse.llvm.org/t/rfc-distributed-thinlto-build-for-kernel/85934

Signed-off-by: Rong Xu <xur@google.com>
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---
 .gitignore                 |  2 ++
 Makefile                   |  9 +++++----
 arch/Kconfig               | 19 ++++++++++++++++++
 scripts/Makefile.lib       |  7 +++++++
 scripts/Makefile.thinlto   | 40 ++++++++++++++++++++++++++++++++++++++
 scripts/Makefile.vmlinux_a | 37 +++++++++++++++++++++++++++++++++++
 scripts/mod/modpost.c      | 15 +++++++++++---
 7 files changed, 122 insertions(+), 7 deletions(-)
 create mode 100644 scripts/Makefile.thinlto

diff --git a/.gitignore b/.gitignore
index 3a7241c941f5..c12bdf5a97f9 100644
--- a/.gitignore
+++ b/.gitignore
@@ -56,6 +56,7 @@
 *.zst
 Module.symvers
 dtbs-list
+builtin.order
 modules.order
 
 #
@@ -67,6 +68,7 @@ modules.order
 /vmlinux.32
 /vmlinux.map
 /vmlinux.symvers
+/vmlinux.thinlto-index
 /vmlinux.unstripped
 /vmlinux-gdb.py
 /vmlinuz
diff --git a/Makefile b/Makefile
index 69ccf9b8507d..d474b6f0f212 100644
--- a/Makefile
+++ b/Makefile
@@ -1047,11 +1047,11 @@ export CC_FLAGS_SCS
 endif
 
 ifdef CONFIG_LTO_CLANG
-ifdef CONFIG_LTO_CLANG_THIN
+ifdef CONFIG_LTO_CLANG_FULL
+CC_FLAGS_LTO	:= -flto
+else
 CC_FLAGS_LTO	:= -flto=thin -fsplit-lto-unit
 KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
-else
-CC_FLAGS_LTO	:= -flto
 endif
 CC_FLAGS_LTO	+= -fvisibility=hidden
 
@@ -1657,6 +1657,7 @@ endif # CONFIG_MODULES
 CLEAN_FILES += vmlinux.symvers modules-only.symvers \
 	       modules.builtin modules.builtin.modinfo modules.nsdeps \
 	       modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
+	       vmlinux.thinlto-index builtin.order \
 	       compile_commands.json rust/test \
 	       rust-project.json .vmlinux.objs .vmlinux.export.c \
                .builtin-dtbs-list .builtin-dtb.S
@@ -2118,7 +2119,7 @@ clean: $(clean-dirs)
 	$(call cmd,rmfiles)
 	@find . $(RCS_FIND_IGNORE) \
 		\( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
-		-o -name '*.ko.*' \
+		-o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
 		-o -name '*.dtb' -o -name '*.dtbo' \
 		-o -name '*.dtb.S' -o -name '*.dtbo.S' \
 		-o -name '*.dt.yaml' -o -name 'dtbs-list' \
diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298e..340550e44c50 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -861,6 +861,25 @@ config LTO_CLANG_THIN
 	    https://clang.llvm.org/docs/ThinLTO.html
 
 	  If unsure, say Y.
+
+config LTO_CLANG_THIN_DIST
+	bool "Clang ThinLTO in distributed mode (EXPERIMENTAL)"
+	depends on HAS_LTO_CLANG && ARCH_SUPPORTS_LTO_CLANG_THIN
+	select LTO_CLANG
+	help
+	  This option enables Clang's ThinLTO in distributed build mode.
+	  In this mode, the linker performs the thin-link, generating
+	  ThinLTO index files. Subsequently, the build system explicitly
+	  invokes ThinLTO backend compilation using these index files
+	  and pre-linked IR objects. The resulting native object files
+	  are with the .thinlto-native.o suffix.
+
+	  This build mode offers improved visibility into the ThinLTO
+	  process through explicit subcommand exposure. It also makes
+	  final native object files directly available, benefiting
+	  tools like objtool and kpatch. Additionally, it provides
+	  crucial granular control over back-end options, enabling
+	  module-specific compiler options, and simplifies debugging.
 endchoice
 
 config ARCH_SUPPORTS_AUTOFDO_CLANG
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 0718e39cedda..b36c7c6817bd 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -249,6 +249,12 @@ ifdef CONFIG_LTO_CLANG
 cmd_ld_single = $(if $(objtool-enabled)$(is-single-obj-m), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
 endif
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+# Save the _c_flags, sliently.
+quiet_cmd_save_c_flags =
+      cmd_save_c_flags = printf '\n%s\n' 'saved_c_flags_$@ := $(call escsq,$(_c_flags))' >> $(dot-target).cmd
+endif
+
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
 		$(cmd_ld_single) \
@@ -256,6 +262,7 @@ quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
 
 define rule_cc_o_c
 	$(call cmd_and_fixdep,cc_o_c)
+	$(call cmd,save_c_flags)
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
 	$(call cmd,gen_objtooldep)
diff --git a/scripts/Makefile.thinlto b/scripts/Makefile.thinlto
new file mode 100644
index 000000000000..03349ac69de5
--- /dev/null
+++ b/scripts/Makefile.thinlto
@@ -0,0 +1,40 @@
+PHONY := __default
+__default:
+
+include include/config/auto.conf
+include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
+
+native-objs := $(patsubst %.o,%.thinlto-native.o,$(call read-file, vmlinux.thinlto-index))
+
+__default: $(native-objs)
+
+# Generate .thinlto-native.o (obj) from .o (bitcode) and .thinlto.bc (summary) files
+# ---------------------------------------------------------------------------
+quiet_cmd_cc_o_bc = CC $(quiet_modtag)  $@
+      be_flags = $(shell sed -n '/saved_c_flags_/s/.*:= //p' \
+		 $(dir $(<)).$(notdir $(<)).cmd)
+      cmd_cc_o_bc = \
+      $(CC) $(be_flags) -x ir -fno-lto -Wno-unused-command-line-argument \
+      -fthinlto-index=$(word 2, $^) -c -o $@ $<
+
+targets += $(native-objs)
+$(native-objs): %.thinlto-native.o: %.o %.o.thinlto.bc   FORCE
+	$(call if_changed,cc_o_bc)
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
diff --git a/scripts/Makefile.vmlinux_a b/scripts/Makefile.vmlinux_a
index 650d44330d1f..15d92ee82dee 100644
--- a/scripts/Makefile.vmlinux_a
+++ b/scripts/Makefile.vmlinux_a
@@ -21,6 +21,41 @@ targets += built-in-fixup.a
 built-in-fixup.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt FORCE
 	$(call if_changed,ar_builtin_fixup)
 
+ifdef CONFIG_LTO_CLANG_THIN_DIST
+
+quiet_cmd_builtin.order = GEN     $@
+      cmd_builtin.order = $(AR) t $< > $@
+
+targets += builtin.order
+builtin.order: built-in-fixup.a FORCE
+	$(call if_changed,builtin.order)
+
+quiet_cmd_ld_thinlto_index = LD      $@
+      cmd_ld_thinlto_index = \
+	$(LD) $(KBUILD_LDFLAGS) -r --thinlto-index-only=$@ @$<
+
+targets += vmlinux.thinlto-index
+vmlinux.thinlto-index: builtin.order FORCE
+	$(call if_changed,ld_thinlto_index)
+
+quiet_cmd_ar_vmlinux.a = GEN     $@
+      cmd_ar_vmlinux.a =					\
+	rm -f $@;						\
+	while read -r obj; do					\
+		if grep -q $${obj} $(word 2, $^); then		\
+			echo $${obj%.o}.thinlto-native.o;	\
+		else						\
+			echo $${obj};				\
+		fi;						\
+	done < $< | xargs $(AR) cDPrS --thin $@
+
+targets += vmlinux.a
+vmlinux.a: builtin.order vmlinux.thinlto-index FORCE
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.thinlto
+	$(call if_changed,ar_vmlinux.a)
+
+else
+
 # vmlinux.a
 # ---------------------------------------------------------------------------
 
@@ -28,6 +63,8 @@ targets += vmlinux.a
 vmlinux.a: built-in-fixup.a FORCE
 	$(call if_changed,copy)
 
+endif
+
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
 
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0c25b5ad497b..b3c3cf42c9eb 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1482,13 +1482,22 @@ static void extract_crcs_for_object(const char *object, struct module *mod)
 	char cmd_file[PATH_MAX];
 	char *buf, *p;
 	const char *base;
-	int dirlen, ret;
+	int dirlen, baselen_without_suffix, ret;
 
 	base = get_basename(object);
 	dirlen = base - object;
 
-	ret = snprintf(cmd_file, sizeof(cmd_file), "%.*s.%s.cmd",
-		       dirlen, object, base);
+	baselen_without_suffix = strlen(object) - dirlen - strlen(".o");
+
+	/*
+	 * When CONFIG_LTO_CLANG_THIN_DIST=y, the ELF is *.thinlto-native.o
+	 * but the symbol CRCs are recorded in *.o.cmd file.
+	 */
+	if (strends(object, ".thinlto-native.o"))
+		baselen_without_suffix -= strlen(".thinlto-native");
+
+	ret = snprintf(cmd_file, sizeof(cmd_file), "%.*s.%.*s.o.cmd",
+		       dirlen, object, baselen_without_suffix, base);
 	if (ret >= sizeof(cmd_file)) {
 		error("%s: too long path was truncated\n", cmd_file);
 		return;
-- 
2.53.0.1018.g2bb0e51243-goog


