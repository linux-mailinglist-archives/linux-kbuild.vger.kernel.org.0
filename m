Return-Path: <linux-kbuild+bounces-13942-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yHRLE9/bS2o9bgEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13942-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Jul 2026 18:46:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD2371378F
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Jul 2026 18:46:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=C7LTx0Lg;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13942-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13942-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C75F53517493
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Jul 2026 14:30:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4623B71A2;
	Mon,  6 Jul 2026 14:29:41 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206393806DD;
	Mon,  6 Jul 2026 14:29:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783348181; cv=none; b=q6uFDv6fXp/4KOXYs3rB91utV8mNWTs+PxJxF2a3yi8Og6fPpxypyliBOFvaypgW44c/FVFGChGB8l2lbOS4sfG1qPPHszvZA4WahJJktfNpPyDFDI1p1IukGF88Q6GpazkwKyxUtVC3f+UV50xbola1pT6znUDEMfKX/vrjsZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783348181; c=relaxed/simple;
	bh=fSN+CekdwU6VNrW6zjWyq0n4nWmHQca/tTGSjq6KLWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lM4Kjpt/oZ8O8HQ5ebOFxPWH1P4wnXpZ79lEZ6r4ZD3ryhquKMLGh4f9NHZqH31S9+L/rSoP9yD/Kf6nXqHBEQxLyK7KKhqHPjR/BAJJvYRjssFCCGnH0gaL4t/oIp+7TQWOi8hZG/SL8dTBfKSLX+bm6gKb7UjU5qRxdM3VNtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C7LTx0Lg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AE941F00A3A;
	Mon,  6 Jul 2026 14:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783348178;
	bh=fR+kMymmiRlWyyL0A06wRKKsGZPI5OeJB6h3uVQa/cE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C7LTx0Lg0SBV2HgqsruG+Gnn+Xa1MD/u025g/OxBk77CdsscJaQwhDwUAUMRwTyYG
	 NofURnIuoXuAlaom6ix4qwIGK9Dq2MBN6KmpquyCtfitS9LoiFxU0GKSIQYq0UNi/z
	 DCsfByPuDvIqhe0cFODUlrWSa7BCQRMFf3bVPaas+nsukLJHdejC6vAhLS8No1d5/i
	 2fWphBTK5dJHOCLNGSFDHk+dYYj6faqT0vsOlmrEJ8fqUFqi42L4DLu5+fSY4A0eLu
	 Ko+bUNrAxhilfC/n4av/TpSyqZia0/ML7Vx9swWNsDkTy7/X3w2JGCwc0jQT3LRPBY
	 CRXQUSlER6fYg==
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
Subject: [PATCH v6 3/4] kallsyms: delta-compress lineinfo tables for ~2.7x size reduction
Date: Mon,  6 Jul 2026 10:29:08 -0400
Message-ID: <20260706142914.2398993-4-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
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
	TAGGED_FROM(0.00)[bounces-13942-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,suse.com:email,vger.kernel.org:from_smtp,tbl.data:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FD2371378F

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
 include/linux/mod_lineinfo.h | 236 ++++++++++++++++++++++++++++++-----
 kernel/kallsyms.c            |  46 +++----
 kernel/kallsyms_internal.h   |   8 +-
 kernel/module/kallsyms.c     | 106 +++++++---------
 scripts/empty_lineinfo.S     |  20 ++-
 scripts/gen_lineinfo.c       | 185 ++++++++++++++++++---------
 scripts/kallsyms.c           |   7 +-
 7 files changed, 420 insertions(+), 188 deletions(-)

diff --git a/include/linux/mod_lineinfo.h b/include/linux/mod_lineinfo.h
index 9cda3263a07847..a3c71434330203 100644
--- a/include/linux/mod_lineinfo.h
+++ b/include/linux/mod_lineinfo.h
@@ -3,9 +3,9 @@
  * mod_lineinfo.h - Binary format for per-module source line information
  *
  * This header defines the layout of the .mod_lineinfo and
- * .init.mod_lineinfo sections embedded in loadable kernel modules.  It
- * is dual-use: included from both the kernel and the userspace
- * gen_lineinfo tool.
+ * .init.mod_lineinfo sections embedded in loadable kernel modules.  It is
+ * dual-use: included from both the kernel and the userspace gen_lineinfo
+ * tool.
  *
  * Top-level layout (all values in target-native endianness):
  *
@@ -20,16 +20,27 @@
  * If the relocation fails to resolve (e.g. unknown reloc type), .anchor
  * stays zero and lookups silently degrade to "no annotation".
  *
- * Each per-section sub-table is laid out as a stand-alone
- * mod_lineinfo_header followed by parallel arrays:
+ * Each per-section sub-table is laid out exactly as a stand-alone
+ * mod_lineinfo_header followed by its arrays:
  *
- *   struct mod_lineinfo_header     (16 bytes)
- *   u32 addrs[num_entries]         -- offsets from this section's base, sorted
- *   u16 file_ids[num_entries]      -- parallel to addrs
- *   <2-byte pad if num_entries is odd>
- *   u32 lines[num_entries]         -- parallel to addrs
+ *   struct mod_lineinfo_header
+ *   u32 block_addrs[num_blocks]    -- first addr per block, for binary search
+ *   u32 block_offsets[num_blocks]  -- byte offset into compressed data stream
+ *   u8  data[data_size]            -- LEB128 delta-compressed entries
  *   u32 file_offsets[num_files]    -- byte offset into filenames[]
  *   char filenames[filenames_size] -- concatenated NUL-terminated strings
+ *
+ * Each sub-array is located by an explicit (offset, size) pair in the
+ * header, similar to a flattened devicetree.  All offsets in the per-section
+ * header are relative to that header itself, so a sub-table is fully
+ * self-describing.
+ *
+ * Compressed stream format (per block of LINEINFO_BLOCK_ENTRIES entries):
+ *   Entry 0: file_id (ULEB128), line (ULEB128)
+ *            addr is in block_addrs[]
+ *   Entry 1..N: addr_delta (ULEB128),
+ *               file_id_delta (SLEB128),
+ *               line_delta (SLEB128)
  */
 #ifndef _LINUX_MOD_LINEINFO_H
 #define _LINUX_MOD_LINEINFO_H
@@ -40,9 +51,12 @@
 #include <stdint.h>
 typedef uint32_t u32;
 typedef uint16_t u16;
+typedef uint8_t  u8;
 typedef uint64_t u64;
 #endif
 
+#define LINEINFO_BLOCK_ENTRIES 64
+
 /*
  * Per-section descriptor.  One entry per ELF text section covered by the
  * blob (.text, .exit.text, .init.text, ...).
@@ -66,39 +80,201 @@ struct mod_lineinfo_root {
 
 struct mod_lineinfo_header {
 	u32 num_entries;
+	u32 num_blocks;
 	u32 num_files;
-	u32 filenames_size;	/* total bytes of concatenated filenames */
+	u32 blocks_offset;	/* offset to block_addrs[] from this header */
+	u32 blocks_size;	/* bytes: num_blocks * 2 * sizeof(u32) */
+	u32 data_offset;	/* offset to compressed stream */
+	u32 data_size;		/* bytes of compressed data */
+	u32 files_offset;	/* offset to file_offsets[] */
+	u32 files_size;		/* bytes: num_files * sizeof(u32) */
+	u32 filenames_offset;
+	u32 filenames_size;
 };
 
