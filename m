Return-Path: <linux-kbuild+bounces-11538-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MdGFOQmp2k3fAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11538-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 19:22:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EEB1F53B9
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 19:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4F525300DCE0
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 18:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CC573DEADA;
	Tue,  3 Mar 2026 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTL1hzeH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5817B1891A9;
	Tue,  3 Mar 2026 18:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562128; cv=none; b=emV1Y0ELE7mcMu36B2IOW4IS48ruUpHPSyND3ubh7R0nOagmGb5XcF4r9W0zzHLGJKkA7Coy4vAHqJPNU9joo7drxUoaNyLE+2fCoMBQCMcBfGC/3zDoAvbHD25LFc3a/5nGRHxoK7ZaXgR2uFOQ2kSpbsAu0uliEeBdYOvAb2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562128; c=relaxed/simple;
	bh=KEoCO8m+FUxF4B3WkKHS/khs8xkMwjfLc3f/e0By5og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AgFfJmBA6WFpteB7/izwK3dqLOZt9/MPSR2JO6lExIanrrQbuLaw7M4iE9ysUg0Wt030Xlv430/6BdQ6xtoPh2uawarfNEMruW1y7h0UV+z0hjPTfJcxxvi09egnRTr7jiSu1y0xkQRq3ZWyIy0WIrhsFmVEU+9nVh44Rkq9e2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTL1hzeH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A272BC116C6;
	Tue,  3 Mar 2026 18:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772562128;
	bh=KEoCO8m+FUxF4B3WkKHS/khs8xkMwjfLc3f/e0By5og=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FTL1hzeHzMzVB70BgVxZ1Ux55xCIDqReNWn+6nAj7DyLHG2QwQM2VrV32MVg4THhK
	 bqoRV08jDq681jUBahhdzvGRjIam/m71333QDK12W/r+A3xclu49Fpz1h8dYk41Wyv
	 /D92nq1GmU2ji4HF2jWIZWwUtBdQ/EhtHdQFzahSvnjJOUBhnXX9Ne2yip8rw2t/y2
	 nypwxu4u9FHCwVkAFT0VQRrc0vLp9MX5+g38Lz8fIt+pvnSaShT84MEvrR2yvy7Ax3
	 DPnLyseV4z3u+deafPlwe3rqHESU94HktKoKMgIeWOWD2hbaak8+MeYjncrfG0XDrF
	 eS/HxK1+g8K/A==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Kees Cook <kees@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Vlastimil Babka <vbabka@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 2/3] kallsyms: extend lineinfo to loadable modules
Date: Tue,  3 Mar 2026 13:21:02 -0500
Message-ID: <20260303182103.3523438-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303182103.3523438-1-sashal@kernel.org>
References: <20260303182103.3523438-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E3EEB1F53B9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11538-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,gen-mod-lineinfo.sh:url]
X-Rspamd-Action: no action

Add CONFIG_KALLSYMS_LINEINFO_MODULES, which extends the
CONFIG_KALLSYMS_LINEINFO feature to loadable kernel modules.

At build time, each .ko is post-processed by scripts/gen-mod-lineinfo.sh
(modeled on gen-btf.sh) which runs scripts/gen_lineinfo --module on the
.ko, generates a .mod_lineinfo section containing a compact binary table
of .text-relative offsets, file IDs, line numbers, and filenames, and
embeds it back into the .ko via objcopy.

At runtime, module_lookup_lineinfo() performs a binary search on the
module's .mod_lineinfo section, and __sprint_symbol() calls it for
addresses that fall within a module.  The lookup is NMI/panic-safe
(no locks, no allocations) - the data lives in read-only module memory
and is freed automatically when the module is unloaded.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../admin-guide/kallsyms-lineinfo.rst         |  40 ++++-
 MAINTAINERS                                   |   2 +
 include/linux/mod_lineinfo.h                  |  68 +++++++
 include/linux/module.h                        |  19 ++
 init/Kconfig                                  |  13 ++
 kernel/kallsyms.c                             |  22 ++-
 kernel/module/kallsyms.c                      |  95 ++++++++++
 kernel/module/main.c                          |   4 +
 scripts/Makefile                              |   1 +
 scripts/Makefile.modfinal                     |   6 +
 scripts/gen-mod-lineinfo.sh                   |  48 +++++
 scripts/gen_lineinfo.c                        | 166 ++++++++++++++++--
 12 files changed, 458 insertions(+), 26 deletions(-)
 create mode 100644 include/linux/mod_lineinfo.h
 create mode 100755 scripts/gen-mod-lineinfo.sh

diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
index 4dffc18dbcf5a..21450569d5324 100644
--- a/Documentation/admin-guide/kallsyms-lineinfo.rst
+++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
@@ -51,22 +51,46 @@ With ``CONFIG_KALLSYMS_LINEINFO``::
 Note that assembly routines (such as ``entry_SYSCALL_64_after_hwframe``) are
 not annotated because they lack DWARF debug information.
 
+Module Support
+==============
+
+``CONFIG_KALLSYMS_LINEINFO_MODULES`` extends the feature to loadable kernel
+modules.  When enabled, each ``.ko`` is post-processed at build time to embed
+a ``.mod_lineinfo`` section containing the same kind of address-to-source
+mapping.
+
+Enable in addition to the base options::
+
+    CONFIG_MODULES=y
+    CONFIG_KALLSYMS_LINEINFO_MODULES=y
+
+Stack traces from module code will then include annotations::
+
+    my_driver_func+0x30/0x100 [my_driver] (drivers/foo/bar.c:123)
+
+The ``.mod_lineinfo`` section is loaded into read-only module memory alongside
+the module text.  No additional runtime memory allocation is required; the data
+is freed when the module is unloaded.
+
 Memory Overhead
 ===============
 
-The lineinfo tables are stored in ``.rodata`` and typically add approximately
-44 MiB to the kernel image for a standard configuration (~4.6 million DWARF
-line entries, ~10 bytes per entry after deduplication).
+The vmlinux lineinfo tables are stored in ``.rodata`` and typically add
+approximately 44 MiB to the kernel image for a standard configuration
+(~4.6 million DWARF line entries, ~10 bytes per entry after deduplication).
+
+Per-module lineinfo adds approximately 10 bytes per DWARF line entry to each
+``.ko`` file.
 
 Known Limitations
 =================
 
-- **vmlinux only**: Only symbols in the core kernel image are annotated.
-  Module symbols are not covered.
-- **4 GiB offset limit**: Address offsets from ``_text`` are stored as 32-bit
-  values.  Entries beyond 4 GiB from ``_text`` are skipped at build time with
-  a warning.
+- **4 GiB offset limit**: Address offsets from ``_text`` (vmlinux) or
+  ``.text`` base (modules) are stored as 32-bit values.  Entries beyond
+  4 GiB are skipped at build time with a warning.
 - **65535 file limit**: Source file IDs are stored as 16-bit values.  Builds
   with more than 65535 unique source files will fail with an error.
 - **No assembly annotations**: Functions implemented in assembly that lack
   DWARF ``.debug_line`` data are not annotated.
+- **No init text**: For modules, functions in ``.init.text`` are not annotated
+  because that memory is freed after module initialization.
diff --git a/MAINTAINERS b/MAINTAINERS
index ab987e74bb0f5..d04abafd9eb77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14282,6 +14282,8 @@ KALLSYMS LINEINFO
 M:	Sasha Levin <sashal@kernel.org>
 S:	Maintained
 F:	Documentation/admin-guide/kallsyms-lineinfo.rst
+F:	include/linux/mod_lineinfo.h
+F:	scripts/gen-mod-lineinfo.sh
 F:	scripts/gen_lineinfo.c
 
 KPROBES
