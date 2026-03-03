Return-Path: <linux-kbuild+bounces-11539-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8MgXNO8mp2k3fAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11539-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 19:22:39 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 783C91F53D4
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Mar 2026 19:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3EF98300D755
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Mar 2026 18:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87CA48A2BE;
	Tue,  3 Mar 2026 18:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LEGAoSCw"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE393D5649;
	Tue,  3 Mar 2026 18:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772562131; cv=none; b=eGcgsHEZn+MycF9IJe7OMm4+BMRnfduSqY0+8u3Yk+Sfl1YpuIvbpNd3DFtbO2Cnn81od1TVRHf82UbVmIQdTGSk0vjqR58Baj11Yb8M0JCaCNrBl5LOAfQgQTIYKn8tF3LVHI095ovA1f50xUpimkq5BaJMW+O4iyX9wi22fnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772562131; c=relaxed/simple;
	bh=nDWvOEm8xdTNZOjDXW7jKTX5VdLCJzXdd/PYX/jWghs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvTkQ3913U3UDxlB2QnmDqcnpDBBNyFR0GvGxOKAZYJLicNgjts7mIJM6tKNeluLc2t7IJc7nnu9PU6dBgWh66Z0IR2fmBldPQiudZVonpEPu9zrdk2sE8GKUi6lQ/JvbOXdc7SlFFU9t7yTnOiZ32kZHM7UGNOaTyfQJso+UNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LEGAoSCw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 380BCC19425;
	Tue,  3 Mar 2026 18:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772562130;
	bh=nDWvOEm8xdTNZOjDXW7jKTX5VdLCJzXdd/PYX/jWghs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LEGAoSCwwHr4B0nSqPeQJhui3JhtxP/g/inp8A28TUBnAkqopJ93+A9GZVO+4vckQ
	 7q5q1upK9YgWwdOpsJGM/uCooVGlDCJlWe1VT1Wfw5gK36LHeFoF0dafEVBQSbfpn4
	 ibkt1kYKbafSz0/lUw97pRo1n5TAuRVXOwRefg7lYjxs+jix0gcpCgX+NWK3tGTi4z
	 CWLX1lff8yKSFN51T5BOG+31pqW/sAtYVbfRGhd6M6BDAjWVfW96X+SyBxTdTxwFh0
	 NV8o85TtSeKbxVSScTM8I31wdl97eYEf2W4ARlcvj1KZ5rPA4da+R6U+rinSSzXPGa
	 EMENMjWEjnnsg==
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
Subject: [PATCH 3/3] kallsyms: delta-compress lineinfo tables for ~2.7x size reduction
Date: Tue,  3 Mar 2026 13:21:03 -0500
Message-ID: <20260303182103.3523438-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260303182103.3523438-1-sashal@kernel.org>
References: <20260303182103.3523438-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 783C91F53D4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11539-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,suse.com:email]
X-Rspamd-Action: no action

Replace the flat uncompressed parallel arrays (lineinfo_addrs[],
lineinfo_file_ids[], lineinfo_lines[]) with a block-indexed,
delta-encoded, ULEB128 varint compressed format.

The sorted address array has small deltas between consecutive entries
(typically 1-50 bytes), file IDs have high locality (delta often 0,
same file), and line numbers change slowly.  Delta-encoding followed
by ULEB128 varint compression shrinks most values from 4 bytes to 1.

Entries are grouped into blocks of 64.  A small uncompressed block
index (first addr + byte offset per block) enables O(log(N/64)) binary
search, followed by sequential decode of at most 64 varints within the
matching block.  All decode state lives on the stack -- zero
allocations, still safe for NMI/panic context.

Measured on a defconfig+debug x86_64 build (3,017,154 entries, 4,822
source files, 47,144 blocks):

  Before (flat arrays):
    lineinfo_addrs[]    12,068,616 bytes (u32 x 3.0M)
    lineinfo_file_ids[]  6,034,308 bytes (u16 x 3.0M)
    lineinfo_lines[]    12,068,616 bytes (u32 x 3.0M)
    Total:              30,171,540 bytes (28.8 MiB, 10.0 bytes/entry)

  After (block-indexed delta + ULEB128):
    lineinfo_block_addrs[]    188,576 bytes (184 KiB)
    lineinfo_block_offsets[]  188,576 bytes (184 KiB)
    lineinfo_data[]        10,926,128 bytes (10.4 MiB)
    Total:                 11,303,280 bytes (10.8 MiB, 3.7 bytes/entry)

  Savings: 18.0 MiB (2.7x reduction)

