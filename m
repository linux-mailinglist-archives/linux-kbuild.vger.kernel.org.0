Return-Path: <linux-kbuild+bounces-12204-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIyWO0l8wWknTgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12204-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:45:46 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E88D2FA5D8
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 18:45:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4F5DF31F0032
	for <lists+linux-kbuild@lfdr.de>; Mon, 23 Mar 2026 16:49:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8473AF650;
	Mon, 23 Mar 2026 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaY8Iiiv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A4A239562;
	Mon, 23 Mar 2026 16:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774284556; cv=none; b=N9o5ok8jiu0mGh7fSUK/stql/SxexTgjVK/cT8rtf9bjFItCsHWWhPVJ/FUjc+kYAjfVmAd28zzl3+scgMzVfohJ9C2Dr9yXWAn3vAS2LA1Sol718e6qkZlKLad1ruYD5tC+6KdA11O4KIxfsMT62RwLg40ugFfZP5uspITJkvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774284556; c=relaxed/simple;
	bh=njd/QwMY3ayyzRe5w9/7/YsNuM82atmxNDcwjCeKTZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fx2BhP5JGBvni5G3PKeMg/0HHIyxjgKPTzr9UCg6MDiLbiJygeGUZ4Rqf2duMjkRRf6/oSuZDueetn3aGelcKhPFdCSyk7rJ+T4E8zpMP+DsoNX53j8zHfGF1+uROemVFQeeM/uJPIOzQuqxpDWs2jqoe8GphN2zlEEvzGIBfpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaY8Iiiv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B62C2BCB0;
	Mon, 23 Mar 2026 16:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774284556;
	bh=njd/QwMY3ayyzRe5w9/7/YsNuM82atmxNDcwjCeKTZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qaY8Iiivd3eFWq3kXZP5+JTlRX9ASd+Li4eh7WaPLWqINgxrqQa9u+tXynE8xeXQn
	 KRVh9xM9+fPTaItjDx7hvH6W2RINOUCp397S1g6T30+fiN6TzLU2Zhni/CeWzy6lsB
	 N89V8ULxZbJInGfk+aM7Iw+3+m+63ssIlTuXTeHvhWfqpkXU07bls/ykXPdSAa9/r3
	 cbFeq2Tt5/mn6jZr6PENrmdk+YwXpCz3L8K4a0ULqkFt0Pi/fS8d0u9NGwZfOinIJu
	 10pjikJVbA3FDeZSdxlDRQEngNA2zB8Ao8Mh6kFE32qY213tQHxHRnN7ZR+Gqw2nHV
	 pY+R0pi39U8fQ==
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
Subject: [PATCH 2/2] kallsyms: add BTF-based deep parameter rendering in oops dumps
Date: Mon, 23 Mar 2026 12:48:57 -0400
Message-ID: <20260323164858.1939248-3-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,suse.com,lwn.net,google.com,linuxfoundation.org,goodmis.org,gmx.de,linux-m68k.org,HansenPartnership.com,gmail.com,ideasonboard.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12204-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3E88D2FA5D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

When CONFIG_KALLSYMS_PARAMINFO_BTF is enabled and a function parameter
is a pointer to a kernel struct, use BTF type information to safely
dereference the pointer and display struct member values in oops/WARN
dumps.

The rendering uses btf_type_snprintf_show() which internally uses
copy_from_kernel_nofault() for safe memory access, making it safe to
call in oops/panic context.  Struct members are printed in a compact
two-column layout for readability.

Example output:

  Function parameters (paraminfo_demo_crash):
    file     (struct file *)         = 0xffff8bc043cb36c0
      .f_mode = (fmode_t)67993630               .f_flags = (unsigned int)32769
      .f_mapping = (struct address_space *)0x..  .f_inode = (struct inode *)0x..
      .f_cred = (struct cred *)0x...             .prev_pos = (loff_t)-1

