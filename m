Return-Path: <linux-kbuild+bounces-4428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D8A9B6E47
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 22:00:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63737B21D06
	for <lists+linux-kbuild@lfdr.de>; Wed, 30 Oct 2024 21:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C370F21503D;
	Wed, 30 Oct 2024 21:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBkfyf9v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EA8213ECD;
	Wed, 30 Oct 2024 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730322031; cv=none; b=YXda8e7DXGtHLmsIRUkpiGU/WgpdKkyoFqmczoJUtBIr/GPXVzPI+ItnGHaEDyhmBzIrI/NOymx6k3PkrUk0rj9mKRH4vBGOmM6HQL/Bcj9XkUBnLDl9Z8YqER6SHe3rHB8XL0eK2OJp6WcNV3Pio8z+mpW26tncYDq02bvn63c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730322031; c=relaxed/simple;
	bh=lyQCKkp48yFiQHrb2X1TI5cHtzSw6UvtKRxCJxEmqTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+r4poRic9I9ZeYu9q7Gp1FXJn9JFzgqo4MmOhO4AeCEtN+aIY4cHZaMuwtgzgsNL0HsN6zpwLGSUW1Rri6xiSva7RGsmDlxgM0y6LcMixTyfkPmiVluuktdjLYYpBjXhJ1z0bxX9YS6tu9Allw+uRcIQjA8HAi+gLbkHx2GL4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBkfyf9v; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e8607c2aso284805e87.3;
        Wed, 30 Oct 2024 14:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730322026; x=1730926826; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iTOYM8hLDlIhNM0EHGK2WLZ+VwRTD0dUszdaQDhEWfg=;
        b=kBkfyf9vSkc99LVgZoDV15oFRVfooozWv4rcIbYV0QNy724wF3djPRQwJ4ix7t+UTq
         DFXhH2Ef4pm5zED22NmQaJ56tXU5ti7nv0PKVoGrfjM7yOuvQov2Vv3A2VbdoH2sb0+c
         ThNXhVOzCmBtVzaCfT7/1PLF3PqfbF6N9yb/hvBYoMuGT12LzUip/FN9vmq4lp/WPWXa
         Oc4If3+juFxdsdIes9o5XMdbjVo+PiekTT+6IjEuB2aXOuZPjw3VXkii3K4hCU/69GLU
         G2ow9JBg3HDf7C+KQhhSE7R19v0sclT6ZnBBEzk5KwSUykm6Bmf+KsxyaBtHkajW02pY
         Tg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730322026; x=1730926826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTOYM8hLDlIhNM0EHGK2WLZ+VwRTD0dUszdaQDhEWfg=;
        b=KrwE4b1AGl5TP+fpizQo8jWzwXoTi+YG/NE2cjmzF1AAC6mrfvBMiIh/Ul+aLY8Ksz
         IzhWIogMja4KH9Zu2RrB7XMPj6rxoPY7Sl+k3hKBlL+3/95zihaqZhJtDGBrpUvSPazV
         4cPSwKE4dROLO+ThRi0ecT+6f0xVdhQ5TCTIxFabCxTONrhhaOZfE2J6nl4DV4niL7/z
         I+5fME2oD0tP8NOQfBZt8RQtUPXS9nTOgYUaAyNMgccok2Gtq3Vrc8Bc7gujbbjSV4g1
         nu7a/IYvtih5Z5jhxCVeT68r+OzJkUnGew91Z0WerRGe9yBaBtqDzU+5sd52sTl6g4jo
         HhKA==
X-Forwarded-Encrypted: i=1; AJvYcCUYRsquBGDEP28rCINnVpF6BVSdOQBgiUqvX/LyFaDYP6sxeFukKQSSHLPci1nOpiNFbnJI6IRykrn5g2ya@vger.kernel.org, AJvYcCW/yE8K2z6phOfgedrSEVI/SWmYs2ItJ6z6/beVPZctOjnGsgdNyuDvXtllTWBpLS+zlaJGRACD5GPViiKguw==@vger.kernel.org, AJvYcCWJFgi9uOXqS9frKKDY+uvfFAtbZrW8iVM/FFWnCcQzdSuzgV1arlflAGoUmGfFid5eNv/ac69PkuBc+ZsA+/4=@vger.kernel.org, AJvYcCWXWKnTnkg+oanfRooWP2krQ/RRFddkjBr7AKobfe45w8+PgFOiCHTBLnRhC42rPxtBe3zR0pZn+tUTeec=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ+OVazX0mspmmrr8H+60/uA57Rk8pJXg27jS3E/pT2U0mzSYy
	dIPe18EmgKSu4t2J2umW+jMB5N5U9GEzGvH4VBaF3e9B6E1sXHq0efVuWpLX63re0OJSdE6JFje
	5ws7J1Gu+Bev8qkN3DL7e18a/Sa4=