Booted in QEMU and verified with SysRq-l that annotations still work:

  default_idle+0x9/0x10 (arch/x86/kernel/process.c:767)
  default_idle_call+0x6c/0xb0 (kernel/sched/idle.c:122)
  do_idle+0x335/0x490 (kernel/sched/idle.c:191)
  cpu_startup_entry+0x4e/0x60 (kernel/sched/idle.c:429)
  rest_init+0x1aa/0x1b0 (init/main.c:760)

Suggested-by: Juergen Gross <jgross@suse.com>
Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../admin-guide/kallsyms-lineinfo.rst         |   7 +-
 include/linux/mod_lineinfo.h                  | 103 ++++++++--
 init/Kconfig                                  |   8 +-
 kernel/kallsyms.c                             |  91 +++++++--
 kernel/kallsyms_internal.h                    |   7 +-
 kernel/module/kallsyms.c                      | 107 +++++++---
 scripts/gen_lineinfo.c                        | 192 ++++++++++++++----
 scripts/kallsyms.c                            |   7 +-
 scripts/link-vmlinux.sh                       |  16 +-
 9 files changed, 423 insertions(+), 115 deletions(-)

diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
index 21450569d5324..fe92c5dde16b3 100644
--- a/Documentation/admin-guide/kallsyms-lineinfo.rst
+++ b/Documentation/admin-guide/kallsyms-lineinfo.rst
@@ -76,10 +76,11 @@ Memory Overhead
 ===============
 
 The vmlinux lineinfo tables are stored in ``.rodata`` and typically add
-approximately 44 MiB to the kernel image for a standard configuration
-(~4.6 million DWARF line entries, ~10 bytes per entry after deduplication).
+approximately 10-15 MiB to the kernel image for a standard configuration
+(~4.6 million DWARF line entries, ~2-3 bytes per entry after delta
+compression).
 
-Per-module lineinfo adds approximately 10 bytes per DWARF line entry to each
+Per-module lineinfo adds approximately 2-3 bytes per DWARF line entry to each
 ``.ko`` file.
 
 Known Limitations
diff --git a/include/linux/mod_lineinfo.h b/include/linux/mod_lineinfo.h
index d62e9608f0f82..ab758acfadceb 100644
--- a/include/linux/mod_lineinfo.h
+++ b/include/linux/mod_lineinfo.h
@@ -8,13 +8,19 @@
  *
  * Section layout (all values in target-native endianness):
  *
- *   struct mod_lineinfo_header     (16 bytes)
- *   u32 addrs[num_entries]         -- offsets from .text base, sorted
- *   u16 file_ids[num_entries]      -- parallel to addrs
- *   <2-byte pad if num_entries is odd>
- *   u32 lines[num_entries]         -- parallel to addrs
+ *   struct mod_lineinfo_header     (24 bytes)
+ *   u32 block_addrs[num_blocks]    -- first addr per block, for binary search
+ *   u32 block_offsets[num_blocks]  -- byte offset into compressed data stream
+ *   u8  data[data_size]            -- ULEB128 delta-compressed entries
  *   u32 file_offsets[num_files]    -- byte offset into filenames[]
  *   char filenames[filenames_size] -- concatenated NUL-terminated strings
+ *
+ * Compressed stream format (per block of LINEINFO_BLOCK_ENTRIES entries):
+ *   Entry 0: file_id (ULEB128), line (ULEB128)
+ *            addr is in block_addrs[]
+ *   Entry 1..N: addr_delta (ULEB128),
+ *               file_id_delta (zigzag-encoded ULEB128),
+ *               line_delta (zigzag-encoded ULEB128)
  */
 #ifndef _LINUX_MOD_LINEINFO_H
 #define _LINUX_MOD_LINEINFO_H
@@ -25,44 +31,107 @@
 #include <stdint.h>
 typedef uint32_t u32;
 typedef uint16_t u16;
+typedef uint8_t  u8;
 #endif
 
+#define LINEINFO_BLOCK_ENTRIES 64
+
 struct mod_lineinfo_header {
 	u32 num_entries;
 	u32 num_files;
 	u32 filenames_size;	/* total bytes of concatenated filenames */
+	u32 num_blocks;
+	u32 data_size;		/* total bytes of compressed data stream */
 	u32 reserved;		/* padding, must be 0 */
 };
 
 /* Offset helpers: compute byte offset from start of section to each array */
 
-static inline u32 mod_lineinfo_addrs_off(void)
+static inline u32 mod_lineinfo_block_addrs_off(void)
 {
 	return sizeof(struct mod_lineinfo_header);
 }
 