Gated behind CONFIG_KALLSYMS_PARAMINFO_BTF which depends on both
CONFIG_KALLSYMS_PARAMINFO and CONFIG_DEBUG_INFO_BTF.  No additional
kernel image size beyond BTF itself.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 init/Kconfig                    |  19 +++
 kernel/Makefile                 |   1 +
 kernel/kallsyms.c               |  47 ++++--
 kernel/kallsyms_paraminfo_btf.c | 267 ++++++++++++++++++++++++++++++++
 lib/tests/paraminfo_kunit.c     |  13 +-
 scripts/gen_paraminfo.c         |  80 ++++++++--
 6 files changed, 384 insertions(+), 43 deletions(-)
 create mode 100644 kernel/kallsyms_paraminfo_btf.c

diff --git a/init/Kconfig b/init/Kconfig
index 76d0c2da7d612..602594c86bf7e 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2106,6 +2106,25 @@ config KALLSYMS_PARAMINFO
 
 	  If unsure, say N.
 
+config KALLSYMS_PARAMINFO_BTF
+	bool "Render struct contents for pointer parameters in oops dumps"
+	depends on KALLSYMS_PARAMINFO && DEBUG_INFO_BTF
+	help
+	  When a function parameter is a pointer to a kernel struct and BTF
+	  type information is available, dereference the pointer and display
+	  key struct members (1 level deep) in oops/WARN dumps.
+
+	  When enabled, oops dumps may include additional indented lines
+	  showing struct member values in a two-column layout:
+
+	    file   (struct file *)         = 0xffff888123456000
+	      .f_flags = (unsigned int)32769  .f_mode = (fmode_t)29
+
+	  Requires CONFIG_DEBUG_INFO_BTF.
+	  No additional kernel image size beyond BTF itself.
+
+	  If unsure, say N.
+
 # end of the "standard kernel features (expert users)" menu
 
 config ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/kernel/Makefile b/kernel/Makefile
index 6785982013dce..e47d911340cad 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -75,6 +75,7 @@ obj-$(CONFIG_UID16) += uid16.o
 obj-$(CONFIG_MODULE_SIG_FORMAT) += module_signature.o
 obj-$(CONFIG_KALLSYMS) += kallsyms.o
 obj-$(CONFIG_KALLSYMS_SELFTEST) += kallsyms_selftest.o
