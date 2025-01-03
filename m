Return-Path: <linux-kbuild+bounces-5349-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2820EA00EE5
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 21:45:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF88A1644B9
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2025 20:45:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C9371BFE0D;
	Fri,  3 Jan 2025 20:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tp2RtusH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A71C07C5
	for <linux-kbuild@vger.kernel.org>; Fri,  3 Jan 2025 20:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735937139; cv=none; b=T4ErtlnzkytD/XxpGRHp+yeKA8FoPjqjMcDPwVTxTpxxV5vCR/FdWHQiERtS/PhjbhIx87aEP6qSPA4KRveS100yGG8VlvfbB5tYGqKtS+2SgwG6PYpGplEX5FMoX4PpGVTgnlDIu3LIZg7rZmjGGoeGZ30BWp0onKPJcwKjoU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735937139; c=relaxed/simple;
	bh=C69TjBW47+ijqP00izGxo3SOHsfM+mqFY/DarOdKxm4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=aATt+actkW58jAhgnexFXAhZB+iqK7K+l1IpGJhKxmCfa8AZpW4nQ42AfUa8cwN23m91Itly+JhB963WRAikeH9KhqzRGYn2sthXrm0BOIo0gWficbZXfpwCV03xNem8CiktAzlcd37hthskNV6EbK3r5f7ni2iNeH72jiMgOmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tp2RtusH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efc4196ca0so17013343a91.2
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Jan 2025 12:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735937135; x=1736541935; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mhAlSc7me114CcHw29Df/xhlTreozr1UfNTT20EEW7U=;
        b=Tp2RtusHBb0ld/y3ofNVHMS9RzByvV/a5ponidFi5fZXfSu3gv2risgsLw7OIh8E8+
         Gky0MU5be2/bNIK2m3Xpm/POqNfIY9cuj4ALcVfA/ecE3TuvWkfqK3fIwkRI6l6Pct7k
         H4U7cQBe76xclRg0x7aq3nonifhJTp80u6oELb6OiWbPXZ2eDrrKlZK4McYm2I92JcwI
         5gZxHywOoBg8ufG5nwXveSvxZ/m0Hr9W9E8qygt9ho5OFhHGaLp/deLypQn+Aez2/AwJ
         CzatrvC0TFKwscVklOqfuAnsahUG14lCJ99p13uRK6GJF0xUswC7JV/oMeDot/whPe8y
         h5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735937135; x=1736541935;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mhAlSc7me114CcHw29Df/xhlTreozr1UfNTT20EEW7U=;
        b=ORd6ynG4TKHVRaXuJete4wtNMQbspk/jtTc90R/m2uloOeY/L5dVkQXe9PAngMAvac
         RW0t3Vd7FHpZxA25LwlisBFEOeKlD3GXmPtMMLZJLg55EVXuK7J2p8oCL2EPxx/5o6QE
         uAmz2LxStGP5JRrrDsL8jvARl9X5kJG1p5ro4oXsLlKGGxC8ZsAkBIVwtjalzIIWIvr0
         PAuGGSsiRrrCgTaCO+3ugNXqNcAzzH4XcK1QR9ClAXyTo5dVvcbHRPJcqeugExd41+gw
         1qtKDAVgV6DAeHk8r0lXtQOkOssCv1XuzjjNoBq0EfYSn6UriL+D4nel2ekiWN6cRz1l
         2XFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS8y25rh5WoaQHrJPKv6wjk6Q2smhHi1Zcf8DJ5r559a4UNYyRtM6/MRxmNkM13RMEReOXKZu+8cCqK74=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKut0DBSDdCDAJzaJbinM4/T+6CIhabSvL+DJy1BdDuZB3LDWu
	01aDltKcpYRkB0XuRqxFDLxhhgKCY6DNBA328GQJoz2CWam2++TdXDteLujOT/9hXndhJ4IdWR7
	JGlxbiEHbNgkfL9XyD2PpkBlsfg==