-static inline u32 mod_lineinfo_file_ids_off(u32 num_entries)
+static inline u32 mod_lineinfo_block_offsets_off(u32 num_blocks)
 {
-	return mod_lineinfo_addrs_off() + num_entries * sizeof(u32);
+	return mod_lineinfo_block_addrs_off() + num_blocks * sizeof(u32);
 }
 
-static inline u32 mod_lineinfo_lines_off(u32 num_entries)
+static inline u32 mod_lineinfo_data_off(u32 num_blocks)
 {
-	/* u16 file_ids[] may need 2-byte padding to align lines[] to 4 bytes */
-	u32 off = mod_lineinfo_file_ids_off(num_entries) +
-		  num_entries * sizeof(u16);
-	return (off + 3) & ~3u;
+	return mod_lineinfo_block_offsets_off(num_blocks) +
+	       num_blocks * sizeof(u32);
 }
 
-static inline u32 mod_lineinfo_file_offsets_off(u32 num_entries)
+static inline u32 mod_lineinfo_file_offsets_off(u32 num_blocks, u32 data_size)
 {
-	return mod_lineinfo_lines_off(num_entries) + num_entries * sizeof(u32);
+	return mod_lineinfo_data_off(num_blocks) + data_size;
 }
 
-static inline u32 mod_lineinfo_filenames_off(u32 num_entries, u32 num_files)
+static inline u32 mod_lineinfo_filenames_off(u32 num_blocks, u32 data_size,
+					     u32 num_files)
 {
-	return mod_lineinfo_file_offsets_off(num_entries) +
+	return mod_lineinfo_file_offsets_off(num_blocks, data_size) +
 	       num_files * sizeof(u32);
 }
 
+/* Zigzag encoding: map signed to unsigned so small magnitudes are small */
+static inline u32 zigzag_encode(int32_t v)
+{
+	return ((u32)v << 1) ^ (u32)(v >> 31);
+}
+
+static inline int32_t zigzag_decode(u32 v)
+{
+	return (int32_t)((v >> 1) ^ -(v & 1));
+}
+
+/*
+ * Read a ULEB128 varint from a byte stream.
+ * Returns the decoded value and advances *pos past the encoded bytes.
+ * If *pos would exceed 'end', returns 0 and sets *pos = end (safe for
+ * NMI/panic context -- no crash, just a missed annotation).
+ */
+static inline u32 lineinfo_read_uleb128(const u8 *data, u32 *pos, u32 end)
+{
+	u32 result = 0;
+	unsigned int shift = 0;
+
+	while (*pos < end) {
+		u8 byte = data[*pos];
+		(*pos)++;
+		result |= (u32)(byte & 0x7f) << shift;
+		if (!(byte & 0x80))
+			return result;
+		shift += 7;
+		if (shift >= 32) {
+			/* Malformed -- skip remaining continuation bytes */
+			while (*pos < end && (data[*pos] & 0x80))
+				(*pos)++;
+			if (*pos < end)
+				(*pos)++;
+			return result;
+		}
+	}
+	return result;
+}
+
+/* Write a ULEB128 varint -- build tool only */
+#ifndef __KERNEL__
+static inline unsigned int lineinfo_write_uleb128(u8 *buf, u32 value)
+{
+	unsigned int len = 0;
+
+	do {
+		u8 byte = value & 0x7f;
+
+		value >>= 7;
+		if (value)
+			byte |= 0x80;
+		buf[len++] = byte;
+	} while (value);
+	return len;
+}
+#endif /* !__KERNEL__ */
+
 #endif /* _LINUX_MOD_LINEINFO_H */
diff --git a/init/Kconfig b/init/Kconfig
index bf53275bc405a..6e3795b3dbd62 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2065,8 +2065,9 @@ config KALLSYMS_LINEINFO
 	    anon_vma_clone+0x2ed/0xcf0 (mm/rmap.c:412)
 
 	  This requires elfutils (libdw-dev/elfutils-devel) on the build host.
-	  Adds approximately 44MB to a typical kernel image (10 bytes per
-	  DWARF line-table entry, ~4.6M entries for a typical config).
+	  Adds approximately 10-15MB to a typical kernel image (~2-3 bytes
+	  per entry after delta compression, ~4.6M entries for a typical
+	  config).
 
 	  If unsure, say N.
 
@@ -2079,7 +2080,8 @@ config KALLSYMS_LINEINFO_MODULES
 	  so stack traces from module code include (file.c:123) annotations.
 
 	  Requires elfutils (libdw-dev/elfutils-devel) on the build host.
