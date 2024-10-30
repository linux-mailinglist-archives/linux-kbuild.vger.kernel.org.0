Return-Path: <linux-kbuild+bounces-4407-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C639B6A45
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 18:08:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6FB21C2188E
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 17:08:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0384821B45E;
	Wed, 30 Oct 2024 17:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4V5sPlKo"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288A321B447
	for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 17:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307685; cv=none; b=Jy7VS/Codm+WWrKyfxG3NTpnOlwKJ7LK1cW3mnr56jhlrl4DdIiqeNHp3fjAqjk2e5/8UCkdbF30sDIh6/4ODo5ztCfw3hi8Kcr1Eork011gXUKKmC7cs/MaPTpOw4z/NkmiLwRPddYBwyIxFlsKYXRK+SZmFK6omCaBuNUtPYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307685; c=relaxed/simple;
	bh=fQR1ipAg12rN5GQOwppGuY5jZB1MJHykOwFYTdB2cBU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Hzby+kmJplfcSnGF4PqjkJRmiB+AFTcn9I6u3UXpRm5KuZWmCNr6pXFNGSgkDkq8cp6/93ABM5rQrMg1uNupAZ0bjOhDFBb4i0QQVdwuV4765bZiqlVnVIAS3wVmSxIrIpvtdq0aTPBtjFRrkBryrjkur8Orc1fPqEBmNEE3JDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4V5sPlKo; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2e2cc47ce63so67a91.3
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Oct 2024 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730307682; x=1730912482; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=om9+T+BzGiFlRsW2pBH91Ute5YSKt+l3yNwMimZjYxE=;
        b=4V5sPlKoCm9L+vVhHvsMTGG4mwPGkuWZ8QGxY81cAa5f3Ma5t8Tb8zHpov/iIQCnmH
         Zjm937Wfs3NRZGaBhCn4Pt4h78foTjIzEaOZ6IDo9ZAtC0uoEU0EhxvAaMjpHpB+ellk
         5w7KlDXhY1uZCew/nSFiPkZLY0/FABJjK1ad00ZsOiNBvYp0EkWi56w54wnV9uoe5kwq
         P4ZLZFMf8ms3avLk1SNX+EkS1nOsUGZmoCTdxfsrPQFZu5zjyum0D+fvlMFA3RLvF1uw
         U+3KxXEt30yOpqX6FbRY25g6seLdQ6dodRThAYLHjntyJ2tcoG4Ztu9fp7z+YMt66RHZ
         9dWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730307682; x=1730912482;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=om9+T+BzGiFlRsW2pBH91Ute5YSKt+l3yNwMimZjYxE=;
        b=Mg1GB9lwEvMZY8n167E7OMIoQ9Lc6e+Uki8o4EIIQPn8k0kQQpvD20r5niNR7EMVWy
         p2KsjPItd4V2zTmwPH38OFfokdSh6ccr8GhG44K/04pD7xdl3EZh4SCSbDfVoQOHMLyZ
         3HuIZpe6uOkcm1/69IHFzQEklcwV7A58EhZMpl1Q6SscU0s4gYm61QahTD2MuQ6mM4zx
         wDL4Br5k/r+t93yGjAVIzoRHI9WTIuiv1i9nAJIyDd6FU34Vbn1eABE4tiXzlgiTx9Ff
         enH55E/Pj9rHzKwkYsyM8W1TGTTw/i6AzmCxojXIjON1Ezi1T+Md1/v8DHLevGnF8CyM
         rx1g==
X-Forwarded-Encrypted: i=1; AJvYcCWDMFQk3gPRXx6WYLjihgUv268SAgIY2ZTGiZwWm3YzItEenwT+Kg3gDaiMNy3yu3tyjQKPk0z86RhDdDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YydqjOe1QUg8P3+ZKFARn92YZNlgTGgOdf3VjF3Bf51WirVhbBk
	mJaBnzTfpWYor6Jy6bGe2C1Appj3MPO16wn6GjD9f4XBRy3VA3/Y11hRLGWhgibfvO11p+BHgAE
	DjPlqNamnxnquFqS/FZsJ71kWSw==
X-Google-Smtp-Source: AGHT+IE7JUiy1OA0lARRilo5KjNtcOiy48QgqtB55vOxlLLSgVgbh4T6s2qrhweBdzwLjj5G6iB7dCy5/BdtSL8N0ns=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a17:90b:23d1:b0:2e2:af0f:9875 with
 SMTP id 98e67ed59e1d1-2e8f11ccdfdmr29458a91.7.1730307682329; Wed, 30 Oct 2024
 10:01:22 -0700 (PDT)