X-Google-Smtp-Source: AGHT+IEuFXayWrGrszQQzABTU5ViBuHYT4x70QKKyER/h7uDN7v/yo9I0scwHOQkjDQCSQ1i4pxwvGHXRhQDErS4WNg=
X-Received: from pfbdc6.prod.google.com ([2002:a05:6a00:35c6:b0:725:dec7:dd47])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:32cb:b0:729:1c0f:b957 with SMTP id d2e1a72fcca58-72abded050amr75271381b3a.25.1735937135430;
 Fri, 03 Jan 2025 12:45:35 -0800 (PST)
Date: Fri,  3 Jan 2025 20:45:22 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=11672; i=samitolvanen@google.com;
 h=from:subject; bh=C69TjBW47+ijqP00izGxo3SOHsfM+mqFY/DarOdKxm4=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOkVPom3Gl6r9Zkku+66N2/Xt0VOfu6CmeliMkc8+J4WL
 7dSMtHqKGVhEONgkBVTZGn5unrr7u9Oqa8+F0nAzGFlAhnCwMUpABOZFsDwh3OCQM+jjp32+5ob
 7y28r1wqmHfw0K87UfKeHfdnz7z+voKRYfmbGXdmLDhZ3CTys0OA5/jHVO7ZM6qOvJGKaFwyg6N VkAkA
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250103204521.1885406-20-samitolvanen@google.com>
Subject: [PATCH v8 00/18] Implement DWARF modversions
From: Sami Tolvanen <samitolvanen@google.com>
To: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, Asahi Linux <asahi@lists.linux.dev>, 
	Sedat Dilek <sedat.dilek@gmail.com>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi,

Here's v8 of the DWARF modversions series. The main motivation is
modversions support for Rust, which is important for distributions
like Android that are about to ship Rust kernel modules. Per Luis'
request [1], v2 dropped the Rust specific bits from the series and
instead added the feature as an option for the entire kernel to
make it easier to evaluate the benefits of this approach, and to
get better test coverage. Matt is addressing Rust modversion_info
compatibility issues in a separate patch set [2] that depends on
this series, and actually allows modversions to be enabled with
Rust.

Short background: Unlike C, Rust source code doesn't have sufficient
information about the final ABI, as the compiler has considerable
freedom in adjusting structure layout, for example, which makes
using a source code parser like genksyms a non-starter. Based on
earlier feedback, this series uses DWARF debugging information for
computing versions. DWARF is an established and a relatively stable
format, which includes all the necessary ABI details, and adding a
CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
reasonable trade-off as most distributions already enable it.

The first 15 patches add gendwarfksyms, a tool for computing symbol
versions from DWARF. When passed a list of exported symbols and
object files, the tool generates an expanded type string for each
symbol and computes symbol versions. gendwarfksyms is written in C,
uses libdw to process DWARF, and zlib for CRC32. Patch 16 ensures
that debugging information is present where we need it, patch 17
adds gendwarfksyms as an alternative to genksyms, and the last patch
adds documentation.

v8 is based on 6.13-rc5, and for your convenience, the series is
also available here:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v8

If you also want to test the series with actual Rust modules, this
branch adds v13 of Matt's modversion_info series:

https://github.com/samitolvanen/linux/commits/rustmodversions-v8

Sami


