Return-Path: <linux-kbuild+bounces-11641-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ItCG3NerGl/pAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11641-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 18:20:51 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B07922CE3A
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 18:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B47E9300F5F3
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Mar 2026 17:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1671C2D3ED2;
	Sat,  7 Mar 2026 17:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qv/Yw1Hj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD95827A92E;
	Sat,  7 Mar 2026 17:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772904027; cv=none; b=GqBk2EgP2UswSJC+MRSLAGxPT3+vgm+Vx4gmYbYLjiKyJQdfGToNM7YzbFuYh9Pkt0E80RCzenQ8XT9/AzN03ZEAbWL8ESo7UDkGGXfiqf9Hsg0qaxDOpRTb/FKrZQtBCxIeUvZ/aHpU8fUyUN4NIZWvfFb0Oe2X7Cgf9guuNUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772904027; c=relaxed/simple;
	bh=xNjldZBtYihS/cKdR8u/FDbbgV8jDa5zgeUG88cv/YQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ahv+S+PjHaUwEqij+ex5j9NVljWfgcQAMCDUqI4mUlssOBGzvtCyYTa7t93CKUY+MovF56Rx1QYgzGBE25hKU5eYdhThmTQf82+DSI07xqEebIneZBh4mKEZ0ksMQrtK/W0Ym79Mq+WsISkMZqNIKrAoy1mPPZMOLOOfjSwZ5ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qv/Yw1Hj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048D8C19422;
	Sat,  7 Mar 2026 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772904026;
	bh=xNjldZBtYihS/cKdR8u/FDbbgV8jDa5zgeUG88cv/YQ=;
	h=From:To:Cc:Subject:Date:From;
	b=qv/Yw1HjruxXKYdphDCIdYrsY3jxaMYebd/bE9Qe/XtZVA635f0AwmfPIimRAVqc1
	 5kURReGeA7sdGc8CKa8FFJFA10/9tDzJjprzcpFDHd5AvkjvPbtMHDcADYkGWsdUe1
	 6r9ZYUo1DWdCcV04z4S+wYT+RCHChHS2YhnHXmaj+YMz44OrprO+xhs16OFdvjrTWY
	 47iadLBA2pStFD1O8KBFJBfbir+2dbjNkrnpFpgKT9PcjqR2QGXFUmJRfW1nkQYyWW
	 bMtBHe01blYx+S7YX9dBnPj+jwPEUZrEgeDvEEZAe//ErEnDEgnFIGzk5Agiim3xxy
	 2uklrYbPQqjcg==
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
Subject: [PATCH v2 0/4] kallsyms: embed source file:line info in kernel stack traces
Date: Sat,  7 Mar 2026 12:20:17 -0500
Message-ID: <20260307172022.460402-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 0B07922CE3A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,kernel.org,suse.com,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,vger.kernel.org,gmx.de,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-11641-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.975];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This series adds CONFIG_KALLSYMS_LINEINFO, which embeds source file:line
information directly in the kernel image so that stack traces annotate
every frame with the originating source location - no external tools, no
debug symbols at runtime, and safe to use in NMI/panic context.

Motivation
==========

The recent "slowly decommission bugzilla?" thread [1] surfaced a recurring
problem: when users encounter kernel crashes they see stack traces like
`func+0x1ec/0x240` but have no way to identify which subsystem or
maintainer to contact.  Richard Weinberger proposed building a database
mapping symbols to source files using nm/DWARF.  Linus pointed to
scripts/decode_stacktrace.sh as the existing solution.  But as the
discussion progressed, it became clear that decode_stacktrace.sh has
significant practical barriers that prevent it from being useful in the
common case.

Problems with scripts/decode_stacktrace.sh
==========================================

- Requires debug symbols: the script needs vmlinux with DWARF debug info.
  Many distros don't retain debug symbols for older or security kernels,
  and even when available, asking users to obtain matching debuginfo
  packages is a significant hurdle.

- Requires toolchain: users need addr2line and nm installed.

- Version-matching requirement: debug symbols must exactly match the
  running kernel binary.

What this series does
=====================

Patch 1: CONFIG_KALLSYMS_LINEINFO

  At build time, a host tool (scripts/gen_lineinfo) reads DWARF
  .debug_line from vmlinux, extracts address-to-file:line mappings,
  and embeds them as sorted lookup tables in .rodata.  At runtime,
  kallsyms_lookup_lineinfo() binary-searches the table and
  __sprint_symbol() appends "(file:line)" to each stack frame.
  NMI/panic-safe (no locks, no allocations), KASLR-compatible.

Patch 2: CONFIG_KALLSYMS_LINEINFO_MODULES

  Extends lineinfo to loadable modules.  Each .ko gets a .mod_lineinfo
  section embedded at build time.  The module loader picks it up at load
  time.  Same zero-allocation, NMI-safe lookup.

Patch 3: delta compression

  Block-indexed delta-encoding with ULEB128 varints, implementing
  the approach suggested by Juergen Gross in the RFC review.  Reduces
  overhead from ~44 MiB to ~11 MiB (~3.7 bytes/entry), addressing the
  primary size concern from the RFC.

