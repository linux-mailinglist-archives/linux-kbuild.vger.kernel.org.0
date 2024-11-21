Return-Path: <linux-kbuild+bounces-4766-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B15789D5410
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 21:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 06583B21441
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Nov 2024 20:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAA51CEAB8;
	Thu, 21 Nov 2024 20:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0hZw1L/J"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DBA1A9B54
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 20:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732221759; cv=none; b=Dgl8lV8ePTD8W7stweq5ZQfm0mLcdtKOuP8D0D2Pyie8Nc3JD6Y9cojVZCRStAWp2oSpgXo2ZvSTxBQAzRnUJamnURGcfjYvsAONdmEjnl6QfTjvklaXcuZ51VyMYOm/+VhobyQqYAqndaYwOwwR3pa0vWzvhuB3v5OJIG0EbFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732221759; c=relaxed/simple;
	bh=rJs6LLEdV9LNIe3BWRFRAx7DlIZIwQfGN90KzyE+A4k=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=i1P3ygH/7pkL80gMT5jvMi56vrZWFhEgj46uf7Ebl+ojqehx91Swqv4tr/RBz7ltK/RaKHq5B+GWGoKYv2c1xmBkMwsIM00/AXib6sfQOd7JBHjPFHujGJIXjzCOleHLLS+noAThWgr0hN4r9R+iG8ljqRkRmG7H8Y3YLaDLcyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0hZw1L/J; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-6ee813065afso22916237b3.0
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Nov 2024 12:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732221756; x=1732826556; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SnWPSw2aqDJ2fjvlH5A3OoULrbQ15ijPXx2tZ4Gn0r4=;
        b=0hZw1L/JgyCI1fmfkYnA/Miv5nQZC1jmIEveFOywZToEgklYS6MaMmLiY1DCMMizJ9
         RkPMqan5eGPoULf4O/hU+SnOoltCMZdzZbMKUI4LYUzQ1w5Cj9iPpbZFXhgU/yjv3Ky1
         JV9AyDGVriD7YleUIdW99NxWDu14DlUDAJm9qg4zVGp0b1SFYimI+eYfNfIPldBbD6we
         6v1nV9OxRF5dOOQsEC3bqV+x0qPcx8xxsNP14hAk/FkWnVaJpxPPofz8cLtTJmDX4AZ9
         O2IH+er23Kc0hrhQUPMx6Tq9Fp279qztzlpLFnKy5pF1msRqEfndfW8/kmHOvvFG8ok9
         LJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732221756; x=1732826556;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SnWPSw2aqDJ2fjvlH5A3OoULrbQ15ijPXx2tZ4Gn0r4=;
        b=ZforYzfwzTdCOjsysvJTinCtdVsj9uRgm4pjd73RtMXpj6L50/Utmq6aHtvEcQ+PCY
         mT+NIkCk2UehnA+jKENNHcdeXTPtcR93rCeJlB2Y6JEc7Y324Ry6rwuEsdMZ2FHK+nVU
         faZj3M6KHMl+Y9rHYs3ME2Ig3pZUzR+4+i3ssuKrPFIr+xZNfOa51JaN0roGXTsgIFqY
         /1v2kv4+BL/K4hquEEFofKy/cvajqI5hEXYgDDLLCjh6ZZVVxHEbE+pXaa2jJbZ1Vctv
         prjU1kCnuAHXHvldpc3aoy1EnbDVNREVLCxlP9cVb0/bbAjuNf3Tjct7Lnqy4ZZsSuhS
         sbog==
X-Forwarded-Encrypted: i=1; AJvYcCUujcWsU0BMwYVArgNTpYiQdhOHO/0sLmYirrZWvxmdVJNhBJsaSA8BOi0PweQkmdO28kEggu0Ro++zSkQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyPbhDN3lnXJBckhDh0vQdEFUvvOqiCcY4JmtlOZc8fcmhbUIq
	EK7WtuYXJJs3DypxGak3y4pAOO0+TvKMwFlLgz6rKUtvwYwX15+nNEh8mQrKiGlZMp/L+Fxaoji
	vwhgTspMMQHSgw58mbmhX1rngmA==