-/* Offset helpers: compute byte offset from the per-section header to each array. */
+/*
+ * Descriptor for a lineinfo table, used by the shared lookup function.
+ * Callers populate this from either linker globals (vmlinux) or a
+ * validated mod_lineinfo_header (modules).
+ */
+struct lineinfo_table {
+	const u32 *blk_addrs;
+	const u32 *blk_offsets;
+	const u8  *data;
+	u32 data_size;
+	const u32 *file_offsets;
+	const char *filenames;
+	u32 num_entries;
+	u32 num_blocks;
+	u32 num_files;
+	u32 filenames_size;
+};
 
-static inline u32 mod_lineinfo_addrs_off(void)
+/*
+ * Read a ULEB128 varint from a byte stream.
+ * Returns the decoded value and advances *pos past the encoded bytes.
+ * If *pos would exceed 'end', returns 0 and sets *pos = end (safe for
+ * NMI/panic context: no crash, just a missed annotation).
+ */
+static inline u32 lineinfo_read_uleb128(const u8 *data, u32 *pos, u32 end)
 {
-	return sizeof(struct mod_lineinfo_header);
-}
+	u32 result = 0;
+	unsigned int shift = 0;
 
-static inline u32 mod_lineinfo_file_ids_off(u32 num_entries)
-{
-	return mod_lineinfo_addrs_off() + num_entries * sizeof(u32);
+	while (*pos < end) {
+		u8 byte = data[*pos];
+		(*pos)++;
+		result |= (u32)(byte & 0x7f) << shift;
+		if (!(byte & 0x80))
+			return result;
+		shift += 7;
+		if (shift >= 32) {
+			/* Malformed: skip remaining continuation bytes */
+			while (*pos < end && (data[*pos] & 0x80))
+				(*pos)++;
+			if (*pos < end)
+				(*pos)++;
+			return result;
+		}
+	}
+	return result;
 }
 
