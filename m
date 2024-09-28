Return-Path: <linux-kbuild+bounces-3825-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AF198919C
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2024 23:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B30842855A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 28 Sep 2024 21:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C4F17C20F;
	Sat, 28 Sep 2024 21:47:05 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DB2015C150;
	Sat, 28 Sep 2024 21:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727560025; cv=none; b=K+jLQkpGIbLo6v5c/6AaWWoMluRgSaUNBy1hCVotXKaTeyqqsHeH161PLV4wFc7LNCZs+XRuBAbBBkW9g0W6pqvut1N3kBZL9AM+NctktokmBlmLXU6g7dVuZvWVQSBNNNTLVip8+4b+pm1oJge/bnv12GZxtNazf2Jqwgr6WqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727560025; c=relaxed/simple;
	bh=pJHKnKu4CRgq7XSoKuoYWzkMNgMNKiayIqSJm078TxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CIudskI72l8faG6TI6fzvRxwYk3lfoZGzc02B7DzAUnIEWKpf5hEnODLR7Jrw1FbtNK1Ju9Dwsbe0klhxPpO7YjnDaccnQYkXKccbXYW2Pb7PMgIVP3EEUEqHew4wAR4h4p7ImnjSaj8mFCPdF4qYfL4FroHgwJ/L2rfbZWdEIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a90188ae58eso401589266b.1;
        Sat, 28 Sep 2024 14:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727560021; x=1728164821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W7GkSo7eHSvwAWlmQ2pcRrIW5iwdwKQe1ajDCIDdclc=;
        b=wzq8zna2yQ0unWsd/eBCF6oCqoNMUwipGOB1g8sqdj57EVt+dUp9pEjFIFDs4Kzh3k
         K7KrYy8BNnHT8x5DuepiCsmBCk4+58zf/12L+DWo2CtU3kmIQW0H4QQRvSW4UoiUrkKn
         EQGDaoL2oZ0ZQ+R8JihacRtTJIr1mZqS2wivZ/GbWG931kDobfu0y6iXPry2jADAbsiZ
         rndw+NYTqQ5W4YpoVBXVsHfBkciJoJ6UbB5L8iwsJkc9S+tWKUY/URlVmuQ8FVu62qAm
         cKByrTg9MWgNcakZ/hN4ZADt+frVkMTifRvwhFeHCO7Ugj0oKRkxEH1rfiez9RUgg9S/
         UWew==
X-Forwarded-Encrypted: i=1; AJvYcCV2/anNwNe58Ku9rFiLcxv4G3uiFSCdB2nU/PCj7I2hOmkCaU3it+MhBeUOp06ATt/9odw7Mu+HaM8SJQ17B8E=@vger.kernel.org, AJvYcCVq2O5WmJ8QHEp5ORObjReWafkQFmN4vL7gqdGRUxqlpwIyDY5YlYMVflx8z2xgf9pZ+nGhdEA8goVOU1RZzQ==@vger.kernel.org, AJvYcCWI03nJErcwHzZnvmMCCoZ+rJIIhvcC0qC0mAG1KJb7wgVJIh3tgHnt7W22agDuggsARhfMNUtAmrgSgkKS@vger.kernel.org, AJvYcCXlpWXiPYHre7kRyUzgti9aLTHzMRCgAPzcPE9bBmYgg8YhnvJ+488wyFL2pS+X/Lkf1VwBrswt9pQtPEw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ghFKTsM8u9YmzQ76akyQWgneUki2nKfyddACO95uZLv4lJNm
	gDvEbrJqXiQn5DAp3kgXynMhp4acQU+UAD3p9UHTA/+/MWGCREoyp3HdAbrwWh8=
X-Google-Smtp-Source: AGHT+IHFD9xhZFNTDWvsYXRldOMc959jTbs86LVDXza5Nu4/vNAGdbGeE0RpmvRVj6bJ3ehVeuu+ew==
X-Received: by 2002:a17:907:7ea4:b0:a8d:5133:c426 with SMTP id a640c23a62f3a-a93c4ac92edmr727407866b.45.1727560021264;
        Sat, 28 Sep 2024 14:47:01 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27d2a84sm292366766b.87.2024.09.28.14.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Sep 2024 14:47:01 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a90188ae58eso401588366b.1;
        Sat, 28 Sep 2024 14:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV54nb095ikTZlbdIfRpR5f8zS/zPCNzIxEbd0L0voMpCd/lDmIfe4kqjGai4WMuEOdF4hrNXsrr3ENfHw=@vger.kernel.org, AJvYcCVK21mb4tfEwYX1EdxfKZitjcTzotxGffK9dVny5/DZFxzvnbJngwO27ddwFMePfBfb+XAQZDRh2F+LTr152j0=@vger.kernel.org, AJvYcCWD6rgQGDUIEFbiCw4uihl8Sq9jxrvWPAlqxfO9Lm+vAkvwiUyuIIOGnRAJeYvpb5koGTvMp9u6NdwFrWSc@vger.kernel.org, AJvYcCWWu1gvZW1i45839dQx6OEy5+olLlOd8wrPV1Ay3QiEWDBdK8qqS+oiSs09KFKa8OfQOIFXGt5VPg8KzEbEwg==@vger.kernel.org