X-Google-Smtp-Source: AGHT+IEM1wcs7zT7wfIKQpp3JjLe/UW3BxESoePC97InZ/JyDv14sDQBJbNNDVOfbMali1ZrmmAYEHbamgjzGXB67y0=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:690c:20a5:b0:6e3:b08:92cb with
 SMTP id 00721157ae682-6eee077a19emr5797b3.0.1732221755894; Thu, 21 Nov 2024
 12:42:35 -0800 (PST)
Date: Thu, 21 Nov 2024 20:42:21 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=10871; i=samitolvanen@google.com;
 h=from:subject; bh=rJs6LLEdV9LNIe3BWRFRAx7DlIZIwQfGN90KzyE+A4k=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOn2s3UuJf/QVZ1z6a65ZsKjZK1eGe6DQVlrl0/LFN35b
 s+uRbsjOkpZGMQ4GGTFFFlavq7euvu7U+qrz0USMHNYmUCGMHBxCsBEZpcyMpxZXGP5d8d1HeG4
 BbnOk1cGt8fmmDrua9F+FKHxOCs9+CAjw9ZI1wW3n0gnvwt3NpqkbCGuG7ygdE3BzY96DHob1YV 4OAE=
X-Mailer: git-send-email 2.47.0.371.ga323438b13-goog
Message-ID: <20241121204220.2378181-20-samitolvanen@google.com>
Subject: [PATCH v6 00/18] Implement DWARF modversions
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

Here's v6 of the DWARF modversions series. The main motivation is
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

v6 has changes to structure expansion and the kABI stability
features based on our backtesting results with previous Android
release kernels (see the change log below). It's also based on
linux-kbuild/for-next to include symtypes build rule clean-ups from
Masahiro [3]. For your convenience, the series is also available
here:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v6

If you also want to test the series with actual Rust modules, this
branch adds Matt's latest modversion_info series:

https://github.com/samitolvanen/linux/commits/rustmodversions-v6

Sami


[1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
[2] https://lore.kernel.org/linux-modules/20241030-extended-modversions-v8-0-93acdef62ce8@google.com/
[3] https://lore.kernel.org/linux-modules/CAK7LNAR9c+EEsOvPPn4qSq3gAFskYOXVd=dg8O+bKeeC-HMifw@mail.gmail.com/

---

v6:
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
 include/linux/export.h                     |   15 +
 kernel/module/Kconfig                      |   31 +
 scripts/Makefile                           |    3 +-
 scripts/Makefile.build                     |   35 +-
 scripts/gendwarfksyms/.gitignore           |    2 +
 scripts/gendwarfksyms/Makefile             |   12 +
 scripts/gendwarfksyms/cache.c              |   51 +
 scripts/gendwarfksyms/die.c                |  166 +++
 scripts/gendwarfksyms/dwarf.c              | 1158 ++++++++++++++++++++
 scripts/gendwarfksyms/examples/kabi.h      |  157 +++
 scripts/gendwarfksyms/examples/kabi_ex.c   |   30 +
 scripts/gendwarfksyms/examples/kabi_ex.h   |  263 +++++
 scripts/gendwarfksyms/examples/symbolptr.c |   33 +
 scripts/gendwarfksyms/gendwarfksyms.c      |  185 ++++
 scripts/gendwarfksyms/gendwarfksyms.h      |  301 +++++
 scripts/gendwarfksyms/kabi.c               |  333 ++++++
 scripts/gendwarfksyms/symbols.c            |  339 ++++++
 scripts/gendwarfksyms/types.c              |  477 ++++++++
 20 files changed, 3893 insertions(+), 7 deletions(-)
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


base-commit: 3596c721c4348b2a964e43f9296a0c01509ba927
-- 
2.47.0.371.ga323438b13-goog


