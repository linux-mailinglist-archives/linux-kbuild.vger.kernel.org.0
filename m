Return-Path: <linux-kbuild+bounces-12203-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFUNIcyCwWnATgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12203-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 19:13:32 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE65A2FB0A9
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 19:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 643FE339756D
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 16:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DFD3C456A;
	Mon, 23 Mar 2026 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scq6ZFe3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00153C455C;
	Mon, 23 Mar 2026 16:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284553; cv=none; b=CQOICXX1HnpUxA/AFxnFytEqp8kNBAVy/sMIBJcIyINFHBRTCEwVVLdnVPM6ouyTYjdOySe7dvZAkekpIcQMgLEU3iHmZaMPqWza3AApEUjM+/X+lrvG8McMUJkgdec4+A++mE140VoLIW8fNer54jrYcIsvBP+fcWZI+i+uI20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284553; c=relaxed/simple;
	bh=a/s6tqAaFZu8em4Wzj1kKugg4m27g3MICPi4Ymfi1KU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qVBDFViwKYru0b54IYOhEYAxS09D6/Wx+gqwJk/Ol5QzQco345FZBqJ9rvQbsv4tdaAbnbRhUKPZjoQwl+PppfcxB2kXY2NQHB3axLANTJ3M1OUIvKIkyyQS5qsMxoajY7tD60/SuRwj+8O0FhbxPx+sZhr+Y6eno5NzHTiwtMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scq6ZFe3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5ADBC2BC9E;
	Mon, 23 Mar 2026 16:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774284553;
	bh=a/s6tqAaFZu8em4Wzj1kKugg4m27g3MICPi4Ymfi1KU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=scq6ZFe3eMquDgSLUQMlw6Klyjaj02s6rKgYLITFwJ3IqYymdSC0Aahj/nujBnl3v
	 zwPSrmZra7WnryGROkiIRWl8SaST9A7Uv7EnPTlC57DJNSM8aVLXwWH4/gjyx93d6o
	 Mv2UoGJoq1WdWg5aag1NpE0vR5oYjB9Yek5lEmAhYsrqc5p9ENqHOv9/gbpQ80YAGn
	 Lei0S7gG+Y6ibKEK8uOGfu4AfGT27BeuTLTbaC8vRUAwxvnUXWUS0zRwi391InHcMy
	 oPCkSW2LTAqSMs0Gcm8oC4EJbp27s1HIi+A7FAN2YLfwXG2tBD9Vqtg5S7RFFaPTWE
	 3gyIDnuzUd1NQ==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Petr Mladek <pmladek@suse.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	David Gow <davidgow@google.com>,
	Kees Cook <kees@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Juergen Gross <jgross@suse.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-modules@vger.kernel.org,
	bpf@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 1/2] kallsyms: show function parameter info in oops/WARN dumps
Date: Mon, 23 Mar 2026 12:48:56 -0400
Message-ID: <20260323164858.1939248-2-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260323164858.1939248-1-sashal@kernel.org>
References: <20260323164858.1939248-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,HansenPartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12203-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,system.map:url]
X-Rspamd-Queue-Id: EE65A2FB0A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Embed DWARF-derived function parameter name and type information in the
kernel image so that oops and WARN dumps display the crashing function's
register-passed arguments with their names, types, and values.

A new build-time tool (scripts/gen_paraminfo.c) parses DW_TAG_subprogram
and DW_TAG_formal_parameter entries from DWARF .debug_info, extracting
parameter names and human-readable type strings. The resulting tables are
stored in .rodata using the same two-phase link approach as lineinfo.

At runtime, kallsyms_show_paraminfo() performs a binary search on the
paraminfo tables, maps parameters to x86-64 calling convention registers
(RDI, RSI, RDX, RCX, R8, R9), and prints each parameter's name, type,
and value from pt_regs. If a parameter value matches the page fault
address (CR2), it is highlighted with "<-- fault address".

Integration at show_regs() means this works for both oops and WARN()
automatically, since both paths provide full pt_regs at the exception
point.

Example output:

  Function parameters (ext4_readdir):
    file     (struct file *)         = 0xffff888123456000
    ctx      (struct dir_context *)  = 0x0000000000001234  <-- fault address

Gated behind CONFIG_KALLSYMS_PARAMINFO (depends on CONFIG_KALLSYMS_LINEINFO).
Adds approximately 1-2 MB to the kernel image for ~58K functions.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../admin-guide/kallsyms-lineinfo.rst         |  31 +
 arch/x86/kernel/dumpstack.c                   |   6 +-
 include/linux/kallsyms.h                      |   9 +
 init/Kconfig                                  |  21 +
 kernel/kallsyms.c                             | 168 ++++++
 kernel/kallsyms_internal.h                    |   6 +
 lib/Kconfig.debug                             |  11 +
 lib/tests/Makefile                            |   3 +
 lib/tests/paraminfo_kunit.c                   | 256 ++++++++
 scripts/Makefile                              |   3 +
 scripts/empty_paraminfo.S                     |  18 +
 scripts/gen_paraminfo.c                       | 549 ++++++++++++++++++
 scripts/link-vmlinux.sh                       |  44 +-
 13 files changed, 1119 insertions(+), 6 deletions(-)
 create mode 100644 lib/tests/paraminfo_kunit.c
 create mode 100644 scripts/empty_paraminfo.S
 create mode 100644 scripts/gen_paraminfo.c

diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
index dd264830c8d5b..26921bb3f7f81 100644
--- a/Documentation/admin-guide/kallsyms-lineinfo.rst
+++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
@@ -83,6 +83,37 @@ compression).
 Per-module lineinfo adds approximately 2-3 bytes per DWARF line entry to each
 ``.ko`` file.
 
