Return-Path: <linux-kbuild+bounces-12990-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IqrMpO8+Gnh0AIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12990-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 17:34:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F5B4C0BCD
	for <lists+linux-kbuild@lfdr.de>; Mon, 04 May 2026 17:34:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7F7030078A7
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2026 15:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07753DF000;
	Mon,  4 May 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dfP3lJKy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB1C33F5BF;
	Mon,  4 May 2026 15:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777908881; cv=none; b=AVKmZrErq1WDVJ0JSD/2BH2FQ1sTAlT+ycdzSGF0G6yRD2HgYs+muh1TjaRxAq3JRqWMZ8vWWBIAPVNPp3YR2zVIJJgqqHfAFgzt+VcIvDSmDqWEwNmduVTxZHSvB62hEV1/uXMvc5m/VFLCMBy3URtfCIdNP30H3W8ctQnOrhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777908881; c=relaxed/simple;
	bh=MJpBLss4fEIc35d/TjZrF2fM/uJyGpZo8ADNTF9uhzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZBi9jzhkSaRwuETy51YMbzkifhz7kdXH2pN6NXwkts5Kpy4yUOGF1TZJ/c+vhBjLvLh9DATlB1XxWKXAqP5RDy41KypHtdEscuBNebtaZhsDPnuejRSgSIzy4aYKn1ZYYvso90SeSU/AAY39ZE05G9IoFU7jr+65+tkiKDAqwgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dfP3lJKy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F087EC2BCB8;
	Mon,  4 May 2026 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777908881;
	bh=MJpBLss4fEIc35d/TjZrF2fM/uJyGpZo8ADNTF9uhzk=;
	h=From:To:Cc:Subject:Date:From;
	b=dfP3lJKyR0kvyMUJ1u/V7pRJxsdwbaG59USmou3F7p8jUSds+rUyVDrzuu64DJ9EN
	 73sQNQlD9tkq3L2zDCbDXNiLBdXHPav7aaMD2xneZWPGZ8jumtGa8OyjhslEg9c+Qe
	 pcgdRpsRxZcUE6sBXcxFh0oVTvsK7zPgYmqr9hCOODq9oHbUWmVmSKf1lOPBDfl0x7
	 srO/xxT/BWcE7wh+W/y5ze7KrYXk0fnNIaUpPnkNYList/6xlqrP+p8Ez070ZwIlZA
	 cQFB+s2Q1N/JLFaXo11IiJgkNzp8KCNn4lbeGnHTLVjmGEQsiocSJQR+0yl/WNfRa6
	 c0qSmo65q6VSQ==
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
	Zhen Lei <thunder.leizhen@huawei.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-modules@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v5 0/4] kallsyms: embed source file:line info in kernel stack traces
Date: Mon,  4 May 2026 11:33:56 -0400
Message-ID: <20260504153401.2416391-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 63F5B4C0BCD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,kernel.org,suse.com,linuxfoundation.org,goodmis.org,infradead.org,leemhuis.info,gmx.de,ideasonboard.com,iscas.ac.cn,huawei.com,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12990-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

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
embeds them as sorted lookup tables in .rodata.  At runtime,
kallsyms_lookup_lineinfo() binary-searches the table and
sprint_backtrace() appends "(file:line)" to each stack frame.
NMI/panic-safe (no locks, no allocations), KASLR-compatible.

Patch 2: CONFIG_KALLSYMS_LINEINFO_MODULES

Extends lineinfo to loadable modules.  Each .ko gets .mod_lineinfo and
.init.mod_lineinfo sections embedded at build time, each carrying one
or more per-section sub-tables identified by an ELF relocation against
the covered text section's symbol.  The module loader's existing
apply_relocations() pass resolves the anchor on load - no special-cased
loader logic, no implicit MOD_TEXT-base assumption.  Coverage extends
to .text, .exit.text, and .init.text; the init blob is freed alongside
init memory.

Patch 3: delta compression

Block-indexed delta-encoding with LEB128 varints, implementing the
approach suggested by Juergen Gross in the RFC review.  Reduces
overhead from ~44 MiB to ~11 MiB (~3.7 bytes/entry), addressing the
primary size concern from the RFC.  Compression applies independently
to each per-section table inside the module blobs.

