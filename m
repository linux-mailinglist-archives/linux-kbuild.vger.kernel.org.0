Return-Path: <linux-kbuild+bounces-13790-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id syjMIk2GMmrv1QUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13790-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:34:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC076991E9
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:34:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=debian.org header.s=smtpauto.stravinsky header.b=ixcaUS3R;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13790-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13790-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=debian.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 952C532FEA31
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 11:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 257F43F58E0;
	Wed, 17 Jun 2026 11:24:13 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA8A3E274D;
	Wed, 17 Jun 2026 11:24:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781695452; cv=none; b=VJ66STxEilaMaNPFxjRFnU4Yrm/oqyrgsN5YjuEG3TtRYTLLDxgrvbsFSzYJDm0vnyVqlK1Sl6N+Iwe7qQo+wuGH2hBlUhoR+zVQnu+fHG4qlF6hoVr8h8jwp+xnDVQmPdMM+WIgnO2sxVQz2+607ioHYaoHUU4a4qp9XR9phpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781695452; c=relaxed/simple;
	bh=kC3KRNXiWL9BxmJo6Ya+0nh91luepuocqQ2vQETBwj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcP/ToPoMtpJPby0+YIJZ2IOXXgKrr00eNWCpprxEpnPecRQPy/q0xvWLR3OZ/8ZjSl+7paqIDMFOfohEmmQIoY6FzlRZkZqWqL2CWu5zAMkz8E7HSpg2TDu8sqnVHXwGFY3upE/ByWE1snM1vH5yt06lPEPJjYvGuTQySz+Etk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=ixcaUS3R; arc=none smtp.client-ip=82.195.75.108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description;
	bh=JpuMov6TmrVvt4fyTkVjKRr5HaD6/d88xqTa0GulVHU=; b=ixcaUS3Rm9o6kM3ABT3cxrTFJp
	OIlafGgCdaTqW2OQSBF7hY7GazL7+BppBuk21qwaLCLYY7hrbmn2j4QVUhK9ulkiK4IdDEfDHWJNP
	kppXyRLd5vyN9/AXU4PQ6k9fBr8tjaIwjlkGypmY3fq6xS/wRvzh85uZmUEFOidm7XweGEN6+3FJT
	erQt425hOsbwApuo0oRMahDyWdVQmAEgG5AloHp26AWD8pOlTEvRVg/jZ4HHhzIRP17BMWljhtw6q
	IVrYWEo21EvpecPHBNGZQmcQP5qMFHnfvcUNEDpK5nhXDLScz3rFrVdg2crIoQNrdHqu2Zo32Difm
	93cY4qNA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wZoNE-00EaFl-0b;
	Wed, 17 Jun 2026 11:24:00 +0000
