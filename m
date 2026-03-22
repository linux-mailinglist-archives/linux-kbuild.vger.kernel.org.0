Return-Path: <linux-kbuild+bounces-12128-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tvtKBofrv2llAAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12128-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 14:15:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 628B82E961B
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 14:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A547630097C3
	for <lists+linux-kbuild@lfdr.de>; Sun, 22 Mar 2026 13:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB49F3290DE;
	Sun, 22 Mar 2026 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol8N1ANr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ABD328B4B;
	Sun, 22 Mar 2026 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774185347; cv=none; b=b2d7tHbY0mvZBHt2PT4EEZVKsnlw4pIoA09xTnZl3tLWZLY6JHh6OK1vQ7cOZ280AD4wFAnoKKhneiS2AFvFTcYSUaRqjuXHqvYVT2D1cYJsXF58RNtD/m2/+H58OoRHZk/+Khke0bkuWfyyuI+/d0wib/Uke4toWzUB/BlKeeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774185347; c=relaxed/simple;
	bh=9dNHMu3VnFuzSVYqaegkUIg3pDM6/jDU2On3IqH4o9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DvuPPfRoBXqU56mTPzgc8Km089oAAJob+zbyKvJaxE7NWPzeF4f4jrxeW5rh2654a0l1+OXBQRQISkmd4PMPKv0G1sTiA2muBWhcE8tGK7HMf9As3Z0qpLTtXwhrF6w5MMnqC0jWIjD8mKsFgAx/qinUtiBguZhyRd68ioYAmWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol8N1ANr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD2FC19424;
	Sun, 22 Mar 2026 13:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774185347;
	bh=9dNHMu3VnFuzSVYqaegkUIg3pDM6/jDU2On3IqH4o9Y=;
	h=From:To:Cc:Subject:Date:From;
	b=ol8N1ANrJPVwRk8afnmgLyaAFDOM6AAW6zBkaGMiya665M8ii2IGgFBVy+GedIMc4
	 1eNehVJA66NmPFZmBMD4PLpcxZFkFv94Hv0bFA8N5IFlYZ8yRDd7h0k7gEdbM8BhO3
	 LvVjn+uDv/YA+KRdcCIVJmfPQjWUsCFGa01MmUQ/2HsA0uwFJf7OQ2qm34ItheV/Zu
	 0XxzSnWZwfDWIMmtGL/78taCejjbOG6UiZw0QHCF32TKVZ6ZRHTcZIhXUvfwRkw5KX
	 rZhbWR/B1tD7UJeTIFCei8XXI450HMsG+tKK4w44fxbSmrfpNHaCV4ywKuKP4SGOuM
	 p5/3p3gnb+Nvw==
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
	Helge Deller <deller@gmx.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v4 0/4] kallsyms: embed source file:line info in kernel stack traces
