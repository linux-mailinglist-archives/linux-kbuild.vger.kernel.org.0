Return-Path: <linux-kbuild+bounces-3954-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 567149956C2
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 20:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C6B1F258DF
	for <lists+linux-kbuild@lfdr.de>; Tue,  8 Oct 2024 18:38:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD699212D09;
	Tue,  8 Oct 2024 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hHEfM2It"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6E1E00A7
	for <linux-kbuild@vger.kernel.org>; Tue,  8 Oct 2024 18:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728412719; cv=none; b=cIiD4bg0kZuSRV3b1UUJ4Sfa/QIiExSwlg0pr/EE1+0R5s3PDLQur5a6fU6K5bvf9LiW3WNo21WdEim8ndOUH99vK7g30OLfnE4KFETpaajy3Q2oTFTU8CFNgzw/A4yMjjjlMZelTVtLI3Fe9vhNpjp5uwoAIzwsTulucSTJl/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728412719; c=relaxed/simple;
	bh=4e8r6mYIDO+igGLWTWuZCKBJGTYTPIHxIKjGnvqW3NI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QGgBbkMXINlsjcfAIYkHy7O6snQsJdNtvvZkMP8iseonXpm+KoXM8qAINikrar8InEpweTIubIW3UqNOY88YLN8hMFy1rpwAzgUV+b2bLtDQ/adtovl1PXRAZw8Sa271OKhuh2a476aiLxOtx1e7qQBqw4icsr6ptVeZ9QhAK6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hHEfM2It; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-71dfeda9ac0so2709215b3a.1
        for <linux-kbuild@vger.kernel.org>; Tue, 08 Oct 2024 11:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728412717; x=1729017517; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gE5C6P+FguMxBPu/VQUgs6ziyMjtABJbpUZYROlb7Hw=;
        b=hHEfM2ItPg/TX5ns7SsCWCZUQF2i7HefI68ZVm0gKFRIMDbfhGgKYoa9ELFqC4ps+v
         dVt8FeZo2j/5qTZWKo+P6qg/vBC8gJ3qIbDu0tywruffkVQfcB+mfr2Mrd6JR14QXzb1
         A6TULAUBpxdtQ++sodnwDpPNBezMm2/xaxZIe8z+q7YyYNxD9DkUS2gh1wk/JuVPcMir
         OY3ISrJDE7H40m/7KZcIOBufeH/IkbGOSnt95nQ5UCqOzyt0W1vIVXjRc8K2EiisG/pg
         K4iWrkvKM0bE7XhbX1BaraVVynZNs6gIQl7GQ88mWLDrP7Pm8ldcUBBAvQLmmRqUfQHX
         NY1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728412717; x=1729017517;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gE5C6P+FguMxBPu/VQUgs6ziyMjtABJbpUZYROlb7Hw=;
        b=k+qbXftYZbT+aHxWCyp6pmgIZ38kZ/HIcHt4K8Q04Zc7K8+BV6EN38Q8vJsv1ha5m+
         TB1cKwrrJRPcwvl1HLuSLqsFsNej3XbuU24ILL/e435duPdMDWA23bgwvr0mOHD+4lyi
         FT9Nc/qm5OuIcmDtoyqV6bMyhMj318ddqTNCPF1YAgBorR9a+FykzuBuDa54X+2AOs72
         jf1H3UaSbJuO8uNb5PVh1Rpt3ZbSjT+jBOsvnUv3jBM3IeAJz7jeyukl/MI7u+slO1oo
         lPNrnNQqAsfl1oKAjBRX01ewmO4t3Zk4FkZ+T7APYa1FbDhGotp6NbCaPFypkoBIkKqj
         +8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLJu9CMl9HHy/PQl1yhVr4+HewTtTGUH8V0q5J2BU9+4LYvaRzFey+vJhrySYIwUfKzW3g4WOiJqtUnhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUmzfESVnKS3OODD2RO1JxGm9Jo06so99PHNzTu3tGc9kVlo5o
	Gh9F2AyFEk3xrx3ZUL1UvX4LXReg+dPl4Mvj59NL3MHrgPyvWWijU8bk6TRPt9ecEi/PxLi+81H
	w0nHDkXSJjGP3v6VHTp4Ro3cLZg==
X-Google-Smtp-Source: AGHT+IHPwHgCApbwLq8iY4kWrrOuNY4O6OryDtwGgVkqDB1jCr+wfxpLArIYzmMcvwJcCBoVtp09Mu+Y72QVAtjeedM=
X-Received: from samitolvanen.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:4f92])
 (user=samitolvanen job=sendgmr) by 2002:a05:6a00:91db:b0:71e:401:6580 with
 SMTP id d2e1a72fcca58-71e040166f7mr14892b3a.6.1728412716926; Tue, 08 Oct 2024
 11:38:36 -0700 (PDT)