+obj-$(CONFIG_KALLSYMS_PARAMINFO_BTF) += kallsyms_paraminfo_btf.o
 obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
 obj-$(CONFIG_VMCORE_INFO) += vmcore_info.o elfcorehdr.o
 obj-$(CONFIG_CRASH_RESERVE) += crash_reserve.o
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index af8de3d8e3ba3..362cfa80b2c08 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -510,16 +510,19 @@ bool kallsyms_lookup_lineinfo(unsigned long addr,
 
 #define MAX_PARAMINFO_PARAMS 6
 
+#ifdef CONFIG_KALLSYMS_PARAMINFO_BTF
+void paraminfo_btf_show_ptr(unsigned long ptr_val, const char *type_str);
+#else
+static inline void paraminfo_btf_show_ptr(unsigned long ptr_val,
+					   const char *type_str) {}
+#endif
+
 /*
  * x86-64 calling convention: arguments are passed in registers
  * RDI, RSI, RDX, RCX, R8, R9 (in that order).
  */
 #ifdef CONFIG_X86_64
 
-static const char * const paraminfo_reg_names[] = {
-	"RDI", "RSI", "RDX", "RCX", "R8", "R9"
-};
-
 static unsigned long paraminfo_get_reg(const struct pt_regs *regs,
 				       unsigned int idx)
 {
@@ -534,9 +537,6 @@ static unsigned long paraminfo_get_reg(const struct pt_regs *regs,
 	}
 }
 #else
-/* Stub for non-x86-64 architectures */
-static const char * const paraminfo_reg_names[] = {};
-
 static unsigned long paraminfo_get_reg(const struct pt_regs *regs,
 				       unsigned int idx)
 {
@@ -586,13 +586,13 @@ void kallsyms_show_paraminfo(struct pt_regs *regs)
 	const u8 *data;
 	unsigned int num_params, i;
 	unsigned long ip, fault_addr;
-	char sym_name[KSYM_NAME_LEN];
+	char sym_name[128];
 	unsigned long sym_size, sym_offset;
 
 	if (!regs || !paraminfo_num_funcs)
 		return;
 
-	ip = regs->ip;
+	ip = instruction_pointer(regs);
 
 	/* Only handle kernel-mode faults */
 	if (user_mode(regs))
@@ -611,14 +611,23 @@ void kallsyms_show_paraminfo(struct pt_regs *regs)
 		return;
 
 	/*
-	 * Verify the IP is within a reasonable range of the function
-	 * start.  paraminfo_func_addrs[] contains function start offsets;
-	 * check that we're not too far past the start.  Use kallsyms to
-	 * verify we're in the right function.
+	 * Verify the paraminfo entry actually matches the function
+	 * containing the IP.  Without this, if the faulting function
+	 * has no paraminfo, the binary search silently returns the
+	 * preceding function's entry — showing wrong parameter info.
 	 */
 	if (!kallsyms_lookup_size_offset(ip, &sym_size, &sym_offset))
 		return;
 
+	{
+		unsigned int func_start_offset;
+
+		func_start_offset = (unsigned int)(ip - sym_offset -
+						   (unsigned long)_text);
+		if (paraminfo_func_addrs[func_idx] != func_start_offset)
+			return;
+	}
+
 	/* Decode the function's parameter data */
 	data = paraminfo_func_data + paraminfo_func_offsets[func_idx];
 	num_params = *data++;
@@ -631,9 +640,9 @@ void kallsyms_show_paraminfo(struct pt_regs *regs)
 		return;
 
 	/*
-	 * Read the fault address for highlighting.  On x86, CR2 holds
-	 * the page fault linear address.  On other architectures this
-	 * would need a different mechanism.
+	 * Read CR2 for fault address highlighting.  CR2 is only meaningful
+	 * for page faults; for GPF, BUG, WARN, etc. it may hold a stale
+	 * value.  This is best-effort — a false match is harmless.
 	 */
 #ifdef CONFIG_X86
 	fault_addr = read_cr2();
@@ -660,9 +669,13 @@ void kallsyms_show_paraminfo(struct pt_regs *regs)
 
 		is_fault_addr = fault_addr && (val == fault_addr);
 
-		printk(KERN_DEFAULT "  %-8s (%-20s) = 0x%016lx%s\n",
+		printk(KERN_DEFAULT " %-8s (%-20s) = 0x%016lx%s\n",
 		       pname, ptype, val,
 		       is_fault_addr ? "  <-- fault address" : "");
+
+		/* If this is a pointer to a struct, try BTF deep rendering */
+		if (val && strstr(ptype, "*"))
+			paraminfo_btf_show_ptr(val, ptype);
 	}
 }
 EXPORT_SYMBOL_GPL(kallsyms_show_paraminfo);
diff --git a/kernel/kallsyms_paraminfo_btf.c b/kernel/kallsyms_paraminfo_btf.c
new file mode 100644
index 0000000000000..28ce1dd45f7a8
--- /dev/null
+++ b/kernel/kallsyms_paraminfo_btf.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * kallsyms_paraminfo_btf.c - BTF-based deep rendering for paraminfo
+ *
+ * Copyright (C) 2026 Sasha Levin <sashal@kernel.org>
+ *
+ * When CONFIG_KALLSYMS_PARAMINFO_BTF is enabled and a function parameter
+ * is a pointer to a kernel struct, this module uses BTF type information
+ * to safely dereference the pointer and display key struct members in
+ * oops/WARN dumps.
+ */
+
+#include <linux/btf.h>
+#include <linux/bpf.h>
+#include <linux/kallsyms.h>
+#include <linux/kernel.h>
+#include <linux/printk.h>
+#include <linux/string.h>
+#include <linux/uaccess.h>
+
+/* Declared in kernel/kallsyms.c under CONFIG_KALLSYMS_PARAMINFO_BTF */
+void paraminfo_btf_show_ptr(unsigned long ptr_val, const char *type_str);
+
+extern struct btf *btf_vmlinux;
+
+/*
+ * Maximum output buffer for BTF rendering.  Large structs (e.g.,
+ * struct dentry) need substantial space.  This is declared static
+ * rather than on the stack because 4096 bytes would exceed the
+ * frame size limit.  Oops context is effectively single-threaded
+ * (other CPUs are stopped or spinning), so a static buffer is safe.
+ */
+#define BTF_SHOW_BUF_LEN	4096
+
+/*
+ * Parse a type string like "struct file *" to extract the struct name.
+ * Writes into caller-provided @name_buf of size @bufsz.
+ * Returns @name_buf on success, or NULL if not a struct/union pointer type.
+ */
+static const char *extract_struct_name(const char *type_str, bool *is_union,
+				       char *name_buf, size_t bufsz)
+{
+	const char *p, *end;
+
+	*is_union = false;
+
+	/* Must end with " *" to be a pointer */
+	end = type_str + strlen(type_str);
+	if (end - type_str < 3 || end[-1] != '*' || end[-2] != ' ')
+		return NULL;
+
+	if (!strncmp(type_str, "struct ", 7)) {
+		p = type_str + 7;
+	} else if (!strncmp(type_str, "union ", 6)) {
+		p = type_str + 6;
+		*is_union = true;
+	} else {
+		return NULL;
+	}
+
+	/* Copy name up to the " *" */
+	{
+		size_t len = (end - 2) - p;
+
+		if (len == 0 || len >= bufsz)
+			return NULL;
+		memcpy(name_buf, p, len);
+		name_buf[len] = '\0';
+	}
+
+	return name_buf;
+}
+
+/*
+ * Show BTF-rendered struct contents for a pointer parameter.
+ * Called from kallsyms_show_paraminfo() when the parameter is a
+ * struct/union pointer.
+ *
+ * Uses btf_type_snprintf_show() which internally uses
+ * copy_from_kernel_nofault() for safe memory access, making it
+ * safe to call in oops/panic context.
+ */
+void paraminfo_btf_show_ptr(unsigned long ptr_val, const char *type_str)
+{
+	static char buf[BTF_SHOW_BUF_LEN];
+	char sname[64];
+	const char *name;
+	bool is_union;
+	s32 type_id;
+	int ret;
+
+	if (!btf_vmlinux || !ptr_val)
+		return;
+
+	/* Only handle kernel pointers */
+	if (ptr_val < PAGE_OFFSET)
+		return;
+
+	name = extract_struct_name(type_str, &is_union, sname, sizeof(sname));
+	if (!name)
+		return;
+
+	type_id = btf_find_by_name_kind(btf_vmlinux, name,
+					is_union ? BTF_KIND_UNION
+						 : BTF_KIND_STRUCT);
+	if (type_id < 0)
+		return;
+
+	/*
+	 * Render without BTF_SHOW_COMPACT so each member gets its own
+	 * line with proper indentation from BTF.  Use BTF_SHOW_PTR_RAW
+	 * to print real kernel addresses instead of hashed pointers —
+	 * this is oops context where address visibility is critical.
+	 */
+	ret = btf_type_snprintf_show(btf_vmlinux, type_id, (void *)ptr_val,
+				     buf, sizeof(buf), BTF_SHOW_PTR_RAW);
+	if (ret < 0)
+		return;
+
+	buf[sizeof(buf) - 1] = '\0';
+
+	/*
+	 * Filter the multi-line BTF output: skip lines that contain
+	 * only braces/brackets/whitespace (structural noise), collect
+	 * meaningful member lines, and print them two per row.
+	 */
+	{
+		/*
+		 * Collect filtered lines as pointers into buf[] (which
+		 * we NUL-terminate in place).  Stack budget: ~64 pointers.
+		 */
+#define MAX_BTF_LINES 64
+#define BTF_COL_WIDTH 40
+		char *lines[MAX_BTF_LINES];
+		int nlines = 0;
+		char *line, *next;
+
+		for (line = buf; line && *line; line = next) {
+			char *s, *c;
+			bool has_content = false;
+
+			next = strchr(line, '\n');
+			if (next)
+				*next++ = '\0';
+
+			s = line;
+			while (*s == ' ' || *s == '\t')
+				s++;
+
+			/* Skip structural-only lines: {}[](), */
+			for (c = s; *c; c++) {
+				if (*c != '{' && *c != '}' &&
+				    *c != '(' && *c != ')' &&
+				    *c != '[' && *c != ']' &&
+				    *c != ',' && *c != ' ' &&
+				    *c != '\t') {
+					has_content = true;
+					break;
+				}
+			}
+			if (!has_content)
+				continue;
+
+			/* Skip type-only prefix lines */
+			if (*s == '(' && !strchr(s, '=') && !strchr(s, '['))
+				continue;
+
+			/* Trim trailing commas/spaces */
+			{
+				size_t len = strlen(s);
+
+				while (len > 0 && (s[len - 1] == ','
+						|| s[len - 1] == ' '))
+					s[--len] = '\0';
+			}
+
+			if (*s && nlines < MAX_BTF_LINES)
+				lines[nlines++] = s;
+		}
+
+		/*
+		 * Coalesce char array elements into strings.
+		 *
+		 * BTF renders char[] as individual elements:
+		 *   .sysname = (char[])[
+		 *   'L'
+		 *   'i'
+		 *   'n'  ...
+		 *
+		 * Detect lines containing "= (char[])[" or
+		 * "= (unsigned char[])[" and collect following
+		 * single-quoted-char lines into a readable string
+		 * like: .sysname = "Linux"
+		 */
+#define MAX_COALESCED 8
+		{
+			static char coalesced[MAX_COALESCED][128];
+			int ci = 0, i;
+
+			for (i = 0; i < nlines && ci < MAX_COALESCED; i++) {
+				char *eq;
+				int spos, j, pfxlen;
+
+				eq = strstr(lines[i], "(char[])[");
+				if (!eq)
+					eq = strstr(lines[i], "(unsigned char[])[");
+				if (!eq)
+					continue;
+
+				/* Extract prefix up to and including '=' */
+				eq = strstr(lines[i], "= ");
+				if (!eq)
+					continue;
+				pfxlen = eq - lines[i] + 2;
+				if (pfxlen > 60)
+					pfxlen = 60;
+
+				memcpy(coalesced[ci], lines[i], pfxlen);
+				coalesced[ci][pfxlen] = '"';
+				spos = pfxlen + 1;
+
+				/* Gather chars from subsequent lines */
+				for (j = i + 1; j < nlines &&
+				     spos < (int)sizeof(coalesced[0]) - 2; j++) {
+					char *s = lines[j];
+
+					if (s[0] == '\'' && s[2] == '\'' &&
+					    (s[3] == '\0' || s[3] == ',')) {
+						coalesced[ci][spos++] = s[1];
+						lines[j] = "";
+					} else {
+						break;
+					}
+				}
+				coalesced[ci][spos++] = '"';
+				coalesced[ci][spos] = '\0';
+				lines[i] = coalesced[ci];
+				ci++;
+			}
+		}
+#undef MAX_COALESCED
+
+		/* Print in two columns, skipping empty (consumed) lines */
+		{
+			int i, col = 0;
+			char *pending = NULL;
+
+			for (i = 0; i < nlines; i++) {
+				if (!lines[i][0])
+					continue;
+				if (col == 0) {
+					pending = lines[i];
+					col = 1;
+				} else {
+					printk(KERN_DEFAULT "  %-*s  %s\n",
+					       BTF_COL_WIDTH, pending,
+					       lines[i]);
+					col = 0;
+				}
+			}
+			if (col == 1)
+				printk(KERN_DEFAULT "  %s\n", pending);
+		}
+#undef MAX_BTF_LINES
+#undef BTF_COL_WIDTH
+	}
+}
diff --git a/lib/tests/paraminfo_kunit.c b/lib/tests/paraminfo_kunit.c
index e09efc4ddeb0e..74a4436163a98 100644
--- a/lib/tests/paraminfo_kunit.c
+++ b/lib/tests/paraminfo_kunit.c
@@ -7,7 +7,8 @@
  * Verifies that the paraminfo tables correctly map function addresses
  * to their parameter names and types.
  *
- * Build with: CONFIG_PARAMINFO_KUNIT_TEST=m (or =y)
+ * Build with: CONFIG_PARAMINFO_KUNIT_TEST=y (must be built-in; paraminfo
+ * tables are vmlinux-only, so module test functions won't be found)
  */
 
 #include <kunit/test.h>
@@ -45,15 +46,7 @@ static noinline void paraminfo_test_no_args(void)
 
 /* ---- Helpers to query paraminfo tables directly ---- */
 
-/*
- * These access the raw paraminfo tables to verify correctness.
- * The tables are defined in kernel/kallsyms_internal.h.
- */
-extern const u32 paraminfo_num_funcs;
-extern const u32 paraminfo_func_addrs[];
-extern const u32 paraminfo_func_offsets[];
-extern const u8  paraminfo_func_data[];
-extern const char paraminfo_strings[];
+#include "../../kernel/kallsyms_internal.h"
 
 struct param_result {
 	unsigned int num_params;
diff --git a/scripts/gen_paraminfo.c b/scripts/gen_paraminfo.c
index ea1d23f3ddd9a..b64dd1232c77c 100644
--- a/scripts/gen_paraminfo.c
+++ b/scripts/gen_paraminfo.c
@@ -58,7 +58,7 @@ static unsigned int num_strings;
 static unsigned int strtab_capacity;
 static unsigned int strtab_total_size;
 
-#define STR_HASH_BITS 14
+#define STR_HASH_BITS 18
 #define STR_HASH_SIZE (1 << STR_HASH_BITS)
 
 struct str_hash_entry {
@@ -87,6 +87,13 @@ static unsigned int find_or_add_string(const char *s)
 		h = (h + 1) & (STR_HASH_SIZE - 1);
 	}
 
+	if (num_strings >= STR_HASH_SIZE * 3 / 4) {
+		fprintf(stderr,
+			"gen_paraminfo: string hash table overflow (%u entries)\n",
+			num_strings);
+		exit(1);
+	}
+
 	if (num_strings >= strtab_capacity) {
 		strtab_capacity = strtab_capacity ? strtab_capacity * 2 : 8192;
 		strtab = realloc(strtab, strtab_capacity * sizeof(*strtab));
@@ -97,6 +104,10 @@ static unsigned int find_or_add_string(const char *s)
 	}
 
 	strtab[num_strings].str = strdup(s);
+	if (!strtab[num_strings].str) {
+		fprintf(stderr, "out of memory\n");
+		exit(1);
+	}
 	strtab[num_strings].offset = strtab_total_size;
 	strtab_total_size += strlen(s) + 1;
 
@@ -120,20 +131,32 @@ static void add_func(struct func_entry *f)
 	funcs[num_funcs++] = *f;
 }
 
+/* Max recursion depth to prevent stack overflow on pathological DWARF */
+#define MAX_TYPE_DEPTH 16
+
+static void __build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz,
+			      int depth);
+
 /*
  * Build a human-readable type name string from a DWARF type DIE.
  * Follows the type chain (pointers, const, etc.) to produce strings like:
  *   "struct file *", "const char *", "unsigned long", "void *"
  */
 static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
+{
+	__build_type_name(type_die, buf, bufsz, 0);
+}
+
+static void __build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz,
+			      int depth)
 {
 	Dwarf_Die child;
 	Dwarf_Attribute attr;
 	const char *name;
 	int tag;
 
-	if (!type_die) {
-		snprintf(buf, bufsz, "void");
+	if (!type_die || depth > MAX_TYPE_DEPTH) {
+		snprintf(buf, bufsz, depth > MAX_TYPE_DEPTH ? "..." : "void");
 		return;
 	}
 
@@ -148,7 +171,7 @@ static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
 	case DW_TAG_pointer_type:
 		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
 		    dwarf_formref_die(&attr, &child)) {
-			build_type_name(&child, buf, bufsz);
+			__build_type_name(&child, buf, bufsz, depth + 1);
 			if (strlen(buf) + 3 < bufsz)
 				strcat(buf, " *");
 		} else {
@@ -161,7 +184,7 @@ static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
 		    dwarf_formref_die(&attr, &child)) {
 			char tmp[MAX_TYPE_LEN - 10];
 
-			build_type_name(&child, tmp, sizeof(tmp));
+			__build_type_name(&child, tmp, sizeof(tmp), depth + 1);
 			snprintf(buf, bufsz, "const %s", tmp);
 		} else {
 			snprintf(buf, bufsz, "const void");
@@ -173,7 +196,7 @@ static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
 		    dwarf_formref_die(&attr, &child)) {
 			char tmp[MAX_TYPE_LEN - 10];
 
-			build_type_name(&child, tmp, sizeof(tmp));
+			__build_type_name(&child, tmp, sizeof(tmp), depth + 1);
 			snprintf(buf, bufsz, "volatile %s", tmp);
 		} else {
 			snprintf(buf, bufsz, "volatile void");
@@ -183,7 +206,7 @@ static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
 	case DW_TAG_restrict_type:
 		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
 		    dwarf_formref_die(&attr, &child)) {
-			build_type_name(&child, buf, bufsz);
+			__build_type_name(&child, buf, bufsz, depth + 1);
 		} else {
 			snprintf(buf, bufsz, "void");
 		}
@@ -195,7 +218,7 @@ static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
 			snprintf(buf, bufsz, "%s", name);
 		} else if (dwarf_attr(type_die, DW_AT_type, &attr) &&
 			   dwarf_formref_die(&attr, &child)) {
-			build_type_name(&child, buf, bufsz);
+			__build_type_name(&child, buf, bufsz, depth + 1);
 		} else {
 			snprintf(buf, bufsz, "?");
 		}