X-Received: by 2002:a17:907:3e21:b0:a8d:7b7d:8c39 with SMTP id
 a640c23a62f3a-a93c4ac9362mr864360066b.43.1727560020553; Sat, 28 Sep 2024
 14:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240923181846.549877-22-samitolvanen@google.com>
In-Reply-To: <20240923181846.549877-22-samitolvanen@google.com>
From: Neal Gompa <neal@gompa.dev>
Date: Sat, 28 Sep 2024 17:46:24 -0400
X-Gmail-Original-Message-ID: <CAEg-Je_wRvSiDLMXRpL+xaun3FjmfSmaYhZZbDn-nsEHg_A=dQ@mail.gmail.com>
Message-ID: <CAEg-Je_wRvSiDLMXRpL+xaun3FjmfSmaYhZZbDn-nsEHg_A=dQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 2:19=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi,
>
> Here's v3 of the DWARF modversions series [1][2]. The main
> motivation remains modversions support for Rust, which is important
> for distributions like Android that are eager to ship Rust kernel
> modules. Per Luis' request [3], v2 dropped the Rust specific bits
> from the series and instead added the feature as an option for
> the entire kernel. Matt is still addressing Rust modversion_info
> compatibility issues in a separate series [4], and we'll follow up
> with a patch to actually allow CONFIG_MODVERSIONS with Rust once
> everything else has been sorted out.
>
> A short background recap: Unlike C, Rust source code doesn't
> have sufficient information about the final ABI, as the compiler
> has considerable freedom in adjusting structure layout, for
> example, which makes using a source code parser like genksyms a
> non-starter. Based on Matt's suggestion and previous feedback from
> maintainers, this series uses DWARF debugging information for
> computing versions. DWARF is an established and a relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off.
>
> The first two patches add more list macros to scripts/include and
> move the genksyms CRC32 implementation to a shared header file. The
> next 15 patches add gendwarfksyms, a tool for computing symbol
> versions from DWARF. When passed a list of exported symbols and
> object files, the tool generates an expanded type string for each
> symbol and computes symbol CRCs similarly to genksyms. gendwarfksyms
> is written in C and uses libdw to process DWARF. Patch 18 ensures
> that debugging information is present where we need it, patch 19
> adds gendwarfksyms as an alternative to genksyms, and the last patch
> adds documentation.
>
> Note that v3 is based on next-20240923 as it depends on Masahiro's
> scripts/include changes. For x86, we also need a separate small
> patch to include asm/ptrace.h in asm/ftrace.h. [5] For your
> convenience, you can find this series with all the prerequisites
> here:
>
> https://github.com/samitolvanen/linux/commits/gendwarfksyms-v3
>
> If you also want to test the series with Rust modules, this branch
> adds Matt's modversion_info series and a small patch to enable Rust
> modversions:
>
> https://github.com/samitolvanen/linux/commits/rustmodversions-v3
>
> Looking forward to hearing your thoughts!
>
> Sami
>
>
> [1] v1: https://lore.kernel.org/lkml/20240617175818.58219-17-samitolvanen=
@google.com/
> [2] v2: https://lore.kernel.org/lkml/20240815173903.4172139-21-samitolvan=
en@google.com/
> [3] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
> [4] https://lore.kernel.org/lkml/20240806212106.617164-1-mmaurer@google.c=
om/
> [5] https://lore.kernel.org/lkml/20240916221557.846853-2-samitolvanen@goo=
gle.com/
>
> ---
>
> Changes in v3:
> - Updated SPX license headers.
>
> - Squashed the first two patches in v2 and tried to reduce churn as
>   much as reasonable.
>
> - Dropped patch 18 from v2 ("x86/asm-prototypes: Include
>   <asm/ptrace.h>") as it's addressed by a separate patch. [5]
>
> - Changed the error handling code to immediately terminate instead
>   of propagating the errors back to main, which cleaned up the code
>   quite a bit.
>
> - Switched to the list and hashtable implementations in scripts and
>   dropped the remaining tools/include dependencies. Added a couple
>   missing list macros. (patch 1)
>
> - Moved the genksyms CRC32 implementation to scripts/include and
>   dropped the duplicate code. (patches 2 and 14)
>
> - Switched from ad-hoc command line parsing to getopt_long (patch 3).
>
> - Added structure member and function parameter names to the DIE
>   output to match genksyms behavior, and tweaked the symtypes format
>   to be more parser-friendly in general based on Petr's suggestions.
>
> - Replaced the declaration-only struct annotations with more generic
>   kABI stability rules that allow source code annotations to be used
>   where #ifndef __GENKSYMS__ was previously used.  Added support for
>   rules that can be used to exclude enumerators from versioning.
>   (patch 16)
>
> - Per Miroslav's suggestion, added an option to hide structure
>   members from versioning when they're added to existing alignment
>   holes, for example. (patch 16)
>
> - Per Greg's request, added documentation and example macros for the
>   --stable features, and a couple of test cases. (patches 15, 16, and
>   20)
>
> - Fixed making symtypes files, which need to depend on .o files with
>   gendwarfksyms. (patch 19)
>
> - Addressed several other smaller issues that Petr and Masahiro
>   kindly pointed out during the v2 review.
>
> Changes in v2:
> - Per Luis' request, dropped Rust-specific patches and added
>   gendwarfksyms as an alternative to genksyms for the entire
>   kernel.
>
> - Added support for missing DWARF features needed to handle
>   also non-Rust code.
>
> - Changed symbol address matching to use the symbol table
>   information instead of relying on addresses in DWARF.
>
> - Added __gendwarfksyms_ptr patches to ensure the compiler emits
>   the necessary type information in DWARF even for symbols that
>   are defined in other TUs.
>
> - Refactored debugging output and moved the more verbose output
>   behind --dump* flags.
>
> - Added a --symtypes flag for generating a genksyms-style
>   symtypes output based on Petr's feedback, and refactored
>   symbol version calculations to be based on symtypes instead
>   of raw --dump-dies output.
>
> - Based on feedback from Greg and Petr, added --stable flag and
>   support for reserved data structure fields and declaration-onl
>   structures. Also added examples for using these features.
>
> - Added a GENDWARFKSYMS option and hooked up kbuild support
>   for both C and assembly code. Note that with gendwarfksyms,
>   we have to actually build a temporary .o file for calculating
>   assembly modversions.
>
> ---
>
> Sami Tolvanen (20):
>   scripts: import more list macros
>   scripts: move genksyms crc32 implementation to a common include
>   tools: Add gendwarfksyms
>   gendwarfksyms: Add address matching
>   gendwarfksyms: Expand base_type
>   gendwarfksyms: Add a cache for processed DIEs
>   gendwarfksyms: Expand type modifiers and typedefs
>   gendwarfksyms: Expand subroutine_type
>   gendwarfksyms: Expand array_type
>   gendwarfksyms: Expand structure types
>   gendwarfksyms: Limit structure expansion
>   gendwarfksyms: Add die_map debugging
>   gendwarfksyms: Add symtypes output
>   gendwarfksyms: Add symbol versioning
>   gendwarfksyms: Add support for kABI rules
>   gendwarfksyms: Add support for reserved and ignored fields
>   gendwarfksyms: Add support for symbol type pointers
>   export: Add __gendwarfksyms_ptr_ references to exported symbols
>   kbuild: Add gendwarfksyms as an alternative to genksyms
>   Documentation/kbuild: Add DWARF module versioning
>
>  Documentation/kbuild/gendwarfksyms.rst      |  274 +++++
>  Documentation/kbuild/index.rst              |    1 +
>  include/linux/export.h                      |   15 +
>  kernel/module/Kconfig                       |   31 +
>  scripts/Makefile                            |    3 +-
>  scripts/Makefile.build                      |   39 +-
>  scripts/gendwarfksyms/.gitignore            |    2 +
>  scripts/gendwarfksyms/Makefile              |   12 +
>  scripts/gendwarfksyms/cache.c               |   44 +
>  scripts/gendwarfksyms/die.c                 |  166 +++
>  scripts/gendwarfksyms/dwarf.c               | 1085 +++++++++++++++++++
>  scripts/gendwarfksyms/examples/kabi.h       |  141 +++
>  scripts/gendwarfksyms/examples/kabi_ex0.c   |   86 ++
>  scripts/gendwarfksyms/examples/kabi_ex1.c   |   89 ++
>  scripts/gendwarfksyms/examples/kabi_ex2.c   |   98 ++
>  scripts/gendwarfksyms/examples/kabi_rules.c |   56 +
>  scripts/gendwarfksyms/examples/symbolptr.c  |   29 +
>  scripts/gendwarfksyms/gendwarfksyms.c       |  195 ++++
>  scripts/gendwarfksyms/gendwarfksyms.h       |  351 ++++++
>  scripts/gendwarfksyms/kabi.c                |  214 ++++
>  scripts/gendwarfksyms/symbols.c             |  317 ++++++
>  scripts/gendwarfksyms/types.c               |  477 ++++++++
>  scripts/genksyms/genksyms.c                 |   77 +-
>  scripts/include/crc32.h                     |   93 ++
>  scripts/include/list.h                      |   50 +
>  25 files changed, 3860 insertions(+), 85 deletions(-)
>  create mode 100644 Documentation/kbuild/gendwarfksyms.rst
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/cache.c
>  create mode 100644 scripts/gendwarfksyms/die.c
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi.h
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_ex0.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_ex1.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_ex2.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_rules.c
>  create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>  create mode 100644 scripts/gendwarfksyms/kabi.c
>  create mode 100644 scripts/gendwarfksyms/symbols.c
>  create mode 100644 scripts/gendwarfksyms/types.c
>  create mode 100644 scripts/include/crc32.h
>
>
> base-commit: ef545bc03a65438cabe87beb1b9a15b0ffcb6ace
> --
> 2.46.0.792.g87dc391469-goog
>

This patch set looks fairly reasonable.

Acked-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