-static inline u32 mod_lineinfo_lines_off(u32 num_entries)
+/* Read an SLEB128 varint. Same safety guarantees as above. */
+static inline int32_t lineinfo_read_sleb128(const u8 *data, u32 *pos, u32 end)
 {
-	/* u16 file_ids[] may need 2-byte padding to align lines[] to 4 bytes */
-	u32 off = mod_lineinfo_file_ids_off(num_entries) +
-		  num_entries * sizeof(u16);
-	return (off + 3) & ~3u;
-}
+	int32_t result = 0;
+	unsigned int shift = 0;
+	u8 byte = 0;
 
-static inline u32 mod_lineinfo_file_offsets_off(u32 num_entries)
-{
-	return mod_lineinfo_lines_off(num_entries) + num_entries * sizeof(u32);
+	while (*pos < end) {
+		byte = data[*pos];
+		(*pos)++;
+		result |= (int32_t)(byte & 0x7f) << shift;
+		shift += 7;
+		if (!(byte & 0x80))
+			break;
+		if (shift >= 32) {
+			while (*pos < end && (data[*pos] & 0x80))
+				(*pos)++;
+			if (*pos < end)
+				(*pos)++;
+			return result;
+		}
+	}
+
+	/* Sign-extend if the high bit of the last byte was set */
+	if (shift < 32 && (byte & 0x40))
+		result |= -(1 << shift);
+
+	return result;
 }
 