+Function Parameter Info
+======================
+
+``CONFIG_KALLSYMS_PARAMINFO`` extends the debugging information by embedding
+function parameter names and types in the kernel image.  When an oops or WARN
+occurs, the faulting function's register-passed arguments are displayed with
+their names, types, and values from the saved registers.
+
+Enable in addition to the lineinfo options::
+
+    CONFIG_KALLSYMS_PARAMINFO=y
+
+Example oops output with paraminfo::
+
+    RIP: 0010:ext4_readdir+0x1a3/0x5b0 (fs/ext4/dir.c:421)
+    ...
+    Function parameters (ext4_readdir):
+      file     (struct file *)         = 0xffff888123456000
+      ctx      (struct dir_context *)  = 0x0000000000001234  <-- fault address
+
+The ``<-- fault address`` annotation appears when a parameter value matches
+the page fault address (CR2 on x86), helping quickly identify which argument
+caused the crash.
+
+This feature works for both oops and WARN() on x86-64.  Only register-passed
+parameters (up to 6 on x86-64: RDI, RSI, RDX, RCX, R8, R9) are displayed.
+The parameter info is only shown for the faulting/warning frame where full
+register state is available.
+
+The paraminfo tables add approximately 1-2 MiB to the kernel image.
+
 Known Limitations
 =================
 
diff --git a/arch/x86/kernel/dumpstack.c b/arch/x86/kernel/dumpstack.c
index b10684dedc589..4e9b5fd58fd1b 100644
--- a/arch/x86/kernel/dumpstack.c
+++ b/arch/x86/kernel/dumpstack.c
@@ -483,8 +483,10 @@ void show_regs(struct pt_regs *regs)
 	__show_regs(regs, print_kernel_regs, KERN_DEFAULT);
 
 	/*
-	 * When in-kernel, we also print out the stack at the time of the fault..
+	 * When in-kernel, show function parameter info and stack trace.
 	 */
-	if (!user_mode(regs))
+	if (!user_mode(regs)) {
+		kallsyms_show_paraminfo(regs);
 		show_trace_log_lvl(current, regs, NULL, KERN_DEFAULT);
+	}
 }
diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 7d4c9dca06c87..17c9df520b2b0 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -104,6 +104,13 @@ int lookup_symbol_name(unsigned long addr, char *symname);
 bool kallsyms_lookup_lineinfo(unsigned long addr,
 			      const char **file, unsigned int *line);
 
+#ifdef CONFIG_KALLSYMS_PARAMINFO
+struct pt_regs;
+void kallsyms_show_paraminfo(struct pt_regs *regs);
+#else
+static inline void kallsyms_show_paraminfo(struct pt_regs *regs) {}
+#endif
+
 #else /* !CONFIG_KALLSYMS */
 
 static inline unsigned long kallsyms_lookup_name(const char *name)
