Return-Path: <linux-kbuild+bounces-13941-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N2LrBrnIS2rIaAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13941-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Jul 2026 17:24:41 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2071288C
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Jul 2026 17:24:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=QPP1WY2A;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13941-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13941-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 610633081492
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jul 2026 14:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6F9C3A7F41;
	Mon,  6 Jul 2026 14:29:39 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DBC37A843;
	Mon,  6 Jul 2026 14:29:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348179; cv=none; b=qqSdofGCeGgVB+flDVirHvGuvIYllP3BeW9P40G10XXHG1aVCokl3qZxKVaan3SNazn7MdrnMCpauRff77ISgSRXlf8y2Fc7f7n6tPULAOAonK7LEmBWp8vBV+DTxd7C7UOUgWlDqgeM9bw7A0CJblH3bFasjsLUDL2HnMu7GZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348179; c=relaxed/simple;
	bh=pKHseOIxsi11JctgJvGTdvwV8jeynnJBhmb13Ix+Enw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sjJlnH8MI1q/Z98uu+OOc9N4GzzaKq/5NpMFavvrzX5zVessnHq49Pd43Nn8vqtvJK9xlDWaAysxwvD+C99R8RPOiygZpzFwG2mhNrZGU49eHNIby0z1RDpM17Q/ykjWFWt/tae6RjT0MZzygD0UvbjGmevGVlYqmZvMUUzHNjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPP1WY2A; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F0C1F000E9;
	Mon,  6 Jul 2026 14:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783348175;
	bh=wnMrk7KbeeMlpqcI0V9oeFgV4swlfkYxVLCLluXrfiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QPP1WY2A1xNeUp0FgtiPvl1WcBLUNiKV3vrXy2ouJA5xl62xyDFmUEB0pNXvQJcVB
	 uS8uLQfnVyqpt7/jppz/61sXIB7S/6lFyHPI1ositUyFGrmII6QIvqz1w3EqBcwAvR
	 Aa5rLgxPzRPWsOB4B4mLAHs2XhNJQ78Pg2/7RZq+c6u4h2ZavHVGwNEwTtAc6OYdG/
	 iXm60pzY2AX2YxMYTJ6f77voidv8kD40VyPo717xOA9TAgbtydlazYoju6//GlKS5X
	 nVfRFblNdNywVWkwDYzvGT/M1aJWEyMunT7KodQZny+WxYadVswNIkJKMC23Myt7UR
	 dFjoU9O713lMA==
From: Sasha Levin <sashal@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Richard Weinberger <richard@nod.at>,
	Juergen Gross <jgross@suse.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
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
	Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Zhen Lei <thunder.leizhen@huawei.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v6 2/4] kallsyms: extend lineinfo to loadable modules
Date: Mon,  6 Jul 2026 10:29:07 -0400
Message-ID: <20260706142914.2398993-3-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706142914.2398993-1-sashal@kernel.org>
References: <20260706142914.2398993-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:masahiroy@kernel.org,m:mcgrof@kernel.org,m:torvalds@linux-foundation.org,m:richard@nod.at,m:jgross@suse.com,m:geert@linux-m68k.org,m:James.Bottomley@HansenPartnership.com,m:sashal@kernel.org,m:corbet@lwn.net,m:nathan@kernel.org,m:nsc@kernel.org,m:petr.pavlu@suse.com,m:da.gomez@kernel.org,m:gregkh@linuxfoundation.org,m:pmladek@suse.com,m:rostedt@goodmis.org,m:kees@kernel.org,m:peterz@infradead.org,m:linux@leemhuis.info,m:vbabka@kernel.org,m:deller@gmx.de,m:rdunlap@infradead.org,m:laurent.pinchart@ideasonboard.com,m:wangruikang@iscas.ac.cn,m:thunder.leizhen@huawei.com,m:samitolvanen@google.com,m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-modules@vger.kernel.org,m:linux-doc@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-13941-lists,linux-kbuild=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,suse.com,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,huawei.com,google.com,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp,gen-mod-lineinfo.sh:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AAF2071288C

Add CONFIG_KALLSYMS_LINEINFO_MODULES, which extends the
CONFIG_KALLSYMS_LINEINFO feature to loadable kernel modules.

At build time, each .ko is post-processed by scripts/gen-mod-lineinfo.sh
(modeled on gen-btf.sh) which runs scripts/gen_lineinfo --module on the
.ko, generates per-section .mod_lineinfo and .init.mod_lineinfo
sections containing compact binary tables of section-relative offsets,
file IDs, line numbers, and filenames, and embeds them back into the
.ko via a partial link (ld -r).

At runtime, module_lookup_lineinfo() walks the section descriptors in
each blob, finds the one whose runtime range contains the queried
address, and binary-searches that section's table.  The lookup is
NMI/panic-safe (no locks, no allocations) — the data lives in
read-only module memory and is freed automatically when the module
(or its init memory) is unloaded.

The gen_lineinfo tool gains --module mode which:
 - Walks an allowlist of text-like sections (.text, .exit.text,
   .init.text), gating each on its presence in the .ko.
 - Uses an ELF relocation against each covered section's symbol as the
   runtime "anchor", resolved by the module loader's standard
   apply_relocations() pass — no implicit base derivation from
   mod->mem[].base, no special-cased loader logic.
 - Disambiguates DWARF addresses across sections that all share
   sh_addr == 0 in ET_REL files via per-section synthetic biases
   applied inside apply_debug_line_relocations() (handles both abs32
   and abs64 width relocs).
 - Handles libdw's ET_REL path-doubling quirk in make_relative().
 - Declares empty section stanzas in its output assembly so the
   resulting lineinfo.o has LOCAL SECTION symbols rather than GLOBAL
   UND ones; otherwise ld -r would not bind the relocation to the
   .ko's existing section symbol of the same name and depmod would
   warn.

The build pipeline runs gen-mod-lineinfo.sh after the existing modfinal
step:

  gen_lineinfo --module ${KO} > ${KO}.lineinfo.S
  ${CC} -c -o ${KO}.lineinfo.o ${KO}.lineinfo.S
  ${LD} -r ${KO}.lineinfo.o ${KO} -o ${KO}.tmp && mv ${KO}.tmp ${KO}

Order matters: lineinfo.o must come first so its zero-byte text
contributions stay at offset 0 of the merged sections.

The init blob lives in MOD_INIT_RODATA and is revoked via WRITE_ONCE
in do_init_module() before do_free_init() releases the memory; the
module_init_lineinfo_data() reader uses READ_ONCE so concurrent
lookups either see the old pointer (still valid until do_free_init's
synchronize_rcu) or NULL.

The struct module fields are guarded by
#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES and accessed through inline
reader accessors so callers don't duplicate the guard.

Per-module overhead is approximately 14 bytes per DWARF line entry
plus a small fixed cost per covered section descriptor.  The next
patch in this series delta-compresses the per-section streams to ~3-4
bytes per entry.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../admin-guide/kallsyms-lineinfo.rst         |  41 +-
 MAINTAINERS                                   |   3 +
 include/linux/mod_lineinfo.h                  | 104 +++
 include/linux/module.h                        |  39 +
 init/Kconfig                                  |  19 +-
 kernel/kallsyms.c                             |  18 +-
 kernel/module/kallsyms.c                      | 181 ++++
 kernel/module/main.c                          |  26 +
 scripts/Makefile.modfinal                     |   6 +
 scripts/gen-mod-lineinfo.sh                   |  50 +
 scripts/gen_lineinfo.c                        | 854 ++++++++++++++++--
 11 files changed, 1250 insertions(+), 91 deletions(-)
 create mode 100644 include/linux/mod_lineinfo.h
 create mode 100644 scripts/gen-mod-lineinfo.sh

diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
index c8ec124394354e..dd264830c8d5bf 100644
--- a/Documentation/admin-guide/kallsyms-lineinfo.rst
+++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
@@ -51,22 +51,47 @@ With ``CONFIG_KALLSYMS_LINEINFO``::
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
+approximately 10-15 MiB to the kernel image for a standard configuration
+(~4.6 million DWARF line entries, ~2-3 bytes per entry after delta
+compression).
+
+Per-module lineinfo adds approximately 2-3 bytes per DWARF line entry to each
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
index b98d57b1ee1d5b..d7e1c1de7998f5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13935,6 +13935,9 @@ KALLSYMS LINEINFO
 M:	Sasha Levin <sashal@kernel.org>
 S:	Maintained
 F:	Documentation/admin-guide/kallsyms-lineinfo.rst