X-Google-Smtp-Source: AGHT+IHn69gcm0LSFxKIg/7imMG1C0qqBwjxlIZpTicJxl6ADiw9oYIxwLzxcFDeC3RuDvF9v4sdvvjyMFy3q2DLgyM=
X-Received: by 2002:a05:6512:1082:b0:539:fcf9:6332 with SMTP id
 2adb3069b0e04-53b348e554bmr8823799e87.33.1730322025610; Wed, 30 Oct 2024
 14:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241030170106.1501763-21-samitolvanen@google.com>
In-Reply-To: <20241030170106.1501763-21-samitolvanen@google.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 30 Oct 2024 21:59:48 +0100
Message-ID: <CA+icZUWTdgM7HQrnR_NzgZZQE3aXXk+tAqD3srNd1Eyjr5d7EA@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@samsung.com>, Neal Gompa <neal@gompa.dev>, 
	Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Miroslav Benes <mbenes@suse.cz>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 6:01=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi,
>
> Here's v5 of the DWARF modversions series. The main motivation is
> modversions support for Rust, which is important for distributions
> like Android that are about to ship Rust kernel modules. Per Luis'
> request [1], v2 dropped the Rust specific bits from the series and
> instead added the feature as an option for the entire kernel to
> make it easier to evaluate the benefits of this approach, and to
> get better test coverage. Matt is addressing Rust modversion_info
> compatibility issues in a separate patch set [2] that depends on this
> series, and actually allows modversions to be enabled with Rust.
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
> The first patch moves the genksyms CRC32 implementation to a shared
> header file to avoid code duplication and the next 15 patches add
> gendwarfksyms, a tool for computing symbol versions from DWARF. When
> passed a list of exported symbols and object files, the tool
> generates an expanded type string for each symbol and computes symbol
> CRCs similarly to genksyms. gendwarfksyms is written in C and uses
> libdw to process DWARF. Patch 17 ensures that debugging information
> is present where we need it, patch 18 adds gendwarfksyms as an
> alternative to genksyms, and the last patch adds documentation.
>
> v5 is based on v6.12-rc5 and for your convenience the series is also
> available here:
>
> https://github.com/samitolvanen/linux/commits/gendwarfksyms-v5
>
> If you also want to test the series with Rust modules, this branch
> adds Matt's latest modversion_info series:
>
> https://github.com/samitolvanen/linux/commits/rustmodversions-v5
>
> Sami
>
>
> [1] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
> [2] https://lore.kernel.org/lkml/20240925233854.90072-1-mmaurer@google.co=
m/
>
> ---
>
> v5:
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

Hi Sami,

perfect timing: Nathan uploaded SLIM LLVM toolchain v19.1.3

KBUILD_GENDWARFKSYMS_STABLE is to be set manually?
What value is recommended?

Thanks.
-Sedat-

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
> Sami Tolvanen (19):
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
>  Documentation/kbuild/gendwarfksyms.rst      |  276 +++++
>  Documentation/kbuild/index.rst              |    1 +
>  include/linux/export.h                      |   15 +
>  kernel/module/Kconfig                       |   31 +
>  scripts/Makefile                            |    3 +-
>  scripts/Makefile.build                      |   41 +-
>  scripts/gendwarfksyms/.gitignore            |    2 +
>  scripts/gendwarfksyms/Makefile              |   12 +
>  scripts/gendwarfksyms/cache.c               |   44 +
>  scripts/gendwarfksyms/die.c                 |  166 +++
>  scripts/gendwarfksyms/dwarf.c               | 1109 +++++++++++++++++++
>  scripts/gendwarfksyms/examples/kabi.h       |  141 +++
>  scripts/gendwarfksyms/examples/kabi_ex0.c   |   86 ++
>  scripts/gendwarfksyms/examples/kabi_ex1.c   |   89 ++
>  scripts/gendwarfksyms/examples/kabi_ex2.c   |   98 ++
>  scripts/gendwarfksyms/examples/kabi_rules.c |   56 +
>  scripts/gendwarfksyms/examples/symbolptr.c  |   33 +
>  scripts/gendwarfksyms/gendwarfksyms.c       |  185 ++++
>  scripts/gendwarfksyms/gendwarfksyms.h       |  288 +++++
>  scripts/gendwarfksyms/kabi.c                |  263 +++++
>  scripts/gendwarfksyms/symbols.c             |  339 ++++++
>  scripts/gendwarfksyms/types.c               |  477 ++++++++
>  scripts/genksyms/genksyms.c                 |   77 +-
>  scripts/include/crc32.h                     |   93 ++
>  24 files changed, 3840 insertions(+), 85 deletions(-)
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
> base-commit: 81983758430957d9a5cb3333fe324fd70cf63e7e
> --
> 2.47.0.163.g1226f6d8fa-goog
>