@@ -219,7 +242,7 @@ static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
 	case DW_TAG_array_type:
 		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
 		    dwarf_formref_die(&attr, &child)) {
-			build_type_name(&child, buf, bufsz);
+			__build_type_name(&child, buf, bufsz, depth + 1);
 			if (strlen(buf) + 3 < bufsz)
 				strcat(buf, "[]");
 		} else {
@@ -231,8 +254,23 @@ static void build_type_name(Dwarf_Die *type_die, char *buf, size_t bufsz)
 		snprintf(buf, bufsz, "func_ptr");
 		break;
 
+	case DW_TAG_unspecified_type:
+		name = dwarf_diename(type_die);
+		snprintf(buf, bufsz, "%s", name ? name : "void");
+		break;
+
 	default:
-		snprintf(buf, bufsz, "?");
+		/*
+		 * Unknown tag — try to follow DW_AT_type if present
+		 * (handles DW_TAG_atomic_type and others).
+		 */
+		if (dwarf_attr(type_die, DW_AT_type, &attr) &&
+		    dwarf_formref_die(&attr, &child)) {
+			__build_type_name(&child, buf, bufsz, depth + 1);
+		} else {
+			name = dwarf_diename(type_die);
+			snprintf(buf, bufsz, "%s", name ? name : "?");
+		}
 		break;
 	}
 }