[1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
[2] https://lore.kernel.org/lkml/20250103-extended-modversions-v13-0-35d87c65ee04@google.com/

---

v8:
- Rebased on v6.13-rc5.

- Changed opts[] to static const and reformatted the array. (Patch 1)

- Moved a stray comment to patch 1. (Patch 2)

v7: https://lore.kernel.org/lkml/20241219210736.2990838-20-samitolvanen@google.com/
- Added a Kconfig description to actually allow build testing each
  patch. (Patch 1)

- Added a MAINTAINERS entry for gendwarfksyms. (Patch 1)

- Cleaned up includes and fixed a build issue with asprintf not
  always being present without _GNU_SOURCE. (Patches 1, 11, and 13)

- Adjusted hash table sizes for lower overhead as we're not right
  now concerned with processing vmlinux.o, and thus need to deal
  with a smaller number of symbols. (Patches 1, 4, 9, 11, and 13)

- Added error handling for gelf_getsymshndx failures. (Patch 2)

- Renamed the is_declaration function to is_kabi_definition for
  clarity and reversed the logic per Petr's suggestion. (Patch 9)

- Dropped the redundant default Kconfig tag. (Patch 17)

- Fixed a documentation typo. (Patch 18)

v6: https://lore.kernel.org/lkml/20241121204220.2378181-20-samitolvanen@google.com/
- Dropped pointer expansion limits as this affects version
  stability when exported symbols are removed. (Patch 9)

- Changed local type definitions (in .c files) that are opaque
  to external users to be treated as declarations even if a
  definition is available. (Patch 9)

- Switched to zlib's CRC32 implementation per Masahiro's
  suggestion. (Patch 12)

- Renamed struct_declonly kABI rule to simply declonly, as it
  applies also to unions and enums, added a new rule for
  overriding enumerator values, and refactored the examples.
  (Patch 13)

- Added --stable support for renamed structure members and
  also added examples. (Patch 14)

- Rebased on linux-kbuild/for-next for Masahiro's symtypes
  build rule clean-ups. (Patch 17)

- Updated the documentation reflect --stable changes. (Patch 18)

v5: https://lore.kernel.org/lkml/20241030170106.1501763-21-samitolvanen@google.com/
- Rebased on v6.12-rc5.

- Fixed an issue with limiting structure expansion, and applied
  Petr's clean-up. (Patch 10)

- Dropped an unnecessary return statement in error path. (Patch
  12)

- Addressed several other smaller issues Petr brought up. (Patches
  13, 14, and 15)

- Added a KBUILD_GENDWARFKSYMS_STABLE flag to enable --stable for
  the entire kernel build. (Patch 18)

- Updated documentation to include KBUILD flags. (Patch 19)

- Picked up Reviewed-by tags from v4.

v4: https://lore.kernel.org/lkml/20241008183823.36676-21-samitolvanen@google.com/
- Rebased on v6.12-rc2, which now includes all the prerequisites.

- Dropped unnecessary name_only parameter for symbols.c::for_each
  and cleaned up error handling. (Patch 3)

- Fixed anonymous scope handling to ensure unnamed DIEs don't get
  names. (Patch 4)

- Added non-variant children to variant_type output, and included
  DW_AT_discr_value attributes for variants. (Patch 9)

- Added another symbol pointer test case. (Patch 16)

- Picked up (Acked|Reviewed)-by tags from v3.

v3: https://lore.kernel.org/lkml/20240923181846.549877-22-samitolvanen@google.com/
- Updated SPX license headers.

- Squashed the first two patches in v2 and tried to reduce churn as
  much as reasonable.

- Dropped patch 18 from v2 ("x86/asm-prototypes: Include
  <asm/ptrace.h>") as it's addressed by a separate patch.

- Changed the error handling code to immediately terminate instead
  of propagating the errors back to main, which cleaned up the code
  quite a bit.

- Switched to the list and hashtable implementations in scripts and
  dropped the remaining tools/include dependencies. Added a couple
  missing list macros. (patch 1)

- Moved the genksyms CRC32 implementation to scripts/include and
  dropped the duplicate code. (patches 2 and 14)

- Switched from ad-hoc command line parsing to getopt_long (patch 3).

- Added structure member and function parameter names to the DIE
  output to match genksyms behavior, and tweaked the symtypes format
  to be more parser-friendly in general based on Petr's suggestions.

- Replaced the declaration-only struct annotations with more generic
  kABI stability rules that allow source code annotations to be used
  where #ifndef __GENKSYMS__ was previously used.  Added support for
  rules that can be used to exclude enumerators from versioning.
  (patch 16)

- Per Miroslav's suggestion, added an option to hide structure
  members from versioning when they're added to existing alignment
  holes, for example. (patch 16)

- Per Greg's request, added documentation and example macros for the
  --stable features, and a couple of test cases. (patches 15, 16, and
  20)

- Fixed making symtypes files, which need to depend on .o files with
  gendwarfksyms. (patch 19)

- Addressed several other smaller issues that Petr and Masahiro
  kindly pointed out during the v2 review.

v2: https://lore.kernel.org/lkml/20240815173903.4172139-21-samitolvanen@google.com/
- Per Luis' request, dropped Rust-specific patches and added
  gendwarfksyms as an alternative to genksyms for the entire
  kernel.

- Added support for missing DWARF features needed to handle
  also non-Rust code.

- Changed symbol address matching to use the symbol table
  information instead of relying on addresses in DWARF.

- Added __gendwarfksyms_ptr patches to ensure the compiler emits
  the necessary type information in DWARF even for symbols that
  are defined in other TUs.

- Refactored debugging output and moved the more verbose output
  behind --dump* flags.

- Added a --symtypes flag for generating a genksyms-style
  symtypes output based on Petr's feedback, and refactored
  symbol version calculations to be based on symtypes instead
  of raw --dump-dies output.

- Based on feedback from Greg and Petr, added --stable flag and
  support for reserved data structure fields and declaration-onl
  structures. Also added examples for using these features.

- Added a GENDWARFKSYMS option and hooked up kbuild support
  for both C and assembly code. Note that with gendwarfksyms,
  we have to actually build a temporary .o file for calculating
  assembly modversions.

v1: https://lore.kernel.org/lkml/20240617175818.58219-17-samitolvanen@google.com/

---

Sami Tolvanen (18):
  tools: Add gendwarfksyms
  gendwarfksyms: Add address matching
  gendwarfksyms: Expand base_type
  gendwarfksyms: Add a cache for processed DIEs
  gendwarfksyms: Expand type modifiers and typedefs
  gendwarfksyms: Expand subroutine_type
  gendwarfksyms: Expand array_type
  gendwarfksyms: Expand structure types
  gendwarfksyms: Limit structure expansion
  gendwarfksyms: Add die_map debugging
  gendwarfksyms: Add symtypes output
  gendwarfksyms: Add symbol versioning
  gendwarfksyms: Add support for kABI rules
  gendwarfksyms: Add support for reserved and ignored fields
  gendwarfksyms: Add support for symbol type pointers
  export: Add __gendwarfksyms_ptr_ references to exported symbols
  kbuild: Add gendwarfksyms as an alternative to genksyms
  Documentation/kbuild: Add DWARF module versioning

 Documentation/kbuild/gendwarfksyms.rst     |  308 ++++++
 Documentation/kbuild/index.rst             |    1 +
 MAINTAINERS                                |    7 +
 include/linux/export.h                     |   15 +
 kernel/module/Kconfig                      |   30 +
 scripts/Makefile                           |    3 +-
 scripts/Makefile.build                     |   35 +-
 scripts/gendwarfksyms/.gitignore           |    2 +
 scripts/gendwarfksyms/Makefile             |   12 +
 scripts/gendwarfksyms/cache.c              |   51 +
 scripts/gendwarfksyms/die.c                |  166 +++
 scripts/gendwarfksyms/dwarf.c              | 1159 ++++++++++++++++++++
 scripts/gendwarfksyms/examples/kabi.h      |  157 +++
 scripts/gendwarfksyms/examples/kabi_ex.c   |   30 +
 scripts/gendwarfksyms/examples/kabi_ex.h   |  263 +++++
 scripts/gendwarfksyms/examples/symbolptr.c |   33 +
 scripts/gendwarfksyms/gendwarfksyms.c      |  187 ++++
 scripts/gendwarfksyms/gendwarfksyms.h      |  296 +++++
 scripts/gendwarfksyms/kabi.c               |  336 ++++++
 scripts/gendwarfksyms/symbols.c            |  341 ++++++
 scripts/gendwarfksyms/types.c              |  481 ++++++++
 21 files changed, 3906 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/kbuild/gendwarfksyms.rst
 create mode 100644 scripts/gendwarfksyms/.gitignore
 create mode 100644 scripts/gendwarfksyms/Makefile
 create mode 100644 scripts/gendwarfksyms/cache.c
 create mode 100644 scripts/gendwarfksyms/die.c
 create mode 100644 scripts/gendwarfksyms/dwarf.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi.h
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.h
 create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
 create mode 100644 scripts/gendwarfksyms/kabi.c
 create mode 100644 scripts/gendwarfksyms/symbols.c
 create mode 100644 scripts/gendwarfksyms/types.c


base-commit: fc033cf25e612e840e545f8d5ad2edd6ba613ed5
-- 
2.47.1.613.gc27f4b7a9f-goog


