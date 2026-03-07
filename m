Return-Path: <linux-kbuild+bounces-11644-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG5xKqherGl/pAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11644-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 18:21:44 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D7B22CEAF
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 18:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B383E3047E4D
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Mar 2026 17:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6750A3101A9;
	Sat,  7 Mar 2026 17:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzaTqqjP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0A02E1746;
	Sat,  7 Mar 2026 17:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904035; cv=none; b=B52ewGSPeNkn/7jJ9aWz8Q5TgWOpvbyht9Ud7Ik/joDya3Y9kJ8JnmYwZ5DTZsCHY2QdpxNv4epcm0fBrPjCYHQY/gmkHfhyIje8A3qXXCtFpxwIbzENMzhLxOY/nkbQTEQK2WQNpcBlO5G/+WuBIqZk/m+U3uXv0/TwDhqKc4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904035; c=relaxed/simple;
	bh=V3WVZbhzwSfBFqjhgS2PSG/k3Zh/Mcurv+nl9c9WPeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B6wjwJxWxTbV3fqNpPrxhTAT58Uzi53mi6IOnp9RV/gCS5RghB+RTqOf+ohwmzqYw2x5yB4gCLxDRm6US4EDI6yDfJFq8ARJhCZxfuK1oBL15x416Y1WLiAkMR8LYXSoFcj02PPiWo85jqlfd/uS5iSlt/wNgcupiVfIkg6Y17k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzaTqqjP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E38BC19422;
	Sat,  7 Mar 2026 17:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772904034;
	bh=V3WVZbhzwSfBFqjhgS2PSG/k3Zh/Mcurv+nl9c9WPeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KzaTqqjPPSsCPDKFggI6z6/q6U/FsZqRR0c5Xl64BCJv7MxGwmIJT4uIApSGzHW9A
	 c/zQWDuTpzCpxuFnUgJ3DkgbfP3k6nB+KOg0cabTuMlXQMuzNh2UptCvWl6rrP5Yve
	 RA3LmsqJJ4N4feejVMUuGMEf9GqbZQnRihgGbq1j+WacmabbZKDFHu3uRCN9q6RhAy
	 r/V94FjhFV2DZmQhF5Qr8O1q5xdV+F/Ig8+D+aWuh1Ppel3pXs80Z7c+GFePkvS7Uo
	 iTFEpedNDikr+QK63Oyr93e7KboUCnAXwZ6+wCw9tBprV3aQwYG6ciJvZyeA2Xl4JV
	 rC8VVNHTUyPGA==
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
	deller@gmx.de,
	rdunlap@infradead.org,
	laurent.pinchart@ideasonboard.com,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2 3/4] kallsyms: delta-compress lineinfo tables for ~2.7x size reduction
Date: Sat,  7 Mar 2026 12:20:20 -0500
Message-ID: <20260307172022.460402-4-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260307172022.460402-1-sashal@kernel.org>
References: <20260307172022.460402-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 52D7B22CEAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,kernel.org,suse.com,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,vger.kernel.org,gmx.de,ideasonboard.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11644-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
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
 include/linux/mod_lineinfo.h                  | 106 ++++++++--
 init/Kconfig                                  |   8 +-
 kernel/kallsyms.c                             |  83 ++++++--
 kernel/kallsyms_internal.h                    |   8 +-
 kernel/module/kallsyms.c                      | 104 +++++++--
 scripts/gen_lineinfo.c                        | 199 ++++++++++++++----
 scripts/kallsyms.c                            |   7 +-
 scripts/link-vmlinux.sh                       |  20 +-
 9 files changed, 438 insertions(+), 104 deletions(-)

