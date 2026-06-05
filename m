Return-Path: <linux-kbuild+bounces-13591-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VrfrCpi7ImqMcwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13591-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:05:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8982647EF1
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 14:05:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=HluiurCM;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13591-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13591-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 652E13022E0A
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 12:04:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F424DA546;
	Fri,  5 Jun 2026 12:04:15 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E604DA52D;
	Fri,  5 Jun 2026 12:04:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661055; cv=none; b=dl0RGd/Z8r/ZI+P0I/o+HaIM1JuM/5z3TbtwHvBOTKa7yjEbbFNqmxiJRk8uNWKkXQKbuVmNbROFtvFBow5Kxij4xsk1LSTMBuugv1DvXAVV4GPBzENyxqpnPFIdcPir0pElfIHIFIS/bs9N0v1RJJIwMJKVbnodRwpfpxVKzUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661055; c=relaxed/simple;
	bh=slLPjII/YYzG8uebXxPO38rsAzJDoPShfAb4TX0Ty4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gdenGdR6lP5tn4s6IQsn7aKpWHXc647xF+Z6N65M2JSnDtHUWv/ArNhUduYD2EhF2q2iNy3kwf1n6CKtvWM775l0Qr3mlu/7EvIO4LfMNPwa4viPg3PcDB5W2Lg2R3L5coSbfMjScrmjcA5bqbx7T1fdklXqRvtrYWcg8dm/vkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=HluiurCM; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=e63u8cSxbTOG7MttvCLiPj4HQCGd9eSdxjzMr9CX6+k=; b=HluiurCM54u2wnPXLfX3693ZWx
	0FfPL2vvT0HIn27MrsoFt5Vgf8IaU3EeIckPZPcdHBomszKtbq4fnhadWJBDIikub6w3rLHDlp9li
	L9TGG5mLmBF9lkxCCahZYwclz08YNEi/ugVNLcSsIfzUW9t7l6OMscOIvxL07KqSAKNnxoGHs+nqf
	4yejuqGw4SahmJUutGLYCuFGZxItBZqDVxC2SP535QTYMfcIZHKuJxeP2IRKU7wXWJ4AljT8bznK6
	lYGlXnwD1yu3DdOmyO5hXYwe54Ji7N/CPTZHmhC3tszRexjXeP17G6xGf7vCe0VVrGlTqq2D6rTDI
	GD4ZEc0w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wVTHQ-005HHe-0Z;
	Fri, 05 Jun 2026 12:04:04 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 05 Jun 2026 05:03:34 -0700
Subject: [PATCH v2 3/6] bootconfig: render embedded bootconfig as a kernel
 cmdline at build time
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-bootconfig_using_tools-v2-3-d309f544b5f7@debian.org>
References: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
In-Reply-To: <20260605-bootconfig_using_tools-v2-0-d309f544b5f7@debian.org>
To: Masami Hiramatsu <mhiramat@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org, 
 Nicolas Schier <nsc@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8534; i=leitao@debian.org;
 h=from:subject:message-id; bh=slLPjII/YYzG8uebXxPO38rsAzJDoPShfAb4TX0Ty4M=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqIrsfqRtONrPL2He67b5vF/k4jg6tn6E77z0HL
 nVR8BGWXy2JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaiK7HwAKCRA1o5Of/Hh3
 bY5HD/9d5AVwTDHIcWRGcGeDYJD5KuJokOSliR6/5n1YAomaz4KFV368LMzj5QlOxEP015zk+ap
 c68w5hMNZ7rMPoMPbOW0bi009x26ucoBfxslaANZI5FR+rk2dToKnUKWcFRPZFb1jIvZPGtAaN3
 LtSiQc2FUKGCMToDp5Pv5tRZ5iWfYAwykHuG1nLzT6ydN7gW3Pt8pt3ebTSQSYeUr24GzokRP79
 LR1Pm5gmVMd9xK2suNKwcDMq4bg9znIpRqA9KFdUX2pre2nGLdxRVZmVZnSih7aeTMggF4QftzI
 wLaN1oGNIVghxoZq8DAb7LvgBEovRYmiag2TFRnf+r8mnSTGFkLMtQOTraSLfMj03/+KRvzaP9L
 gFcEjUCO+aP504TAHigpymCJ+wGx1GSIVrqQSrcaJZgl8P8qgRka7cYvNkGdS0ZqoWsqi+e7Cin
 XnRZKoxU32Qr4Z9NZD6zCpowzwUzJkbHeNCC6+dS5aNHVkCSu25vwTjK638D0na9bQrvTqEbbO0
 8MsBvW6Jxq78H52KYSTDQHROVZ5Uodu8TtNJkUhoNZ+dY0wwzCgqCuiiHrMmr6MHKoUUh3cuRUf
 ewyt2xkRnC9GKFWj3LwXc+OcuFjqREIMXLhBzy4wf9QgG0FqGgYMSl87JQ6il5Xu+ZBtF3eOJQT
 ZF8X45zUp8pdIpg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13591-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B8982647EF1