@@ -311,10 +349,15 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
 				continue;
 
 			/* Skip declarations (no body) */
-			if (dwarf_attr(&child, DW_AT_declaration, &attr))
+			if (dwarf_attr_integrate(&child, DW_AT_declaration, &attr))
 				continue;
 
-			/* Get function start address */
+			/*
+			 * Get function start address.
+			 * dwarf_lowpc handles DW_AT_low_pc directly, but
+			 * for concrete inlined instances the address may be
+			 * in a ranges table.
+			 */
 			if (dwarf_lowpc(&child, &low_pc) != 0)
 				continue;
 
@@ -341,6 +384,12 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
 					if (func.num_params >= MAX_PARAMS)
 						break;
 
+					/*
+					 * Use dwarf_attr_integrate to follow
+					 * DW_AT_abstract_origin chains — inlined
+					 * or outlined functions may store param
+					 * names/types in an abstract instance.
+					 */
 					pname = dwarf_diename(&param);
 					if (!pname)
 						pname = "?";
@@ -349,8 +398,8 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
 						 sizeof(func.params[0].name),
 						 "%s", pname);
 
-					/* Resolve type */
-					if (dwarf_attr(&param, DW_AT_type, &attr) &&
+					/* Resolve type (follow abstract origin) */
+					if (dwarf_attr_integrate(&param, DW_AT_type, &attr) &&
 					    dwarf_formref_die(&attr, &type_die)) {
 						build_type_name(&type_die,
 								func.params[func.num_params].type,
@@ -530,8 +579,7 @@ int main(int argc, char *argv[])
 	process_dwarf(dwarf, text_addr);
 	deduplicate();
 
-	fprintf(stderr, "paraminfo: %u functions, %u strings\n",
-		num_funcs, num_strings);
+	fprintf(stderr, "paraminfo: %u functions\n", num_funcs);
 
 	output_assembly();
 
-- 
2.51.0