diff --git a/include/linux/mod_lineinfo.h b/include/linux/mod_lineinfo.h
new file mode 100644
index 0000000000000..d62e9608f0f82
--- /dev/null
+++ b/include/linux/mod_lineinfo.h
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mod_lineinfo.h - Binary format for per-module source line information
+ *
+ * This header defines the layout of the .mod_lineinfo section embedded
+ * in loadable kernel modules.  It is dual-use: included from both the
+ * kernel and the userspace gen_lineinfo tool.
+ *
+ * Section layout (all values in target-native endianness):
+ *
+ *   struct mod_lineinfo_header     (16 bytes)
+ *   u32 addrs[num_entries]         -- offsets from .text base, sorted
+ *   u16 file_ids[num_entries]      -- parallel to addrs
+ *   <2-byte pad if num_entries is odd>
+ *   u32 lines[num_entries]         -- parallel to addrs
+ *   u32 file_offsets[num_files]    -- byte offset into filenames[]
+ *   char filenames[filenames_size] -- concatenated NUL-terminated strings
+ */
+#ifndef _LINUX_MOD_LINEINFO_H
+#define _LINUX_MOD_LINEINFO_H
+
+#ifdef __KERNEL__
+#include <linux/types.h>
+#else
+#include <stdint.h>
+typedef uint32_t u32;
+typedef uint16_t u16;
+#endif
+
+struct mod_lineinfo_header {
+	u32 num_entries;
+	u32 num_files;
+	u32 filenames_size;	/* total bytes of concatenated filenames */
+	u32 reserved;		/* padding, must be 0 */
+};
+
+/* Offset helpers: compute byte offset from start of section to each array */
+
+static inline u32 mod_lineinfo_addrs_off(void)
+{
+	return sizeof(struct mod_lineinfo_header);
+}
+
+static inline u32 mod_lineinfo_file_ids_off(u32 num_entries)
+{
+	return mod_lineinfo_addrs_off() + num_entries * sizeof(u32);
+}
+
+static inline u32 mod_lineinfo_lines_off(u32 num_entries)
+{
+	/* u16 file_ids[] may need 2-byte padding to align lines[] to 4 bytes */
+	u32 off = mod_lineinfo_file_ids_off(num_entries) +
+		  num_entries * sizeof(u16);
+	return (off + 3) & ~3u;
+}
+
+static inline u32 mod_lineinfo_file_offsets_off(u32 num_entries)
+{
+	return mod_lineinfo_lines_off(num_entries) + num_entries * sizeof(u32);
+}
+
+static inline u32 mod_lineinfo_filenames_off(u32 num_entries, u32 num_files)
+{
+	return mod_lineinfo_file_offsets_off(num_entries) +
+	       num_files * sizeof(u32);
+}
+
+#endif /* _LINUX_MOD_LINEINFO_H */
diff --git a/include/linux/module.h b/include/linux/module.h
index 14f391b186c6d..1c5840e736ec7 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -508,6 +508,10 @@ struct module {
 	void *btf_data;
 	void *btf_base_data;
 #endif
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	void *lineinfo_data;		/* .mod_lineinfo section in MOD_RODATA */
+	unsigned int lineinfo_data_size;
+#endif
 #ifdef CONFIG_JUMP_LABEL
 	struct jump_entry *jump_entries;
 	unsigned int num_jump_entries;
@@ -1021,6 +1025,21 @@ static inline unsigned long find_kallsyms_symbol_value(struct module *mod,
 
 #endif  /* CONFIG_MODULES && CONFIG_KALLSYMS */
 
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
+			    unsigned long sym_start,
+			    const char **file, unsigned int *line);
+#else
+static inline bool module_lookup_lineinfo(struct module *mod,
+					  unsigned long addr,
+					  unsigned long sym_start,
+					  const char **file,
+					  unsigned int *line)
+{
+	return false;
+}
+#endif
+
 /* Define __free(module_put) macro for struct module *. */
 DEFINE_FREE(module_put, struct module *, if (_T) module_put(_T))
 
diff --git a/init/Kconfig b/init/Kconfig
index c39f27e6393a8..bf53275bc405a 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2070,6 +2070,19 @@ config KALLSYMS_LINEINFO
 
 	  If unsure, say N.
 
+config KALLSYMS_LINEINFO_MODULES
+	bool "Embed source file:line information in module stack traces"
+	depends on KALLSYMS_LINEINFO && MODULES
+	help
+	  Extends KALLSYMS_LINEINFO to loadable kernel modules.  Each .ko
+	  gets a lineinfo table generated from its DWARF data at build time,
+	  so stack traces from module code include (file.c:123) annotations.
+
+	  Requires elfutils (libdw-dev/elfutils-devel) on the build host.
+	  Increases .ko sizes by approximately 10 bytes per DWARF line entry.
+
+	  If unsure, say N.
+
 # end of the "standard kernel features (expert users)" menu
 
 config ARCH_HAS_MEMBARRIER_CALLBACKS
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 2b9c9d6322a3e..cea74992e5427 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -554,13 +554,27 @@ static int __sprint_symbol(char *buffer, unsigned long address,
 	}
 
 #ifdef CONFIG_KALLSYMS_LINEINFO
-	if (!modname) {
+	{
 		const char *li_file;
 		unsigned int li_line;
 		unsigned long sym_start = address - offset;
-
-		if (kallsyms_lookup_lineinfo(address, sym_start,
-					     &li_file, &li_line))
+		bool found = false;
+
+		if (!modname)
+			found = kallsyms_lookup_lineinfo(address, sym_start,
+							 &li_file, &li_line);
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+		else {
+			struct module *mod = __module_address(address);
+
+			if (mod)
+				found = module_lookup_lineinfo(mod, address,
+							      sym_start,
+							      &li_file,
+							      &li_line);
+		}
+#endif
+		if (found)
 			len += snprintf(buffer + len, KSYM_SYMBOL_LEN - len,
 					" (%s:%u)", li_file, li_line);
 	}
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index 0fc11e45df9b9..7af414bd65e79 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -494,3 +494,98 @@ int module_kallsyms_on_each_symbol(const char *modname,
 	mutex_unlock(&module_mutex);
 	return ret;
 }
+
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+#include <linux/mod_lineinfo.h>
+
+/*
+ * Look up source file:line for an address within a loaded module.
+ * Uses the .mod_lineinfo section embedded in the .ko at build time.
+ *
+ * Safe in NMI/panic context: no locks, no allocations.
+ * Caller must hold RCU read lock (or be in a context where the module
+ * cannot be unloaded).
+ */
+bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
+			    unsigned long sym_start,
+			    const char **file, unsigned int *line)
+{
+	const struct mod_lineinfo_header *hdr;
+	const void *base;
+	const u32 *addrs, *lines, *file_offsets;
+	const u16 *file_ids;
+	const char *filenames;
+	u32 num_entries, num_files, filenames_size;
+	unsigned long text_base;
+	unsigned int offset;
+	unsigned long long raw_offset;
+	unsigned int low, high, mid;
+	u16 file_id;
+
+	base = mod->lineinfo_data;
+	if (!base)
+		return false;
+
+	if (mod->lineinfo_data_size < sizeof(*hdr))
+		return false;
+
+	hdr = base;
+	num_entries = hdr->num_entries;
+	num_files = hdr->num_files;
+	filenames_size = hdr->filenames_size;
+
+	if (num_entries == 0)
+		return false;
+
+	/* Validate section is large enough for all arrays */
+	if (mod->lineinfo_data_size <
+	    mod_lineinfo_filenames_off(num_entries, num_files) + filenames_size)
+		return false;
+
+	addrs = base + mod_lineinfo_addrs_off();
+	file_ids = base + mod_lineinfo_file_ids_off(num_entries);
+	lines = base + mod_lineinfo_lines_off(num_entries);
+	file_offsets = base + mod_lineinfo_file_offsets_off(num_entries);
+	filenames = base + mod_lineinfo_filenames_off(num_entries, num_files);
+
+	/* Compute offset from module .text base */
+	text_base = (unsigned long)mod->mem[MOD_TEXT].base;
+	if (addr < text_base)
+		return false;
+
+	raw_offset = addr - text_base;
+	if (raw_offset > UINT_MAX)
+		return false;
+	offset = (unsigned int)raw_offset;
+
+	/* Binary search for largest entry <= offset */
+	low = 0;
+	high = num_entries;
+	while (low < high) {
+		mid = low + (high - low) / 2;
+		if (addrs[mid] <= offset)
+			low = mid + 1;
+		else
+			high = mid;
+	}
+
+	if (low == 0)
+		return false;
+	low--;
+
+	/* Ensure the matched entry belongs to the same symbol */
+	if (text_base + addrs[low] < sym_start)
+		return false;
+
+	file_id = file_ids[low];
+	if (file_id >= num_files)
+		return false;
+
+	if (file_offsets[file_id] >= filenames_size)
+		return false;
+
+	*file = &filenames[file_offsets[file_id]];
+	*line = lines[low];
+	return true;
+}
+#endif /* CONFIG_KALLSYMS_LINEINFO_MODULES */
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 2bac4c7cd019a..7b6ff9f7411b0 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2648,6 +2648,10 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->btf_base_data = any_section_objs(info, ".BTF.base", 1,
 					      &mod->btf_base_data_size);
 #endif
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	mod->lineinfo_data = any_section_objs(info, ".mod_lineinfo", 1,
+					      &mod->lineinfo_data_size);
+#endif
 #ifdef CONFIG_JUMP_LABEL
 	mod->jump_entries = section_objs(info, "__jump_table",
 					sizeof(*mod->jump_entries),
diff --git a/scripts/Makefile b/scripts/Makefile
index ffe89875b3295..651df2a867ffb 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -5,6 +5,7 @@
 
 hostprogs-always-$(CONFIG_KALLSYMS)			+= kallsyms
 hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO)		+= gen_lineinfo
+hostprogs-always-$(CONFIG_KALLSYMS_LINEINFO_MODULES)	+= gen_lineinfo
 hostprogs-always-$(BUILD_C_RECORDMCOUNT)		+= recordmcount
 hostprogs-always-$(CONFIG_BUILDTIME_TABLE_SORT)		+= sorttable
 hostprogs-always-$(CONFIG_ASN1)				+= asn1_compiler
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index adcbcde16a071..3941cf624526b 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -46,6 +46,9 @@ quiet_cmd_btf_ko = BTF [M] $@
 		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
 	fi;
 
+quiet_cmd_lineinfo_ko = LINEINFO [M] $@
+      cmd_lineinfo_ko = $(CONFIG_SHELL) $(srctree)/scripts/gen-mod-lineinfo.sh $@
+
 # Same as newer-prereqs, but allows to exclude specified extra dependencies
 newer_prereqs_except = $(filter-out $(PHONY) $(1),$?)
 
@@ -59,6 +62,9 @@ if_changed_except = $(if $(call newer_prereqs_except,$(2))$(cmd-check),      \
 	+$(call if_changed_except,ld_ko_o,$(objtree)/vmlinux)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
+endif
+ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	+$(if $(newer-prereqs),$(call cmd,lineinfo_ko))
 endif
 	+$(call cmd,check_tracepoint)
 
diff --git a/scripts/gen-mod-lineinfo.sh b/scripts/gen-mod-lineinfo.sh
new file mode 100755
index 0000000000000..fa8a914b8363b
--- /dev/null
+++ b/scripts/gen-mod-lineinfo.sh
@@ -0,0 +1,48 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# gen-mod-lineinfo.sh - Embed source line info into a kernel module (.ko)
+#
+# Reads DWARF from the .ko, generates a .mod_lineinfo section, and
+# embeds it back into the .ko.  Modeled on scripts/gen-btf.sh.
+
+set -e
+
+if [ $# -ne 1 ]; then
+	echo "Usage: $0 <module.ko>" >&2
+	exit 1
+fi
+
+KO="$1"
+
+cleanup() {
+	rm -f "${KO}.lineinfo.S" "${KO}.lineinfo.o" "${KO}.lineinfo.bin"
+}
+trap cleanup EXIT
+
+case "${KBUILD_VERBOSE}" in
+*1*)
+	set -x
+	;;
+esac
+
+# Generate assembly from DWARF -- if it fails (no DWARF), silently skip
+if ! ${objtree}/scripts/gen_lineinfo --module "${KO}" > "${KO}.lineinfo.S" 2>/dev/null; then
+	exit 0
+fi
+
+# Compile assembly to object file
+${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	${KBUILD_AFLAGS} ${KBUILD_AFLAGS_MODULE} \
+	-c -o "${KO}.lineinfo.o" "${KO}.lineinfo.S"
+
+# Extract raw section content
+${OBJCOPY} -O binary --only-section=.mod_lineinfo \
+	"${KO}.lineinfo.o" "${KO}.lineinfo.bin"
+
+# Embed into the .ko with alloc,readonly flags
+${OBJCOPY} --add-section ".mod_lineinfo=${KO}.lineinfo.bin" \
+	--set-section-flags .mod_lineinfo=alloc,readonly \
+	"${KO}"
+
+exit 0
diff --git a/scripts/gen_lineinfo.c b/scripts/gen_lineinfo.c
index 9eebfaca5857c..609de59f47ffd 100644
--- a/scripts/gen_lineinfo.c
+++ b/scripts/gen_lineinfo.c
@@ -23,8 +23,16 @@
 #include <gelf.h>
 #include <limits.h>
 
+#include "../include/linux/mod_lineinfo.h"
+
+static int module_mode;
+
 static unsigned int skipped_overflow;
 
+/* .text range for module mode (keep only runtime code) */
+static unsigned long long text_section_start;
+static unsigned long long text_section_end;
+
 struct line_entry {
 	unsigned int offset;	/* offset from _text */
 	unsigned int file_id;
@@ -123,26 +131,46 @@ static unsigned int find_or_add_file(const char *name)
  *
  * For absolute paths, strip the comp_dir prefix (from DWARF) to get
  * a kernel-tree-relative path, or fall back to the basename.
+ *
+ * For relative paths (common in modules), libdw may produce a bogus
+ * doubled path like "net/foo/bar.c/net/foo/bar.c" due to ET_REL DWARF
+ * quirks.  Detect and strip such duplicates.
  */
 static const char *make_relative(const char *path, const char *comp_dir)
 {
 	const char *p;
 
-	/* If already relative, use as-is */
-	if (path[0] != '/')
-		return path;
+	if (path[0] == '/') {
+		/* Try comp_dir prefix from DWARF */
+		if (comp_dir) {
+			size_t len = strlen(comp_dir);
 
-	/* comp_dir from DWARF is the most reliable method */
-	if (comp_dir) {
-		size_t len = strlen(comp_dir);
+			if (!strncmp(path, comp_dir, len) && path[len] == '/')
+				return path + len + 1;
+		}
 
-		if (!strncmp(path, comp_dir, len) && path[len] == '/')
-			return path + len + 1;
+		/* Fall back to basename */
+		p = strrchr(path, '/');
+		return p ? p + 1 : path;
 	}
 
-	/* Fall back to basename */
-	p = strrchr(path, '/');
-	return p ? p + 1 : path;
+	/*
+	 * Relative path — check for duplicated-path quirk from libdw
+	 * on ET_REL files (e.g., "a/b.c/a/b.c" → "a/b.c").
+	 */
+	{
+		size_t len = strlen(path);
+
+		for (p = path; (p = strchr(p, '/')) != NULL; p++) {
+			size_t prefix = p - path;
+			size_t rest = len - prefix - 1;
+
+			if (rest == prefix && !memcmp(path, p + 1, prefix))
+				return p + 1;
+		}
+	}
+
+	return path;
 }
 
 static int compare_entries(const void *a, const void *b)
@@ -194,6 +222,29 @@ static unsigned long long find_text_addr(Elf *elf)
 	exit(1);
 }
 
+static void find_text_section_range(Elf *elf)
+{
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+	size_t shstrndx;
+
+	if (elf_getshdrstrndx(elf, &shstrndx) != 0)
+		return;
+
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		const char *name;
+
+		if (!gelf_getshdr(scn, &shdr))
+			continue;
+		name = elf_strptr(elf, shstrndx, shdr.sh_name);
+		if (name && !strcmp(name, ".text")) {
+			text_section_start = shdr.sh_addr;
+			text_section_end = shdr.sh_addr + shdr.sh_size;
+			return;
+		}
+	}
+}
+
 static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
 {
 	Dwarf_Off off = 0, next_off;
@@ -241,6 +292,16 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
 			if (addr < text_addr)
 				continue;
 
+			/*
+			 * In module mode, keep only .text addresses.
+			 * In ET_REL .ko files, .init.text/.exit.text may
+			 * overlap with .text address ranges, so we must
+			 * explicitly check against the .text bounds.
+			 */
+			if (module_mode && text_section_end > text_section_start &&
+			    (addr < text_section_start || addr >= text_section_end))
+				continue;
+
 			{
 				unsigned long long raw_offset = addr - text_addr;
 
@@ -374,6 +435,63 @@ static void output_assembly(void)
 	printf("\n");
 }
 
+static void output_module_assembly(void)
+{
+	unsigned int filenames_size = 0;
+
+	for (unsigned int i = 0; i < num_files; i++)
+		filenames_size += strlen(files[i].name) + 1;
+
+	printf("/* SPDX-License-Identifier: GPL-2.0 */\n");
+	printf("/*\n");
+	printf(" * Automatically generated by scripts/gen_lineinfo --module\n");
+	printf(" * Do not edit.\n");
+	printf(" */\n\n");
+
+	printf("\t.section .mod_lineinfo, \"a\"\n\n");
+
+	/* Header: num_entries, num_files, filenames_size, reserved */
+	printf("\t.balign 4\n");
+	printf("\t.long %u\n", num_entries);
+	printf("\t.long %u\n", num_files);
+	printf("\t.long %u\n", filenames_size);
+	printf("\t.long 0\n\n");
+
+	/* addrs[] */
+	for (unsigned int i = 0; i < num_entries; i++)
+		printf("\t.long 0x%x\n", entries[i].offset);
+	if (num_entries)
+		printf("\n");
+
+	/* file_ids[] */
+	for (unsigned int i = 0; i < num_entries; i++)
+		printf("\t.short %u\n", entries[i].file_id);
+
+	/* Padding to align lines[] to 4 bytes */
+	if (num_entries & 1)
+		printf("\t.short 0\n");
+	if (num_entries)
+		printf("\n");
+
+	/* lines[] */
+	for (unsigned int i = 0; i < num_entries; i++)
+		printf("\t.long %u\n", entries[i].line);
+	if (num_entries)
+		printf("\n");
+
+	/* file_offsets[] */
+	for (unsigned int i = 0; i < num_files; i++)
+		printf("\t.long %u\n", files[i].str_offset);
+	if (num_files)
+		printf("\n");
+
+	/* filenames[] */
+	for (unsigned int i = 0; i < num_files; i++)
+		print_escaped_asciz(files[i].name);
+	if (num_files)
+		printf("\n");
+}
+
 int main(int argc, char *argv[])
 {
 	int fd;
@@ -381,8 +499,14 @@ int main(int argc, char *argv[])
 	Dwarf *dwarf;
 	unsigned long long text_addr;
 
+	if (argc >= 2 && !strcmp(argv[1], "--module")) {
+		module_mode = 1;
+		argv++;
+		argc--;
+	}
+
 	if (argc != 2) {
-		fprintf(stderr, "Usage: %s <vmlinux>\n", argv[0]);
+		fprintf(stderr, "Usage: %s [--module] <ELF file>\n", argv[0]);
 		return 1;
 	}
 
@@ -402,7 +526,18 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	text_addr = find_text_addr(elf);
+	if (module_mode) {
+		/*
+		 * .ko files are ET_REL after ld -r.  libdw applies
+		 * relocations using section addresses, so DWARF addresses
+		 * include the .text sh_addr.  Use .text sh_addr as the
+		 * base so offsets are .text-relative.
+		 */
+		find_text_section_range(elf);
+		text_addr = text_section_start;
+	} else {
+		text_addr = find_text_addr(elf);
+	}
 
 	dwarf = dwarf_begin_elf(elf, DWARF_C_READ, NULL);
 	if (!dwarf) {
@@ -428,7 +563,10 @@ int main(int argc, char *argv[])
 	fprintf(stderr, "lineinfo: %u entries, %u files\n",
 		num_entries, num_files);
 
-	output_assembly();
+	if (module_mode)
+		output_module_assembly();
+	else
+		output_assembly();
 
 	dwarf_end(dwarf);
 	elf_end(elf);
-- 
2.51.0