Add the build-time pipeline that renders the "kernel" subtree of
CONFIG_BOOT_CONFIG_EMBED_FILE into a flat cmdline string and stashes
it in .init.rodata as embedded_kernel_cmdline[]. A follow-up patch
adds the runtime helper that prepends this string to boot_command_line
during early architecture setup so parse_early_param() sees the values.

The build wires up:
  tools/bootconfig -C kernel - userspace tool already shared with
                               lib/bootconfig.c, used here in -C mode
                               to render a bootconfig file to a cmdline
  lib/embedded-cmdline.S     - .incbin's the rendered text plus a NUL
                               (listed under the EXTRA BOOT CONFIG
                               MAINTAINERS entry)
  lib/Makefile rule          - runs tools/bootconfig at build time
  Makefile prepare dep       - ensures tools/bootconfig is built first,
                               same pattern as tools/objtool and
                               tools/bpf/resolve_btfids

Drop the test target from tools/bootconfig/Makefile's default 'all'
recipe so that hooking the binary into the kernel build does not run
test-bootconfig.sh on every prepare. The tests stay available as
'make -C tools/bootconfig test', matching the convention of
tools/objtool and tools/bpf/resolve_btfids whose 'all' targets only
build the binary.

Require BOOT_CONFIG_EMBED_FILE to be non-empty before the new option
can be enabled, otherwise tools/bootconfig -C runs against an empty
file and prints a parse error on every kernel build.

The feature gates on CONFIG_ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG, a
silent symbol arches select once they've wired the prepend call into
setup_arch(). No arch selects it in this patch, so the user-visible
CONFIG_BOOT_CONFIG_EMBED_CMDLINE is not yet enableable; when an arch
later opts in, the runtime behavior is added by the follow-up patches.

tools/bootconfig is compiled with $(HOSTCC), not $(CC): Kbuild exports
CC as the target cross-compiler, but the prepare hook runs the tool on
the build host, so $(CC) would produce a binary that fails to exec
("Exec format error") under ARCH=... cross builds. This mirrors
tools/objtool and tools/bpf/resolve_btfids.

embedded-cmdline.S places the rendered string in .init.rodata with the
"a" (allocatable, read-only) flag and %progbits, not "aw": the data is
never written at runtime, so it must not land in a writable section.

A follow-up patch wires the build-time tools/bootconfig into the
top-level clean target.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 MAINTAINERS               |  1 +
 Makefile                  |  5 +++++
 init/Kconfig              | 33 +++++++++++++++++++++++++++++++++
 lib/Makefile              | 16 ++++++++++++++++
 lib/embedded-cmdline.S    | 16 ++++++++++++++++
 tools/bootconfig/Makefile |  8 ++++++--
 6 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 4087b67bbc69..fb9314cbe344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9845,6 +9845,7 @@ F:	fs/proc/bootconfig.c
 F:	include/linux/bootconfig.h
 F:	lib/bootconfig-data.S
 F:	lib/bootconfig.c
