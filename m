Return-Path: <linux-kbuild+bounces-10969-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IA/QKLaFgGnE8wIAu9opvQ
	(envelope-from <linux-kbuild+bounces-10969-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 12:08:38 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC1ECB7D4
	for <lists+linux-kbuild@lfdr.de>; Mon, 02 Feb 2026 12:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2DDFA3017253
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Feb 2026 11:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DC135CB61;
	Mon,  2 Feb 2026 11:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="rDLRrBIC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7790B35E544;
	Mon,  2 Feb 2026 11:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770030402; cv=none; b=TEbpam/P+lPHg3cDFiw7dWTx/lfsqFDNvAL8cGbP/n9mG3BLtX+/BDrdT8ZfiXdaqhNEnJZVX65lHo6TsqnxR3SNGAGlzip78P20+LpNQnWZys/JCTXYzLtE1EZQ74bK/RNYfmuJgivJer2D+3OF5miOGjllW1zWzLqx/apSLW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770030402; c=relaxed/simple;
	bh=20XLJ8vTV6VFM74zVheFIqma4qoPLb9CMtF7SJhQTYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fl6N4LWDsYaTkXmCDzaSBSw4e4RNDz3p3Bg6bQlm908oOFSZUD0hOX/GsmizuV7+uafNnySvUtHmDaRMZZ3Mlmsl7jSib6IZ7Cg1eiAxs+22v+FarFJ+ad+i8wYVmS9vuWjGf7oz88EavY0ofNpCGIRKvmxeYRfv2GCph9w9ROE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=rDLRrBIC; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from CPC-namja-026ON.redmond.corp.microsoft.com (unknown [4.213.232.19])
	by linux.microsoft.com (Postfix) with ESMTPSA id 2C45720B7167;
	Mon,  2 Feb 2026 03:06:34 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 2C45720B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770030400;
	bh=YK1bIPZnnWv7pQYIyhk35+mOVNMBab8mq9bTqqdASAg=;
	h=From:To:Cc:Subject:Date:From;
	b=rDLRrBIC+PuwHWuZRDUn1bNSeLTo7bn6JCiV/ZM1HvjeiM6WLaX53h53yDp6MvcWb
	 vXyWWf4Moz8HSk4Ogpv1PSyNJ3j1GZOIWriHLA7pVpZWmpfotYkVhOAxbknZEK/kTL
	 mGi7sIcvYoGJMxF5ZqiIHh8Lf0Hp3cZYreq6HUEU=
From: Naman Jain <namjain@linux.microsoft.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	thomas.weissschuh@linutronix.de,
	Tamir Duberstein <tamird@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Naman Jain <namjain@linux.microsoft.com>,
	Kees Cook <kees@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Saurabh Singh Sengar <ssengar@linux.microsoft.com>
Subject: [RFC PATCH] kbuild: Make --build-id linker flag configurable
Date: Mon,  2 Feb 2026 11:06:31 +0000
Message-ID: <20260202110631.978412-1-namjain@linux.microsoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linutronix.de,gmail.com,goodmis.org,linux.microsoft.com,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10969-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namjain@linux.microsoft.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1FC1ECB7D4
X-Rspamd-Action: no action

Build ID hashes include file paths, so building the same source from
different directories produces different binaries. This breaks
reproducible builds.

Add KBUILD_BUILD_ID variable (default: sha1) to allow overriding:

    make KBUILD_BUILD_ID=none

The variable is exported to VDSO Makefiles which also include a
fallback default for standalone invocation.

Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
---
Hi,
Sending this change for RFC, as it is quite possible that this is a
generic problem and I may be missing something.

I am trying to implement reproducible builds for one of my product
kernel. I referred https://reproducible-builds.org/docs/build-path/
and tried to use both -fdebug-prefix-map=OLD=NEW and
-fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
binary reproducibility without overwriting build-id to none. 
If I move the kernel to same path in other setup, I was able to create
same binary hash, however, without it, there is some difference in
build-id hash values.

Reproducibility wiki says "In most cases however, post-processing is
required to either remove the build path or to normalize it to a
predefined value.". I have tried that, and it works, but wanted to
conclude if that is my last option here.

Thanks.

---
 Makefile                          | 8 ++++++--
 arch/arm64/kernel/vdso/Makefile   | 5 ++++-
 arch/arm64/kernel/vdso32/Makefile | 5 ++++-
 arch/x86/entry/vdso/Makefile      | 5 ++++-
 4 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 3373308d2217c..3fcff4af200d7 100644
--- a/Makefile
+++ b/Makefile
@@ -1132,8 +1132,12 @@ KBUILD_AFLAGS   += $(KAFLAGS)
 KBUILD_CFLAGS   += $(KCFLAGS)
 KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 
-KBUILD_LDFLAGS_MODULE += --build-id=sha1
-LDFLAGS_vmlinux += --build-id=sha1
+# Can be overridden for reproducible builds by using "make KBUILD_BUILD_ID=none"
+KBUILD_BUILD_ID ?= sha1
+export KBUILD_BUILD_ID
+
+KBUILD_LDFLAGS_MODULE += --build-id=$(KBUILD_BUILD_ID)
+LDFLAGS_vmlinux += --build-id=$(KBUILD_BUILD_ID)
 
 KBUILD_LDFLAGS	+= -z noexecstack
 ifeq ($(CONFIG_LD_IS_BFD),y)
diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
index 7dec05dd33b70..b3ee5982b4676 100644
--- a/arch/arm64/kernel/vdso/Makefile
+++ b/arch/arm64/kernel/vdso/Makefile
@@ -9,6 +9,9 @@
 # Include the generic Makefile to check the built vdso.
 include $(srctree)/lib/vdso/Makefile.include
 
+# Fallback for standalone builds, normally inherited from top-level Makefile
+KBUILD_BUILD_ID ?= sha1
+
 obj-vdso := vgettimeofday.o note.o sigreturn.o vgetrandom.o vgetrandom-chacha.o
 
 # Build rules
@@ -22,7 +25,7 @@ btildflags-$(CONFIG_ARM64_BTI_KERNEL) += -z force-bti
 # routines, as x86 does (see 6f121e548f83 ("x86, vdso: Reimplement vdso.so
 # preparation in build-time C")).
 ldflags-y := -shared -soname=linux-vdso.so.1 \
-	     -Bsymbolic --build-id=sha1 -n $(btildflags-y)
+	     -Bsymbolic --build-id=$(KBUILD_BUILD_ID) -n $(btildflags-y)
 
 ifdef CONFIG_LD_ORPHAN_WARN
   ldflags-y += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
diff --git a/arch/arm64/kernel/vdso32/Makefile b/arch/arm64/kernel/vdso32/Makefile
index 9d0efed91414c..991aed67e65a2 100644
--- a/arch/arm64/kernel/vdso32/Makefile
+++ b/arch/arm64/kernel/vdso32/Makefile
@@ -5,6 +5,9 @@
 
 include $(srctree)/lib/vdso/Makefile.include
 
+# Fallback for standalone builds, normally inherited from top-level Makefile
+KBUILD_BUILD_ID ?= sha1
+
 # Same as cc-*option, but using CC_COMPAT instead of CC
 ifeq ($(CONFIG_CC_IS_CLANG), y)
 CC_COMPAT ?= $(CC)
@@ -87,7 +90,7 @@ VDSO_AFLAGS += -D__ASSEMBLY__
 # From arm vDSO Makefile
 VDSO_LDFLAGS += -Bsymbolic --no-undefined -soname=linux-vdso.so.1
 VDSO_LDFLAGS += -z max-page-size=4096 -z common-page-size=4096
-VDSO_LDFLAGS += -shared --build-id=sha1
+VDSO_LDFLAGS += -shared --build-id=$(KBUILD_BUILD_ID)
 VDSO_LDFLAGS += --orphan-handling=$(CONFIG_LD_ORPHAN_WARN_LEVEL)
 
 
diff --git a/arch/x86/entry/vdso/Makefile b/arch/x86/entry/vdso/Makefile
index f247f5f5cb44d..fefddc91b41ea 100644
--- a/arch/x86/entry/vdso/Makefile
+++ b/arch/x86/entry/vdso/Makefile
@@ -6,6 +6,9 @@
 # Include the generic Makefile to check the built vDSO:
 include $(srctree)/lib/vdso/Makefile.include
 
+# Fallback for standalone builds, normally inherited from top-level Makefile
+KBUILD_BUILD_ID ?= sha1
+
 # Files to link into the vDSO:
 vobjs-y := vdso-note.o vclock_gettime.o vgetcpu.o vgetrandom.o vgetrandom-chacha.o
 vobjs32-y := vdso32/note.o vdso32/system_call.o vdso32/sigreturn.o
@@ -155,7 +158,7 @@ quiet_cmd_vdso = VDSO    $@
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
 		       -T $(filter %.lds,$^) $(filter %.o,$^)
 
-VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 --no-undefined \
+VDSO_LDFLAGS = -shared --hash-style=both --build-id=$(KBUILD_BUILD_ID) --no-undefined \
 	$(call ld-option, --eh-frame-hdr) -Bsymbolic -z noexecstack
 
 quiet_cmd_vdso_and_check = VDSO    $@

base-commit: 63804fed149a6750ffd28610c5c1c98cce6bd377
-- 
2.43.0