Date: Sun, 22 Mar 2026 09:15:39 -0400
Message-ID: <20260322131543.971079-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
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
	FREEMAIL_CC(0.00)[lwn.net,kernel.org,suse.com,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12128-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 628B82E961B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds CONFIG_KALLSYMS_LINEINFO, which embeds source file:line
information directly in the kernel image so that stack traces annotate
every frame with the originating source location - no external tools, no
debug symbols at runtime, and safe to use in NMI/panic context.

Motivation
==========

The recent "slowly decommission bugzilla?" thread surfaced a recurring
problem: when users encounter kernel crashes they see stack traces like
`func+0x1ec/0x240` but have no way to identify which subsystem or
maintainer to contact. Richard Weinberger proposed building a database
mapping symbols to source files using nm/DWARF. Linus pointed to
scripts/decode_stacktrace.sh as the existing solution. But as the
discussion progressed, it became clear that decode_stacktrace.sh has
significant practical barriers that prevent it from being useful in the
common case.

Problems with scripts/decode_stacktrace.sh
==========================================

- Requires debug symbols: the script needs vmlinux with DWARF debug
  info. Many distros don't retain debug symbols for older or security
  kernels, and even when available, asking users to obtain matching
  debuginfo packages is a significant hurdle.

- Requires toolchain: users need addr2line and nm installed.

- Version-matching requirement: debug symbols must exactly match the
  running kernel binary.

What this series does
=====================

Patch 1: CONFIG_KALLSYMS_LINEINFO

At build time, a host tool (scripts/gen_lineinfo) reads DWARF
.debug_line from vmlinux, extracts address-to-file:line mappings, and
embeds them as sorted lookup tables in .rodata. At runtime,
kallsyms_lookup_lineinfo() binary-searches the table and
__sprint_symbol() appends "(file:line)" to each stack frame. NMI/panic-
safe (no locks, no allocations), KASLR-compatible.

Patch 2: CONFIG_KALLSYMS_LINEINFO_MODULES

Extends lineinfo to loadable modules. Each .ko gets a .mod_lineinfo
section embedded at build time. The module loader picks it up at load
time. Same zero-allocation, NMI-safe lookup.

Patch 3: delta compression

Block-indexed delta-encoding with LEB128 varints, implementing the
approach suggested by Juergen Gross in the RFC review. Reduces overhead
from ~44 MiB to ~11 MiB (~3.7 bytes/entry), addressing the primary size
concern from the RFC.

Patch 4: KUnit tests

30 KUnit tests covering the lineinfo lookup paths, delta-decode logic,
boundary conditions, and integration with the backtrace formatting APIs.

Example output
==============

  [   11.206749]  dump_stack_lvl+0x5d/0x80 (lib/dump_stack.c:94)
  [   11.207403]  vpanic+0x36e/0x620 (kernel/panic.c:650)
  [   11.209324]  panic+0xc9/0xd0 (kernel/panic.c:787)
  [   11.213312]  sysrq_handle_crash+0x1a/0x20 (drivers/tty/sysrq.c:154)
  [   11.214005]  __handle_sysrq.cold+0x66/0x256 (drivers/tty/sysrq.c:611)
  [   11.214712]  write_sysrq_trigger+0x65/0x80 (drivers/tty/sysrq.c:1221)
  [   11.215424]  proc_reg_write+0x1bd/0x3c0 (fs/proc/inode.c:330)
  [   11.216061]  vfs_write+0x1c6/0xff0 (fs/read_write.c:686)
  [   11.218848]  ksys_write+0xfa/0x200 (fs/read_write.c:740)
  [   11.222394]  do_syscall_64+0xf3/0x690 (arch/x86/entry/syscall_64.c:63)

Size impact
===========

Measured with a Debian kernel config:

- bzImage: +3.6 MiB (14 MiB -> 18 MiB, +26%)
- Runtime memory: +5.9 MiB (text+data+bss)
- Code overhead: +5.0 KiB (.text, lookup functions only)
- Data overhead: +5.9 MiB (.data, lineinfo tables)

Lineinfo data breakdown:

- lineinfo_data (delta-compressed): 5,728 KiB (97%)
- lineinfo_block_addrs: 99 KiB
- lineinfo_block_offsets: 99 KiB
- lineinfo_filenames: 111 KiB
- lineinfo_file_offsets: 17 KiB

The ~5.9 MiB is after 2.7x delta compression; uncompressed would be
~16 MiB. This is a fraction of the cost of shipping full DWARF debug
info (hundreds of MiB), which distros must store and serve for every
kernel version.

For distros, maintaining debug symbol repositories is expensive: storage,
mirrors, and CDN bandwidth for hundreds of MiB per kernel build add up
quickly. A ~5.9 MiB increase in the kernel image itself is a modest cost
that eliminates the need for users to find, download, and version-match
debuginfo packages just to make a crash report useful.

For developers, the file:line annotations appear immediately in crash
traces - no post-processing with decode_stacktrace.sh needed.

Changes since v3
=================

- Remove redundant gen_lineinfo entry in scripts/Makefile for
  CONFIG_KALLSYMS_LINEINFO_MODULES (depends on CONFIG_KALLSYMS_LINEINFO
  which already builds it). (Reported by Petr Pavlu)

- Use R_* constants from <elf.h> instead of hardcoded relocation type
  values in r_type_abs32(). (Reported by Petr Pavlu)

- Simplify duplicated-path detection in make_relative(): replace loop
  over every '/' with a direct midpoint check, since true path
  duplication always splits at len/2. (Suggested by Petr Pavlu)

- Fix comment in process_dwarf(): sections in ET_REL objects have
  sh_addr == 0 and therefore overlapping address ranges; this is
  expected behavior, not a "may" situation. (Reported by Petr Pavlu)

- Use U32_MAX instead of UINT_MAX for the module raw_offset bounds
  check, matching the u32 type of the addrs array.
  (Reported by Petr Pavlu)

- Document the assumption that .text is at the start of the MOD_TEXT
  segment in module_lookup_lineinfo(). A proper fix using ELF
  relocations is planned for a future series.
  (Reported by Petr Pavlu)

- Wrap -fno-inline-functions-called-once in $(call cc-option,...) for
  clang compatibility. Clang does not support this GCC-specific flag;
  the noinline attribute is sufficient.

Changes since v2
=================

- Replace #ifdef CONFIG_KALLSYMS_LINEINFO with IS_ENABLED() throughout,
  so the compiler checks the code for syntax errors regardless of
  configuration. (Suggested by Helge Deller)

- Replace zigzag + ULEB128 encoding of signed deltas with native SLEB128,
  removing the unnecessary zigzag transform layer.
  (Suggested by Vivian Wang)

- Deduplicate the binary search and delta-decode logic: extract shared
  struct lineinfo_table and lineinfo_search() into mod_lineinfo.h
  instead of maintaining near-identical copies in kernel/kallsyms.c and
  kernel/module/kallsyms.c. (Suggested by Vivian Wang)

- Use .uleb128 / .sleb128 assembler directives in gen_lineinfo output
  instead of encoding varints in C and emitting .byte hex literals.
  (Suggested by Vivian Wang)

- Redesign module mod_lineinfo_header to use explicit (offset, size)
  pairs for each sub-array, similar to flattened devicetree layout.
  This makes bounds validation straightforward: offset + size <=
  section_size. (Suggested by Vivian Wang)

- Remove dead sym_start parameter from kallsyms_lookup_lineinfo() and
  module_lookup_lineinfo().

Changes since v1
=================

- Fix path stripping regression on architectures where DWARF comp_dir is
  a subdirectory (e.g. arch/parisc/kernel) rather than the source tree
  root: paths now correctly show "kernel/traps.c:212" instead of bare
  "traps.c:212". Added kernel_dirs[] fallback scan and bare-filename
  recovery via comp_dir. (Reported by Helge Deller)

- Fix RST heading: overline/underline must be at least as long as the
  heading text in kallsyms-lineinfo.rst. (Reported by Randy Dunlap)

- Fix MAINTAINERS alphabetical ordering: move KALLSYMS LINEINFO entry
  before KASAN. (Reported by Randy Dunlap)

- Fix arch-portability of .debug_line relocation handling: replace
  hardcoded R_X86_64_32 with r_type_abs32() supporting x86, arm, arm64,
  riscv, s390, mips, ppc, loongarch, and parisc.

- Fix vmlinux compressed-path data_end for the last block: use
  lineinfo_data_size instead of UINT_MAX.

- Add file_offsets[] and filenames_size bounds checks in vmlinux lookup
  path (the module path already had them).

- Add alignment padding for file_offsets[] in module .mod_lineinfo
  binary format (data[] is variable-length u8, followed by u32[]).

- Remove sym_start cross-validation check that incorrectly rejected
  valid lineinfo entries for assembly-adjacent functions.

- Add KUnit test suite (new patch 4/4): 30 tests covering vmlinux
  lookup, module lookup, delta decode, boundary conditions, and
  backtrace formatting integration.

Changes since RFC
==================

- Added module support (patch 2)
- Added delta compression (patch 3), reducing size from ~44 MiB to
  ~11 MiB, addressing the primary concern from RFC review
- Added documentation (Documentation/admin-guide/kallsyms-lineinfo.rst)
- Added MAINTAINERS entry

Sasha Levin (4):
  kallsyms: embed source file:line info in kernel stack traces
  kallsyms: extend lineinfo to loadable modules
  kallsyms: delta-compress lineinfo tables for ~2.7x size reduction
  kallsyms: add KUnit tests for lineinfo feature

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kallsyms-lineinfo.rst         |  97 ++
 MAINTAINERS                                   |   9 +
 include/linux/kallsyms.h                      |  17 +-
 include/linux/mod_lineinfo.h                  | 243 +++++
 include/linux/module.h                        |   5 +
 init/Kconfig                                  |  35 +
 kernel/kallsyms.c                             |  58 ++
 kernel/kallsyms_internal.h                    |  11 +
 kernel/module/kallsyms.c                      |  80 ++
 kernel/module/main.c                          |   3 +
 lib/Kconfig.debug                             |  10 +
 lib/tests/Makefile                            |   3 +
 lib/tests/lineinfo_kunit.c                    | 813 +++++++++++++++++
 scripts/.gitignore                            |   1 +
 scripts/Makefile                              |   3 +
 scripts/Makefile.modfinal                     |   6 +
 scripts/empty_lineinfo.S                      |  38 +
 scripts/gen-mod-lineinfo.sh                   |  48 +
 scripts/gen_lineinfo.c                        | 848 ++++++++++++++++++
 scripts/kallsyms.c                            |  17 +
 scripts/link-vmlinux.sh                       |  43 +-
 22 files changed, 2385 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/admin-guide/kallsyms-lineinfo.rst
 create mode 100644 include/linux/mod_lineinfo.h
 create mode 100644 lib/tests/lineinfo_kunit.c
 create mode 100644 scripts/empty_lineinfo.S
 create mode 100755 scripts/gen-mod-lineinfo.sh
 create mode 100644 scripts/gen_lineinfo.c

-- 
2.51.0