Date: Wed, 30 Oct 2024 17:01:07 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10158; i=samitolvanen@google.com;
 h=from:subject; bh=fQR1ipAg12rN5GQOwppGuY5jZB1MJHykOwFYTdB2cBU=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOlKaUHNn8KrtUQ5P6ZrZpz9n/RgkfQn7T3fZ0rkzFPmV
 uyc9/VwRykLgxgHg6yYIkvL19Vbd393Sn31uUgCZg4rE8gQBi5OAZiI7C+G/4EXeuoNcm7MXc8Y
 dj9359GWpPlbZyivk7uu475Ac9m9UDVGhoneiktuc8aJsG5Scbqjqli+7NnpvefLC3eoqTV9CD6 byQgA
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241030170106.1501763-21-samitolvanen@google.com>
Subject: [PATCH v5 00/19] Implement DWARF modversions
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

Here's v5 of the DWARF modversions series. The main motivation is
modversions support for Rust, which is important for distributions
like Android that are about to ship Rust kernel modules. Per Luis'
request [1], v2 dropped the Rust specific bits from the series and
instead added the feature as an option for the entire kernel to
make it easier to evaluate the benefits of this approach, and to
get better test coverage. Matt is addressing Rust modversion_info
compatibility issues in a separate patch set [2] that depends on this
series, and actually allows modversions to be enabled with Rust.

Short background: Unlike C, Rust source code doesn't have sufficient
information about the final ABI, as the compiler has considerable
freedom in adjusting structure layout, for example, which makes
using a source code parser like genksyms a non-starter. Based on
earlier feedback, this series uses DWARF debugging information for
computing versions. DWARF is an established and a relatively stable
format, which includes all the necessary ABI details, and adding a
CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
reasonable trade-off as most distributions already enable it.

The first patch moves the genksyms CRC32 implementation to a shared
header file to avoid code duplication and the next 15 patches add
gendwarfksyms, a tool for computing symbol versions from DWARF. When
passed a list of exported symbols and object files, the tool
generates an expanded type string for each symbol and computes symbol
CRCs similarly to genksyms. gendwarfksyms is written in C and uses
libdw to process DWARF. Patch 17 ensures that debugging information
is present where we need it, patch 18 adds gendwarfksyms as an
alternative to genksyms, and the last patch adds documentation.

v5 is based on v6.12-rc5 and for your convenience the series is also
available here:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v5

If you also want to test the series with Rust modules, this branch
adds Matt's latest modversion_info series:

https://github.com/samitolvanen/linux/commits/rustmodversions-v5

Sami


[1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
[2] https://lore.kernel.org/lkml/20240925233854.90072-1-mmaurer@google.com/

---

v5:
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

Sami Tolvanen (19):
  scripts: move genksyms crc32 implementation to a common include
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

 Documentation/kbuild/gendwarfksyms.rst      |  276 +++++
 Documentation/kbuild/index.rst              |    1 +
 include/linux/export.h                      |   15 +
 kernel/module/Kconfig                       |   31 +
 scripts/Makefile                            |    3 +-
 scripts/Makefile.build                      |   41 +-
 scripts/gendwarfksyms/.gitignore            |    2 +
 scripts/gendwarfksyms/Makefile              |   12 +
 scripts/gendwarfksyms/cache.c               |   44 +
 scripts/gendwarfksyms/die.c                 |  166 +++
 scripts/gendwarfksyms/dwarf.c               | 1109 +++++++++++++++++++
 scripts/gendwarfksyms/examples/kabi.h       |  141 +++
 scripts/gendwarfksyms/examples/kabi_ex0.c   |   86 ++
 scripts/gendwarfksyms/examples/kabi_ex1.c   |   89 ++
 scripts/gendwarfksyms/examples/kabi_ex2.c   |   98 ++
 scripts/gendwarfksyms/examples/kabi_rules.c |   56 +
 scripts/gendwarfksyms/examples/symbolptr.c  |   33 +
 scripts/gendwarfksyms/gendwarfksyms.c       |  185 ++++
 scripts/gendwarfksyms/gendwarfksyms.h       |  288 +++++
 scripts/gendwarfksyms/kabi.c                |  263 +++++
 scripts/gendwarfksyms/symbols.c             |  339 ++++++
 scripts/gendwarfksyms/types.c               |  477 ++++++++
 scripts/genksyms/genksyms.c                 |   77 +-
 scripts/include/crc32.h                     |   93 ++
 24 files changed, 3840 insertions(+), 85 deletions(-)
 create mode 100644 Documentation/kbuild/gendwarfksyms.rst
 create mode 100644 scripts/gendwarfksyms/.gitignore
 create mode 100644 scripts/gendwarfksyms/Makefile
 create mode 100644 scripts/gendwarfksyms/cache.c
 create mode 100644 scripts/gendwarfksyms/die.c
 create mode 100644 scripts/gendwarfksyms/dwarf.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi.h
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex0.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex1.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_ex2.c
 create mode 100644 scripts/gendwarfksyms/examples/kabi_rules.c
 create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
 create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
 create mode 100644 scripts/gendwarfksyms/kabi.c
 create mode 100644 scripts/gendwarfksyms/symbols.c
 create mode 100644 scripts/gendwarfksyms/types.c
 create mode 100644 scripts/include/crc32.h


base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
-- 
2.47.0.163.g1226f6d8fa-goog