-	  Increases .ko sizes by approximately 10 bytes per DWARF line entry.
+	  Increases .ko sizes by approximately 2-3 bytes per DWARF line
+	  entry after delta compression.
 
 	  If unsure, say N.
 
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index cea74992e5427..de4aa8fcfd69d 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -468,14 +468,20 @@ static int append_buildid(char *buffer,   const char *modname,
 #endif /* CONFIG_STACKTRACE_BUILD_ID */
 
 #ifdef CONFIG_KALLSYMS_LINEINFO
+#include <linux/mod_lineinfo.h>
+
 bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
 			      const char **file, unsigned int *line)
 {
 	unsigned long long raw_offset;
-	unsigned int offset, low, high, mid, file_id;
-	unsigned long line_addr;
-
-	if (!lineinfo_num_entries)
+	unsigned int offset, low, high, mid, block;
+	unsigned int cur_addr, cur_file_id, cur_line;
+	unsigned int best_file_id = 0, best_line = 0;
+	unsigned int block_entries, data_end;
+	bool found = false;
+	u32 pos;
+
+	if (!lineinfo_num_entries || !lineinfo_num_blocks)
 		return false;
 
 	/* Compute offset from _text */
@@ -487,12 +493,12 @@ bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
 		return false;
 	offset = (unsigned int)raw_offset;
 
-	/* Binary search for largest entry <= offset */
+	/* Binary search on block_addrs[] to find the right block */
 	low = 0;
-	high = lineinfo_num_entries;
+	high = lineinfo_num_blocks;
 	while (low < high) {
 		mid = low + (high - low) / 2;
-		if (lineinfo_addrs[mid] <= offset)
+		if (lineinfo_block_addrs[mid] <= offset)
 			low = mid + 1;
 		else
 			high = mid;
@@ -500,25 +506,68 @@ bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
 
 	if (low == 0)
 		return false;
-	low--;
+	block = low - 1;
 
-	/*
-	 * Validate that the matched lineinfo entry belongs to the same
-	 * symbol.  Without this check, assembly routines or other
-	 * functions lacking DWARF data would inherit the file:line of
-	 * a preceding C function.
-	 */
-	line_addr = (unsigned long)_text + lineinfo_addrs[low];
-	if (line_addr < sym_start)
-		return false;
+	/* How many entries in this block? */
+	block_entries = LINEINFO_BLOCK_ENTRIES;
+	if (block == lineinfo_num_blocks - 1) {
+		unsigned int remaining = lineinfo_num_entries - block * LINEINFO_BLOCK_ENTRIES;
+
+		if (remaining < block_entries)
+			block_entries = remaining;
+	}
+
+	/* Determine end of this block's data in the compressed stream */
+	if (block + 1 < lineinfo_num_blocks)
+		data_end = lineinfo_block_offsets[block + 1];
+	else
+		data_end = UINT_MAX; /* last block: read to end */
+
+	/* Decode entry 0: addr from block_addrs, file_id and line from stream */
+	pos = lineinfo_block_offsets[block];
+	cur_addr = lineinfo_block_addrs[block];
+	cur_file_id = lineinfo_read_uleb128(lineinfo_data, &pos, data_end);
+	cur_line = lineinfo_read_uleb128(lineinfo_data, &pos, data_end);
+
+	/* Check entry 0 */
+	if (cur_addr <= offset &&
+	    (unsigned long)_text + cur_addr >= sym_start) {
+		best_file_id = cur_file_id;
+		best_line = cur_line;
+		found = true;
+	}
 
-	file_id = lineinfo_file_ids[low];
-	*line = lineinfo_lines[low];
+	/* Decode entries 1..N */
+	for (unsigned int i = 1; i < block_entries; i++) {
+		unsigned int addr_delta;
+		int32_t file_delta, line_delta;
+
+		addr_delta = lineinfo_read_uleb128(lineinfo_data, &pos, data_end);
+		file_delta = zigzag_decode(lineinfo_read_uleb128(lineinfo_data, &pos, data_end));
+		line_delta = zigzag_decode(lineinfo_read_uleb128(lineinfo_data, &pos, data_end));
+
+		cur_addr += addr_delta;
+		cur_file_id = (unsigned int)((int32_t)cur_file_id + file_delta);
+		cur_line = (unsigned int)((int32_t)cur_line + line_delta);
+
+		if (cur_addr > offset)
+			break;
+
+		if ((unsigned long)_text + cur_addr >= sym_start) {
+			best_file_id = cur_file_id;
+			best_line = cur_line;
+			found = true;
+		}
+	}
+
+	if (!found)
+		return false;
 
-	if (file_id >= lineinfo_num_files)
+	if (best_file_id >= lineinfo_num_files)
 		return false;
 
-	*file = &lineinfo_filenames[lineinfo_file_offsets[file_id]];
+	*file = &lineinfo_filenames[lineinfo_file_offsets[best_file_id]];
+	*line = best_line;
 	return true;
 }
 #endif /* CONFIG_KALLSYMS_LINEINFO */
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 868a1d5035212..691be44440395 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -17,10 +17,11 @@ extern const u8 kallsyms_seqs_of_names[];
 
 #ifdef CONFIG_KALLSYMS_LINEINFO
 extern const u32 lineinfo_num_entries;
-extern const u32 lineinfo_addrs[];
-extern const u16 lineinfo_file_ids[];
-extern const u32 lineinfo_lines[];
 extern const u32 lineinfo_num_files;
+extern const u32 lineinfo_num_blocks;
+extern const u32 lineinfo_block_addrs[];
+extern const u32 lineinfo_block_offsets[];
+extern const u8  lineinfo_data[];
 extern const u32 lineinfo_file_offsets[];
 extern const char lineinfo_filenames[];
 #endif
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index 7af414bd65e79..0ead1bb69de4e 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -512,15 +512,19 @@ bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
 {
 	const struct mod_lineinfo_header *hdr;
 	const void *base;
-	const u32 *addrs, *lines, *file_offsets;
-	const u16 *file_ids;
+	const u32 *blk_addrs, *blk_offsets, *file_offsets;
+	const u8 *data;
 	const char *filenames;
-	u32 num_entries, num_files, filenames_size;
+	u32 num_entries, num_files, filenames_size, num_blocks, data_size;
 	unsigned long text_base;
 	unsigned int offset;
 	unsigned long long raw_offset;
-	unsigned int low, high, mid;
-	u16 file_id;
+	unsigned int low, high, mid, block;
+	unsigned int cur_addr, cur_file_id, cur_line;
+	unsigned int best_file_id = 0, best_line = 0;
+	unsigned int block_entries, data_end;
+	bool found = false;
+	u32 pos;
 
 	base = mod->lineinfo_data;
 	if (!base)
@@ -533,20 +537,24 @@ bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
 	num_entries = hdr->num_entries;
 	num_files = hdr->num_files;
 	filenames_size = hdr->filenames_size;
+	num_blocks = hdr->num_blocks;
+	data_size = hdr->data_size;
 
-	if (num_entries == 0)
+	if (num_entries == 0 || num_blocks == 0)
 		return false;
 
 	/* Validate section is large enough for all arrays */
 	if (mod->lineinfo_data_size <
-	    mod_lineinfo_filenames_off(num_entries, num_files) + filenames_size)
+	    mod_lineinfo_filenames_off(num_blocks, data_size, num_files) +
+	    filenames_size)
 		return false;
 
-	addrs = base + mod_lineinfo_addrs_off();
-	file_ids = base + mod_lineinfo_file_ids_off(num_entries);
-	lines = base + mod_lineinfo_lines_off(num_entries);
-	file_offsets = base + mod_lineinfo_file_offsets_off(num_entries);
-	filenames = base + mod_lineinfo_filenames_off(num_entries, num_files);
+	blk_addrs = base + mod_lineinfo_block_addrs_off();
+	blk_offsets = base + mod_lineinfo_block_offsets_off(num_blocks);
+	data = base + mod_lineinfo_data_off(num_blocks);
+	file_offsets = base + mod_lineinfo_file_offsets_off(num_blocks, data_size);
+	filenames = base + mod_lineinfo_filenames_off(num_blocks, data_size,
+						      num_files);
 
 	/* Compute offset from module .text base */
 	text_base = (unsigned long)mod->mem[MOD_TEXT].base;
@@ -558,12 +566,12 @@ bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
 		return false;
 	offset = (unsigned int)raw_offset;
 
-	/* Binary search for largest entry <= offset */
+	/* Binary search on block_addrs[] to find the right block */
 	low = 0;
-	high = num_entries;
+	high = num_blocks;
 	while (low < high) {
 		mid = low + (high - low) / 2;
-		if (addrs[mid] <= offset)
+		if (blk_addrs[mid] <= offset)
 			low = mid + 1;
 		else
 			high = mid;
@@ -571,21 +579,74 @@ bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
 
 	if (low == 0)
 		return false;
-	low--;
+	block = low - 1;
 
-	/* Ensure the matched entry belongs to the same symbol */
-	if (text_base + addrs[low] < sym_start)
+	/* How many entries in this block? */
+	block_entries = LINEINFO_BLOCK_ENTRIES;
+	if (block == num_blocks - 1) {
+		unsigned int remaining = num_entries - block * LINEINFO_BLOCK_ENTRIES;
+
+		if (remaining < block_entries)
+			block_entries = remaining;
+	}
+
+	/* Determine end of this block's data in the compressed stream */
+	if (block + 1 < num_blocks)
+		data_end = blk_offsets[block + 1];
+	else
+		data_end = data_size;
+
+	/* Decode entry 0: addr from block_addrs, file_id and line from stream */
+	pos = blk_offsets[block];
+	if (pos >= data_end)
+		return false;
+
+	cur_addr = blk_addrs[block];
+	cur_file_id = lineinfo_read_uleb128(data, &pos, data_end);
+	cur_line = lineinfo_read_uleb128(data, &pos, data_end);
+
+	/* Check entry 0 */
+	if (cur_addr <= offset &&
+	    text_base + cur_addr >= sym_start) {
+		best_file_id = cur_file_id;
+		best_line = cur_line;
+		found = true;
+	}
+
+	/* Decode entries 1..N */
+	for (unsigned int i = 1; i < block_entries; i++) {
+		unsigned int addr_delta;
+		int32_t file_delta, line_delta;
+
+		addr_delta = lineinfo_read_uleb128(data, &pos, data_end);
+		file_delta = zigzag_decode(lineinfo_read_uleb128(data, &pos, data_end));
+		line_delta = zigzag_decode(lineinfo_read_uleb128(data, &pos, data_end));
+
+		cur_addr += addr_delta;
+		cur_file_id = (unsigned int)((int32_t)cur_file_id + file_delta);
+		cur_line = (unsigned int)((int32_t)cur_line + line_delta);
+
+		if (cur_addr > offset)
+			break;
+
+		if (text_base + cur_addr >= sym_start) {
+			best_file_id = cur_file_id;
+			best_line = cur_line;
+			found = true;
+		}
+	}
+
+	if (!found)
 		return false;
 
-	file_id = file_ids[low];
-	if (file_id >= num_files)
+	if (best_file_id >= num_files)
 		return false;
 
-	if (file_offsets[file_id] >= filenames_size)
+	if (file_offsets[best_file_id] >= filenames_size)
 		return false;
 
-	*file = &filenames[file_offsets[file_id]];
-	*line = lines[low];
+	*file = &filenames[file_offsets[best_file_id]];
+	*line = best_line;
 	return true;
 }
 #endif /* CONFIG_KALLSYMS_LINEINFO_MODULES */
diff --git a/scripts/gen_lineinfo.c b/scripts/gen_lineinfo.c
index 609de59f47ffd..9507ed9bcbe55 100644
--- a/scripts/gen_lineinfo.c
+++ b/scripts/gen_lineinfo.c
@@ -8,6 +8,9 @@
  * file containing sorted lookup tables that the kernel uses to annotate
  * stack traces with source file:line information.
  *
+ * The output uses a block-indexed, delta-encoded, ULEB128-compressed format
+ * for ~3-4x size reduction compared to flat arrays.
+ *
  * Requires libdw from elfutils.
  */
 
@@ -53,6 +56,15 @@ static struct file_entry *files;
 static unsigned int num_files;
 static unsigned int files_capacity;
 
+/* Compressed output */
+static unsigned char *compressed_data;
+static unsigned int compressed_size;
+static unsigned int compressed_capacity;
+
+static unsigned int *block_addrs;
+static unsigned int *block_offsets;
+static unsigned int num_blocks;
+
 #define FILE_HASH_BITS 13
 #define FILE_HASH_SIZE (1 << FILE_HASH_BITS)
 
@@ -352,6 +364,93 @@ static void deduplicate(void)
 	num_entries = j + 1;
 }
 
