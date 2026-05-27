Return-Path: <linux-kbuild+bounces-13365-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aDT2CCgfF2rw5AcAu9opvQ
	(envelope-from <linux-kbuild+bounces-13365-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:20 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F545E7EF9
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 18:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F40A9301C5BA
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 May 2026 16:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFE643D4E9;
	Wed, 27 May 2026 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="K6UsFZbj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362BA43C04C;
	Wed, 27 May 2026 16:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779900143; cv=none; b=uZ2oJoZF1UY8GKfFYjEp+OWmDRT8s2hkaEKe4P2cwUy7wdF7tcPIn4GKDHQ5Vn3VdbyBIe+5RCIL6HjZeDXHdf71l/Qtqkjew/EOJy8n5fc00bQgNgwPW7hKvphzYCZ2r6FB/TF9dFOA2TmxFcwqWOxSx8vBLvxhxHXjXurOXYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779900143; c=relaxed/simple;
	bh=qjd3tguTj0WFwiPlEIeVbyzh3f1Zu6w1BXCkFvwK7q8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EU/bn5+gyGCDtlaVxIObaLKerNa9t6/WyjPjEWCOERWtxc/I35d9KY4RcxJDDizO4aXxSsTOQzKCM6fxnBXkiiFXBGXNh6gT7JUQvK2Yhp77fJ4w/HQAX+Cph9t7tFBygXHfJEih2YJzlM/okmyE/xf7dWlXgG51g62dyAiXZVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=K6UsFZbj; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=M13mLGQRBGUn1JxQb9Dlyz/7Efn1k3VV1WqpaU1q/a4=; b=K6UsFZbj+JXviEdG9m6WNbH9Tw
	5QSlnUl9QvrvMWS4HDJGbv9Z7yAooG7PE8b7H90qq2NoRILPxivZQ6vI+F971jdfTgqlCxuIQZki0
	HDJJ6UtSeXe1kOLz8hGZ5nHBdnDqwpLRmaxGQZ5elAob6WuW5MBWFpXyqlO0tW2EMU+q9aBUUOFQM
	ZxlFj/rOUwmp7IybXI4tFl70jln5pb7ydn5nBhKTb3q3u4oIOomoRq0ue6DKT33TsvsB1D+YgQ0w3
	Mye8dMT560SfSDjfwuTeOw4IwjkylTNCtTSo2hAmy8Zk+PTlr3cuLqNcEp7EsGdRO1e/EyHFUwqSg
	dAetBJWw==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wSHKW-003JPh-2O;
	Wed, 27 May 2026 16:42:05 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 27 May 2026 09:41:35 -0700
Subject: [PATCH 2/4] bootconfig: render embedded bootconfig as a kernel
 cmdline at build time
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bootconfig_using_tools-v1-2-b6906a86e7d5@debian.org>
References: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
In-Reply-To: <20260527-bootconfig_using_tools-v1-0-b6906a86e7d5@debian.org>
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
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=6974; i=leitao@debian.org;
 h=from:subject:message-id; bh=qjd3tguTj0WFwiPlEIeVbyzh3f1Zu6w1BXCkFvwK7q8=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqFx7N/lN7BhCSbH5GyUOsWhONOBrZ7ohZPrPON
 R0xqw+moQ6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCahcezQAKCRA1o5Of/Hh3
 bZTtEACbVcAO3TU/zsDr8yMKV8XfYFC+IbG/J+PhYQAny8E4igdDdFIwTHWmCs0wwF6KiLFVX2e
 h3q9vjgOiqc2yXfSE/poRW7rEO+LVfv7kPQBGHtcQjJmt1lp4ivKrXzdSEfSwS6s7lE+UE4iWVc
 DC5u4FpjklxYBVddUleJKIVBjvxKi7fbJsH0vthVeWyhb8T7P0Hr6xop/2R+kKN0ZLWPTQh8F7w
 CreMF1OHwoa/Q+8QEuWTGUj0X7ZtVaDdll5lL1ZXFvl/WuO5l+Xc6hc5BCx8iyNYuhSTtqzbK3M
 lvf/LkYwG9DJ8A43xInUnpCU3np5/NEdGEAsL39HA1o+CcItVP4+7lyEyvg5EwdOL1mqBGYF8yy
 gXiZpSVSI6iFCr9H46QwItINk8coMXG8Bbx/KvCvQM8zBe2f+oGXr1kQ3fpdoKz2xD0u6g6HSct
 6JxZvEVkidtqgo5RxKxgDSRowSoLh6EvLvT/4EZ+m8NQyEw6Vx1JexxzIWN6xKXMSQfBdzRhT7L
 TG1BW9mCyarX9HyCAdnadiXqa+LQ/AYY12PFG3Hxq4gvZld/5f5ccmQBpi56ixhbn9BuLIWJCRg
 w3kOaYI1ExzZqlEyOCOAX0gjy0ecyXr7nlOTS8Q14lkYOBm878LtyYn020z5IMapnBtXoS+L/x3
 MnU2JqgBJlX9BuQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13365-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[debian.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,test-bootconfig.sh:url]
X-Rspamd-Queue-Id: 29F545E7EF9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 Makefile                  |  5 +++++
 init/Kconfig              | 33 +++++++++++++++++++++++++++++++++
 lib/Makefile              | 16 ++++++++++++++++
 lib/embedded-cmdline.S    | 16 ++++++++++++++++
 tools/bootconfig/Makefile |  2 +-
 5 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index d59f703f9797..3ee259d00a9a 100644
--- a/Makefile
+++ b/Makefile
@@ -1543,6 +1543,11 @@ prepare: tools/bpf/resolve_btfids
 endif
 endif
 
+# lib/Makefile invokes tools/bootconfig to render the embedded bconf to cmdline.
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
index 000000000000..7e2e1d81af96
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
+	.section .init.rodata, "aw"
+	.global embedded_kernel_cmdline
+embedded_kernel_cmdline:
+	.incbin "lib/embedded_cmdline.bin"
+	.byte 0
+	.global embedded_kernel_cmdline_end
+embedded_kernel_cmdline_end:
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 90eb47c9d8de..4e82fd9553cd 100644
--- a/tools/bootconfig/Makefile
+++ b/tools/bootconfig/Makefile
@@ -15,7 +15,7 @@ override CFLAGS += -Wall -g -I$(CURDIR)/include
 ALL_TARGETS := bootconfig
 ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
 
-all: $(ALL_PROGRAMS) test
+all: $(ALL_PROGRAMS)
 
 $(OUTPUT)bootconfig: main.c include/linux/bootconfig.h $(LIBSRC)
 	$(CC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@

-- 
2.54.0