diff --git a/Documentation/admin-guide/kallsyms-lineinfo.rst b/Documentation/admin-guide/kallsyms-lineinfo.rst
index 5cae995eb118e..dd264830c8d5b 100644
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
index d62e9608f0f82..d00fb2937968c 100644
--- a/include/linux/mod_lineinfo.h
+++ b/include/linux/mod_lineinfo.h
@@ -8,13 +8,20 @@
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
+ *   (0-3 bytes padding to 4-byte alignment)
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
@@ -25,44 +32,109 @@
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
+	u32 off = mod_lineinfo_data_off(num_blocks) + data_size;
+
+	return (off + 3) & ~(u32)3;	/* align to 4 bytes for u32[] */
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
index 4ae0e9501da1a..bbc4d59243dd4 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -468,13 +468,20 @@ static int append_buildid(char *buffer,   const char *modname,
 #endif /* CONFIG_STACKTRACE_BUILD_ID */
 
 #ifdef CONFIG_KALLSYMS_LINEINFO
+#include <linux/mod_lineinfo.h>
+
 bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
 			      const char **file, unsigned int *line)
 {
 	unsigned long long raw_offset;
-	unsigned int offset, low, high, mid, file_id;
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
@@ -486,12 +493,12 @@ bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
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
@@ -499,18 +506,70 @@ bool kallsyms_lookup_lineinfo(unsigned long addr, unsigned long sym_start,
 
 	if (low == 0)
 		return false;
-	low--;
+	block = low - 1;
+
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
+		data_end = lineinfo_data_size;
+
+	/* Decode entry 0: addr from block_addrs, file_id and line from stream */
+	pos = lineinfo_block_offsets[block];
+	if (pos >= data_end)
+		return false;
+	cur_addr = lineinfo_block_addrs[block];
+	cur_file_id = lineinfo_read_uleb128(lineinfo_data, &pos, data_end);
+	cur_line = lineinfo_read_uleb128(lineinfo_data, &pos, data_end);
+
+	/* Check entry 0 */
+	if (cur_addr <= offset) {
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
+		addr_delta = lineinfo_read_uleb128(lineinfo_data, &pos, data_end);
+		file_delta = zigzag_decode(lineinfo_read_uleb128(lineinfo_data, &pos, data_end));
+		line_delta = zigzag_decode(lineinfo_read_uleb128(lineinfo_data, &pos, data_end));
 
-	file_id = lineinfo_file_ids[low];
-	*line = lineinfo_lines[low];
+		cur_addr += addr_delta;
+		cur_file_id = (unsigned int)((int32_t)cur_file_id + file_delta);
+		cur_line = (unsigned int)((int32_t)cur_line + line_delta);
+
+		if (cur_addr > offset)
+			break;
+
+		best_file_id = cur_file_id;
+		best_line = cur_line;
+		found = true;
+	}
+
+	if (!found)
+		return false;
 
-	if (file_id >= lineinfo_num_files)
+	if (best_file_id >= lineinfo_num_files)
 		return false;
 
-	if (lineinfo_file_offsets[file_id] >= lineinfo_filenames_size)
+	if (lineinfo_file_offsets[best_file_id] >= lineinfo_filenames_size)
 		return false;
 
-	*file = &lineinfo_filenames[lineinfo_file_offsets[file_id]];
+	*file = &lineinfo_filenames[lineinfo_file_offsets[best_file_id]];
+	*line = best_line;
 	return true;
 }
 #endif /* CONFIG_KALLSYMS_LINEINFO */
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index 982557aeff28d..a11d61a34f593 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -17,10 +17,12 @@ extern const u8 kallsyms_seqs_of_names[];
 
 #ifdef CONFIG_KALLSYMS_LINEINFO
 extern const u32 lineinfo_num_entries;
-extern const u32 lineinfo_addrs[];
-extern const u16 lineinfo_file_ids[];
-extern const u32 lineinfo_lines[];
 extern const u32 lineinfo_num_files;
+extern const u32 lineinfo_num_blocks;
+extern const u32 lineinfo_block_addrs[];
+extern const u32 lineinfo_block_offsets[];
+extern const u32 lineinfo_data_size;
+extern const u8  lineinfo_data[];
 extern const u32 lineinfo_file_offsets[];
 extern const u32 lineinfo_filenames_size;
 extern const char lineinfo_filenames[];
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index 4bfb6707fb8a5..52a839ca61bd9 100644
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
@@ -571,17 +579,71 @@ bool module_lookup_lineinfo(struct module *mod, unsigned long addr,
 
 	if (low == 0)
 		return false;
-	low--;
+	block = low - 1;
 
-	file_id = file_ids[low];
-	if (file_id >= num_files)
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
+	if (cur_addr <= offset) {
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
+		best_file_id = cur_file_id;
+		best_line = cur_line;
+		found = true;
+	}
+
+	if (!found)
+		return false;
+
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
index 5ced6897cbbee..13f8bbd66f23c 100644
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
 
@@ -550,6 +562,93 @@ static void deduplicate(void)
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
@@ -593,28 +692,46 @@ static void output_assembly(void)
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
+	printf("lineinfo_num_blocks:\n");
+	printf("\t.long %u\n\n", num_blocks);
+
+	/* Block first-addresses for binary search */
+	printf("\t.globl lineinfo_block_addrs\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_block_addrs:\n");
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long 0x%x\n", block_addrs[i]);
 	printf("\n");
 
-	/* File IDs, parallel to addrs (u16 -- supports up to 65535 files) */
-	printf("\t.globl lineinfo_file_ids\n");
-	printf("\t.balign 2\n");
-	printf("lineinfo_file_ids:\n");
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.short %u\n", entries[i].file_id);
+	/* Block byte offsets into compressed stream */
+	printf("\t.globl lineinfo_block_offsets\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_block_offsets:\n");
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long %u\n", block_offsets[i]);
 	printf("\n");
 
-	/* Line numbers, parallel to addrs */
-	printf("\t.globl lineinfo_lines\n");
+	/* Compressed data size */
+	printf("\t.globl lineinfo_data_size\n");
 	printf("\t.balign 4\n");
-	printf("lineinfo_lines:\n");
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.long %u\n", entries[i].line);
+	printf("lineinfo_data_size:\n");
+	printf("\t.long %u\n\n", compressed_size);
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
@@ -660,36 +777,42 @@ static void output_module_assembly(void)
 
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
 
-	/* file_offsets[] */
+	/* file_offsets[] -- align after variable-length compressed data */
+	printf("\t.balign 4\n");
 	for (unsigned int i = 0; i < num_files; i++)
 		printf("\t.long %u\n", files[i].str_offset);
 	if (num_files)
@@ -777,10 +900,11 @@ int main(int argc, char *argv[])
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
@@ -796,6 +920,9 @@ int main(int argc, char *argv[])
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
index 9222659806700..db36c27e23444 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -235,12 +235,20 @@ lineinfo_num_entries:
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
+	.globl lineinfo_data_size
+	.balign 4
+lineinfo_data_size:
+	.long 0
+	.globl lineinfo_data
+lineinfo_data:
 	.globl lineinfo_file_offsets
 lineinfo_file_offsets:
 	.globl lineinfo_filenames_size
-- 
2.51.0