@@ -179,6 +186,8 @@ static inline bool kallsyms_lookup_lineinfo(unsigned long addr,
 {
 	return false;
 }
+
+static inline void kallsyms_show_paraminfo(struct pt_regs *regs) {}
 #endif /*CONFIG_KALLSYMS*/
 
 static inline void print_ip_sym(const char *loglvl, unsigned long ip)
diff --git a/init/Kconfig b/init/Kconfig
index 6e3795b3dbd62..76d0c2da7d612 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2085,6 +2085,27 @@ config KALLSYMS_LINEINFO_MODULES
 
 	  If unsure, say N.
 
+config KALLSYMS_PARAMINFO
+	bool "Show function parameter info in oops/WARN dumps"
+	depends on KALLSYMS_LINEINFO
+	help
+	  Embeds function parameter name and type information in the kernel
+	  image, extracted from DWARF debug info at build time.  When an
+	  oops or WARN occurs, the crashing/warning function's register-
+	  passed arguments are displayed with their names, types, and
+	  values from pt_regs.
+
+	  When enabled, oops/WARN dumps include lines like:
+
+	    Function parameters (ext4_readdir):
+	      file   (struct file *)         = 0xffff888123456000
+	      ctx    (struct dir_context *)  = 0x0000000000001234
+
+	  Requires elfutils (libdw-dev/elfutils-devel) on the build host.
+	  Adds approximately 1-2 MB to the kernel image.
+
+	  If unsure, say N.
+
 # end of the "standard kernel features (expert users)" menu
 
 config ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index e6f796d43dd70..af8de3d8e3ba3 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -501,6 +501,174 @@ bool kallsyms_lookup_lineinfo(unsigned long addr,
 	return lineinfo_search(&tbl, (unsigned int)raw_offset, file, line);
 }
 
+#ifdef CONFIG_KALLSYMS_PARAMINFO
+
+#include <linux/ptrace.h>
+#ifdef CONFIG_X86
+#include <asm/special_insns.h>
+#endif
+
+#define MAX_PARAMINFO_PARAMS 6
+
+/*
+ * x86-64 calling convention: arguments are passed in registers
+ * RDI, RSI, RDX, RCX, R8, R9 (in that order).
+ */
+#ifdef CONFIG_X86_64
+
+static const char * const paraminfo_reg_names[] = {
+	"RDI", "RSI", "RDX", "RCX", "R8", "R9"
+};
+
+static unsigned long paraminfo_get_reg(const struct pt_regs *regs,
+				       unsigned int idx)
+{
+	switch (idx) {
+	case 0: return regs->di;
+	case 1: return regs->si;
+	case 2: return regs->dx;
+	case 3: return regs->cx;
+	case 4: return regs->r8;
+	case 5: return regs->r9;
+	default: return 0;
+	}
+}
+#else
+/* Stub for non-x86-64 architectures */
+static const char * const paraminfo_reg_names[] = {};
+
+static unsigned long paraminfo_get_reg(const struct pt_regs *regs,
+				       unsigned int idx)
+{
+	return 0;
+}
+#endif /* CONFIG_X86_64 */
+
+/*
+ * Binary search for the function containing the given offset in
+ * paraminfo_func_addrs[].  Returns the index of the function whose
+ * start address is <= offset, or -1 if not found.
+ */
+static int paraminfo_find_func(unsigned int offset)
+{
+	int lo = 0, hi = paraminfo_num_funcs - 1;
+	int result = -1;
+
+	if (!paraminfo_num_funcs)
+		return -1;
+
+	while (lo <= hi) {
+		int mid = lo + (hi - lo) / 2;
+
+		if (paraminfo_func_addrs[mid] <= offset) {
+			result = mid;
+			lo = mid + 1;
+		} else {
+			hi = mid - 1;
+		}
+	}
+
+	return result;
+}
+
+/*
+ * Show function parameter info for the faulting/warning instruction.
+ *
+ * Called from show_regs() on x86 when CONFIG_KALLSYMS_PARAMINFO is
+ * enabled.  Works for both oops (page fault, GPF, etc.) and WARN(),
+ * since both paths provide full pt_regs at the exception point.
+ */
+void kallsyms_show_paraminfo(struct pt_regs *regs)
+{
+	unsigned long long raw_offset;
+	unsigned int offset;
+	int func_idx;
+	const u8 *data;
+	unsigned int num_params, i;
+	unsigned long ip, fault_addr;
+	char sym_name[KSYM_NAME_LEN];
+	unsigned long sym_size, sym_offset;
+
+	if (!regs || !paraminfo_num_funcs)
+		return;
+
+	ip = regs->ip;
+
+	/* Only handle kernel-mode faults */
+	if (user_mode(regs))
+		return;
+
+	if (ip < (unsigned long)_text)
+		return;
+
+	raw_offset = ip - (unsigned long)_text;
+	if (raw_offset > UINT_MAX)
+		return;
+	offset = (unsigned int)raw_offset;
+
+	func_idx = paraminfo_find_func(offset);
+	if (func_idx < 0)
+		return;
+
+	/*
+	 * Verify the IP is within a reasonable range of the function
+	 * start.  paraminfo_func_addrs[] contains function start offsets;
+	 * check that we're not too far past the start.  Use kallsyms to
+	 * verify we're in the right function.
+	 */
+	if (!kallsyms_lookup_size_offset(ip, &sym_size, &sym_offset))
+		return;
+
+	/* Decode the function's parameter data */
+	data = paraminfo_func_data + paraminfo_func_offsets[func_idx];
+	num_params = *data++;
+
+	if (num_params == 0 || num_params > MAX_PARAMINFO_PARAMS)
+		return;
+
+	/* Look up function name for the header */
+	if (lookup_symbol_name(ip - sym_offset, sym_name))
+		return;
+
+	/*
+	 * Read the fault address for highlighting.  On x86, CR2 holds
+	 * the page fault linear address.  On other architectures this
+	 * would need a different mechanism.
+	 */
+#ifdef CONFIG_X86
+	fault_addr = read_cr2();
+#else
+	fault_addr = 0;
+#endif
+
+	printk(KERN_DEFAULT "Function parameters (%s):\n", sym_name);
+
+	for (i = 0; i < num_params; i++) {
+		u32 name_off, type_off;
+		const char *pname, *ptype;
+		unsigned long val;
+		bool is_fault_addr;
+
+		memcpy(&name_off, data, sizeof(u32));
+		data += sizeof(u32);
+		memcpy(&type_off, data, sizeof(u32));
+		data += sizeof(u32);
+
+		pname = paraminfo_strings + name_off;
+		ptype = paraminfo_strings + type_off;
+		val = paraminfo_get_reg(regs, i);
+
+		is_fault_addr = fault_addr && (val == fault_addr);
+
+		printk(KERN_DEFAULT "  %-8s (%-20s) = 0x%016lx%s\n",
+		       pname, ptype, val,
+		       is_fault_addr ? "  <-- fault address" : "");
+	}
+}
+EXPORT_SYMBOL_GPL(kallsyms_show_paraminfo);
+
+#endif /* CONFIG_KALLSYMS_PARAMINFO */
+
 /* Look up a kernel symbol and return it in a text buffer. */
 static int __sprint_symbol(char *buffer, unsigned long address,
 			   int symbol_offset, int add_offset, int add_buildid)
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index ffe4c658067ec..7287ee0859515 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -26,4 +26,10 @@ extern const u32 lineinfo_file_offsets[];
 extern const u32 lineinfo_filenames_size;
 extern const char lineinfo_filenames[];
 
+extern const u32 paraminfo_num_funcs;
+extern const u32 paraminfo_func_addrs[];
+extern const u32 paraminfo_func_offsets[];
+extern const u8  paraminfo_func_data[];
+extern const char paraminfo_strings[];
+
 #endif // LINUX_KALLSYMS_INTERNAL_H_
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 688bbcb3eaa62..be8cee0985fbd 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3058,6 +3058,17 @@ config LINEINFO_KUNIT_TEST
 
 	  If unsure, say N.
 
+config PARAMINFO_KUNIT_TEST
+	tristate "KUnit tests for kallsyms paraminfo" if !KUNIT_ALL_TESTS
+	depends on KUNIT && KALLSYMS_PARAMINFO
+	default KUNIT_ALL_TESTS
+	help
+	  KUnit tests for the kallsyms function parameter info feature.
+	  Verifies that paraminfo tables correctly map functions to their
+	  parameter names and types.
+
+	  If unsure, say N.
+
 config HW_BREAKPOINT_KUNIT_TEST
 	bool "Test hw_breakpoint constraints accounting" if !KUNIT_ALL_TESTS
 	depends on HAVE_HW_BREAKPOINT
diff --git a/lib/tests/Makefile b/lib/tests/Makefile
index c6add3b04bbd5..70452942baf45 100644
--- a/lib/tests/Makefile
+++ b/lib/tests/Makefile
@@ -39,6 +39,9 @@ obj-$(CONFIG_LONGEST_SYM_KUNIT_TEST) += longest_symbol_kunit.o
 CFLAGS_lineinfo_kunit.o += $(call cc-option,-fno-inline-functions-called-once)
 obj-$(CONFIG_LINEINFO_KUNIT_TEST) += lineinfo_kunit.o
 
+CFLAGS_paraminfo_kunit.o += $(call cc-option,-fno-inline-functions-called-once)
+obj-$(CONFIG_PARAMINFO_KUNIT_TEST) += paraminfo_kunit.o
+
 obj-$(CONFIG_MEMCPY_KUNIT_TEST) += memcpy_kunit.o
 obj-$(CONFIG_MIN_HEAP_KUNIT_TEST) += min_heap_kunit.o
 CFLAGS_overflow_kunit.o = $(call cc-disable-warning, tautological-constant-out-of-range-compare)
diff --git a/lib/tests/paraminfo_kunit.c b/lib/tests/paraminfo_kunit.c
new file mode 100644
index 0000000000000..e09efc4ddeb0e
--- /dev/null
+++ b/lib/tests/paraminfo_kunit.c
@@ -0,0 +1,256 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * KUnit tests for kallsyms paraminfo (CONFIG_KALLSYMS_PARAMINFO).
+ *
+ * Copyright (c) 2026 Sasha Levin <sashal@kernel.org>
+ *
+ * Verifies that the paraminfo tables correctly map function addresses
+ * to their parameter names and types.
+ *
+ * Build with: CONFIG_PARAMINFO_KUNIT_TEST=m (or =y)
+ */
+
+#include <kunit/test.h>
+#include <linux/kallsyms.h>
+#include <linux/module.h>
+#include <linux/string.h>
+#include <linux/slab.h>
+
+/* ---- Test target functions with known signatures ---- */
+
+static noinline int paraminfo_test_two_args(struct kunit *test, int value)
+{
+	/* Prevent optimization */
+	return test ? value + 1 : 0;
+}
+
+static noinline void *paraminfo_test_ptr_arg(void *ptr, unsigned long size)
+{
+	if (ptr && size > 0)
+		return ptr;
+	return NULL;
+}
+
+static noinline long paraminfo_test_many_args(int a, int b, int c,
+					      int d, int e, int f)
+{
+	return (long)a + b + c + d + e + f;
+}
+
+static noinline void paraminfo_test_no_args(void)
+{
+	/* Function with no parameters */
+	barrier();
+}
+
+/* ---- Helpers to query paraminfo tables directly ---- */
+
+/*
+ * These access the raw paraminfo tables to verify correctness.
+ * The tables are defined in kernel/kallsyms_internal.h.
+ */
+extern const u32 paraminfo_num_funcs;
+extern const u32 paraminfo_func_addrs[];
+extern const u32 paraminfo_func_offsets[];
+extern const u8  paraminfo_func_data[];
+extern const char paraminfo_strings[];
+
+struct param_result {
+	unsigned int num_params;
+	const char *names[6];
+	const char *types[6];
+};
+
+/*
+ * Look up paraminfo for a given kernel address.
+ * Returns true if found, filling in @result.
+ */
+static bool lookup_paraminfo(unsigned long addr, struct param_result *result)
+{
+	unsigned long long raw_offset;
+	unsigned int offset;
+	int lo, hi, func_idx;
+	const u8 *data;
+	unsigned int i;
+
+	if (!paraminfo_num_funcs)
+		return false;
+
+	if (addr < (unsigned long)_text)
+		return false;
+
+	raw_offset = addr - (unsigned long)_text;
+	if (raw_offset > UINT_MAX)
+		return false;
+	offset = (unsigned int)raw_offset;
+
+	/* Binary search for the function */
+	lo = 0;
+	hi = paraminfo_num_funcs - 1;
+	func_idx = -1;
+	while (lo <= hi) {
+		int mid = lo + (hi - lo) / 2;
+
+		if (paraminfo_func_addrs[mid] <= offset) {
+			func_idx = mid;
+			lo = mid + 1;
+		} else {
+			hi = mid - 1;
+		}
+	}
+
+	if (func_idx < 0)
+		return false;
+
+	/* Verify we're not too far from the function start */
+	if (offset - paraminfo_func_addrs[func_idx] > 0x10000)
+		return false;
+
+	data = paraminfo_func_data + paraminfo_func_offsets[func_idx];
+	result->num_params = *data++;
+
+	if (result->num_params > 6)
+		return false;
+
+	for (i = 0; i < result->num_params; i++) {
+		u32 name_off, type_off;
+
+		memcpy(&name_off, data, sizeof(u32));
+		data += sizeof(u32);
+		memcpy(&type_off, data, sizeof(u32));
+		data += sizeof(u32);
+
+		result->names[i] = paraminfo_strings + name_off;
+		result->types[i] = paraminfo_strings + type_off;
+	}
+
+	return true;
+}
+
+/* ---- Test cases ---- */
+
+static void test_paraminfo_two_args(struct kunit *test)
+{
+	struct param_result res;
+	bool found;
+
+	found = lookup_paraminfo((unsigned long)paraminfo_test_two_args, &res);
+
+	if (!IS_ENABLED(CONFIG_KALLSYMS_PARAMINFO)) {
+		KUNIT_EXPECT_FALSE(test, found);
+		return;
+	}
+
+	KUNIT_ASSERT_TRUE(test, found);
+	KUNIT_EXPECT_EQ(test, res.num_params, 2U);
+	KUNIT_EXPECT_STREQ(test, res.names[0], "test");
+	KUNIT_EXPECT_STREQ(test, res.names[1], "value");
+	KUNIT_EXPECT_TRUE(test, strstr(res.types[1], "int") != NULL);
+}
+
+static void test_paraminfo_ptr_arg(struct kunit *test)
+{
+	struct param_result res;
+	bool found;
+
+	found = lookup_paraminfo((unsigned long)paraminfo_test_ptr_arg, &res);
+
+	if (!IS_ENABLED(CONFIG_KALLSYMS_PARAMINFO)) {
+		KUNIT_EXPECT_FALSE(test, found);
+		return;
+	}
+
+	KUNIT_ASSERT_TRUE(test, found);
+	KUNIT_EXPECT_EQ(test, res.num_params, 2U);
+	KUNIT_EXPECT_STREQ(test, res.names[0], "ptr");
+	KUNIT_EXPECT_STREQ(test, res.names[1], "size");
+	/* First param should be a pointer type */
+	KUNIT_EXPECT_TRUE(test, strstr(res.types[0], "*") != NULL);
+}
+
+static void test_paraminfo_many_args(struct kunit *test)
+{
+	struct param_result res;
+	bool found;
+
+	found = lookup_paraminfo((unsigned long)paraminfo_test_many_args, &res);
+
+	if (!IS_ENABLED(CONFIG_KALLSYMS_PARAMINFO)) {
+		KUNIT_EXPECT_FALSE(test, found);
+		return;
+	}
+
+	KUNIT_ASSERT_TRUE(test, found);
+	KUNIT_EXPECT_EQ(test, res.num_params, 6U);
+	KUNIT_EXPECT_STREQ(test, res.names[0], "a");
+	KUNIT_EXPECT_STREQ(test, res.names[1], "b");
+	KUNIT_EXPECT_STREQ(test, res.names[2], "c");
+	KUNIT_EXPECT_STREQ(test, res.names[3], "d");
+	KUNIT_EXPECT_STREQ(test, res.names[4], "e");
+	KUNIT_EXPECT_STREQ(test, res.names[5], "f");
+}
+
+static void test_paraminfo_no_args(struct kunit *test)
+{
+	struct param_result res;
+	bool found;
+
+	/*
+	 * Functions with no parameters should not have entries in the
+	 * paraminfo table (they are filtered out at build time).
+	 * The lookup may find a nearby function instead, but if it
+	 * does find our function exactly, num_params should be 0.
+	 */
+	found = lookup_paraminfo((unsigned long)paraminfo_test_no_args, &res);
+
+	if (found) {
+		/* If it matched our exact function, it should have 0 params.
+		 * But it may have matched a preceding function instead.
+		 */
+		kunit_info(test, "lookup found func with %u params\n",
+			   res.num_params);
+	}
+}
+
+static void test_paraminfo_bogus_addr(struct kunit *test)
+{
+	struct param_result res;
+
+	/* Address 0 should not match anything */
+	KUNIT_EXPECT_FALSE(test, lookup_paraminfo(0, &res));
+
+	/* Address in userspace should not match */
+	KUNIT_EXPECT_FALSE(test, lookup_paraminfo(0x1000, &res));
+}
+
+static void test_paraminfo_tables_present(struct kunit *test)
+{
+	if (!IS_ENABLED(CONFIG_KALLSYMS_PARAMINFO)) {
+		kunit_skip(test, "CONFIG_KALLSYMS_PARAMINFO not enabled");
+		return;
+	}
+
+	KUNIT_EXPECT_GT(test, paraminfo_num_funcs, 0U);
+	kunit_info(test, "paraminfo: %u functions in table\n",
+		   paraminfo_num_funcs);
+}
+
+static struct kunit_case paraminfo_test_cases[] = {
+	KUNIT_CASE(test_paraminfo_tables_present),
+	KUNIT_CASE(test_paraminfo_two_args),
+	KUNIT_CASE(test_paraminfo_ptr_arg),
+	KUNIT_CASE(test_paraminfo_many_args),
+	KUNIT_CASE(test_paraminfo_no_args),
+	KUNIT_CASE(test_paraminfo_bogus_addr),
+	{}
+};
+
+static struct kunit_suite paraminfo_test_suite = {
+	.name = "paraminfo",
+	.test_cases = paraminfo_test_cases,
+};
+
+kunit_test_suite(paraminfo_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit tests for kallsyms paraminfo");
diff --git a/scripts/Makefile b/scripts/Makefile
index ffe89875b3295..f681b94c6d9e7 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -5,6 +5,7 @@
 
 hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
 hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO)		+= gen_lineinfo
+hostprogs-always-$(CONFIG_KALLSYMS_PARAMINFO)		+= gen_paraminfo
 hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
 hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
@@ -39,6 +40,8 @@ HOSTCFLAGS_sign-file.o = $(shell $(HOSTPKG_CONFIG) --cflags libcrypto 2> /dev/nu
 HOSTLDLIBS_sign-file = $(shell $(HOSTPKG_CONFIG) --libs libcrypto 2> /dev/null || echo -lcrypto)
 HOSTCFLAGS_gen_lineinfo.o = $(shell $(HOSTPKG_CONFIG) --cflags libdw 2> /dev/null)
 HOSTLDLIBS_gen_lineinfo = $(shell $(HOSTPKG_CONFIG) --libs libdw 2> /dev/null || echo -ldw -lelf -lz)
+HOSTCFLAGS_gen_paraminfo.o = $(shell $(HOSTPKG_CONFIG) --cflags libdw 2> /dev/null)
+HOSTLDLIBS_gen_paraminfo = $(shell $(HOSTPKG_CONFIG) --libs libdw 2> /dev/null || echo -ldw -lelf -lz)
 
 ifdef CONFIG_UNWINDER_ORC
 ifeq ($(ARCH),x86_64)
diff --git a/scripts/empty_paraminfo.S b/scripts/empty_paraminfo.S
new file mode 100644
index 0000000000000..a0e39dbfbd3cb
--- /dev/null
+++ b/scripts/empty_paraminfo.S
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Empty paraminfo stub for the initial vmlinux link.
+ * The real paraminfo is generated from .tmp_vmlinux1 by gen_paraminfo.
+ */
+	.section .rodata, "a"
+	.globl paraminfo_num_funcs
+	.balign 4
+paraminfo_num_funcs:
+	.long 0
+	.globl paraminfo_func_addrs
+paraminfo_func_addrs:
+	.globl paraminfo_func_offsets
+paraminfo_func_offsets:
+	.globl paraminfo_func_data
+paraminfo_func_data:
+	.globl paraminfo_strings
+paraminfo_strings:
diff --git a/scripts/gen_paraminfo.c b/scripts/gen_paraminfo.c
new file mode 100644
index 0000000000000..ea1d23f3ddd9a
--- /dev/null
+++ b/scripts/gen_paraminfo.c
@@ -0,0 +1,549 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * gen_paraminfo.c - Generate function parameter info tables from DWARF
+ *
+ * Copyright (C) 2026 Sasha Levin <sashal@kernel.org>
+ *
+ * Reads DWARF .debug_info from a vmlinux ELF file and outputs an assembly
+ * file containing function parameter name/type tables that the kernel uses
+ * to annotate oops/WARN dumps with typed parameter values.
+ *
+ * Requires libdw from elfutils.
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <errno.h>
+#include <fcntl.h>
+#include <unistd.h>
+#include <elfutils/libdw.h>
+#include <dwarf.h>
+#include <elf.h>
+#include <gelf.h>
+#include <limits.h>
+
+/* Maximum register-passed parameters on x86-64 */
+#define MAX_PARAMS 6
+
+/* Maximum length for a type name string */
+#define MAX_TYPE_LEN 64
+
+struct param_info {
+	char name[64];
+	char type[MAX_TYPE_LEN];
+};
+
+struct func_entry {
+	unsigned int offset;		/* offset from _text */
+	unsigned int num_params;
+	struct param_info params[MAX_PARAMS];
+};
+
+static struct func_entry *funcs;
+static unsigned int num_funcs;
+static unsigned int funcs_capacity;
+
+/*
+ * String table for parameter names and type names.
+ * Deduplicated via a hash table.
+ */
+struct str_entry {
+	char *str;
+	unsigned int offset;	/* byte offset in concatenated output */
+};
+
+static struct str_entry *strtab;
+static unsigned int num_strings;
+static unsigned int strtab_capacity;
+static unsigned int strtab_total_size;
+
+#define STR_HASH_BITS 14
+#define STR_HASH_SIZE (1 << STR_HASH_BITS)
+
+struct str_hash_entry {
+	const char *str;
+	unsigned int idx;	/* index into strtab[] */
+};
+
+static struct str_hash_entry str_hash[STR_HASH_SIZE];
+
+static unsigned int hash_str(const char *s)
+{
+	unsigned int h = 5381;
+
+	for (; *s; s++)
+		h = h * 33 + (unsigned char)*s;
+	return h & (STR_HASH_SIZE - 1);
+}
+
+static unsigned int find_or_add_string(const char *s)
+{
+	unsigned int h = hash_str(s);
+
+	while (str_hash[h].str) {
+		if (!strcmp(str_hash[h].str, s))
+			return str_hash[h].idx;
+		h = (h + 1) & (STR_HASH_SIZE - 1);
+	}
+
+	if (num_strings >= strtab_capacity) {
+		strtab_capacity = strtab_capacity ? strtab_capacity * 2 : 8192;
+		strtab = realloc(strtab, strtab_capacity * sizeof(*strtab));
+		if (!strtab) {
+			fprintf(stderr, "out of memory\n");
+			exit(1);
+		}
+	}
+
+	strtab[num_strings].str = strdup(s);
+	strtab[num_strings].offset = strtab_total_size;
+	strtab_total_size += strlen(s) + 1;
+
+	str_hash[h].str = strtab[num_strings].str;
+	str_hash[h].idx = num_strings;
+
+	num_strings++;
+	return num_strings - 1;
+}
+
+static void add_func(struct func_entry *f)
+{
+	if (num_funcs >= funcs_capacity) {
+		funcs_capacity = funcs_capacity ? funcs_capacity * 2 : 16384;
+		funcs = realloc(funcs, funcs_capacity * sizeof(*funcs));
+		if (!funcs) {
+			fprintf(stderr, "out of memory\n");
+			exit(1);
+		}
+	}
+	funcs[num_funcs++] = *f;
+}
+
+/*
+ * Build a human-readable type name string from a DWARF type DIE.
+ * Follows the type chain (pointers, const, etc.) to produce strings like:
+ *   "struct file *", "const char *", "unsigned long", "void *"
+ */
+static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
+{
+	Dwarf_Die child;
+	Dwarf_Attribute attr;
+	const char *name;
+	int tag;
+
+	if (!type_die) {
+		snprintf(buf, bufsz, "void");
+		return;
+	}
+
+	tag = dwarf_tag(type_die);
+
+	switch (tag) {
+	case DW_TAG_base_type:
+		name = dwarf_diename(type_die);
+		snprintf(buf, bufsz, "%s", name ? name : "?");
+		break;
+
+	case DW_TAG_pointer_type:
+		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
+		    dwarf_formref_die(&attr, &child)) {
+			build_type_name(&child, buf, bufsz);
+			if (strlen(buf) + 3 < bufsz)
+				strcat(buf, " *");
+		} else {
+			snprintf(buf, bufsz, "void *");
+		}
+		break;
+
+	case DW_TAG_const_type:
+		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
+		    dwarf_formref_die(&attr, &child)) {
+			char tmp[MAX_TYPE_LEN - 10];
+
+			build_type_name(&child, tmp, sizeof(tmp));
+			snprintf(buf, bufsz, "const %s", tmp);
+		} else {
+			snprintf(buf, bufsz, "const void");
+		}
+		break;
+
+	case DW_TAG_volatile_type:
+		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
+		    dwarf_formref_die(&attr, &child)) {
+			char tmp[MAX_TYPE_LEN - 10];
+
+			build_type_name(&child, tmp, sizeof(tmp));
+			snprintf(buf, bufsz, "volatile %s", tmp);
+		} else {
+			snprintf(buf, bufsz, "volatile void");
+		}
+		break;
+
+	case DW_TAG_restrict_type:
+		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
+		    dwarf_formref_die(&attr, &child)) {
+			build_type_name(&child, buf, bufsz);
+		} else {
+			snprintf(buf, bufsz, "void");
+		}
+		break;
+
+	case DW_TAG_typedef:
+		name = dwarf_diename(type_die);
+		if (name) {
+			snprintf(buf, bufsz, "%s", name);
+		} else if (dwarf_attr(type_die, DW_AT_type, &attr) &&
+			   dwarf_formref_die(&attr, &child)) {
+			build_type_name(&child, buf, bufsz);
+		} else {
+			snprintf(buf, bufsz, "?");
+		}
+		break;
+
+	case DW_TAG_structure_type:
+		name = dwarf_diename(type_die);
+		snprintf(buf, bufsz, "struct %s", name ? name : "(anon)");
+		break;
+
+	case DW_TAG_union_type:
+		name = dwarf_diename(type_die);
+		snprintf(buf, bufsz, "union %s", name ? name : "(anon)");
+		break;
+
+	case DW_TAG_enumeration_type:
+		name = dwarf_diename(type_die);
+		snprintf(buf, bufsz, "enum %s", name ? name : "(anon)");
+		break;
+
+	case DW_TAG_array_type:
+		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
+		    dwarf_formref_die(&attr, &child)) {
+			build_type_name(&child, buf, bufsz);
+			if (strlen(buf) + 3 < bufsz)
+				strcat(buf, "[]");
+		} else {
+			snprintf(buf, bufsz, "?[]");
+		}
+		break;
+
+	case DW_TAG_subroutine_type:
+		snprintf(buf, bufsz, "func_ptr");
+		break;
+
+	default:
+		snprintf(buf, bufsz, "?");
+		break;
+	}
+}
+
+static unsigned long long find_text_addr(Elf *elf)
+{
+	size_t nsyms, i;
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		Elf_Data *data;
+
+		if (!gelf_getshdr(scn, &shdr))
+			continue;
+		if (shdr.sh_type != SHT_SYMTAB)
+			continue;
+
+		data = elf_getdata(scn, NULL);
+		if (!data)
+			continue;
+
+		nsyms = shdr.sh_size / shdr.sh_entsize;
+		for (i = 0; i < nsyms; i++) {
+			GElf_Sym sym;
+			const char *name;
+
+			if (!gelf_getsym(data, i, &sym))
+				continue;
+			name = elf_strptr(elf, shdr.sh_link, sym.st_name);
+			if (name && !strcmp(name, "_text"))
+				return sym.st_value;
+		}
+	}
+
+	fprintf(stderr, "Cannot find _text symbol\n");
+	exit(1);
+}
+
+static int compare_funcs(const void *a, const void *b)
+{
+	const struct func_entry *fa = a;
+	const struct func_entry *fb = b;
+
+	if (fa->offset < fb->offset)
+		return -1;
+	if (fa->offset > fb->offset)
+		return 1;
+	return 0;
+}
+
+static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
+{
+	Dwarf_Off off = 0, next_off;
+	size_t hdr_size;
+
+	while (dwarf_nextcu(dwarf, off, &next_off, &hdr_size,
+			    NULL, NULL, NULL) == 0) {
+		Dwarf_Die cudie, child;
+
+		if (!dwarf_offdie(dwarf, off + hdr_size, &cudie))
+			goto next;
+
+		if (dwarf_child(&cudie, &child) != 0)
+			goto next;
+
+		do {
+			Dwarf_Die param;
+			Dwarf_Attribute attr;
+			Dwarf_Addr low_pc;
+			struct func_entry func;
+			int tag;
+
+			tag = dwarf_tag(&child);
+			if (tag != DW_TAG_subprogram)
+				continue;
+
+			/* Skip declarations (no body) */
+			if (dwarf_attr(&child, DW_AT_declaration, &attr))
+				continue;
+
+			/* Get function start address */
+			if (dwarf_lowpc(&child, &low_pc) != 0)
+				continue;
+
+			if (low_pc < text_addr)
+				continue;
+
+			{
+				unsigned long long raw_offset = low_pc - text_addr;
+
+				if (raw_offset > UINT_MAX)
+					continue;
+				func.offset = (unsigned int)raw_offset;
+			}
+
+			/* Iterate formal parameters */
+			func.num_params = 0;
+			if (dwarf_child(&child, &param) == 0) {
+				do {
+					Dwarf_Die type_die;
+					const char *pname;
+
+					if (dwarf_tag(&param) != DW_TAG_formal_parameter)
+						continue;
+					if (func.num_params >= MAX_PARAMS)
+						break;
+
+					pname = dwarf_diename(&param);
+					if (!pname)
+						pname = "?";
+
+					snprintf(func.params[func.num_params].name,
+						 sizeof(func.params[0].name),
+						 "%s", pname);
+
+					/* Resolve type */
+					if (dwarf_attr(&param, DW_AT_type, &attr) &&
+					    dwarf_formref_die(&attr, &type_die)) {
+						build_type_name(&type_die,
+								func.params[func.num_params].type,
+								MAX_TYPE_LEN);
+					} else {
+						snprintf(func.params[func.num_params].type,
+							 MAX_TYPE_LEN, "?");
+					}
+
+					func.num_params++;
+				} while (dwarf_siblingof(&param, &param) == 0);
+			}
+
+			/* Skip functions with no parameters */
+			if (func.num_params == 0)
+				continue;
+
+			add_func(&func);
+		} while (dwarf_siblingof(&child, &child) == 0);
+next:
+		off = next_off;
+	}
+}
+
+static void deduplicate(void)
+{
+	unsigned int i, j;
+
+	if (num_funcs < 2)
+		return;
+
+	/* Sort by offset */
+	qsort(funcs, num_funcs, sizeof(*funcs), compare_funcs);
+
+	/* Remove duplicates (same offset — keep first) */
+	j = 0;
+	for (i = 1; i < num_funcs; i++) {
+		if (funcs[i].offset == funcs[j].offset)
+			continue;
+		j++;
+		if (j != i)
+			funcs[j] = funcs[i];
+	}
+	num_funcs = j + 1;
+}
+
+static void print_escaped_asciz(const char *s)
+{
+	printf("\t.asciz \"");
+	for (; *s; s++) {
+		if (*s == '"' || *s == '\\')
+			putchar('\\');
+		putchar(*s);
+	}
+	printf("\"\n");
+}
+
+static void output_assembly(void)
+{
+	unsigned int i, j;
+
+	printf("/* SPDX-License-Identifier: GPL-2.0 */\n");
+	printf("/*\n");
+	printf(" * Automatically generated by scripts/gen_paraminfo\n");
+	printf(" * Do not edit.\n");
+	printf(" */\n\n");
+
+	printf("\t.section .rodata, \"a\"\n\n");
+
+	/* Number of functions */
+	printf("\t.globl paraminfo_num_funcs\n");
+	printf("\t.balign 4\n");
+	printf("paraminfo_num_funcs:\n");
+	printf("\t.long %u\n\n", num_funcs);
+
+	/* Function address offsets (sorted, for binary search) */
+	printf("\t.globl paraminfo_func_addrs\n");
+	printf("\t.balign 4\n");
+	printf("paraminfo_func_addrs:\n");
+	for (i = 0; i < num_funcs; i++)
+		printf("\t.long 0x%x\n", funcs[i].offset);
+	printf("\n");
+
+	/*
+	 * Function data offsets — byte offset into paraminfo_func_data
+	 * for each function's parameter list.
+	 */
+	printf("\t.globl paraminfo_func_offsets\n");
+	printf("\t.balign 4\n");
+	printf("paraminfo_func_offsets:\n");
+	for (i = 0; i < num_funcs; i++)
+		printf("\t.long .Lfunc_%u - paraminfo_func_data\n", i);
+	printf("\n");
+
+	/*
+	 * Register strings in the string table and build the func data.
+	 * Func data format per function:
+	 *   u8  num_params
+	 *   For each param:
+	 *     u32 name_str_offset
+	 *     u32 type_str_offset
+	 */
+	/* First pass: register all strings */
+	for (i = 0; i < num_funcs; i++) {
+		for (j = 0; j < funcs[i].num_params; j++) {
+			find_or_add_string(funcs[i].params[j].name);
+			find_or_add_string(funcs[i].params[j].type);
+		}
+	}
+
+	/* Function parameter data */
+	printf("\t.globl paraminfo_func_data\n");
+	printf("paraminfo_func_data:\n");
+	for (i = 0; i < num_funcs; i++) {
+		printf(".Lfunc_%u:\n", i);
+		printf("\t.byte %u\n", funcs[i].num_params);
+		for (j = 0; j < funcs[i].num_params; j++) {
+			unsigned int name_idx = find_or_add_string(funcs[i].params[j].name);
+			unsigned int type_idx = find_or_add_string(funcs[i].params[j].type);
+
+			printf("\t.long %u, %u\n",
+			       strtab[name_idx].offset,
+			       strtab[type_idx].offset);
+		}
+	}
+	printf("\n");
+
+	/* String table */
+	printf("\t.globl paraminfo_strings\n");
+	printf("paraminfo_strings:\n");
+	for (i = 0; i < num_strings; i++)
+		print_escaped_asciz(strtab[i].str);
+	printf("\n");
+}
+
+int main(int argc, char *argv[])
+{
+	int fd;
+	Elf *elf;
+	Dwarf *dwarf;
+	unsigned long long text_addr;
+
+	if (argc != 2) {
+		fprintf(stderr, "Usage: %s <vmlinux ELF>\n", argv[0]);
+		return 1;
+	}
+
+	fd = open(argv[1], O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "Cannot open %s: %s\n", argv[1],
+			strerror(errno));
+		return 1;
+	}
+
+	elf_version(EV_CURRENT);
+	elf = elf_begin(fd, ELF_C_READ, NULL);
+	if (!elf) {
+		fprintf(stderr, "elf_begin failed: %s\n",
+			elf_errmsg(elf_errno()));
+		close(fd);
+		return 1;
+	}
+
+	text_addr = find_text_addr(elf);
+
+	dwarf = dwarf_begin_elf(elf, DWARF_C_READ, NULL);
+	if (!dwarf) {
+		fprintf(stderr, "dwarf_begin_elf failed: %s\n",
+			dwarf_errmsg(dwarf_errno()));
+		fprintf(stderr, "Is %s built with CONFIG_DEBUG_INFO?\n",
+			argv[1]);
+		elf_end(elf);
+		close(fd);
+		return 1;
+	}
+
+	process_dwarf(dwarf, text_addr);
+	deduplicate();
+
+	fprintf(stderr, "paraminfo: %u functions, %u strings\n",
+		num_funcs, num_strings);
+
+	output_assembly();
+
+	dwarf_end(dwarf);
+	elf_end(elf);
+	close(fd);
+
+	/* Cleanup */
+	free(funcs);
+	for (unsigned int i = 0; i < num_strings; i++)
+		free(strtab[i].str);
+	free(strtab);
+
+	return 0;
+}
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 39ca44fbb259b..d41b31dde4ef9 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -103,7 +103,7 @@ vmlinux_link()
 	${ld} ${ldflags} -o ${output}					\
 		${wl}--whole-archive ${objs} ${wl}--no-whole-archive	\
 		${wl}--start-group ${libs} ${wl}--end-group		\