From: Breno Leitao <leitao@debian.org>
Date: Wed, 17 Jun 2026 04:23:35 -0700
Subject: [PATCH v5 3/7] bootconfig: render embedded bootconfig as a kernel
 cmdline at build time
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-bootconfig_using_tools-v5-3-fd589a9cc5e3@debian.org>
References: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
In-Reply-To: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9499; i=leitao@debian.org;
 h=from:subject:message-id; bh=kC3KRNXiWL9BxmJo6Ya+0nh91luepuocqQ2vQETBwj0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqMoO7d+MofSj1S3jQYjikCiffIFgb6T/jYUTTF
 1sbpqq/2TCJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCajKDuwAKCRA1o5Of/Hh3
 bf82D/9Vz7kaYoSuOVSv+80pPA4jAzHnN2U0PfvesO91NI5PcrM9BjuzyReiq+ZrBDwioxZFYpX
 KpwGpXrFSfR4OQto/k+6ziZo0N/nLnWvbzMRL8euTQKjNjpBSJDLiI5IPkaUYbei1Q3fCHSzKaz
 9MxM9KBorcOuZjyh1ZtoIcKbiT9EWs8mkJTYGTrKODjelD+qpbGgIVdWXEv66+nbO9pa35Wr1h5
 xfWvbH3HkkL/UjLjj7FmOnOUNXMeT/AaKKRS38fBTtFQrG2CdyyAgHs/FNd8sbO0nJkymVCxAm6
 VlsIxm4VmxMNoXGTIFmLWM8rAnFMi7HQZX/Wk7cMM+HwAJ4NOMkbXdjUerjirr334CcvThPxbFz
 U/FGH5QtW8Q9RaWPsCdWKp1Oc8deo9k7pHOQoABPkmHtoTPhb6DPNuqsHGm5AkwQvQWu4fYspd8
 z2e2i8+WasJPi1boTPNdQPgLnLfsHtBx4QvtoYMTK5bBL+Mz6cun8etnhynqoR0F0czXQ2WsqeF
 QQoZ+ESma7YccuDuDF21n0x4rkj1Mpw/kRyPkT1ePNtXkfxV/EP8qakVVPCJy0Vbdsv/c4TWNp/
 JDtQ17csIaRJRBgqb81jWx0Chuy+1JwEVozNl0Y2gWsft6ZwXAQ0vQ7xYOwxk6EuTq9HFl6iVY3
 DyucthIWzFlJhuA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[debian.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[debian.org:s=smtpauto.stravinsky];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:leitao@debian.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-13790-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leitao@debian.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[debian.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DDC076991E9

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

tools/bootconfig also installs on target systems, so its own Makefile
keeps $(CC) and stays cross-buildable as a standalone tool. The kernel
build, which runs the tool on the build host during prepare, instead
forces CC=$(HOSTCC) from a dedicated tools/bootconfig rule and clears
CROSS_COMPILE= in the sub-make. Without that clear, an LLVM=1 cross
build would inherit CROSS_COMPILE and tools/scripts/Makefile.include
would inject --target=/--sysroot= flags into the host clang invocation,
producing a target binary that fails to exec ("Exec format error").

embedded-cmdline.S places the rendered string in its own .init.rodata
subsection (.init.rodata.embed_cmdline) with the "a" (allocatable,
read-only) flag and %progbits. lib/bootconfig-data.S already places
the embedded bootconfig blob in .init.rodata with the "aw" flag
(xbc_init() rewrites separators in place, so that data must be
writable). Using a distinct subsection name avoids the ld.lld section-
type mismatch that would otherwise arise from mixing "a" and "aw"
under the same name; the linker's "*(.init.rodata .init.rodata.*)"
glob still folds both into the init image and frees them after boot.

A follow-up patch wires the build-time tools/bootconfig into the
top-level clean target.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 MAINTAINERS               |  1 +
 Makefile                  | 15 +++++++++++++++
 init/Kconfig              | 35 +++++++++++++++++++++++++++++++++++
 lib/Makefile              | 16 ++++++++++++++++
 lib/embedded-cmdline.S    | 16 ++++++++++++++++
 tools/bootconfig/Makefile |  2 +-
 6 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 57656ec0e9d5d..953231df1911d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9844,6 +9844,7 @@ F:	fs/proc/bootconfig.c
 F:	include/linux/bootconfig.h
 F:	lib/bootconfig-data.S
 F:	lib/bootconfig.c
+F:	lib/embedded-cmdline.S
 F:	tools/bootconfig/*
 F:	tools/bootconfig/scripts/*
 
diff --git a/Makefile b/Makefile
index bf196c6df5b92..a7abb3f9a6264 100644
--- a/Makefile
+++ b/Makefile
@@ -1545,6 +1545,21 @@ prepare: tools/bpf/resolve_btfids
 endif
 endif
 
+# tools/bootconfig renders the embedded bootconfig into a cmdline at build time.
+ifdef CONFIG_BOOT_CONFIG_EMBED_CMDLINE
+prepare: tools/bootconfig
+endif
+
+# tools/bootconfig is run on the build host during prepare, so force a host
+# binary here; its own Makefile keeps $(CC) for standalone and cross builds.
+# CROSS_COMPILE= is cleared so tools/scripts/Makefile.include does not inject
+# the target's --target=/--sysroot= flags into the host clang invocation under
+# LLVM=1 cross builds (which would produce a target binary that fails to exec).
+tools/bootconfig: FORCE
+	$(Q)mkdir -p $(objtree)/tools
+	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ \
+		bootconfig CC=$(HOSTCC) CROSS_COMPILE=
+
 # The tools build system is not a part of Kbuild and tends to introduce
 # its own unique issues. If you need to integrate a new tool into Kbuild,
 # please consider locating that tool outside the tools/ tree and using the
diff --git a/init/Kconfig b/init/Kconfig
index 5230d4879b1c8..d2b8613a6b927 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -1566,6 +1566,41 @@ config BOOT_CONFIG_EMBED_FILE
 	  This bootconfig will be used if there is no initrd or no other
 	  bootconfig in the initrd.
 
+config ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
+	bool
+	help
+	  Silent symbol; no C code reads it directly. Architectures
+	  select it once their setup_arch() calls
+	  xbc_prepend_embedded_cmdline() before parse_early_param().
+	  Its only role is to gate the user-visible
+	  BOOT_CONFIG_EMBED_CMDLINE option per-arch, the same
+	  ARCH_SUPPORTS_* idiom used by ARCH_SUPPORTS_CFI, etc.
+
+config BOOT_CONFIG_EMBED_CMDLINE
+	bool "Render embedded bootconfig as kernel cmdline at build time"
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
index 7f75cc6edf94a..4ace86a5cb6de 100644
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
index 0000000000000..bda81b4a42bea
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
+	.section .init.rodata.embed_cmdline, "a", %progbits
+	.global embedded_kernel_cmdline
+embedded_kernel_cmdline:
+	.incbin "lib/embedded_cmdline.bin"
+	.byte 0
+	.global embedded_kernel_cmdline_end
+embedded_kernel_cmdline_end:
diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
index 90eb47c9d8de6..4e82fd9553cde 100644
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
2.53.0-Meta