Patch 4: KUnit tests

  New in v2.  30 KUnit tests covering the lineinfo lookup paths,
  delta-decode logic, boundary conditions, and integration with the
  backtrace formatting APIs.

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

  bzImage:          +3.6 MiB  (14 MiB -> 18 MiB, +26%)
  Runtime memory:   +5.9 MiB  (text+data+bss)
  Code overhead:    +5.0 KiB  (.text, lookup functions only)
  Data overhead:    +5.9 MiB  (.data, lineinfo tables)

Lineinfo data breakdown:

  lineinfo_data (delta-compressed):   5,728 KiB  (97%)
  lineinfo_block_addrs:                  99 KiB
  lineinfo_block_offsets:                99 KiB
  lineinfo_filenames:                   111 KiB
  lineinfo_file_offsets:                 17 KiB

The ~5.9 MiB is after 2.7x delta compression; uncompressed would be
~16 MiB.  This is a fraction of the cost of shipping full DWARF debug
info (hundreds of MiB), which distros must store and serve for every
kernel version.

For distros, maintaining debug symbol repositories is expensive:
storage, mirrors, and CDN bandwidth for hundreds of MiB per kernel
build add up quickly.  A ~5.9 MiB increase in the kernel image itself
is a modest cost that eliminates the need for users to find, download,
and version-match debuginfo packages just to make a crash report
useful.

For developers, the file:line annotations appear immediately in crash
traces - no post-processing with decode_stacktrace.sh needed.

Changes since v1
================

- Fix path stripping regression on architectures where DWARF comp_dir
  is a subdirectory (e.g. arch/parisc/kernel) rather than the source
  tree root: paths now correctly show "kernel/traps.c:212" instead of
  bare "traps.c:212".  Added kernel_dirs[] fallback scan and bare-
  filename recovery via comp_dir.  (Reported by Helge Deller)

- Fix RST heading: overline/underline must be at least as long as the
  heading text in kallsyms-lineinfo.rst.  (Reported by Randy Dunlap)

- Fix MAINTAINERS alphabetical ordering: move KALLSYMS LINEINFO entry
  before KASAN.  (Reported by Randy Dunlap)

- Fix arch-portability of .debug_line relocation handling: replace
  hardcoded R_X86_64_32 with r_type_abs32() supporting x86, arm,
  arm64, riscv, s390, mips, ppc, loongarch, and parisc.

- Fix vmlinux compressed-path data_end for the last block: use
  lineinfo_data_size instead of UINT_MAX.

- Add file_offsets[] and filenames_size bounds checks in vmlinux
  lookup path (the module path already had them).

- Add alignment padding for file_offsets[] in module .mod_lineinfo
  binary format (data[] is variable-length u8, followed by u32[]).

- Remove sym_start cross-validation check that incorrectly rejected
  valid lineinfo entries for assembly-adjacent functions.

- Add KUnit test suite (new patch 4/4): 30 tests covering vmlinux
  lookup, module lookup, delta decode, boundary conditions, and
  backtrace formatting integration.

Changes since RFC
=================

- Added module support (patch 2)
- Added delta compression (patch 3), reducing size from ~44 MiB to
  ~11 MiB, addressing the primary concern from RFC review
- Added documentation (Documentation/admin-guide/kallsyms-lineinfo.rst)
- Added MAINTAINERS entry

Link: https://lore.kernel.org/all/1786920159.1633.1772291851870.JavaMail.zimbra@nod.at/ [1]

Sasha Levin (4):
  kallsyms: embed source file:line info in kernel stack traces
  kallsyms: extend lineinfo to loadable modules
  kallsyms: delta-compress lineinfo tables for ~2.7x size reduction
  kallsyms: add KUnit tests for lineinfo feature

 Documentation/admin-guide/index.rst           |   1 +
 .../admin-guide/kallsyms-lineinfo.rst         |  97 ++
 MAINTAINERS                                   |   9 +
 include/linux/kallsyms.h                      |  32 +-
 include/linux/mod_lineinfo.h                  | 140 +++
 include/linux/module.h                        |  19 +
 init/Kconfig                                  |  35 +
 kernel/kallsyms.c                             | 136 +++
 kernel/kallsyms_internal.h                    |  13 +
 kernel/module/kallsyms.c                      | 153 +++
 kernel/module/main.c                          |   4 +
 lib/Kconfig.debug                             |  10 +
 lib/tests/Makefile                            |   3 +
 lib/tests/lineinfo_kunit.c                    | 772 +++++++++++++++
 scripts/.gitignore                            |   1 +
 scripts/Makefile                              |   4 +
 scripts/Makefile.modfinal                     |   6 +
 scripts/gen-mod-lineinfo.sh                   |  48 +
 scripts/gen_lineinfo.c                        | 928 ++++++++++++++++++
 scripts/kallsyms.c                            |  17 +
 scripts/link-vmlinux.sh                       |  78 +-
 21 files changed, 2502 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/admin-guide/kallsyms-lineinfo.rst
 create mode 100644 include/linux/mod_lineinfo.h
 create mode 100644 lib/tests/lineinfo_kunit.c
 create mode 100755 scripts/gen-mod-lineinfo.sh
 create mode 100644 scripts/gen_lineinfo.c

-- 
2.51.0


