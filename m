Return-Path: <linux-kbuild+bounces-4847-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ADC9D866C
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 14:30:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6988B16A065
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 Nov 2024 13:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA3B51AC8B8;
	Mon, 25 Nov 2024 13:29:40 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9D21AB52F;
	Mon, 25 Nov 2024 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541380; cv=none; b=WH0mm+yzsDmfdPJM4MdLTG+/2GYitJ1zeas88okfVzsgnzunM4iLMpswG+pDgkKGFBUBkr+gRNeku8eMPNmH10HTF80o8RgJRKMGW5fofdfdI9rET4vuLYcBpZdwbfm92OYZZbNI4zMDYUAGsVCxQFPx4p4wZcA8oDqB0qJ+a6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541380; c=relaxed/simple;
	bh=Ahsf+7m3iG/GKdqKjKW2hw7ObanDERZHiY4c1Vga1cY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOO4QVm43cYkm0bKE8mMJhuiq9H3Dmt/m6FhOxMZ5UuQnxBAWRrEHBtPBnjbYvtpEfC9MxxGXPWfiRU6NkZ30cmvs7Clfd35Y7PWGm9CC83N/GatlkiDIjfGZudmAHOtDCeVP16m5L1jXifyV+p8E8qafWZTCMTGPCZQTkJ2psk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5cfaeed515bso5848044a12.1;
        Mon, 25 Nov 2024 05:29:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732541376; x=1733146176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTKrQraN2IyV/SgbyUsYqrdmAhzorxXjm9+NVhb0pbA=;
        b=Ph+mp1XJ9Xx0+hsANxOciVcfEpTVnnRpuBIKKu7SwQlUscdLOWwXLT5/hzXv+wLtLP
         uqUJ+D75U0RdO5iFlrsctVPGOnBeBykOWbSLl5cdY9wzPbmPH0wjBTUF85AAoK4tRbAu
         WaE7MDH4A/L1Xqzs6Xg8Ggmz6wW3VUTISj9bMT8U5z2jSXeBiu2Cm7cKNlCwFwW5zJ9Y
         rUpk+PHWWao0QJ5LYTXet82R+CgmlrYwoy+p1RrFgl321zWSDX457IBwdPCKmocum1aK
         vFE9rT/OZDjf7TT+BeD7FUgqVTp7CxKovkaCsD6AbHKjcIllywq4hEFE600HPX23YzD2
         byYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/w5Km2SRq8FWuLOLmKlVOkBzHka0KYKmuF/TrLSTqFJr8GJgstS1jtK1XXixFbLHLBzi/xLE/MREph/OxP98=@vger.kernel.org, AJvYcCVLE2ikEVe5b/FKhI/qMNZ7y6+YnQVxIeJUWIPhsMFgvyEvh8S7ViR7HLQSYHzwkzZWPiroZgXT9DvL4ec=@vger.kernel.org, AJvYcCVXW4E8BjTT2MGOU1PXv1abPQHxeACGFNcpbPQ6HFHXBLAvnF8Blt8hjNp4J5PYFtOC0eH9uL/zSUKCpL9YHw==@vger.kernel.org, AJvYcCWR/pxftpH6aJ66HTzYzL4ZPEKNtFnAx3BOav4odeWqvF0lhZZMTnocxCmgUFJiskjTEiIJqlIe6tD8x9nw@vger.kernel.org
X-Gm-Message-State: AOJu0YxcCO0j/eFR/u7/4SbFGP6Ea/9JBgvU0S7kvUJu3PPe1Op6Wp/L
	m7IhR3hONLdovv+dctq6oHDCqGEj/Vs24H0hettV9wQnHAGqzOH7CFVfxdjKgBc=
X-Gm-Gg: ASbGncvB9EmY0unFmZ9td2xEBo3/EMQ9GZzY68VYtP+a84eQcOWFmkiwD1Y3Q5er6AS
	MDRXCNzLTo+odZ+XsGeKPxn8QWCUU9Bl3FS7NIQ7hiRNtM9poDHLP3eOnrP6FoQESFEnZlBAKe0
	md9NCx+550ke8N7B2l0Pq5wDuQCzo53fXnu3JJLWoY+oXAFO6XxFsLiDdvtRL288D6jVNnrfz9U
	qMCCGOZCi6kgsaV0uxIP/ReMvVPletwY6PrBGKyXyBrzSSJB7htPT7p04p3SLgg+a4RKQdvlR8j
	VmEX