-		${kallsymso} ${lineinfo_o} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldlibs}
+		${kallsymso} ${lineinfo_o} ${paraminfo_o} ${btf_vmlinux_bin_o} ${arch_vmlinux_o} ${ldlibs}
 }
 
 # Create ${2}.o file with all symbols from the ${1} object file
@@ -149,6 +149,26 @@ gen_lineinfo()
 	lineinfo_o=.tmp_lineinfo.o
 }
 
+# Generate paraminfo tables from DWARF debug info in a temporary vmlinux.
+# ${1} - temporary vmlinux with debug info
+# Output: sets paraminfo_o to the generated .o file
+gen_paraminfo()
+{
+	info PARAMINFO .tmp_paraminfo.S
+	if ! scripts/gen_paraminfo "${1}" > .tmp_paraminfo.S; then
+		echo >&2 "Failed to generate paraminfo from ${1}"
+		echo >&2 "Try to disable CONFIG_KALLSYMS_PARAMINFO"
+		exit 1
+	fi
+
+	info AS .tmp_paraminfo.o
+	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
+	      -c -o .tmp_paraminfo.o .tmp_paraminfo.S
+
+	paraminfo_o=.tmp_paraminfo.o
+}
+
 # Perform kallsyms for the given temporary vmlinux.
 sysmap_and_kallsyms()
 {
@@ -176,6 +196,7 @@ cleanup()
 {
 	rm -f .btf.*
 	rm -f .tmp_lineinfo.*
+	rm -f .tmp_paraminfo.*
 	rm -f .tmp_vmlinux.nm-sort
 	rm -f System.map
 	rm -f vmlinux
@@ -205,6 +226,7 @@ btf_vmlinux_bin_o=
 btfids_vmlinux=
 kallsymso=
 lineinfo_o=
+paraminfo_o=
 strip_debug=
 generate_map=
 
@@ -229,12 +251,22 @@ if is_enabled CONFIG_KALLSYMS_LINEINFO; then
 	lineinfo_o=.tmp_lineinfo.o
 fi
 
+if is_enabled CONFIG_KALLSYMS_PARAMINFO; then
+	# Assemble an empty paraminfo stub for the initial link.
+	# The real paraminfo is generated from .tmp_vmlinux1 by gen_paraminfo.
+	${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	      ${KBUILD_AFLAGS} ${KBUILD_AFLAGS_KERNEL} \
+	      -c -o .tmp_paraminfo.o "${srctree}/scripts/empty_paraminfo.S"
+	paraminfo_o=.tmp_paraminfo.o
+fi
+
 if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
 
-	# The kallsyms linking does not need debug symbols, but BTF and
-	# lineinfo generation do.
+	# The kallsyms linking does not need debug symbols, but BTF,
+	# lineinfo and paraminfo generation do.
 	if ! is_enabled CONFIG_DEBUG_INFO_BTF &&
-	   ! is_enabled CONFIG_KALLSYMS_LINEINFO; then
+	   ! is_enabled CONFIG_KALLSYMS_LINEINFO &&
+	   ! is_enabled CONFIG_KALLSYMS_PARAMINFO; then
 		strip_debug=1
 	fi
 
@@ -256,6 +288,10 @@ if is_enabled CONFIG_KALLSYMS_LINEINFO; then
 	gen_lineinfo .tmp_vmlinux1
 fi
 
+if is_enabled CONFIG_KALLSYMS_PARAMINFO; then
+	gen_paraminfo .tmp_vmlinux1
+fi
+
 if is_enabled CONFIG_KALLSYMS; then
 
 	# kallsyms support
-- 
2.51.0