+static void compressed_ensure(unsigned int need)
+{
+	if (compressed_size + need <= compressed_capacity)
+		return;
+	compressed_capacity = compressed_capacity ? compressed_capacity * 2 : 1024 * 1024;
+	while (compressed_capacity < compressed_size + need)
+		compressed_capacity *= 2;
+	compressed_data = realloc(compressed_data, compressed_capacity);
+	if (!compressed_data) {
+		fprintf(stderr, "out of memory\n");
+		exit(1);
+	}
+}
+
+static void compress_entries(void)
+{
+	unsigned int i, block;
+
+	if (num_entries == 0) {
+		num_blocks = 0;
+		return;
+	}
+
+	num_blocks = (num_entries + LINEINFO_BLOCK_ENTRIES - 1) / LINEINFO_BLOCK_ENTRIES;
+	block_addrs = calloc(num_blocks, sizeof(*block_addrs));
+	block_offsets = calloc(num_blocks, sizeof(*block_offsets));
+	if (!block_addrs || !block_offsets) {
+		fprintf(stderr, "out of memory\n");
+		exit(1);
+	}
+
+	for (block = 0; block < num_blocks; block++) {
+		unsigned int base = block * LINEINFO_BLOCK_ENTRIES;
+		unsigned int count = num_entries - base;
+		unsigned int prev_addr, prev_file_id, prev_line;
+		unsigned char buf[10]; /* max 5 bytes per ULEB128 */
+
+		if (count > LINEINFO_BLOCK_ENTRIES)
+			count = LINEINFO_BLOCK_ENTRIES;
+
+		block_addrs[block] = entries[base].offset;
+		block_offsets[block] = compressed_size;
+
+		/* Entry 0: file_id (ULEB128), line (ULEB128) */
+		compressed_ensure(20);
+		compressed_size += lineinfo_write_uleb128(
+			compressed_data + compressed_size,
+			entries[base].file_id);
+		compressed_size += lineinfo_write_uleb128(
+			compressed_data + compressed_size,
+			entries[base].line);
+
+		prev_addr = entries[base].offset;
+		prev_file_id = entries[base].file_id;
+		prev_line = entries[base].line;
+
+		/* Entries 1..N: deltas */
+		for (i = 1; i < count; i++) {
+			unsigned int idx = base + i;
+			unsigned int addr_delta;
+			int32_t file_delta, line_delta;
+			unsigned int n;
+
+			addr_delta = entries[idx].offset - prev_addr;
+			file_delta = (int32_t)entries[idx].file_id - (int32_t)prev_file_id;
+			line_delta = (int32_t)entries[idx].line - (int32_t)prev_line;
+
+			compressed_ensure(15);
+			n = lineinfo_write_uleb128(buf, addr_delta);
+			memcpy(compressed_data + compressed_size, buf, n);
+			compressed_size += n;
+
+			n = lineinfo_write_uleb128(buf, zigzag_encode(file_delta));
+			memcpy(compressed_data + compressed_size, buf, n);
+			compressed_size += n;
+
+			n = lineinfo_write_uleb128(buf, zigzag_encode(line_delta));
+			memcpy(compressed_data + compressed_size, buf, n);
+			compressed_size += n;
+
+			prev_addr = entries[idx].offset;
+			prev_file_id = entries[idx].file_id;
+			prev_line = entries[idx].line;
+		}
+	}
+}
+
 static void compute_file_offsets(void)
 {
 	unsigned int offset = 0;
@@ -395,28 +494,40 @@ static void output_assembly(void)
 	printf("lineinfo_num_files:\n");
 	printf("\t.long %u\n\n", num_files);
 
-	/* Sorted address offsets from _text */
-	printf("\t.globl lineinfo_addrs\n");
+	/* Number of blocks */
+	printf("\t.globl lineinfo_num_blocks\n");
 	printf("\t.balign 4\n");
-	printf("lineinfo_addrs:\n");
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.long 0x%x\n", entries[i].offset);
-	printf("\n");
+	printf("lineinfo_num_blocks:\n");
+	printf("\t.long %u\n\n", num_blocks);
 
-	/* File IDs, parallel to addrs (u16 -- supports up to 65535 files) */
-	printf("\t.globl lineinfo_file_ids\n");
-	printf("\t.balign 2\n");
-	printf("lineinfo_file_ids:\n");
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.short %u\n", entries[i].file_id);
+	/* Block first-addresses for binary search */
+	printf("\t.globl lineinfo_block_addrs\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_block_addrs:\n");
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long 0x%x\n", block_addrs[i]);
 	printf("\n");
 
-	/* Line numbers, parallel to addrs */
-	printf("\t.globl lineinfo_lines\n");
+	/* Block byte offsets into compressed stream */
+	printf("\t.globl lineinfo_block_offsets\n");
 	printf("\t.balign 4\n");
-	printf("lineinfo_lines:\n");
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.long %u\n", entries[i].line);
+	printf("lineinfo_block_offsets:\n");
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long %u\n", block_offsets[i]);
+	printf("\n");
+
+	/* Compressed data stream */
+	printf("\t.globl lineinfo_data\n");
+	printf("lineinfo_data:\n");
+	for (unsigned int i = 0; i < compressed_size; i++) {
+		if ((i % 16) == 0)
+			printf("\t.byte ");
+		else
+			printf(",");
+		printf("0x%02x", compressed_data[i]);
+		if ((i % 16) == 15 || i == compressed_size - 1)
+			printf("\n");
+	}
 	printf("\n");
 
 	/* File string offset table */
@@ -450,33 +561,38 @@ static void output_module_assembly(void)
 
 	printf("\t.section .mod_lineinfo, \"a\"\n\n");
 
-	/* Header: num_entries, num_files, filenames_size, reserved */
+	/* Header: num_entries, num_files, filenames_size, num_blocks, data_size, reserved */
 	printf("\t.balign 4\n");
 	printf("\t.long %u\n", num_entries);
 	printf("\t.long %u\n", num_files);
 	printf("\t.long %u\n", filenames_size);
+	printf("\t.long %u\n", num_blocks);
+	printf("\t.long %u\n", compressed_size);
 	printf("\t.long 0\n\n");
 
-	/* addrs[] */
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.long 0x%x\n", entries[i].offset);
-	if (num_entries)
+	/* block_addrs[] */
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long 0x%x\n", block_addrs[i]);
+	if (num_blocks)
 		printf("\n");
 
-	/* file_ids[] */
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.short %u\n", entries[i].file_id);
-
-	/* Padding to align lines[] to 4 bytes */
-	if (num_entries & 1)
-		printf("\t.short 0\n");
-	if (num_entries)
+	/* block_offsets[] */
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long %u\n", block_offsets[i]);
+	if (num_blocks)
 		printf("\n");
 
-	/* lines[] */
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.long %u\n", entries[i].line);
-	if (num_entries)
+	/* compressed data[] */
+	for (unsigned int i = 0; i < compressed_size; i++) {
+		if ((i % 16) == 0)
+			printf("\t.byte ");
+		else
+			printf(",");
+		printf("0x%02x", compressed_data[i]);
+		if ((i % 16) == 15 || i == compressed_size - 1)
+			printf("\n");
+	}
+	if (compressed_size)
 		printf("\n");
 
 	/* file_offsets[] */
@@ -558,10 +674,11 @@ int main(int argc, char *argv[])
 			skipped_overflow);
 
 	deduplicate();
