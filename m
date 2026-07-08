Return-Path: <linux-kbuild+bounces-13953-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y4NvEU5YTmobLAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13953-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 16:01:50 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01928727098
	for <lists+linux-kbuild@lfdr.de>; Wed, 08 Jul 2026 16:01:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linutronix.de header.s=2020 header.b=umoZVKca;
	dkim=pass header.d=linutronix.de header.s=2020e header.b=5Ry88VGS;
	dmarc=pass (policy=none) header.from=linutronix.de;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13953-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13953-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14BF730AA99E
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2026 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253282F49FD;
	Wed,  8 Jul 2026 13:56:36 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3DD3A784E;
	Wed,  8 Jul 2026 13:56:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783518996; cv=none; b=BHxfLyD2RxIdILvZYx4dEiW3wmZ57DJK3H6WuuGSuO40aKmV8ZjxugDZ2G77Z4Pboq3WULx8sg44pkyS1VXm6WWxx+89wzYlr/BEl+pNd8K4two2Yl5x1VaoDxsmOqyiLSVaIeilS/TSVjuoU77lWoCGFHm1zIpzYELkKpft/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783518996; c=relaxed/simple;
	bh=O98AfbFyke/HVXu/VvQRaKZrk3pjknagnCmymNcCC6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DEOMlFebNdnUNLCZuz///7OWBZFxv4e5zkF3onUOGcbTs8pnvj2Z2kCTgPnOeV+9+MYLI/s8hnAvtX1uobcteQIMjeqXcZw0R9nKPbsbzOoiktnvRpQCrogYf7iOwJH2mlPRsXXGxLHu3yOKaxpIJoHicVEWVncbN3L+elLD8/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=umoZVKca; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5Ry88VGS; arc=none smtp.client-ip=193.142.43.55
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783518992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NVOWz06gOmScGeV8/ZQRhng3m+A3dI+uhzkYOdLC5Xs=;
	b=umoZVKcae3C7unh06T4436UsHVG4TiVqspvynKdrTnplARDW7lmuv4Yxuw1quaKGdOvVh0
	LMtRr8tfZLqCA60P8JV7nTSG4H3IjZ+TGws07Td194MJWm211dw70ueoo4D1slGrrMYP6r
	ROEN8guMqah7BDP0tT9kRETaR7LsYNtna6k0kItT3T/aLYmAyP8x7LNe3Nit0gv0YkIFHz
	zh1L0HeTHZi+0rK1rKqrJFvfTq10+kEy6RtEQ2OU8P1g/5i/G8tyP90u4QSPxtQB0ToMsD
	cISWOgnGnLHbLAlDdNVAlI8zniqn7YoyWzyYaT79RicPzwuKl0HNUfLIe0a1Tw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783518992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NVOWz06gOmScGeV8/ZQRhng3m+A3dI+uhzkYOdLC5Xs=;
	b=5Ry88VGSzvCeRqidrbAroWyrEpdqJ5C07v0eu4PSY/xhVJBufIPc02wVsB/l7l+jqYEcil
	EtmHh6gB2rsFORDg==
Date: Wed, 08 Jul 2026 15:56:27 +0200
Subject: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyMT3bKU4nzd4sritGLdxKS0FEOTtJRU00RzJaCGgqLUtMwKsGHRsbW
 1AEyHdeFcAAAA
X-Change-ID: 20260624-vdso-sysfs-abfd14fde5a7
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nam Cao <namcao@linutronix.de>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783518987; l=6687;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=O98AfbFyke/HVXu/VvQRaKZrk3pjknagnCmymNcCC6Y=;
 b=iU1E2585mUrT7JLD3uzNrWXRdSkRpeIcsX/T4355YDwhg7taZKmo5dtDGJ7zqUovMOiczoKmG
 iLYkxdBfdl8DXcgSIIn6K+VZDL2P1Cxdy0wb/eex5aA7AxPrHs3jnie
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13953-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:bigeasy@linutronix.de,m:andrealmeid@igalia.com,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[thomas.weissschuh@linutronix.de:query timed out,linux-kbuild@vger.kernel.org:query timed out];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01928727098

Finding the debug version of the vDSO is not trivial as there is no common
scheme where it is placed. That's especially problematic for CI testing.

The vDSO futex unlock mechanism requires for testing to have access to the
inner labels of the unlock assembly, which are only accessible via the
debug so.

Also for general debugging purposes it's convenient to have access to the
debug vDSO at a well defined place.

The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
regular 'make vdso_install' layout, including build-id symlinks to find
the correct file for each process.

The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.

On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
explicit dependency to avoid errors due to concurrent builds.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile            | 33 ++++++++++++++++++++++++++++++++-
 arch/x86/Makefile   |  3 +++
 init/Kconfig        | 10 ++++++++++
 kernel/Makefile     |  1 +
 kernel/vdso_debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b9c5792c79e0..8049f10c27b2 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,7 @@ no-dot-config-targets := $(clean-targets) \
 			 %asm-generic kernelversion %src-pkg dt_binding_check \
 			 dt_style_selftest \
 			 outputmakefile rustavailable rustfmt rustfmtcheck \
-			 run-command
+			 run-command have-vdso-debug
 no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
 			  image_name
 single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
@@ -1539,6 +1539,37 @@ vdso_install: export INSTALL_FILES = $(vdso-install-y)
 vdso_install:
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vdsoinst
 