Date: Tue,  8 Oct 2024 18:38:24 +0000
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=9498; i=samitolvanen@google.com;
 h=from:subject; bh=4e8r6mYIDO+igGLWTWuZCKBJGTYTPIHxIKjGnvqW3NI=;
 b=owGbwMvMwCEWxa662nLh8irG02pJDOmsNfKtCvddrh1eEVsbsNnNScFUKvrWfKtpQTtZ2q/YH
 f0xT0S4o5SFQYyDQVZMkaXl6+qtu787pb76XCQBM4eVCWQIAxenAEzkcxwjw8lft67bq8564pK7
 Jki6iXvd2RWbLkjPcN//ncclVSXnRiojQ58Cr8zjKLH1R986xLkdf3s79rCrHLNR6BN9cbkOqxx xVgA=
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Message-ID: <20241008183823.36676-21-samitolvanen@google.com>
Subject: [PATCH v4 00/19] Implement DWARF modversions
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

Here's v4 of the DWARF modversions series. The main motivation is
modversions support for Rust, which is important for distributions
like Android that are about to ship Rust kernel modules. Per Luis'
request [1], v2 dropped the Rust specific bits from the series and
instead added the feature as an option for the entire kernel. Matt is
addressing Rust modversion_info compatibility issues in a separate
series [2], and we'll follow up with a patch to actually allow
CONFIG_MODVERSIONS with Rust once everything else has been sorted
out.

Short background: Unlike C, Rust source code doesn't have sufficient
information about the final ABI, as the compiler has considerable
freedom in adjusting structure layout, for example, which makes
using a source code parser like genksyms a non-starter. Based on
earlier feedback, this series uses DWARF debugging information for
computing versions. DWARF is an established and a relatively stable
format, which includes all the necessary ABI details, and adding a
CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
reasonable trade-off.

The first patch moves the genksyms CRC32 implementation to a shared
header file and the next 15 patches add gendwarfksyms, a tool for
computing symbol versions from DWARF. When passed a list of exported
symbols and object files, the tool generates an expanded type string
for each symbol and computes symbol CRCs similarly to genksyms.
gendwarfksyms is written in C and uses libdw to process DWARF. Patch
17 ensures that debugging information is present where we need it,
patch 18 adds gendwarfksyms as an alternative to genksyms, and the
last patch adds documentation.

v4 is based on v6.12-rc2 and for your convenience the series is also
available here:

https://github.com/samitolvanen/linux/commits/gendwarfksyms-v4

If you also want to test the series with Rust modules, this branch
adds Matt's latest modversion_info series and a small patch to enable
Rust modversions:

https://github.com/samitolvanen/linux/commits/rustmodversions-v4

Sami


[1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
[2] https://lore.kernel.org/lkml/20240925233854.90072-1-mmaurer@google.com/

---

v4:
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

 Documentation/kbuild/gendwarfksyms.rst      |  274 +++++
 Documentation/kbuild/index.rst              |    1 +
 include/linux/export.h                      |   15 +
 kernel/module/Kconfig                       |   31 +
 scripts/Makefile                            |    3 +-
 scripts/Makefile.build                      |   39 +-
 scripts/gendwarfksyms/.gitignore            |    2 +
 scripts/gendwarfksyms/Makefile              |   12 +
 scripts/gendwarfksyms/cache.c               |   44 +
 scripts/gendwarfksyms/die.c                 |  166 +++
 scripts/gendwarfksyms/dwarf.c               | 1088 +++++++++++++++++++
 scripts/gendwarfksyms/examples/kabi.h       |  141 +++
 scripts/gendwarfksyms/examples/kabi_ex0.c   |   86 ++
 scripts/gendwarfksyms/examples/kabi_ex1.c   |   89 ++
 scripts/gendwarfksyms/examples/kabi_ex2.c   |   98 ++
 scripts/gendwarfksyms/examples/kabi_rules.c |   56 +
 scripts/gendwarfksyms/examples/symbolptr.c  |   33 +
 scripts/gendwarfksyms/gendwarfksyms.c       |  187 ++++
 scripts/gendwarfksyms/gendwarfksyms.h       |  352 ++++++
 scripts/gendwarfksyms/kabi.c                |  214 ++++
 scripts/gendwarfksyms/symbols.c             |  319 ++++++
 scripts/gendwarfksyms/types.c               |  477 ++++++++
 scripts/genksyms/genksyms.c                 |   77 +-
 scripts/include/crc32.h                     |   93 ++
 24 files changed, 3812 insertions(+), 85 deletions(-)
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


base-commit: 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
-- 
2.47.0.rc0.187.ge670bccf7e-goog