Patch 4: KUnit tests

30 KUnit tests covering the lineinfo lookup paths, delta-decode logic,
boundary conditions, the module-side multi-section format, and
integration with the backtrace formatting APIs.

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

Changes since v4
================

- Replace mod->mem[MOD_TEXT].base derivation with an ELF relocation
  against the covered section's symbol; resolved by the module loader
  on load.  (Suggested by Petr Pavlu)

- Cover .exit.text and .init.text in addition to .text.  Init code
  lives in a parallel .init.mod_lineinfo blob (MOD_INIT_RODATA) that
  is revoked and freed alongside init memory.

- Switch the build step from objcopy --add-section to ld -r, so
  .rela.mod_lineinfo / .rela.init.mod_lineinfo ride along into the .ko.

- Pick up lineinfo sections via section_objs() (not any_section_objs)
  to validate SHF_ALLOC and avoid dangling pointers into the temporary
  load image.

- Drop the unused "reserved" placeholder field from mod_lineinfo_root
  and mod_lineinfo_header.  (Suggested by Petr Pavlu)

- Guard the per-module fields with #ifdef CONFIG_KALLSYMS_LINEINFO_MODULES
  and expose them via inline reader accessors.  (Suggested by Petr Pavlu)

- Update the per-section header layout comment to name struct fields.
  (Suggested by Petr Pavlu)

- Cap vmlinux-side captured DWARF addresses at _etext: sections placed
  after .rodata shift as the real lineinfo replaces the empty stub
  during the multi-pass link, so addresses outside the invariant .text
  window become stale in the final image.

- Append "(file:line)" only via sprint_backtrace*(), not plain
  sprint_symbol*() (which backs %ps); many format strings already
  follow %ps with literal "()" and would otherwise render as
  "foo (file:line)()".  KUnit gains a sprint_with_lineinfo() helper.

- Build-side fixes in scripts/gen_lineinfo: apply 64-bit absolute
  relocations to .debug_line (libdw doesn't relocate ET_REL inputs);
  endian-safe writes for cross-builds; declare empty
  .text/.exit.text/.init.text stanzas so ld -r binds anchors to LOCAL
  rather than GLOBAL UND symbols.

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

Sasha Levin (4):
  kallsyms: embed source file:line info in kernel stack traces
  kallsyms: extend lineinfo to loadable modules
  kallsyms: delta-compress lineinfo tables for ~2.7x size reduction
  kallsyms: add KUnit tests for lineinfo feature

 Documentation/admin-guide/index.rst           |    1 +
 .../admin-guide/kallsyms-lineinfo.rst         |   97 ++
 MAINTAINERS                                   |  114 +-
 include/linux/kallsyms.h                      |   17 +-
 include/linux/mod_lineinfo.h                  |  280 ++++
 include/linux/module.h                        |   39 +
 init/Kconfig                                  |   35 +
 kernel/kallsyms.c                             |   78 +-
 kernel/kallsyms_internal.h                    |   11 +
 kernel/module/kallsyms.c                      |  171 +++
 kernel/module/main.c                          |   26 +
 lib/Kconfig.debug                             |   10 +
 lib/tests/Makefile                            |    3 +
 lib/tests/lineinfo_kunit.c                    |  870 +++++++++++
 scripts/.gitignore                            |    1 +
 scripts/Makefile                              |    3 +
 scripts/Makefile.modfinal                     |    6 +
 scripts/empty_lineinfo.S                      |   38 +
 scripts/gen-mod-lineinfo.sh                   |   50 +
 scripts/gen_lineinfo.c                        | 1322 +++++++++++++++++
 scripts/kallsyms.c                            |   17 +
 scripts/link-vmlinux.sh                       |   43 +-
 22 files changed, 3187 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/admin-guide/kallsyms-lineinfo.rst
 create mode 100644 include/linux/mod_lineinfo.h
 create mode 100644 lib/tests/lineinfo_kunit.c
 create mode 100644 scripts/empty_lineinfo.S
 create mode 100644 scripts/gen-mod-lineinfo.sh
 create mode 100644 scripts/gen_lineinfo.c

--
2.53.0