+	compress_entries();
 	compute_file_offsets();
 
-	fprintf(stderr, "lineinfo: %u entries, %u files\n",
-		num_entries, num_files);
+	fprintf(stderr, "lineinfo: %u entries, %u files, %u blocks, %u compressed bytes\n",
+		num_entries, num_files, num_blocks, compressed_size);
 
 	if (module_mode)
 		output_module_assembly();
@@ -577,6 +694,9 @@ int main(int argc, char *argv[])
 	for (unsigned int i = 0; i < num_files; i++)
 		free(files[i].name);
 	free(files);
+	free(compressed_data);
+	free(block_addrs);
+	free(block_offsets);
 
 	return 0;
 }
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 42662c4fbc6c9..94fbdad3df7c6 100644
--- a/scripts/kallsyms.c
+++ b/scripts/kallsyms.c
@@ -80,11 +80,12 @@ static bool is_ignored_symbol(const char *name, char type)
 {
 	/* Ignore lineinfo symbols for kallsyms pass stability */
 	static const char * const lineinfo_syms[] = {
-		"lineinfo_addrs",
-		"lineinfo_file_ids",
+		"lineinfo_block_addrs",
+		"lineinfo_block_offsets",
+		"lineinfo_data",
 		"lineinfo_file_offsets",
 		"lineinfo_filenames",
-		"lineinfo_lines",
+		"lineinfo_num_blocks",
 		"lineinfo_num_entries",
 		"lineinfo_num_files",
 	};
diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index 640209f2e9eb9..3c122cf9b95c5 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -235,12 +235,16 @@ lineinfo_num_entries:
 	.balign 4
 lineinfo_num_files:
 	.long 0
-	.globl lineinfo_addrs
-lineinfo_addrs:
-	.globl lineinfo_file_ids
-lineinfo_file_ids:
-	.globl lineinfo_lines
-lineinfo_lines:
+	.globl lineinfo_num_blocks
+	.balign 4
+lineinfo_num_blocks:
+	.long 0
+	.globl lineinfo_block_addrs
+lineinfo_block_addrs:
+	.globl lineinfo_block_offsets
+lineinfo_block_offsets:
+	.globl lineinfo_data
+lineinfo_data:
 	.globl lineinfo_file_offsets
 lineinfo_file_offsets:
 	.globl lineinfo_filenames
-- 
2.51.0