X-Google-Smtp-Source: AGHT+IHY7/wbtxSGB+GeYcAxU+N7NhNsuHgiEEl9m2XxUy+29C33dzI7oRtOU8/37ChnJBy6XwNTTg==
X-Received: by 2002:a17:906:c384:b0:aa5:50b6:a612 with SMTP id a640c23a62f3a-aa550b6aa04mr302909366b.61.1732541376052;
        Mon, 25 Nov 2024 05:29:36 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa550d3a484sm140952766b.115.2024.11.25.05.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 05:29:35 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso388230266b.2;
        Mon, 25 Nov 2024 05:29:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7HHu4ZOLbm168kVesnC4nnm7n+ooU2weZgD5u0vjwDtxPgZTbmI8HEtMd0wQ0Oqi00gP6Pw8jySUmwimR@vger.kernel.org, AJvYcCVuWw0HM9g0LoqSKyXnmGcM8cotYKcrz2V3HR88C1Flp3d3cC33is60zSZrSdsU+9TTxNyOwy8+nMBCqBzeAg==@vger.kernel.org, AJvYcCWlt1J7jf2G18x5P9xvhDXKOi1YFX1GEfOOdCcmnv/j81AFDUjtkihPS0lZInnLW0CqGbVPHHSMDPL7TUYmRsM=@vger.kernel.org, AJvYcCX1iUqBO/vP2Uhnh9DV4jOVAZXx+pKX9s8zdVuX1YF1SZEKLSkyc6okrcwXYP6Le8hXr1SSLITfPJvSMFg=@vger.kernel.org
X-Received: by 2002:a17:907:7752:b0:aa5:3b1c:77a7 with SMTP id
 a640c23a62f3a-aa53b1c791amr601319166b.6.1732541374662; Mon, 25 Nov 2024
 05:29:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121204220.2378181-20-samitolvanen@google.com>