-static inline u32 mod_lineinfo_filenames_off(u32 num_entries, u32 num_files)
+/*
+ * Search a lineinfo table for the source file and line corresponding to a
+ * given offset (from _text for vmlinux, from .text base for modules).
+ *
+ * Safe for NMI and panic context: no locks, no allocations, all state on stack.
+ * Returns true and sets @file and @line on success; false on any failure.
+ */
+static inline bool lineinfo_search(const struct lineinfo_table *tbl,
+				   unsigned int offset,
+				   const char **file, unsigned int *line)
 {
-	return mod_lineinfo_file_offsets_off(num_entries) +
-	       num_files * sizeof(u32);
+	unsigned int low, high, mid, block;
+	unsigned int cur_addr, cur_file_id, cur_line;
+	unsigned int best_file_id = 0, best_line = 0;
+	unsigned int block_entries, data_end;
+	bool found = false;
+	u32 pos;
+
+	if (!tbl->num_entries || !tbl->num_blocks)
+		return false;
+
+	/* Binary search on blk_addrs[] to find the right block */
+	low = 0;
+	high = tbl->num_blocks;
+	while (low < high) {
+		mid = low + (high - low) / 2;
+		if (tbl->blk_addrs[mid] <= offset)
+			low = mid + 1;
+		else
+			high = mid;
+	}
+
+	if (low == 0)
+		return false;
+	block = low - 1;
+
+	/* How many entries in this block? */
+	block_entries = LINEINFO_BLOCK_ENTRIES;
+	if (block == tbl->num_blocks - 1) {
+		unsigned int remaining = tbl->num_entries -
+					block * LINEINFO_BLOCK_ENTRIES;
+
+		if (remaining < block_entries)
+			block_entries = remaining;
+	}
+
+	/* Determine end of this block's data in the compressed stream */
+	if (block + 1 < tbl->num_blocks)
+		data_end = tbl->blk_offsets[block + 1];
+	else
+		data_end = tbl->data_size;
+
+	/* Clamp data_end to actual data size */
+	if (data_end > tbl->data_size)
+		data_end = tbl->data_size;
+
+	/* Decode entry 0: addr from blk_addrs, file_id and line from stream */
+	pos = tbl->blk_offsets[block];
+	if (pos >= data_end)
+		return false;
+
+	cur_addr = tbl->blk_addrs[block];
+	cur_file_id = lineinfo_read_uleb128(tbl->data, &pos, data_end);
+	cur_line = lineinfo_read_uleb128(tbl->data, &pos, data_end);
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
+		addr_delta = lineinfo_read_uleb128(tbl->data, &pos, data_end);
+		file_delta = lineinfo_read_sleb128(tbl->data, &pos, data_end);
+		line_delta = lineinfo_read_sleb128(tbl->data, &pos, data_end);
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
+	if (best_file_id >= tbl->num_files)
+		return false;
+
+	if (tbl->file_offsets[best_file_id] >= tbl->filenames_size)
+		return false;
+
+	*file = &tbl->filenames[tbl->file_offsets[best_file_id]];
+	*line = best_line;
+	return true;
 }
 
 #endif /* _LINUX_MOD_LINEINFO_H */
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index d95387f51b4c08..1f58b4123a8ae7 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -467,13 +467,16 @@ static int append_buildid(char *buffer,   const char *modname,
 
 #endif /* CONFIG_STACKTRACE_BUILD_ID */
 
+#include <linux/mod_lineinfo.h>
+
 bool kallsyms_lookup_lineinfo(unsigned long addr,
 			      const char **file, unsigned int *line)
 {
+	struct lineinfo_table tbl;
 	unsigned long long raw_offset;
-	unsigned int offset, low, high, mid, file_id;
 
-	if (!IS_ENABLED(CONFIG_KALLSYMS_LINEINFO) || !lineinfo_num_entries)
+	if (!IS_ENABLED(CONFIG_KALLSYMS_LINEINFO) ||
+	    !lineinfo_num_entries || !lineinfo_num_blocks)
 		return false;
 
 	/* Compute offset from _text */
@@ -483,34 +486,19 @@ bool kallsyms_lookup_lineinfo(unsigned long addr,
 	raw_offset = addr - (unsigned long)_text;
 	if (raw_offset > UINT_MAX)
 		return false;
-	offset = (unsigned int)raw_offset;
-
-	/* Binary search for largest entry <= offset */
-	low = 0;
-	high = lineinfo_num_entries;
-	while (low < high) {
-		mid = low + (high - low) / 2;
-		if (lineinfo_addrs[mid] <= offset)
-			low = mid + 1;
-		else
-			high = mid;
-	}
-
-	if (low == 0)
-		return false;
-	low--;
-
-	file_id = lineinfo_file_ids[low];
-	*line = lineinfo_lines[low];
-
-	if (file_id >= lineinfo_num_files)
-		return false;
-
-	if (lineinfo_file_offsets[file_id] >= lineinfo_filenames_size)
-		return false;
 
-	*file = &lineinfo_filenames[lineinfo_file_offsets[file_id]];
-	return true;
+	tbl.blk_addrs	= lineinfo_block_addrs;
+	tbl.blk_offsets	= lineinfo_block_offsets;
+	tbl.data	= lineinfo_data;
+	tbl.data_size	= lineinfo_data_size;
+	tbl.file_offsets = lineinfo_file_offsets;
+	tbl.filenames	= lineinfo_filenames;
+	tbl.num_entries	= lineinfo_num_entries;
+	tbl.num_blocks	= lineinfo_num_blocks;
+	tbl.num_files	= lineinfo_num_files;
+	tbl.filenames_size = lineinfo_filenames_size;
+
+	return lineinfo_search(&tbl, (unsigned int)raw_offset, file, line);
 }
 
 /* Look up a kernel symbol and return it in a text buffer. */
diff --git a/kernel/kallsyms_internal.h b/kernel/kallsyms_internal.h
index d7374ce444d811..ffe4c658067ecc 100644
--- a/kernel/kallsyms_internal.h
+++ b/kernel/kallsyms_internal.h
@@ -16,10 +16,12 @@ extern const unsigned int kallsyms_markers[];
 extern const u8 kallsyms_seqs_of_names[];
 
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
index 819d6594c29371..2bec9f0e6afc55 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -498,9 +498,9 @@ int module_kallsyms_on_each_symbol(const char *modname,
 #include <linux/mod_lineinfo.h>
 
 /*
- * Search one per-section sub-table for @section_offset using flat parallel
- * arrays.  @hdr is the per-section header at byte offset @hdr_offset within
- * @blob.  Returns true on hit and populates @file / @line.
+ * Search one per-section sub-table for @section_offset.
+ * @hdr is the per-section header at byte offset @hdr_offset within @blob.
+ * Returns true on hit and populates @file / @line.
  */
 static bool module_lookup_lineinfo_section(const void *blob, u32 blob_size,
 					   u32 hdr_offset,
@@ -509,85 +509,71 @@ static bool module_lookup_lineinfo_section(const void *blob, u32 blob_size,
 					   unsigned int *line)
 {
 	const struct mod_lineinfo_header *hdr;
-	const u8 *base;
-	const u32 *addrs, *lines, *file_offsets;
-	const u16 *file_ids;
-	const char *filenames;
-	u32 num_entries, num_files, filenames_size;
-	unsigned int low, high, mid;
-	u16 file_id;
+	struct lineinfo_table tbl;
+	const void *base;
 
 	if (hdr_offset > blob_size ||
 	    blob_size - hdr_offset < sizeof(*hdr))
 		return false;
 
 	base = (const u8 *)blob + hdr_offset;
-	hdr = (const struct mod_lineinfo_header *)base;
-	num_entries = hdr->num_entries;
-	num_files = hdr->num_files;
-	filenames_size = hdr->filenames_size;
+	hdr = base;
 
-	if (num_entries == 0)
+	if (hdr->num_entries == 0 || hdr->num_blocks == 0)
 		return false;
 
-	/*
-	 * Validate counts before multiplying — sizing arithmetic could
-	 * otherwise overflow on 32-bit with a malformed blob.  Each entry
-	 * contributes one u32 (addrs), one u16 (file_ids), and one u32
-	 * (lines); each file contributes one u32 (file_offsets).
-	 */
+	/* Validate each sub-array fits within the remaining blob bytes */
 	{
 		u32 avail = blob_size - hdr_offset;
-		u32 needed = mod_lineinfo_filenames_off(num_entries, num_files);
 
-		if (num_entries > U32_MAX / sizeof(u32))
+		if (hdr->blocks_offset > avail ||
+		    hdr->blocks_size > avail - hdr->blocks_offset)
+			return false;
+		if (hdr->data_offset > avail ||
+		    hdr->data_size > avail - hdr->data_offset)
 			return false;
-		if (num_files > U32_MAX / sizeof(u32))
+		if (hdr->files_offset > avail ||
+		    hdr->files_size > avail - hdr->files_offset)
 			return false;
-		if (needed > avail || filenames_size > avail - needed)
+		if (hdr->filenames_offset > avail ||
+		    hdr->filenames_size > avail - hdr->filenames_offset)
 			return false;
 	}
 
 	/*
-	 * Filenames are read as NUL-terminated C strings.  Require the blob
-	 * to end in NUL so a malformed file_offsets entry can never lead the
-	 * later "%s" consumer past the end of the section.
+	 * Validate counts before multiplying by element size — multiplication
+	 * could otherwise overflow on 32-bit builds with a malformed blob.
+	 * num_blocks contributes (addr,offset) u32 pairs; num_files contributes
+	 * one u32 each.
 	 */
-	if (filenames_size == 0 ||
-	    base[mod_lineinfo_filenames_off(num_entries, num_files) +
-		 filenames_size - 1] != 0)
+	if (hdr->num_blocks > hdr->blocks_size / (2 * sizeof(u32)))
 		return false;
-
-	addrs = (const u32 *)(base + mod_lineinfo_addrs_off());
-	file_ids = (const u16 *)(base + mod_lineinfo_file_ids_off(num_entries));
-	lines = (const u32 *)(base + mod_lineinfo_lines_off(num_entries));
-	file_offsets = (const u32 *)(base + mod_lineinfo_file_offsets_off(num_entries));
-	filenames = (const char *)(base + mod_lineinfo_filenames_off(num_entries, num_files));
-
-	/* Binary search for largest entry <= section_offset. */
-	low = 0;
-	high = num_entries;
-	while (low < high) {
-		mid = low + (high - low) / 2;
-		if (addrs[mid] <= section_offset)
-			low = mid + 1;
-		else
-			high = mid;
-	}
-
-	if (low == 0)
+	if (hdr->num_files > hdr->files_size / sizeof(u32))
 		return false;
-	low--;
 
-	file_id = file_ids[low];
-	if (file_id >= num_files)
-		return false;
-	if (file_offsets[file_id] >= filenames_size)
+	/*
+	 * Filenames are read as NUL-terminated C strings.  Require the blob
+	 * to end in NUL so a malformed file_offsets entry can never lead the
+	 * later "%s" consumer past the end of the section.
+	 */
+	if (hdr->filenames_size == 0 ||
+	    ((const u8 *)base)[hdr->filenames_offset +
+			       hdr->filenames_size - 1] != 0)
 		return false;
 
-	*file = &filenames[file_offsets[file_id]];
-	*line = lines[low];
-	return true;
+	tbl.blk_addrs	= base + hdr->blocks_offset;
+	tbl.blk_offsets	= base + hdr->blocks_offset +
+			  hdr->num_blocks * sizeof(u32);
+	tbl.data	= base + hdr->data_offset;
+	tbl.data_size	= hdr->data_size;
+	tbl.file_offsets = base + hdr->files_offset;
+	tbl.filenames	= base + hdr->filenames_offset;
+	tbl.num_entries	= hdr->num_entries;
+	tbl.num_blocks	= hdr->num_blocks;
+	tbl.num_files	= hdr->num_files;
+	tbl.filenames_size = hdr->filenames_size;
+
+	return lineinfo_search(&tbl, section_offset, file, line);
 }
 
 /*
@@ -609,6 +595,7 @@ static bool module_lookup_lineinfo_blob(const void *blob, u32 blob_size,
 	if (root->num_sections == 0)
 		return false;
 
+	/* Validate sections[] array fits within the blob */
 	if (root->num_sections > U32_MAX / sizeof(struct mod_lineinfo_section))
 		return false;
 	sections_end = sizeof(*root) +
@@ -642,6 +629,9 @@ static bool module_lookup_lineinfo_blob(const void *blob, u32 blob_size,
 
 /*
  * Look up source file:line for an address within a loaded module.
+ * Uses the .mod_lineinfo / .init.mod_lineinfo sections embedded in the .ko
+ * at build time.  Each section contains one or more per-section sub-tables
+ * keyed by an ELF-relocation-resolved anchor.
  *
  * Safe in NMI/panic context: no locks, no allocations.
  * Caller must hold RCU read lock (or be in a context where the module
diff --git a/scripts/empty_lineinfo.S b/scripts/empty_lineinfo.S
index e058c411371237..edd5b1092f0503 100644
--- a/scripts/empty_lineinfo.S
+++ b/scripts/empty_lineinfo.S
@@ -14,12 +14,20 @@ lineinfo_num_entries:
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
diff --git a/scripts/gen_lineinfo.c b/scripts/gen_lineinfo.c
index e1e08469b4f2fd..394690a23a2f7d 100644
--- a/scripts/gen_lineinfo.c
+++ b/scripts/gen_lineinfo.c
@@ -825,6 +825,45 @@ static void deduplicate(struct covered_section *sections,
 	}
 }
 
+/*
+ * Emit the LEB128 delta-compressed data stream for one block.
+ * @base is the absolute index of the first entry, @count is the number of
+ * entries in this block (<= LINEINFO_BLOCK_ENTRIES).  Used by both vmlinux
+ * mode (one section, full entries[]) and module mode (per-section ranges).
+ */
+static void emit_block_data_range(unsigned int base, unsigned int count)
+{
+	if (!count)
+		return;
+
+	/* Entry 0: file_id, line (both unsigned) */
+	printf("\t.uleb128 %u\n", entries[base].file_id);
+	printf("\t.uleb128 %u\n", entries[base].line);
+
+	/* Entries 1..N: addr_delta (unsigned), file/line deltas (signed) */
+	for (unsigned int i = 1; i < count; i++) {
+		unsigned int idx = base + i;
+
+		printf("\t.uleb128 %u\n",
+		       entries[idx].offset - entries[idx - 1].offset);
+		printf("\t.sleb128 %d\n",
+		       (int)entries[idx].file_id - (int)entries[idx - 1].file_id);
+		printf("\t.sleb128 %d\n",
+		       (int)entries[idx].line - (int)entries[idx - 1].line);
+	}
+}
+
+/* Vmlinux-mode wrapper: pick block index out of the global entries[]. */
+static void emit_block_data(unsigned int block)
+{
+	unsigned int base = block * LINEINFO_BLOCK_ENTRIES;
+	unsigned int count = num_entries - base;
+
+	if (count > LINEINFO_BLOCK_ENTRIES)
+		count = LINEINFO_BLOCK_ENTRIES;
+	emit_block_data_range(base, count);
+}
+
 static void compute_file_offsets(void)
 {
 	unsigned int offset = 0;
@@ -848,6 +887,11 @@ static void print_escaped_asciz(const char *s)
 
 static void output_assembly(void)
 {
+	unsigned int num_blocks;
+
+	num_blocks = num_entries ?
+		(num_entries + LINEINFO_BLOCK_ENTRIES - 1) / LINEINFO_BLOCK_ENTRIES : 0;
+
 	printf("/* SPDX-License-Identifier: GPL-2.0 */\n");
 	printf("/*\n");
 	printf(" * Automatically generated by scripts/gen_lineinfo\n");
@@ -868,29 +912,40 @@ static void output_assembly(void)
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
-	printf("\n");
+	/* Block first-addresses for binary search */
+	printf("\t.globl lineinfo_block_addrs\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_block_addrs:\n");
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long 0x%x\n", entries[i * LINEINFO_BLOCK_ENTRIES].offset);
 
-	/* Line numbers, parallel to addrs */
-	printf("\t.globl lineinfo_lines\n");
+	/* Block byte offsets into compressed stream */
+	printf("\t.globl lineinfo_block_offsets\n");
 	printf("\t.balign 4\n");
-	printf("lineinfo_lines:\n");
-	for (unsigned int i = 0; i < num_entries; i++)
-		printf("\t.long %u\n", entries[i].line);
-	printf("\n");
+	printf("lineinfo_block_offsets:\n");
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long .Lblock_%u - lineinfo_data\n", i);
+
+	/* Compressed data size */
+	printf("\t.globl lineinfo_data_size\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_data_size:\n");
+	printf("\t.long .Ldata_end - lineinfo_data\n\n");
+
+	/* Compressed data stream */
+	printf("\t.globl lineinfo_data\n");
+	printf("lineinfo_data:\n");
+	for (unsigned int i = 0; i < num_blocks; i++) {
+		printf(".Lblock_%u:\n", i);
+		emit_block_data(i);
+	}
+	printf(".Ldata_end:\n\n");
 
 	/* File string offset table */
 	printf("\t.globl lineinfo_file_offsets\n");
@@ -898,71 +953,81 @@ static void output_assembly(void)
 	printf("lineinfo_file_offsets:\n");
 	for (unsigned int i = 0; i < num_files; i++)
 		printf("\t.long %u\n", files[i].str_offset);
-	printf("\n");
 
 	/* Filenames size */
-	{
-		unsigned int fsize = 0;
-
-		for (unsigned int i = 0; i < num_files; i++)
-			fsize += strlen(files[i].name) + 1;
-		printf("\t.globl lineinfo_filenames_size\n");
-		printf("\t.balign 4\n");
-		printf("lineinfo_filenames_size:\n");
-		printf("\t.long %u\n\n", fsize);
-	}
+	printf("\t.globl lineinfo_filenames_size\n");
+	printf("\t.balign 4\n");
+	printf("lineinfo_filenames_size:\n");
+	printf("\t.long .Lfilenames_end - lineinfo_filenames\n\n");
 
 	/* Concatenated NUL-terminated filenames */
 	printf("\t.globl lineinfo_filenames\n");
 	printf("lineinfo_filenames:\n");
 	for (unsigned int i = 0; i < num_files; i++)
 		print_escaped_asciz(files[i].name);
-	printf("\n");
+	printf(".Lfilenames_end:\n");
 }
 
 /*
- * Emit one per-section table in the simple flat-array layout:
+ * Emit one per-section table.  @suffix uniquifies the local labels so
+ * multiple tables can coexist in a single output blob; @blob_root_label
+ * is the symbol for the start of the enclosing blob (used for
+ * table_offset = .Lhdr - .Lroot).
  *
- *   mod_lineinfo_header
- *   addrs[count]    (u32, sorted)
- *   file_ids[count] (u16) + 2-byte pad if count is odd
- *   lines[count]    (u32)
- *   file_offsets[]  (u32)
- *   filenames[]
- *
- * @suffix uniquifies labels so multiple tables can coexist in one blob.
- * Caller has sorted entries[] so this section's entries occupy [first,
- * first + count).
+ * Caller has already sorted entries[] so this section's entries occupy
+ * the contiguous range [first, first + count).  This function emits
+ * block-relative addresses computed from entries[first + N].offset.
  */
 static void emit_section_table(unsigned int first, unsigned int count,
 			       const char *suffix)
 {
+	unsigned int num_blocks;
+
+	num_blocks = count ?
+		(count + LINEINFO_BLOCK_ENTRIES - 1) / LINEINFO_BLOCK_ENTRIES : 0;
+
 	printf(".Lhdr%s:\n", suffix);
 	printf("\t.balign 4\n");
 	printf("\t.long %u\t\t/* num_entries */\n", count);
+	printf("\t.long %u\t\t/* num_blocks */\n", num_blocks);
 	printf("\t.long %u\t\t/* num_files */\n", num_files);
+	printf("\t.long .Lblk_addrs%s - .Lhdr%s\n", suffix, suffix);
+	printf("\t.long .Lblk_offsets_end%s - .Lblk_addrs%s\n", suffix, suffix);
+	printf("\t.long .Ldata%s - .Lhdr%s\n", suffix, suffix);
+	printf("\t.long .Ldata_end%s - .Ldata%s\n", suffix, suffix);
+	printf("\t.long .Lfile_offsets%s - .Lhdr%s\n", suffix, suffix);
+	printf("\t.long .Lfile_offsets_end%s - .Lfile_offsets%s\n", suffix, suffix);
+	printf("\t.long .Lfilenames%s - .Lhdr%s\n", suffix, suffix);
 	printf("\t.long .Lfilenames_end%s - .Lfilenames%s\n\n", suffix, suffix);
 
-	/* addrs[] */
-	for (unsigned int i = 0; i < count; i++)
-		printf("\t.long 0x%x\n", entries[first + i].offset);
-
-	/* file_ids[] */
-	for (unsigned int i = 0; i < count; i++)
-		printf("\t.short %u\n", entries[first + i].file_id);
-	if (count & 1)
-		printf("\t.short 0\t\t/* pad to align lines[] */\n");
-
-	/* lines[] */
-	for (unsigned int i = 0; i < count; i++)
-		printf("\t.long %u\n", entries[first + i].line);
+	printf(".Lblk_addrs%s:\n", suffix);
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long 0x%x\n",
+		       entries[first + i * LINEINFO_BLOCK_ENTRIES].offset);
+
+	printf(".Lblk_offsets%s:\n", suffix);
+	for (unsigned int i = 0; i < num_blocks; i++)
+		printf("\t.long .Lblock%s_%u - .Ldata%s\n", suffix, i, suffix);
+	printf(".Lblk_offsets_end%s:\n\n", suffix);
+
+	printf(".Ldata%s:\n", suffix);
+	for (unsigned int i = 0; i < num_blocks; i++) {
+		unsigned int base = first + i * LINEINFO_BLOCK_ENTRIES;
+		unsigned int n = count - i * LINEINFO_BLOCK_ENTRIES;
+
+		if (n > LINEINFO_BLOCK_ENTRIES)
+			n = LINEINFO_BLOCK_ENTRIES;
+		printf(".Lblock%s_%u:\n", suffix, i);
+		emit_block_data_range(base, n);
+	}
+	printf(".Ldata_end%s:\n", suffix);
 
-	/* file_offsets[] */
 	printf("\t.balign 4\n");
+	printf(".Lfile_offsets%s:\n", suffix);
 	for (unsigned int i = 0; i < num_files; i++)
 		printf("\t.long %u\n", files[i].str_offset);
+	printf(".Lfile_offsets_end%s:\n\n", suffix);
 
-	/* filenames[] */
 	printf(".Lfilenames%s:\n", suffix);
 	for (unsigned int i = 0; i < num_files; i++)
 		print_escaped_asciz(files[i].name);
@@ -1236,8 +1301,10 @@ int main(int argc, char *argv[])
 		deduplicate(NULL, 0);
 		compute_file_offsets();
 
-		fprintf(stderr, "lineinfo: %u entries, %u files\n",
-			num_entries, num_files);
+		fprintf(stderr, "lineinfo: %u entries, %u files, %u blocks\n",
+			num_entries, num_files,
+			num_entries ?
+			(num_entries + LINEINFO_BLOCK_ENTRIES - 1) / LINEINFO_BLOCK_ENTRIES : 0);
 
 		output_assembly();
 	}
diff --git a/scripts/kallsyms.c b/scripts/kallsyms.c
index 42662c4fbc6c94..94fbdad3df7c6e 100644
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
-- 
2.53.0