+F:	include/linux/mod_lineinfo.h
+F:	lib/tests/lineinfo_kunit.c
+F:	scripts/gen-mod-lineinfo.sh
 F:	scripts/gen_lineinfo.c
 
 KASAN
diff --git a/include/linux/mod_lineinfo.h b/include/linux/mod_lineinfo.h
new file mode 100644
index 00000000000000..9cda3263a07847
--- /dev/null
+++ b/include/linux/mod_lineinfo.h
@@ -0,0 +1,104 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mod_lineinfo.h - Binary format for per-module source line information
+ *
+ * This header defines the layout of the .mod_lineinfo and
+ * .init.mod_lineinfo sections embedded in loadable kernel modules.  It
+ * is dual-use: included from both the kernel and the userspace
+ * gen_lineinfo tool.
+ *
+ * Top-level layout (all values in target-native endianness):
+ *
+ *   struct mod_lineinfo_root
+ *   struct mod_lineinfo_section sections[hdr.num_sections]
+ *   ... per-section sub-tables, each pointed at by sections[i].table_offset
+ *
+ * Each mod_lineinfo_section descriptor identifies one ELF text section
+ * covered by the lineinfo blob.  Its .anchor field is an ELF relocation
+ * resolved at module-load time to the runtime base of the named section,
+ * eliminating the need to derive the base from mod->mem[].base segments.
+ * If the relocation fails to resolve (e.g. unknown reloc type), .anchor
+ * stays zero and lookups silently degrade to "no annotation".
+ *
+ * Each per-section sub-table is laid out as a stand-alone
+ * mod_lineinfo_header followed by parallel arrays:
+ *
+ *   struct mod_lineinfo_header     (16 bytes)
+ *   u32 addrs[num_entries]         -- offsets from this section's base, sorted
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
+typedef uint64_t u64;
+#endif
+
+/*
+ * Per-section descriptor.  One entry per ELF text section covered by the
+ * blob (.text, .exit.text, .init.text, ...).
+ */
+struct mod_lineinfo_section {
+	u64 anchor;		/* RELOC: runtime base of covered section, or 0 */
+	u32 size;		/* covered section size in bytes */
+	u32 table_offset;	/* byte offset from blob start to this section's
+				 * mod_lineinfo_header */
+};
+
+/*
+ * Top-level header.  Sits at offset 0 of every .mod_lineinfo /
+ * .init.mod_lineinfo section.  The compiler inserts 4 bytes of trailing
+ * padding so the u64 anchor in sections[0] starts 8-byte aligned.
+ */
+struct mod_lineinfo_root {
+	u32 num_sections;
+	struct mod_lineinfo_section sections[];
+};
+
+struct mod_lineinfo_header {
+	u32 num_entries;
+	u32 num_files;
+	u32 filenames_size;	/* total bytes of concatenated filenames */
+};
+
+/* Offset helpers: compute byte offset from the per-section header to each array. */
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
index 7566815fabbe8b..2bc0263b086d27 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -507,6 +507,12 @@ struct module {
 	void *btf_data;
 	void *btf_base_data;
 #endif
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	void *lineinfo_data;		/* .mod_lineinfo section in MOD_RODATA */
+	unsigned int lineinfo_data_size;
+	void *init_lineinfo_data;	/* .init.mod_lineinfo, NULL after init runs */
+	unsigned int init_lineinfo_data_size;
+#endif
 #ifdef CONFIG_JUMP_LABEL
 	struct jump_entry *jump_entries;
 	unsigned int num_jump_entries;
@@ -1020,6 +1026,39 @@ static inline unsigned long find_kallsyms_symbol_value(struct module *mod,
 
 #endif  /* CONFIG_MODULES && CONFIG_KALLSYMS */
 
+bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
+			    const char **file, unsigned int *line);
+
+/*
+ * Reader accessors so callers don't need to duplicate the
+ * CONFIG_KALLSYMS_LINEINFO_MODULES guard around mod->lineinfo_data /
+ * mod->init_lineinfo_data field access.  Setters/clearers in the loader
+ * use the field directly under a matching #ifdef.
+ */
+static inline void *module_lineinfo_data(const struct module *mod,
+					 unsigned int *size)
+{
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	*size = mod->lineinfo_data_size;
+	return mod->lineinfo_data;
+#else
+	*size = 0;
+	return NULL;
+#endif
+}
+
+static inline void *module_init_lineinfo_data(const struct module *mod,
+					      unsigned int *size)
+{
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	*size = READ_ONCE(mod->init_lineinfo_data_size);
+	return READ_ONCE(mod->init_lineinfo_data);
+#else
+	*size = 0;
+	return NULL;
+#endif
+}
+
 /* Define __free(module_put) macro for struct module *. */
 DEFINE_FREE(module_put, struct module *, if (_T) module_put(_T))
 
diff --git a/init/Kconfig b/init/Kconfig
index f004cf9a69d40a..79975a6e67c21b 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2102,8 +2102,23 @@ config KALLSYMS_LINEINFO
 	    anon_vma_clone+0x2ed/0xcf0 (mm/rmap.c:412)
 
 	  This requires elfutils (libdw-dev/elfutils-devel) on the build host.
-	  Adds approximately 44MB to a typical kernel image (10 bytes per
-	  DWARF line-table entry, ~4.6M entries for a typical config).
+	  Adds approximately 10-15MB to a typical kernel image (~2-3 bytes
+	  per entry after delta compression, ~4.6M entries for a typical
+	  config).
+
+	  If unsure, say N.
+
+config KALLSYMS_LINEINFO_MODULES
+	bool "Embed source file:line information in module stack traces"
+	depends on KALLSYMS_LINEINFO && MODULES
+	help
+	  Extends KALLSYMS_LINEINFO to loadable kernel modules.  Each .ko
+	  gets a lineinfo table generated from its DWARF data at build time,
+	  so stack traces from module code include (file.c:123) annotations.
+
+	  Requires elfutils (libdw-dev/elfutils-devel) on the build host.
+	  Increases .ko sizes by approximately 2-3 bytes per DWARF line
+	  entry after delta compression.
 
 	  If unsure, say N.
 
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 1e3f527b13988b..d95387f51b4c08 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -551,12 +551,24 @@ static int __sprint_symbol(char *buffer, unsigned long address,
 	 * replaced with bar()"); appending lineinfo there would produce a
 	 * confusing "foo (file:line)()".
 	 */
-	if (add_lineinfo && IS_ENABLED(CONFIG_KALLSYMS_LINEINFO) && !modname) {
+	if (add_lineinfo && IS_ENABLED(CONFIG_KALLSYMS_LINEINFO)) {
 		const char *li_file;
 		unsigned int li_line;
+		bool found = false;
+
+		if (!modname) {
+			found = kallsyms_lookup_lineinfo(address,
+							 &li_file, &li_line);
+		} else if (IS_ENABLED(CONFIG_KALLSYMS_LINEINFO_MODULES)) {
+			struct module *mod = __module_address(address);
+
+			if (mod)
+				found = module_lookup_lineinfo(mod, address,
+							       &li_file,
+							       &li_line);
+		}
 
-		if (kallsyms_lookup_lineinfo(address,
-					     &li_file, &li_line))
+		if (found)
 			len += snprintf(buffer + len, KSYM_SYMBOL_LEN - len,
 					" (%s:%u)", li_file, li_line);
 	}
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index 0fc11e45df9b91..819d6594c29371 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -494,3 +494,184 @@ int module_kallsyms_on_each_symbol(const char *modname,
 	mutex_unlock(&module_mutex);
 	return ret;
 }
+
+#include <linux/mod_lineinfo.h>
+
+/*
+ * Search one per-section sub-table for @section_offset using flat parallel
+ * arrays.  @hdr is the per-section header at byte offset @hdr_offset within
+ * @blob.  Returns true on hit and populates @file / @line.
+ */
+static bool module_lookup_lineinfo_section(const void *blob, u32 blob_size,
+					   u32 hdr_offset,
+					   unsigned int section_offset,
+					   const char **file,
+					   unsigned int *line)
+{
+	const struct mod_lineinfo_header *hdr;
+	const u8 *base;
+	const u32 *addrs, *lines, *file_offsets;
+	const u16 *file_ids;
+	const char *filenames;
+	u32 num_entries, num_files, filenames_size;
+	unsigned int low, high, mid;
+	u16 file_id;
+
+	if (hdr_offset > blob_size ||
+	    blob_size - hdr_offset < sizeof(*hdr))
+		return false;
+
+	base = (const u8 *)blob + hdr_offset;
+	hdr = (const struct mod_lineinfo_header *)base;
+	num_entries = hdr->num_entries;
+	num_files = hdr->num_files;
+	filenames_size = hdr->filenames_size;
+
+	if (num_entries == 0)
+		return false;
+
+	/*
+	 * Validate counts before multiplying — sizing arithmetic could
+	 * otherwise overflow on 32-bit with a malformed blob.  Each entry
+	 * contributes one u32 (addrs), one u16 (file_ids), and one u32
+	 * (lines); each file contributes one u32 (file_offsets).
+	 */
+	{
+		u32 avail = blob_size - hdr_offset;
+		u32 needed = mod_lineinfo_filenames_off(num_entries, num_files);
+
+		if (num_entries > U32_MAX / sizeof(u32))
+			return false;
+		if (num_files > U32_MAX / sizeof(u32))
+			return false;
+		if (needed > avail || filenames_size > avail - needed)
+			return false;
+	}
+
+	/*
+	 * Filenames are read as NUL-terminated C strings.  Require the blob
+	 * to end in NUL so a malformed file_offsets entry can never lead the
+	 * later "%s" consumer past the end of the section.
+	 */
+	if (filenames_size == 0 ||
+	    base[mod_lineinfo_filenames_off(num_entries, num_files) +
+		 filenames_size - 1] != 0)
+		return false;
+
+	addrs = (const u32 *)(base + mod_lineinfo_addrs_off());
+	file_ids = (const u16 *)(base + mod_lineinfo_file_ids_off(num_entries));
+	lines = (const u32 *)(base + mod_lineinfo_lines_off(num_entries));
+	file_offsets = (const u32 *)(base + mod_lineinfo_file_offsets_off(num_entries));
+	filenames = (const char *)(base + mod_lineinfo_filenames_off(num_entries, num_files));
+
+	/* Binary search for largest entry <= section_offset. */
+	low = 0;
+	high = num_entries;
+	while (low < high) {
+		mid = low + (high - low) / 2;
+		if (addrs[mid] <= section_offset)
+			low = mid + 1;
+		else
+			high = mid;
+	}
+
+	if (low == 0)
+		return false;
+	low--;
+
+	file_id = file_ids[low];
+	if (file_id >= num_files)
+		return false;
+	if (file_offsets[file_id] >= filenames_size)
+		return false;
+
+	*file = &filenames[file_offsets[file_id]];
+	*line = lines[low];
+	return true;
+}
+
+/*
+ * Walk a single .mod_lineinfo / .init.mod_lineinfo blob, find the section
+ * descriptor whose [anchor, anchor+size) range contains @addr, then search
+ * that section's sub-table.
+ */
+static bool module_lookup_lineinfo_blob(const void *blob, u32 blob_size,
+					unsigned long addr,
+					const char **file, unsigned int *line)
+{
+	const struct mod_lineinfo_root *root;
+	u32 i, sections_end;
+
+	if (!blob || blob_size < sizeof(*root))
+		return false;
+
+	root = blob;
+	if (root->num_sections == 0)
+		return false;
+
+	if (root->num_sections > U32_MAX / sizeof(struct mod_lineinfo_section))
+		return false;
+	sections_end = sizeof(*root) +
+		       root->num_sections * sizeof(struct mod_lineinfo_section);
+	if (sections_end > blob_size)
+		return false;
+
+	for (i = 0; i < root->num_sections; i++) {
+		const struct mod_lineinfo_section *s = &root->sections[i];
+		unsigned long base = (unsigned long)s->anchor;
+		unsigned long offset;
+
+		if (!base)
+			continue;	/* relocation didn't resolve */
+		if (addr < base)
+			continue;
+		offset = addr - base;
+		if (offset >= s->size)
+			continue;
+		if (offset > U32_MAX)
+			continue;
+
+		return module_lookup_lineinfo_section(blob, blob_size,
+						      s->table_offset,
+						      (unsigned int)offset,
+						      file, line);
+	}
+
+	return false;
+}
+
+/*
+ * Look up source file:line for an address within a loaded module.
+ *
+ * Safe in NMI/panic context: no locks, no allocations.
+ * Caller must hold RCU read lock (or be in a context where the module
+ * cannot be unloaded).
+ */
+bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
+			    const char **file, unsigned int *line)
+{
+	const void *blob;
+	unsigned int size;
+
+	if (!IS_ENABLED(CONFIG_KALLSYMS_LINEINFO_MODULES))
+		return false;
+
+	blob = module_lineinfo_data(mod, &size);
+	if (blob && module_lookup_lineinfo_blob(blob, size, addr, file, line))
+		return true;
+
+	/*
+	 * The init blob lives in MOD_INIT_RODATA and is revoked by
+	 * do_init_module() before do_free_init() releases the memory.  The
+	 * READ_ONCE inside module_init_lineinfo_data() pairs with the
+	 * WRITE_ONCE in do_init_module so we never see a partial
+	 * pointer/size pair, and an RCU grace period in do_free_init()
+	 * guarantees the memory still exists for the duration of any lookup
+	 * that captured the pointer before the revocation.
+	 */
+	blob = module_init_lineinfo_data(mod, &size);
+	if (blob && module_lookup_lineinfo_blob(blob, size, addr, file, line))
+		return true;
+
+	return false;
+}
diff --git a/kernel/module/main.c b/kernel/module/main.c
index 46dd8d25a6058e..46bb2bf799d1ee 100644
--- a/kernel/module/main.c
+++ b/kernel/module/main.c
@@ -2712,6 +2712,19 @@ static int find_module_sections(struct module *mod, struct load_info *info)
 	mod->btf_base_data = any_section_objs(info, ".BTF.base", 1,
 					      &mod->btf_base_data_size);
 #endif
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	/*
+	 * Use section_objs() (not any_section_objs) — both blobs carry an
+	 * ELF anchor relocation that the module loader resolves via its
+	 * standard apply_relocations() pass, which only walks SHF_ALLOC
+	 * sections.  Picking up a non-ALLOC section here would also leave
+	 * the pointer dangling into the temporary load image once freed.
+	 */
+	mod->lineinfo_data = section_objs(info, ".mod_lineinfo", 1,
+					  &mod->lineinfo_data_size);
+	mod->init_lineinfo_data = section_objs(info, ".init.mod_lineinfo", 1,
+					       &mod->init_lineinfo_data_size);
+#endif
 #ifdef CONFIG_JUMP_LABEL
 	mod->jump_entries = section_objs(info, "__jump_table",
 					sizeof(*mod->jump_entries),
@@ -3165,6 +3178,19 @@ static noinline int do_init_module(struct module *mod)
 	/* .BTF is not SHF_ALLOC and will get removed, so sanitize pointers */
 	mod->btf_data = NULL;
 	mod->btf_base_data = NULL;
+#endif
+#ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	/*
+	 * .init.mod_lineinfo lives in MOD_INIT_RODATA which do_free_init() is
+	 * about to release.  Clear the pointer so concurrent stack-trace
+	 * lookups stop dereferencing it; do_free_init()'s synchronize_rcu()
+	 * then waits out any reader that already captured the old pointer.
+	 * WRITE_ONCE pairs with the READ_ONCE inside module_init_lineinfo_data()
+	 * so the compiler can't tear or reorder the revocation across the
+	 * llist_add() that follows.
+	 */
+	WRITE_ONCE(mod->init_lineinfo_data, NULL);
+	WRITE_ONCE(mod->init_lineinfo_data_size, 0);
 #endif
 	/*
 	 * We want to free module_init, but be aware that kallsyms may be
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 01a37ec872b905..2cdd76becb4d52 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -46,11 +46,17 @@ quiet_cmd_btf_ko = BTF [M] $@
 		$(CONFIG_SHELL) $(srctree)/scripts/gen-btf.sh --btf_base $(objtree)/vmlinux $@; \
 	fi;
 
+quiet_cmd_lineinfo_ko = LINEINFO [M] $@
+      cmd_lineinfo_ko = $(CONFIG_SHELL) $(srctree)/scripts/gen-mod-lineinfo.sh $@
+
 # Re-generate module BTFs if either module's .ko or vmlinux changed
 %.ko: %.o %.mod.o .module-common.o $(objtree)/scripts/module.lds $(and $(CONFIG_DEBUG_INFO_BTF_MODULES),$(KBUILD_BUILTIN),$(objtree)/vmlinux) FORCE
 	+$(call if_changed,ld_ko_o)
 ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 	+$(if $(newer-prereqs),$(call cmd,btf_ko))
+endif
+ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
+	+$(if $(newer-prereqs),$(call cmd,lineinfo_ko))
 endif
 	+$(call cmd,check_tracepoint)
 
diff --git a/scripts/gen-mod-lineinfo.sh b/scripts/gen-mod-lineinfo.sh
new file mode 100644
index 00000000000000..832d290f3bf4cb
--- /dev/null
+++ b/scripts/gen-mod-lineinfo.sh
@@ -0,0 +1,50 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+#
+# gen-mod-lineinfo.sh - Embed source line info into a kernel module (.ko)
+#
+# Reads DWARF from the .ko, generates a .mod_lineinfo section that contains
+# an ELF relocation against the module's .text section symbol, and partial-
+# links the result back into the .ko via "ld -r" so the relocation rides
+# along to the module loader.  Modeled on scripts/gen-btf.sh.
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
+	rm -f "${KO}.lineinfo.S" "${KO}.lineinfo.o" "${KO}.lineinfo.tmp"
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
+if ! ${objtree}/scripts/gen_lineinfo --module "${KO}" > "${KO}.lineinfo.S"; then
+	exit 0
+fi
+
+# Compile assembly to object file
+${CC} ${NOSTDINC_FLAGS} ${LINUXINCLUDE} ${KBUILD_CPPFLAGS} \
+	${KBUILD_AFLAGS} ${KBUILD_AFLAGS_MODULE} \
+	-c -o "${KO}.lineinfo.o" "${KO}.lineinfo.S"
+
+# Partial-link lineinfo.o INTO the .ko.  Order matters: lineinfo.o must come
+# FIRST so its empty .text contributes 0 bytes at offset 0 of the merged
+# .text, which keeps the .quad .text relocation (against lineinfo.o's local
+# .text symbol, which after merge points at offset 0 of merged .text)
+# resolving to the start of the module's .text.  Reversing inputs here
+# silently breaks lookup correctness.
+${LD} -r "${KO}.lineinfo.o" "${KO}" -o "${KO}.lineinfo.tmp"
+mv "${KO}.lineinfo.tmp" "${KO}"
+
+exit 0
diff --git a/scripts/gen_lineinfo.c b/scripts/gen_lineinfo.c
index 699e760178f094..e1e08469b4f2fd 100644
--- a/scripts/gen_lineinfo.c
+++ b/scripts/gen_lineinfo.c
@@ -24,16 +24,66 @@
 #include <gelf.h>
 #include <limits.h>
 
+#include "../include/linux/mod_lineinfo.h"
+
+static int module_mode;
+
 static unsigned int skipped_overflow;
 
+/* Target ELF traits, captured once in main() and reused at emit time. */
+static bool target_64bit;
+static bool target_le;
+
 /*
- * vmlinux mode: end of the invariant .text region.  Zero means "no cap"
- * (graceful fallback when _etext is absent on some build).
+ * Vmlinux mode only: address range of the *invariant* .text region.
+ * See find_text_end_addr() for why we cap on _etext.  text_end_addr == 0
+ * means "no cap available; capture everything above text_addr" (v3
+ * behavior, used as graceful fallback if _etext is absent).
  */
 static unsigned long long text_end_addr;
 
+/*
+ * In module mode we cover several text-like sections, split across two
+ * output blobs by lifecycle:
+ *
+ *   .mod_lineinfo      -- persistent code (.text, .exit.text); MOD_RODATA
+ *   .init.mod_lineinfo -- init code (.init.text); freed with init memory
+ *
+ * In ET_REL .ko files .text/.init.text/.exit.text all have sh_addr == 0,
+ * so DWARF line addresses (which become sh_addr + addend after relocation)
+ * collide across sections.  We disambiguate by giving each *present*
+ * covered section a unique synthetic "bias" — a u32 base address — and
+ * adding that bias to relocated values inside apply_debug_line_relocations.
+ * libdw then yields biased addresses that classify_address() can map back
+ * to a single section unambiguously.  The bias is internal to gen_lineinfo
+ * and never leaks into the emitted blob.
+ */
+enum mod_lineinfo_blob {
+	BLOB_PERSISTENT,
+	BLOB_INIT,
+	NUM_BLOBS,
+};
+
+struct covered_section {
+	const char *name;	/* ELF section name (e.g. ".text") */
+	enum mod_lineinfo_blob blob;
+	unsigned long long bias;/* synthetic base address (set in resolve_*) */
+	unsigned long long size;
+	bool present;		/* found in this .ko */
+	unsigned int sec_index;	/* ELF section header index, for reloc matching */
+	unsigned int n_entries;	/* DWARF line entries collected for this section */
+};
+
+static struct covered_section all_sections[] = {
+	{ .name = ".text",      .blob = BLOB_PERSISTENT },
+	{ .name = ".exit.text", .blob = BLOB_PERSISTENT },
+	{ .name = ".init.text", .blob = BLOB_INIT },
+};
+#define ALL_SECTIONS	(sizeof(all_sections) / sizeof(all_sections[0]))
+
 struct line_entry {
-	unsigned int offset;	/* offset from _text */
+	unsigned int offset;	/* offset from covered section's start */
+	unsigned int section_id;/* index into covered_sections[] (module mode only) */
 	unsigned int file_id;
 	unsigned int line;
 };
@@ -52,7 +102,12 @@ static struct file_entry *files;
 static unsigned int num_files;
 static unsigned int files_capacity;
 
-#define FILE_HASH_BITS 13
+/*
+ * Hash size must comfortably exceed the 65535-file cap below so the open
+ * addressing in find_or_add_file() always has a free slot to land on.
+ * 17 bits = 131072 entries gives ~50% max load factor.
+ */
+#define FILE_HASH_BITS 17
 #define FILE_HASH_SIZE (1 << FILE_HASH_BITS)
 
 struct file_hash_entry {
@@ -71,8 +126,8 @@ static unsigned int hash_str(const char *s)
 	return h & (FILE_HASH_SIZE - 1);
 }
 
-static void add_entry(unsigned int offset, unsigned int file_id,
-		      unsigned int line)
+static void add_entry(unsigned int offset, unsigned int section_id,
+		      unsigned int file_id, unsigned int line)
 {
 	if (num_entries >= entries_capacity) {
 		entries_capacity = entries_capacity ? entries_capacity * 2 : 65536;
@@ -83,6 +138,7 @@ static void add_entry(unsigned int offset, unsigned int file_id,
 		}
 	}
 	entries[num_entries].offset = offset;
+	entries[num_entries].section_id = section_id;
 	entries[num_entries].file_id = file_id;
 	entries[num_entries].line = line;
 	num_entries++;
@@ -155,27 +211,25 @@ static const char *make_relative(const char *path, const char *comp_dir)
 {
 	const char *p;
 
-	/* If already relative, use as-is */
-	if (path[0] != '/')
-		return path;
-
-	/* comp_dir from DWARF is the most reliable method */
-	if (comp_dir) {
-		size_t len = strlen(comp_dir);
-
-		if (!strncmp(path, comp_dir, len) && path[len] == '/') {
-			const char *rel = path + len + 1;
-
-			/*
-			 * If comp_dir pointed to a subdirectory
-			 * (e.g. arch/parisc/kernel) rather than
-			 * the tree root, stripping it leaves a
-			 * bare filename.  Fall through to the
-			 * kernel_dirs scan so we recover the full
-			 * relative path instead.
-			 */
-			if (strchr(rel, '/'))
-				return rel;
+	if (path[0] == '/') {
+		/* Try comp_dir prefix from DWARF */
+		if (comp_dir) {
+			size_t len = strlen(comp_dir);
+
+			if (!strncmp(path, comp_dir, len) && path[len] == '/') {
+				const char *rel = path + len + 1;
+
+				/*
+				 * If comp_dir pointed to a subdirectory
+				 * (e.g. arch/parisc/kernel) rather than
+				 * the tree root, stripping it leaves a
+				 * bare filename.  Fall through to the
+				 * kernel_dirs scan so we recover the full
+				 * relative path instead.
+				 */
+				if (strchr(rel, '/'))
+					return rel;
+			}
 		}
 
 		/*
@@ -201,9 +255,42 @@ static const char *make_relative(const char *path, const char *comp_dir)
 		return p ? p + 1 : path;
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
+		size_t mid = len / 2;
+
+		if (len > 1 && path[mid] == '/' &&
+		    !memcmp(path, path + mid + 1, mid))
+			return path + mid + 1;
+	}
+
+	/*
+	 * Bare filename with no directory component — try to recover the
+	 * relative path using comp_dir.  Some toolchains/elfutils combos
+	 * produce bare filenames where comp_dir holds the source directory.
+	 * Construct the absolute path and run the kernel_dirs scan.
+	 */
+	if (!strchr(path, '/') && comp_dir && comp_dir[0] == '/') {
+		static char buf[PATH_MAX];
+
+		snprintf(buf, sizeof(buf), "%s/%s", comp_dir, path);
+		for (p = buf + 1; *p; p++) {
+			if (*(p - 1) == '/') {
+				for (unsigned int i = 0; i < sizeof(kernel_dirs) /
+				     sizeof(kernel_dirs[0]); i++) {
+					if (!strncmp(p, kernel_dirs[i],
+						     strlen(kernel_dirs[i])))
+						return p;
+				}
+			}
+		}
+	}
+
+	return path;
 }
 
 static int compare_entries(const void *a, const void *b)
@@ -211,6 +298,9 @@ static int compare_entries(const void *a, const void *b)
 	const struct line_entry *ea = a;
 	const struct line_entry *eb = b;
 
+	/* Group by section first so each per-section table is contiguous. */
+	if (ea->section_id != eb->section_id)
+		return ea->section_id < eb->section_id ? -1 : 1;
 	if (ea->offset != eb->offset)
 		return ea->offset < eb->offset ? -1 : 1;
 	if (ea->file_id != eb->file_id)
@@ -222,7 +312,8 @@ static int compare_entries(const void *a, const void *b)
 
 /*
  * Look up a vmlinux symbol by exact name and return its st_value, or
- * @fallback if absent.  Aborts when @required and the symbol is missing.
+ * @fallback if the symbol is absent (lets callers gracefully skip
+ * optional bounds like _etext).
  */
 static unsigned long long find_vmlinux_sym(Elf *elf, const char *name,
 					   unsigned long long fallback,
@@ -270,22 +361,325 @@ static unsigned long long find_text_addr(Elf *elf)
 }
 
 /*
- * vmlinux is linked in multiple passes: gen_lineinfo runs against
- * .tmp_vmlinux1 (which carries an empty lineinfo stub), then real tables
- * are linked in for the final image.  Sections placed AFTER .rodata
- * (.init.text, .exit.text, ...) shift forward as .rodata grows to hold
- * the real lineinfo blob, so DWARF addresses we'd capture for them in
- * pass 1 would be stale in the final kernel.  Cap captured addresses at
- * _etext, the symbol that marks the end of .text — placed before .rodata
- * in every architecture's vmlinux.lds.S, so its addresses are invariant
- * across the relink.  Returns 0 if _etext is absent (no cap; v3 behavior).
+ * Vmlinux is linked in multiple passes: gen_lineinfo runs against
+ * .tmp_vmlinux1 (which carries the empty lineinfo stub), and the resulting
+ * tables are then linked into the final vmlinux.  Sections placed AFTER
+ * .rodata (.init.text, .exit.text, ...) shift forward as the real lineinfo
+ * tables replace the empty stub, so DWARF addresses we'd capture for them
+ * here are stale by the time the kernel runs.
+ *
+ * Cap the captured range at _etext, the symbol that marks the end of the
+ * .text section.  .text is placed BEFORE .rodata in every architecture's
+ * vmlinux.lds.S, so its addresses are invariant across the relink.
+ * Returns 0 on architectures or builds that don't expose _etext, in which
+ * case the cap is disabled (preserving the v3 behavior — addresses past
+ * .text remain captured but may be off in stack traces).
  */
 static unsigned long long find_text_end_addr(Elf *elf)
 {
 	return find_vmlinux_sym(elf, "_etext", 0, false);
 }
 
-static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
+/*
+ * Populate @sections[].present/sec_index/size/bias.  Sections that don't
+ * exist stay marked absent.  Biases are assigned in array order: each
+ * present section gets a base equal to the running total of preceding
+ * present sections' sizes, rounded up to 16 to keep ranges sparse.  This
+ * guarantees [bias, bias+size) ranges are pairwise disjoint and fit in
+ * u32 as long as the sum of all covered text sizes is below 4 GiB.
+ */
+static void resolve_covered_sections(Elf *elf,
+				     struct covered_section *sections,
+				     unsigned int num_sections)
+{
+	Elf_Scn *scn = NULL;
+	GElf_Shdr shdr;
+	size_t shstrndx;
+	unsigned long long cursor = 0;
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
+		if (!name)
+			continue;
+		for (unsigned int i = 0; i < num_sections; i++) {
+			if (sections[i].present)
+				continue;
+			if (strcmp(name, sections[i].name))
+				continue;
+			if (shdr.sh_size > UINT_MAX) {
+				fprintf(stderr,
+					"lineinfo: section %s exceeds 4 GiB (size=%llu); skipping\n",
+					name,
+					(unsigned long long)shdr.sh_size);
+				break;
+			}
+			sections[i].sec_index = elf_ndxscn(scn);
+			sections[i].size = shdr.sh_size;
+			sections[i].present = true;
+			break;
+		}
+	}
+
+	/* Pack present sections into non-overlapping bias ranges. */
+	for (unsigned int i = 0; i < num_sections; i++) {
+		if (!sections[i].present)
+			continue;
+		sections[i].bias = cursor;
+		cursor += sections[i].size;
+		cursor = (cursor + 15) & ~15ULL;	/* pad for separation */
+	}
+}
+
+/* Look up a covered_section by ELF section header index. */
+static struct covered_section *section_by_index(struct covered_section *sections,
+						unsigned int num_sections,
+						unsigned int sec_index)
+{
+	for (unsigned int i = 0; i < num_sections; i++) {
+		if (sections[i].present && sections[i].sec_index == sec_index)
+			return &sections[i];
+	}
+	return NULL;
+}
+
+/*
+ * Apply .rela.debug_line relocations to a mutable copy of .debug_line data.
+ *
+ * elfutils libdw (through at least 0.194) does NOT apply relocations for
+ * ET_REL files when using dwarf_begin_elf().  The internal libdwfl layer
+ * does this via __libdwfl_relocate(), but that API is not public.
+ *
+ * For DWARF5, the .debug_line file name table uses DW_FORM_line_strp
+ * references into .debug_line_str.  Without relocation, all these offsets
+ * resolve to 0 (or garbage), causing dwarf_linesrc()/dwarf_filesrc() to
+ * return wrong filenames (typically the comp_dir for every file).
+ *
+ * This function applies the relocations manually so that the patched
+ * .debug_line data can be fed to dwarf_begin_elf() and produce correct
+ * results.
+ *
+ * See elfutils bug https://sourceware.org/bugzilla/show_bug.cgi?id=31447
+ * A fix (dwelf_elf_apply_relocs) was proposed but not yet merged as of
+ * elfutils 0.194: https://sourceware.org/pipermail/elfutils-devel/2024q3/007388.html
+ */
+/*
+ * Determine the relocation type for a 32-bit absolute reference
+ * on the given architecture.  Returns 0 if unknown.
+ */
+static unsigned int r_type_abs32(unsigned int e_machine)
+{
+	switch (e_machine) {
+	case EM_X86_64:		return R_X86_64_32;
+	case EM_386:		return R_386_32;
+	case EM_AARCH64:	return R_AARCH64_ABS32;
+	case EM_ARM:		return R_ARM_ABS32;
+	case EM_RISCV:		return R_RISCV_32;
+	case EM_S390:		return R_390_32;
+	case EM_MIPS:		return R_MIPS_32;
+	case EM_PPC64:		return R_PPC64_ADDR32;
+	case EM_PPC:		return R_PPC_ADDR32;
+	case EM_LOONGARCH:	return R_LARCH_32;
+	case EM_PARISC:		return R_PARISC_DIR32;
+	default:		return 0;
+	}
+}
+
+/*
+ * Determine the relocation type for a 64-bit absolute reference
+ * on the given architecture.  Returns 0 on 32-bit-only architectures
+ * (where DW_LNE_set_address fits in 32 bits and r_type_abs32 covers it).
+ */
+static unsigned int r_type_abs64(unsigned int e_machine)
+{
+	switch (e_machine) {
+	case EM_X86_64:		return R_X86_64_64;
+	case EM_AARCH64:	return R_AARCH64_ABS64;
+	case EM_RISCV:		return R_RISCV_64;
+	case EM_S390:		return R_390_64;
+	case EM_MIPS:		return R_MIPS_64;
+	case EM_PPC64:		return R_PPC64_ADDR64;
+	case EM_LOONGARCH:	return R_LARCH_64;
+	case EM_PARISC:		return R_PARISC_DIR64;
+	default:		return 0;
+	}
+}
+
+/*
+ * Write a 4- or 8-byte unsigned integer in target byte order.
+ * Cross-builds (e.g. x86_64 host -> s390 module) need the patched
+ * .debug_line bytes laid out per the .ko's e_ident[EI_DATA], not the host's.
+ */
+static void elf_write_uint(unsigned char *dst, uint64_t value, size_t size,
+			   bool little_endian)
+{
+	if (little_endian) {
+		for (size_t i = 0; i < size; i++)
+			dst[i] = (value >> (i * 8)) & 0xff;
+	} else {
+		for (size_t i = 0; i < size; i++)
+			dst[i] = (value >> ((size - 1 - i) * 8)) & 0xff;
+	}
+}
+
+static void apply_debug_line_relocations(Elf *elf)
+{
+	Elf_Scn *scn = NULL;
+	Elf_Scn *debug_line_scn = NULL;
+	Elf_Scn *rela_debug_line_scn = NULL;
+	Elf_Scn *symtab_scn = NULL;
+	GElf_Shdr shdr;
+	GElf_Ehdr ehdr;
+	unsigned int abs32_type, abs64_type;
+	bool target_le;
+	size_t shstrndx;
+	Elf_Data *dl_data, *rela_data, *sym_data;
+	GElf_Shdr rela_shdr, sym_shdr;
+	size_t nrels, i;
+
+	if (gelf_getehdr(elf, &ehdr) == NULL)
+		return;
+
+	abs32_type = r_type_abs32(ehdr.e_machine);
+	abs64_type = r_type_abs64(ehdr.e_machine);
+	if (!abs32_type && !abs64_type)
+		return;
+	target_le = (ehdr.e_ident[EI_DATA] == ELFDATA2LSB);
+
+	if (elf_getshdrstrndx(elf, &shstrndx) != 0)
+		return;
+
+	/* Find the relevant sections */
+	while ((scn = elf_nextscn(elf, scn)) != NULL) {
+		const char *name;
+
+		if (!gelf_getshdr(scn, &shdr))
+			continue;
+		name = elf_strptr(elf, shstrndx, shdr.sh_name);
+		if (!name)
+			continue;
+
+		if (!strcmp(name, ".debug_line"))
+			debug_line_scn = scn;
+		else if (!strcmp(name, ".rela.debug_line"))
+			rela_debug_line_scn = scn;
+		else if (shdr.sh_type == SHT_SYMTAB)
+			symtab_scn = scn;
+	}
+
+	if (!debug_line_scn || !rela_debug_line_scn || !symtab_scn)
+		return;
+
+	dl_data = elf_getdata(debug_line_scn, NULL);
+	rela_data = elf_getdata(rela_debug_line_scn, NULL);
+	sym_data = elf_getdata(symtab_scn, NULL);
+	if (!dl_data || !rela_data || !sym_data)
+		return;
+
+	if (!gelf_getshdr(rela_debug_line_scn, &rela_shdr))
+		return;
+	if (!gelf_getshdr(symtab_scn, &sym_shdr))
+		return;
+
+	nrels = rela_shdr.sh_size / rela_shdr.sh_entsize;
+
+	for (i = 0; i < nrels; i++) {
+		GElf_Rela rela;
+		GElf_Sym sym;
+		unsigned int r_type;
+		size_t r_sym;
+		bool is_abs64;
+
+		if (!gelf_getrela(rela_data, i, &rela))
+			continue;
+
+		r_type = GELF_R_TYPE(rela.r_info);
+		r_sym = GELF_R_SYM(rela.r_info);
+
+		/*
+		 * Two reloc widths matter for .debug_line:
+		 *   abs32 - DW_FORM_line_strp file-table refs into .debug_line_str
+		 *   abs64 - DW_LNE_set_address arguments (sequence start PCs)
+		 * Without both, libdw sees zeros and reports wrong filenames or
+		 * collapses every sequence to address 0 (collision after dedup).
+		 */
+		if (abs32_type && r_type == abs32_type) {
+			is_abs64 = false;
+		} else if (abs64_type && r_type == abs64_type) {
+			is_abs64 = true;
+		} else {
+			continue;
+		}
+
+		if (!gelf_getsym(sym_data, r_sym, &sym))
+			continue;
+
+		size_t width = is_abs64 ? 8 : 4;
+		uint64_t value = (uint64_t)(sym.st_value + rela.r_addend);
+
+		/*
+		 * If the relocation targets one of our covered text sections,
+		 * fold in that section's synthetic bias so the patched DWARF
+		 * address lands in a unique numeric range.  String-ref relocs
+		 * (DW_FORM_line_strp into .debug_line_str) target a different
+		 * section, so the symbol-based check correctly excludes them
+		 * from biasing — for both abs64 (64-bit ELF) and abs32 (32-bit
+		 * ELF, where DW_LNE_set_address is also 4 bytes wide).
+		 */
+		if (module_mode) {
+			struct covered_section *cs;
+
+			cs = section_by_index(all_sections, ALL_SECTIONS,
+					      sym.st_shndx);
+			if (cs)
+				value += cs->bias;
+		}
+
+		if (!is_abs64)
+			value &= 0xffffffffULL;
+
+		if (rela.r_offset + width <= dl_data->d_size)
+			elf_write_uint((unsigned char *)dl_data->d_buf +
+					       rela.r_offset,
+				       value, width, target_le);
+	}
+}
+
+/*
+ * Decide which covered_section a (biased) DWARF address belongs to.
+ * apply_debug_line_relocations() has already added the section's bias to
+ * each line-program PC, so [bias, bias+size) ranges are pairwise disjoint
+ * and a simple linear scan picks the right bucket.  Returns the index
+ * within @sections, or @num_sections if @addr falls outside every
+ * present range (caller skips the entry).
+ */
+static unsigned int classify_address(struct covered_section *sections,
+				     unsigned int num_sections,
+				     unsigned long long addr,
+				     unsigned long long *out_offset)
+{
+	for (unsigned int i = 0; i < num_sections; i++) {
+		if (!sections[i].present)
+			continue;
+		if (addr < sections[i].bias)
+			continue;
+		if (addr >= sections[i].bias + sections[i].size)
+			continue;
+		*out_offset = addr - sections[i].bias;
+		return i;
+	}
+	return num_sections;
+}
+
+static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr,
+			  struct covered_section *sections,
+			  unsigned int num_sections)
 {
 	Dwarf_Off off = 0, next_off;
 	size_t hdr_size;
@@ -312,7 +706,8 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
 			Dwarf_Addr addr;
 			const char *src;
 			const char *rel;
-			unsigned int file_id, loffset;
+			unsigned int file_id, loffset, sec_id;
+			unsigned long long sec_off;
 			int lineno;
 
 			if (!line)
@@ -329,56 +724,87 @@ static void process_dwarf(Dwarf *dwarf, unsigned long long text_addr)
 			if (!src)
 				continue;
 
-			if (addr < text_addr)
-				continue;
-			/*
-			 * Skip addresses past _etext.  Sections after .rodata
-			 * shift when the real lineinfo replaces the empty stub
-			 * during the multi-pass vmlinux link, so any address
-			 * we'd capture there would be stale by the time the
-			 * final kernel runs.
-			 */
-			if (text_end_addr && addr >= text_end_addr)
-				continue;
-
-			{
-				unsigned long long raw_offset = addr - text_addr;
+			if (module_mode) {
+				/*
+				 * In ET_REL .ko files .text/.init.text/.exit.text
+				 * all share sh_addr == 0; classify_address picks
+				 * the right bucket from the explicit ranges we
+				 * captured.
+				 */
+				sec_id = classify_address(sections, num_sections,
+							  addr, &sec_off);
+				if (sec_id == num_sections)
+					continue;
+				if (sec_off > UINT_MAX) {
+					skipped_overflow++;
+					continue;
+				}
+				loffset = (unsigned int)sec_off;
+				sections[sec_id].n_entries++;
+			} else {
+				unsigned long long raw_offset;
 
+				if (addr < text_addr)
+					continue;
+				/*
+				 * Skip addresses past _etext.  Sections after
+				 * .rodata shift when the real lineinfo replaces
+				 * the empty stub during the multi-pass vmlinux
+				 * link, so any address we'd capture there would
+				 * be stale by the time the final kernel runs.
+				 */
+				if (text_end_addr && addr >= text_end_addr)
+					continue;
+				raw_offset = addr - text_addr;
 				if (raw_offset > UINT_MAX) {
 					skipped_overflow++;
 					continue;
 				}
 				loffset = (unsigned int)raw_offset;
+				sec_id = 0;
 			}
 
 			rel = make_relative(src, comp_dir);
 			file_id = find_or_add_file(rel);
 
-			add_entry(loffset, file_id, (unsigned int)lineno);
+			add_entry(loffset, sec_id, file_id, (unsigned int)lineno);
 		}
 next:
 		off = next_off;
 	}
 }
 
-static void deduplicate(void)
+static void deduplicate(struct covered_section *sections,
+			unsigned int num_sections)
 {
 	unsigned int i, j;
 
 	if (num_entries < 2)
 		return;
 
-	/* Sort by offset, then file_id, then line for stability */
+	/*
+	 * Sort by section_id, then offset, then file_id, line.  This groups
+	 * each section's entries contiguously so the per-section emit can
+	 * iterate a simple range, and ensures the binary search invariant
+	 * (offsets ascending) holds within each section.
+	 */
 	qsort(entries, num_entries, sizeof(*entries), compare_entries);
 
 	/*
-	 * Remove duplicate entries:
-	 * - Same offset: keep first (deterministic from stable sort keys)
-	 * - Same file:line as previous kept entry: redundant for binary
-	 *   search -- any address between them resolves to the earlier one
+	 * Remove duplicates.  Reset on a section_id boundary: the same offset
+	 * can legitimately appear in two different sections (they all start
+	 * at sh_addr 0 in ET_REL), and the "same as previous kept entry"
+	 * collapse is only meaningful inside one section's binary-search
+	 * domain.
 	 */
 	j = 0;
 	for (i = 1; i < num_entries; i++) {
+		if (entries[i].section_id != entries[j].section_id) {
+			j++;
+			if (j != i)
+				entries[j] = entries[i];
+			continue;
+		}
 		if (entries[i].offset == entries[j].offset)
 			continue;
 		if (entries[i].file_id == entries[j].file_id &&
@@ -389,6 +815,14 @@ static void deduplicate(void)
 			entries[j] = entries[i];
 	}
 	num_entries = j + 1;
+
+	/* Recompute per-section n_entries from the deduped array. */
+	if (sections) {
+		for (unsigned int k = 0; k < num_sections; k++)
+			sections[k].n_entries = 0;
+		for (i = 0; i < num_entries; i++)
+			sections[entries[i].section_id].n_entries++;
+	}
 }
 
 static void compute_file_offsets(void)
@@ -486,6 +920,199 @@ static void output_assembly(void)
 	printf("\n");
 }
 
+/*
+ * Emit one per-section table in the simple flat-array layout:
+ *
+ *   mod_lineinfo_header
+ *   addrs[count]    (u32, sorted)
+ *   file_ids[count] (u16) + 2-byte pad if count is odd
+ *   lines[count]    (u32)
+ *   file_offsets[]  (u32)
+ *   filenames[]
+ *
+ * @suffix uniquifies labels so multiple tables can coexist in one blob.
+ * Caller has sorted entries[] so this section's entries occupy [first,
+ * first + count).
+ */
+static void emit_section_table(unsigned int first, unsigned int count,
+			       const char *suffix)
+{
+	printf(".Lhdr%s:\n", suffix);
+	printf("\t.balign 4\n");
+	printf("\t.long %u\t\t/* num_entries */\n", count);
+	printf("\t.long %u\t\t/* num_files */\n", num_files);
+	printf("\t.long .Lfilenames_end%s - .Lfilenames%s\n\n", suffix, suffix);
+
+	/* addrs[] */
+	for (unsigned int i = 0; i < count; i++)
+		printf("\t.long 0x%x\n", entries[first + i].offset);
+
+	/* file_ids[] */
+	for (unsigned int i = 0; i < count; i++)
+		printf("\t.short %u\n", entries[first + i].file_id);
+	if (count & 1)
+		printf("\t.short 0\t\t/* pad to align lines[] */\n");
+
+	/* lines[] */
+	for (unsigned int i = 0; i < count; i++)
+		printf("\t.long %u\n", entries[first + i].line);
+
+	/* file_offsets[] */
+	printf("\t.balign 4\n");
+	for (unsigned int i = 0; i < num_files; i++)
+		printf("\t.long %u\n", files[i].str_offset);
+
+	/* filenames[] */
+	printf(".Lfilenames%s:\n", suffix);
+	for (unsigned int i = 0; i < num_files; i++)
+		print_escaped_asciz(files[i].name);
+	printf(".Lfilenames_end%s:\n", suffix);
+}
+
+/*
+ * Emit one mod_lineinfo_section descriptor.  The "anchor" field is a
+ * relocation against the named ELF section symbol; the module loader
+ * resolves it on load to the runtime base of that section.
+ *
+ * On 64-bit ELF: 8-byte slot via .quad <name> (R_*_64 reloc).
+ * On 32-bit ELF: 4-byte reloc via .long <name>, plus 4 bytes of zero
+ * padding.  The two halves are ordered to match target endianness so a
+ * naive u64 read on the kernel side recovers the relocated value.
+ */
+static void emit_section_descriptor(const char *section_name,
+				    unsigned long long size,
+				    const char *table_label,
+				    const char *root_label)
+{
+	if (target_64bit) {
+		printf("\t.quad %s\t/* sections[].anchor (RELOC) */\n",
+		       section_name);
+	} else if (target_le) {
+		printf("\t.long %s\t/* sections[].anchor low (RELOC) */\n",
+		       section_name);
+		printf("\t.long 0\t\t/* sections[].anchor high pad */\n");
+	} else {
+		printf("\t.long 0\t\t/* sections[].anchor high pad */\n");
+		printf("\t.long %s\t/* sections[].anchor low (RELOC) */\n",
+		       section_name);
+	}
+	printf("\t.long %llu\t/* sections[].size */\n", size);
+	printf("\t.long %s - %s\t/* sections[].table_offset */\n",
+	       table_label, root_label);
+}
+
+/*
+ * Emit one .mod_lineinfo / .init.mod_lineinfo blob.  Walks all_sections[]
+ * picking only entries that (a) belong to the requested blob and (b)
+ * actually produced at least one DWARF line entry — sections present in
+ * the .ko but without DWARF (e.g. compiler-generated stub thunks) are
+ * silently skipped.  The caller-supplied entries[] is already sorted by
+ * section_id, so each section's entries are contiguous; we walk the
+ * master array in order to compute per-section starting indices.
+ */
+static void emit_blob(const char *output_section,
+		      const char *blob_tag,
+		      enum mod_lineinfo_blob blob)
+{
+	unsigned int active = 0;
+	unsigned int section_starts[ALL_SECTIONS];
+	unsigned int cursor = 0;
+
+	for (unsigned int i = 0; i < ALL_SECTIONS; i++) {
+		section_starts[i] = cursor;
+		cursor += all_sections[i].n_entries;
+		if (all_sections[i].blob == blob && all_sections[i].n_entries)
+			active++;
+	}
+
+	if (!active)
+		return;
+
+	printf("\t.section %s, \"a\"\n\n", output_section);
+
+	printf("\t.balign 8\n");
+	printf(".Lroot_%s:\n", blob_tag);
+	printf("\t.long %u\t\t/* num_sections */\n", active);
+	/* Pad to align the u64 anchor in sections[0] to 8 bytes. */
+	printf("\t.balign 8\n");
+
+	{
+		unsigned int slot = 0;
+		for (unsigned int i = 0; i < ALL_SECTIONS; i++) {
+			char table_label[64];
+			char root_label[64];
+
+			if (all_sections[i].blob != blob)
+				continue;
+			if (!all_sections[i].n_entries)
+				continue;
+			snprintf(table_label, sizeof(table_label),
+				 ".Lhdr_%s_%u", blob_tag, slot);
+			snprintf(root_label, sizeof(root_label),
+				 ".Lroot_%s", blob_tag);
+			emit_section_descriptor(all_sections[i].name,
+						all_sections[i].size,
+						table_label, root_label);
+			slot++;
+		}
+	}
+	printf("\n");
+
+	{
+		unsigned int slot = 0;
+
+		for (unsigned int i = 0; i < ALL_SECTIONS; i++) {
+			char suffix[64];
+
+			if (all_sections[i].blob != blob)
+				continue;
+			if (!all_sections[i].n_entries)
+				continue;
+			snprintf(suffix, sizeof(suffix), "_%s_%u",
+				 blob_tag, slot);
+			emit_section_table(section_starts[i],
+					   all_sections[i].n_entries,
+					   suffix);
+			slot++;
+		}
+	}
+	printf("\n");
+}
+
+/*
+ * Declare each text-like section we plan to reference as an empty
+ * SHF_EXECINSTR section in this object.  Without these stanzas the
+ * assembler treats `.quad .exit.text` as an undefined external symbol;
+ * after ld -r the resulting GLOBAL UND `.exit.text` doesn't bind to the
+ * .ko's LOCAL SECTION symbol of the same name, leaving depmod with an
+ * unresolved-symbol warning and the loader unable to relocate the anchor.
+ *
+ * Declaring the section here gives lineinfo.o its own local SECTION
+ * symbol; ld -r merges sections by name so the local symbol simply
+ * relocates to offset 0 of the merged section (lineinfo.o is linked
+ * FIRST so its zero-byte contribution stays at the start).
+ */
+static void declare_empty_text_sections(void)
+{
+	for (unsigned int i = 0; i < ALL_SECTIONS; i++) {
+		if (!all_sections[i].present)
+			continue;
+		printf("\t.section %s, \"ax\"\n", all_sections[i].name);
+	}
+	printf("\n");
+}
+
+static void output_module_assembly(void)
+{
+	printf("/* SPDX-License-Identifier: GPL-2.0 */\n");
+	printf("/*\n");
+	printf(" * Automatically generated by scripts/gen_lineinfo --module\n");
+	printf(" * Do not edit.\n");
+	printf(" */\n\n");
+
+	declare_empty_text_sections();
+}
+
 int main(int argc, char *argv[])
 {
 	int fd;
@@ -493,12 +1120,23 @@ int main(int argc, char *argv[])
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
 
-	fd = open(argv[1], O_RDONLY);
+	/*
+	 * For module mode, open O_RDWR so we can apply debug section
+	 * relocations to the in-memory ELF data.  The modifications
+	 * are NOT written back to disk (no elf_update() call).
+	 */
+	fd = open(argv[1], module_mode ? O_RDWR : O_RDONLY);
 	if (fd < 0) {
 		fprintf(stderr, "Cannot open %s: %s\n", argv[1],
 			strerror(errno));
@@ -506,7 +1144,7 @@ int main(int argc, char *argv[])
 	}
 
 	elf_version(EV_CURRENT);
-	elf = elf_begin(fd, ELF_C_READ, NULL);
+	elf = elf_begin(fd, module_mode ? ELF_C_RDWR : ELF_C_READ, NULL);
 	if (!elf) {
 		fprintf(stderr, "elf_begin failed: %s\n",
 			elf_errmsg(elf_errno()));
@@ -514,8 +1152,34 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	text_addr = find_text_addr(elf);
-	text_end_addr = find_text_end_addr(elf);
+	{
+		GElf_Ehdr ehdr;
+
+		if (gelf_getehdr(elf, &ehdr) == NULL) {
+			fprintf(stderr, "gelf_getehdr failed\n");
+			elf_end(elf);
+			close(fd);
+			return 1;
+		}
+		target_64bit = (ehdr.e_ident[EI_CLASS] == ELFCLASS64);
+		target_le = (ehdr.e_ident[EI_DATA] == ELFDATA2LSB);
+	}
+
+	if (module_mode) {
+		/*
+		 * .ko files are ET_REL after ld -r.  Resolve covered text
+		 * sections FIRST so apply_debug_line_relocations() can use
+		 * the assigned biases when patching line-program addresses;
+		 * libdw does NOT apply relocations for ET_REL files, so we
+		 * also handle DW_FORM_line_strp refs into .debug_line_str.
+		 */
+		resolve_covered_sections(elf, all_sections, ALL_SECTIONS);
+		apply_debug_line_relocations(elf);
+		text_addr = 0;	/* unused in module mode */
+	} else {
+		text_addr = find_text_addr(elf);
+		text_end_addr = find_text_end_addr(elf);
+	}
 
 	dwarf = dwarf_begin_elf(elf, DWARF_C_READ, NULL);
 	if (!dwarf) {
@@ -528,20 +1192,55 @@ int main(int argc, char *argv[])
 		return 1;
 	}
 
-	process_dwarf(dwarf, text_addr);
+	if (module_mode) {
+		unsigned int persistent_total, init_total;
+
+		output_module_assembly();	/* file header only */
 
-	if (skipped_overflow)
+		/*
+		 * Single DWARF pass classifies every line entry into its
+		 * covering section (or skips it).  Each entry is tagged with
+		 * the master-array section_id so per-blob emit can filter.
+		 */
+		process_dwarf(dwarf, 0, all_sections, ALL_SECTIONS);
+		deduplicate(all_sections, ALL_SECTIONS);
+		compute_file_offsets();
+
+		emit_blob(".mod_lineinfo", "p", BLOB_PERSISTENT);
+		emit_blob(".init.mod_lineinfo", "i", BLOB_INIT);
+
+		persistent_total = 0;
+		init_total = 0;
+		for (unsigned int i = 0; i < ALL_SECTIONS; i++) {
+			if (all_sections[i].blob == BLOB_PERSISTENT)
+				persistent_total += all_sections[i].n_entries;
+			else if (all_sections[i].blob == BLOB_INIT)
+				init_total += all_sections[i].n_entries;
+		}
 		fprintf(stderr,
-			"lineinfo: warning: %u entries skipped (offset > 4 GiB from _text)\n",
-			skipped_overflow);
+			"lineinfo: persistent %u entries, init %u entries, %u files\n",
+			persistent_total, init_total, num_files);
+
+		if (skipped_overflow)
+			fprintf(stderr,
+				"lineinfo: warning: %u entries skipped (offset > 4 GiB)\n",
+				skipped_overflow);
+	} else {
+		process_dwarf(dwarf, text_addr, NULL, 0);
 
-	deduplicate();
-	compute_file_offsets();
+		if (skipped_overflow)
+			fprintf(stderr,
+				"lineinfo: warning: %u entries skipped (offset > 4 GiB from _text)\n",
+				skipped_overflow);
 
-	fprintf(stderr, "lineinfo: %u entries, %u files\n",
-		num_entries, num_files);
+		deduplicate(NULL, 0);
+		compute_file_offsets();
 
-	output_assembly();
+		fprintf(stderr, "lineinfo: %u entries, %u files\n",
+			num_entries, num_files);
+
+		output_assembly();
+	}
 
 	dwarf_end(dwarf);
 	elf_end(elf);
@@ -552,6 +1251,5 @@ int main(int argc, char *argv[])
 	for (unsigned int i = 0; i < num_files; i++)
 		free(files[i].name);
 	free(files);
-
 	return 0;
 }
-- 
2.53.0