In-Reply-To: <20241121204220.2378181-20-samitolvanen@google.com>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 25 Nov 2024 08:28:58 -0500
X-Gmail-Original-Message-ID: <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
Message-ID: <CAEg-Je-h4NitWb2ErFGCOqt0KQfXuyKWLhpnNHCdRzZdxi018Q@mail.gmail.com>
Subject: Re: [PATCH v6 00/18] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, Sedat Dilek <sedat.dilek@gmail.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-modules@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	"Darrick J. Wong" <djwong@kernel.org>, Donald Zickus <dzickus@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 3:42=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi,
>
> Here's v6 of the DWARF modversions series. The main motivation is
> modversions support for Rust, which is important for distributions
> like Android that are about to ship Rust kernel modules. Per Luis'
> request [1], v2 dropped the Rust specific bits from the series and
> instead added the feature as an option for the entire kernel to
> make it easier to evaluate the benefits of this approach, and to
> get better test coverage. Matt is addressing Rust modversion_info
> compatibility issues in a separate patch set [2] that depends on
> this series, and actually allows modversions to be enabled with
> Rust.
>
> Short background: Unlike C, Rust source code doesn't have sufficient
> information about the final ABI, as the compiler has considerable
> freedom in adjusting structure layout, for example, which makes
> using a source code parser like genksyms a non-starter. Based on
> earlier feedback, this series uses DWARF debugging information for
> computing versions. DWARF is an established and a relatively stable
> format, which includes all the necessary ABI details, and adding a
> CONFIG_DEBUG_INFO dependency for Rust symbol versioning seems like a
> reasonable trade-off as most distributions already enable it.
>
> The first 15 patches add gendwarfksyms, a tool for computing symbol
> versions from DWARF. When passed a list of exported symbols and
> object files, the tool generates an expanded type string for each
> symbol and computes symbol versions. gendwarfksyms is written in C,
> uses libdw to process DWARF, and zlib for CRC32. Patch 16 ensures
> that debugging information is present where we need it, patch 17
> adds gendwarfksyms as an alternative to genksyms, and the last patch
> adds documentation.
>
> v6 has changes to structure expansion and the kABI stability
> features based on our backtesting results with previous Android
> release kernels (see the change log below). It's also based on
> linux-kbuild/for-next to include symtypes build rule clean-ups from
> Masahiro [3]. For your convenience, the series is also available
> here:
>
> https://github.com/samitolvanen/linux/commits/gendwarfksyms-v6
>
> If you also want to test the series with actual Rust modules, this
> branch adds Matt's latest modversion_info series:
>
> https://github.com/samitolvanen/linux/commits/rustmodversions-v6
>
> Sami
>
>
> [1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
> [2] https://lore.kernel.org/linux-modules/20241030-extended-modversions-v=
8-0-93acdef62ce8@google.com/
> [3] https://lore.kernel.org/linux-modules/CAK7LNAR9c+EEsOvPPn4qSq3gAFskYO=
XVd=3Ddg8O+bKeeC-HMifw@mail.gmail.com/
>
> ---
>
> v6:
> - Dropped pointer expansion limits as this affects version
>   stability when exported symbols are removed. (Patch 9)
>
> - Changed local type definitions (in .c files) that are opaque
>   to external users to be treated as declarations even if a
>   definition is available. (Patch 9)
>
> - Switched to zlib's CRC32 implementation per Masahiro's
>   suggestion. (Patch 12)
>
> - Renamed struct_declonly kABI rule to simply declonly, as it
>   applies also to unions and enums, added a new rule for
>   overriding enumerator values, and refactored the examples.
>   (Patch 13)
>
> - Added --stable support for renamed structure members and
>   also added examples. (Patch 14)
>
> - Rebased on linux-kbuild/for-next for Masahiro's symtypes
>   build rule clean-ups. (Patch 17)
>
> - Updated the documentation reflect --stable changes. (Patch 18)
>
> v5: https://lore.kernel.org/lkml/20241030170106.1501763-21-samitolvanen@g=
oogle.com/
> - Rebased on v6.12-rc5.
>
> - Fixed an issue with limiting structure expansion, and applied
>   Petr's clean-up. (Patch 10)
>
> - Dropped an unnecessary return statement in error path. (Patch
>   12)
>
> - Addressed several other smaller issues Petr brought up. (Patches
>   13, 14, and 15)
>
> - Added a KBUILD_GENDWARFKSYMS_STABLE flag to enable --stable for
>   the entire kernel build. (Patch 18)
>
> - Updated documentation to include KBUILD flags. (Patch 19)
>
> - Picked up Reviewed-by tags from v4.
>
> v4: https://lore.kernel.org/lkml/20241008183823.36676-21-samitolvanen@goo=
gle.com/
> - Rebased on v6.12-rc2, which now includes all the prerequisites.
>
> - Dropped unnecessary name_only parameter for symbols.c::for_each
>   and cleaned up error handling. (Patch 3)
>
> - Fixed anonymous scope handling to ensure unnamed DIEs don't get
>   names. (Patch 4)
>
> - Added non-variant children to variant_type output, and included
>   DW_AT_discr_value attributes for variants. (Patch 9)
>
> - Added another symbol pointer test case. (Patch 16)
>
> - Picked up (Acked|Reviewed)-by tags from v3.
>
> v3: https://lore.kernel.org/lkml/20240923181846.549877-22-samitolvanen@go=
ogle.com/
> - Updated SPX license headers.
>
> - Squashed the first two patches in v2 and tried to reduce churn as
>   much as reasonable.
>
> - Dropped patch 18 from v2 ("x86/asm-prototypes: Include
>   <asm/ptrace.h>") as it's addressed by a separate patch.
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
> v2: https://lore.kernel.org/lkml/20240815173903.4172139-21-samitolvanen@g=
oogle.com/
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
> v1: https://lore.kernel.org/lkml/20240617175818.58219-17-samitolvanen@goo=
gle.com/
>
> ---
>
> Sami Tolvanen (18):
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
>  Documentation/kbuild/gendwarfksyms.rst     |  308 ++++++
>  Documentation/kbuild/index.rst             |    1 +
>  include/linux/export.h                     |   15 +
>  kernel/module/Kconfig                      |   31 +
>  scripts/Makefile                           |    3 +-
>  scripts/Makefile.build                     |   35 +-
>  scripts/gendwarfksyms/.gitignore           |    2 +
>  scripts/gendwarfksyms/Makefile             |   12 +
>  scripts/gendwarfksyms/cache.c              |   51 +
>  scripts/gendwarfksyms/die.c                |  166 +++
>  scripts/gendwarfksyms/dwarf.c              | 1158 ++++++++++++++++++++
>  scripts/gendwarfksyms/examples/kabi.h      |  157 +++
>  scripts/gendwarfksyms/examples/kabi_ex.c   |   30 +
>  scripts/gendwarfksyms/examples/kabi_ex.h   |  263 +++++
>  scripts/gendwarfksyms/examples/symbolptr.c |   33 +
>  scripts/gendwarfksyms/gendwarfksyms.c      |  185 ++++
>  scripts/gendwarfksyms/gendwarfksyms.h      |  301 +++++
>  scripts/gendwarfksyms/kabi.c               |  333 ++++++
>  scripts/gendwarfksyms/symbols.c            |  339 ++++++
>  scripts/gendwarfksyms/types.c              |  477 ++++++++
>  20 files changed, 3893 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/kbuild/gendwarfksyms.rst
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/cache.c
>  create mode 100644 scripts/gendwarfksyms/die.c
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi.h
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.c
>  create mode 100644 scripts/gendwarfksyms/examples/kabi_ex.h
>  create mode 100644 scripts/gendwarfksyms/examples/symbolptr.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>  create mode 100644 scripts/gendwarfksyms/kabi.c
>  create mode 100644 scripts/gendwarfksyms/symbols.c
>  create mode 100644 scripts/gendwarfksyms/types.c
>
>
> base-commit: 3596c721c4348b2a964e43f9296a0c01509ba927
> --
> 2.47.0.371.ga323438b13-goog
>

As my Acked-by was removed, I'm sorry to say that there is no point
for me to provide feedback since it is unwanted.

I hope it lands soon, but I also hope the people here who decided that
a person's efforts aren't worth recording because they don't
personally know them should reflect on this too. It's a good way to
keep people from coming into the community for the long term.

Regardless, I've copied one of the RHEL kernel folks (Don Zickus) onto
this thread to have his team be aware and give feedback. You'll
probably want their feedback instead of mine.


--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!