+F:	lib/embedded-cmdline.S
 F:	tools/bootconfig/*
 F:	tools/bootconfig/scripts/*
 
diff --git a/Makefile b/Makefile
index d59f703f9797..e95992959f44 100644
--- a/Makefile
+++ b/Makefile
@@ -1543,6 +1543,11 @@ prepare: tools/bpf/resolve_btfids
 endif
 endif
 
+# tools/bootconfig renders the embedded bootconfig into a cmdline at build time.
+ifdef CONFIG_BOOT_CONFIG_EMBED_CMDLINE
+prepare: tools/bootconfig
+endif
+
 # The tools build system is not a part of Kbuild and tends to introduce
 # its own unique issues. If you need to integrate a new tool into Kbuild,
 # please consider locating that tool outside the tools/ tree and using the
diff --git a/init/Kconfig b/init/Kconfig
index ca35184532dc..5f491a5ac4b8 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1569,6 +1569,39 @@ config BOOT_CONFIG_EMBED_FILE
 	  This bootconfig will be used if there is no initrd or no other
 	  bootconfig in the initrd.
 
+config ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
+	bool
+	help
+	  Selected by architectures whose setup_arch() prepends the
+	  build-time-rendered embedded bootconfig cmdline to
+	  boot_command_line before parse_early_param() runs.
+
+config BOOT_CONFIG_EMBED_CMDLINE
+	bool "Render embedded bootconfig as kernel cmdline at build time"
+	depends on BOOT_CONFIG_EMBED
+	depends on BOOT_CONFIG_EMBED_FILE != ""
+	depends on ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
+	default n
+	help
+	  Render the "kernel" subtree of the embedded bootconfig file into a
+	  flat cmdline string at kernel build time and prepend it to
+	  boot_command_line during early architecture setup. This makes
+	  early_param() handlers (e.g. mem=, earlycon=, loglevel=) see the
+	  values supplied via the embedded bootconfig.
+
+	  The runtime bootconfig parser is unaffected, so tree-structured
+	  consumers such as ftrace boot-time tracing keep working.
+
+	  Note: when an initrd also carries a bootconfig, its "kernel"
+	  subtree is still parsed at runtime, but the embedded "kernel"
+	  keys remain in boot_command_line for parse_early_param() and
+	  end up later than the initrd keys in saved_command_line, so
+	  parse_args() last-wins favors the embedded values. If you need
+	  initrd to override embedded kernel.* keys, leave this option
+	  off.
+
+	  If unsure, say N.
+
 config CMDLINE_LOG_WRAP_IDEAL_LEN
 	int "Length to try to wrap the cmdline when logged at boot"
 	default 1021
diff --git a/lib/Makefile b/lib/Makefile
index 6e72d2c1cce7..9de0ac7732a2 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -273,6 +273,22 @@ filechk_defbconf = cat $(or $(real-prereqs), /dev/null)
 $(obj)/default.bconf: $(CONFIG_BOOT_CONFIG_EMBED_FILE) FORCE
 	$(call filechk,defbconf)
 
+obj-$(CONFIG_BOOT_CONFIG_EMBED_CMDLINE) += embedded-cmdline.o
+$(obj)/embedded-cmdline.o: $(obj)/embedded_cmdline.bin
+
+# Render the bootconfig "kernel" subtree to a flat cmdline string using
+# the userspace tools/bootconfig parser (-C mode). The runtime prepend
+# helper enforces COMMAND_LINE_SIZE at boot, so no build-time size
+# check is performed here (COMMAND_LINE_SIZE is an arch header
+# constant, not a Kconfig value).
+quiet_cmd_render_cmdline = BCONF2C $@
+      cmd_render_cmdline = \
+	$(objtree)/tools/bootconfig/bootconfig -C $< > $@
+
+targets += embedded_cmdline.bin
+$(obj)/embedded_cmdline.bin: $(obj)/default.bconf $(objtree)/tools/bootconfig/bootconfig FORCE
+	$(call if_changed,render_cmdline)
+
 obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
 obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o
 
diff --git a/lib/embedded-cmdline.S b/lib/embedded-cmdline.S
new file mode 100644
index 000000000000..740d7ad2dc01
--- /dev/null
+++ b/lib/embedded-cmdline.S
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Embed the build-time-rendered bootconfig "kernel" subtree as a flat
+ * cmdline string. setup_arch() prepends this to boot_command_line on
+ * architectures that select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG.
+ *
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates
+ * Copyright (c) 2026 Breno Leitao <leitao@debian.org>
+ */
+	.section .init.rodata, "a", %progbits
+	.global embedded_kernel_cmdline
+embedded_kernel_cmdline:
+	.incbin "lib/embedded_cmdline.bin"
+	.byte 0
+	.global embedded_kernel_cmdline_end
+embedded_kernel_cmdline_end:
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 90eb47c9d8de..aa75a7828685 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -15,10 +15,14 @@ override CFLAGS += -Wall -g -I$(CURDIR)/include
 ALL_TARGETS := bootconfig
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 
-all: $(ALL_PROGRAMS) test
+all: $(ALL_PROGRAMS)
 
+# bootconfig is a build host tool: Kbuild's prepare hook runs it on the
+# build machine to render the embedded cmdline, so always compile it with
+# $(HOSTCC). Using $(CC) would cross-compile it under ARCH=... builds and
+# fail to exec on the host ("Exec format error").
 $(OUTPUT)bootconfig: main.c include/linux/bootconfig.h $(LIBSRC)
-	$(CC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@
+	$(HOSTCC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@
 
 test: $(ALL_PROGRAMS) test-bootconfig.sh
 	./test-bootconfig.sh $(OUTPUT)

-- 
2.53.0-Meta