+# ---------------------------------------------------------------------------
+# vDSO embedded debug symbols
+
+PHONY += vdso_prepare
+
+# Build the targets in $(vdso-install-y)
+# Some architectures may do this already through vdso_prepare,
+# so add a dependency to avoid race conditions
+$(vdso-install-y): vdso_prepare prepare0 FORCE
+	@$(MAKE) $(build)=$(patsubst %/,%,$(dir $@)) $@
+
+tar-opts := --mtime='1970-01-01 00:00:00' --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X
+
+quiet_cmd_vdso_debug_tar_xz = VDSODBG $@
+      cmd_vdso_debug_tar_xz = \
+		rm -rf $(tmp-target); mkdir -p $(tmp-target)/vdso/; \
+		$(MAKE) quiet=@ MODLIB=$(tmp-target) vdso_install; \
+		$(TAR) $(tar-opts) -a -c -f $@ -C $(tmp-target)/vdso/ .
+
+targets += vdso_debug.tar.xz
+vdso_debug.tar.xz: $(vdso-install-y) FORCE
+	$(call if_changed,vdso_debug_tar_xz)
+
+ifdef CONFIG_IVDSODEBUG
+prepare: vdso_debug.tar.xz
+endif
+
+PHONY += have-vdso-debug
+have-vdso-debug:
+	@echo $(if $(vdso-install-y)$(vdso-install-),y,n)
+
 # ---------------------------------------------------------------------------
 # Tools
 
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 598f178102ee..b762fddb620e 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -316,6 +316,9 @@ vdso-install-$(CONFIG_X86_64)	   += arch/x86/entry/vdso/vdso64/vdso64.so.dbg
 vdso-install-$(CONFIG_X86_X32_ABI) += arch/x86/entry/vdso/vdso64/vdsox32.so.dbg
 vdso-install-$(CONFIG_COMPAT_32)   += arch/x86/entry/vdso/vdso32/vdso32.so.dbg
 
+# vdsox32.so.dbg is derived from vdso64.so.dbg. Avoid races with CONFIG_IVDSODEBUG
+arch/x86/entry/vdso/vdso64/vdsox32.so.dbg: arch/x86/entry/vdso/vdso64/vdso64.so.dbg
+
 archprepare: checkbin
 checkbin:
 ifdef CONFIG_MITIGATION_RETPOLINE
diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c..f09132a44264 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -801,6 +801,16 @@ config IKHEADERS
 	  or similar programs.  If you build the headers as a module, a module called
 	  kheaders.ko is built which can be loaded on-demand to get access to headers.
 
+config IVDSODEBUG
+	tristate "Enable vDSO debug information through /sys/kernel/vdso_debug.tar.xz"
+	depends on SYSFS
+	depends on "$(shell,make have-vdso-debug)"
+	help
+	  This option enables access to the vDSO debug information. That can be
+	  used to debug applications and test the vDSO implementation.
+
+	  If configured as M the module will be called vdso_debug.ko.
+
 config LOG_BUF_SHIFT
 	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
 	range 12 25
diff --git a/kernel/Makefile b/kernel/Makefile
index 1e1a31673577..8adcc26ef859 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -93,6 +93,7 @@ obj-$(CONFIG_USER_NS) += user_namespace.o
 obj-$(CONFIG_PID_NS) += pid_namespace.o
 obj-$(CONFIG_IKCONFIG) += configs.o
 obj-$(CONFIG_IKHEADERS) += kheaders.o
+obj-$(CONFIG_IVDSODEBUG) += vdso_debug.o
 obj-$(CONFIG_SMP) += stop_machine.o
 obj-$(CONFIG_AUDIT) += audit.o auditfilter.o
 obj-$(CONFIG_AUDITSYSCALL) += auditsc.o audit_watch.o audit_fsnotify.o audit_tree.o
diff --git a/kernel/vdso_debug.c b/kernel/vdso_debug.c
new file mode 100644
index 000000000000..72d4f11327fc
--- /dev/null
+++ b/kernel/vdso_debug.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/cache.h>
+#include <linux/init.h>
+#include <linux/kobject.h>
+#include <linux/module.h>
+#include <linux/sysfs.h>
+
+asm (
+"	.pushsection .rodata, \"a\"	\n"
+"	.global vdso_debug_data		\n"
+"vdso_debug_data:			\n"
+"	.incbin \"vdso_debug.tar.xz\"	\n"
+"	.global vdso_debug_data_end	\n"
+"vdso_debug_data_end:			\n"
+"	.popsection			\n"
+);
+
+extern char vdso_debug_data[];
+extern char vdso_debug_data_end[];
+
+static struct bin_attribute vdso_debug_attr __ro_after_init =
+	__BIN_ATTR_SIMPLE_RO(vdso_debug.tar.xz, 0444);
+
+static int __init vdso_debug_init(void)
+{
+	vdso_debug_attr.private = vdso_debug_data;
+	vdso_debug_attr.size = vdso_debug_data_end - vdso_debug_data;
+
+	return sysfs_create_bin_file(kernel_kobj, &vdso_debug_attr);
+}
+
+static void __exit vdso_debug_exit(void)
+{
+	sysfs_remove_bin_file(kernel_kobj, &vdso_debug_attr);
+}
+
+module_init(vdso_debug_init);
+module_exit(vdso_debug_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Thomas Weißschuh <thomas.weissschuh@linutronix.de>");
+MODULE_DESCRIPTION("Provide vDSO debug information at runtime");

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260624-vdso-sysfs-abfd14fde5a7

Best regards,
--  
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


