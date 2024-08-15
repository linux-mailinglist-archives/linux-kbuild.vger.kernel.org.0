Return-Path: <linux-kbuild+bounces-3026-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081EA953B4B
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 22:14:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB409285090
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Aug 2024 20:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E86E813C90F;
	Thu, 15 Aug 2024 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D0YoAe1y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F8413C661;
	Thu, 15 Aug 2024 20:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723752873; cv=none; b=YCf0GkydR/fQO4rlZjaUPtqbQyTeGXsw6nkG8dIZ4InGS+djCU0u5yNG29MpUK/N0IkdQu0dW3ktX8/r20Ql4oXdgYynWCe1KQ3J/WhAezzg3kmhCUBD+G6JRXE7jgzgMnw6v7KlbxK4RUgjJy9Mshjz413GeG3FC6uupbVNtvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723752873; c=relaxed/simple;
	bh=az8xOr5rvrhSqT+teD+uMtfBWxRwqAdI8hDUHvt4XxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HcSbWP7SMm8nLZ5W+z7O7KiRYo5TPl4D3TwgzETBTgxNKthPi2khYW3+PyNAS27HcEKD5L34Ltvc1Uox4qFYHDZETHuaFmdilPNo8mr0SPElMJK0m4MOZMTddfA3pIepVp7THT/w7BQm4CbfRXGzwWNLjokgzLWbY3TOHqRXVFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D0YoAe1y; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-530c2e5f4feso1294345e87.0;
        Thu, 15 Aug 2024 13:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723752869; x=1724357669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uPyvZwMrbBHAiEy+HfK0N+b9KS2IvrUmVzJny22n+DE=;
        b=D0YoAe1ynttq4UeryTmz49L5rdbREW97XjGiMNn3DJiCfJN9rxZdFXqcGLls1AYDH4
         SEPmIFjfOJCDQDAKCwbkv99Y2UNT1ySCk+0THPCjzdp6qBAJmbCK9c2R5U+2LUBD3zlu
         baxoV6CXmef443icHSnzj5iplxm5BwSMP83OJx4H2/MiuHAXfanPi3ZcrENaZdo7Zp81
         SHxD8r/dF03Ngg6Ibt0nOZgZlJfQrGdsWQpNOdEXRqWRNuCMvE6pljXmYaepz1Qoof/l
         TZY68mA2tOMzQwftLpuflT3pIxTdIcNbh4p+YVb8WUUe2uEsu1jbXXt60vBt1AJy8HFH
         +BEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723752869; x=1724357669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uPyvZwMrbBHAiEy+HfK0N+b9KS2IvrUmVzJny22n+DE=;
        b=Y+/PnUz4P189dAThyXcI9f/vOTXWndd+rcbOxK42J7H4aEXcnXb/bIAkJDOXx5LXzs
         0Pp2mjtLftVq+LN/wtr/6QrhjMsnFXyR5jlf3MeVTIhgUCotaSuYHMeGrf7WyRrkV2gk
         4vwgLwWbvknMLn153NCWayS2zBZF/thcmvxVY0Kl30u7ewUs1P4Obzj//jiEgDeWd3lS
         Lrgk7sxf484VtrMz4zUpkSgPbaRQNhqBtmb//uIcAfKCcO7jJPQ17bWbeetkQxrTeLG5
         KK9Zzs/lB1QhVirS+wht3MMx76NZf35hs8ps7JlKT0coI6D38o/f8Hg9fHpU8SeEvpBu
         AVlA==
X-Forwarded-Encrypted: i=1; AJvYcCU8LzcnwVfgRLEhy8TCZ9TMnPJUBIlRMovOMsgqYg7SRoMIgxAc+y4zwQMQTskITVJR6IRa10vbJSBKNv3i0JG2B4SQdqFSQtiq8WPkW/25cKSyuQhK5YpDzmOj3X9PUzHXg2yp4Mb/KF/nzUa0jBtu4gm/DnrTHYbFLIpax7DckMP3HQ6MVLEBDifBjtqjsCpwHTEQe4KrYdTtar6kAoDCczHIp6vKGjzV
X-Gm-Message-State: AOJu0YxziM74rn7P6lyBp6/3S2riAP2jX2AXHy5bF3zsWq1YbNhv5uTH
	wvPxqCWXn1ArG6DuPAk3Oz9og1teF9EQ0AHBj3+L2Wf5CTOSJfFPbcEJrqeIhUEzlHBQTGNp2GP
	bg0txH0M8ob/4/SMXyLDU7e8K8kw=
X-Google-Smtp-Source: AGHT+IGqtO6B0SZHS6UYC69NthUclzungji+anGzkyYF7VEE/R5oZL36UN6UODSgtO31g6+H0JaWCA0NR2oZsfwVEwI=
X-Received: by 2002:a05:6512:3046:b0:52c:9e82:a971 with SMTP id
 2adb3069b0e04-5331c68f990mr398734e87.7.1723752868986; Thu, 15 Aug 2024
 13:14:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Thu, 15 Aug 2024 22:13:53 +0200
Message-ID: <CA+icZUUdevE_n4+PgwisFdpxz=7XwaMciVKn+XnDHo-=UqRZ7A@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 15, 2024 at 7:39=E2=80=AFPM Sami Tolvanen <samitolvanen@google.=
com> wrote:
>
> Hi,
>
> Here's v2 of the DWARF modversions series [1]. The main motivation
> remains modversions support for Rust, which is important for
> distributions like Android that are eager to ship Rust kernel
> modules. However, per Luis' request [2], v2 drops all Rust specific
> bits from the series and instead adds the feature as an option
> for the entire kernel. Matt is addressing Rust modversion_info
> compatibility issues in a separate series [3], and we'll follow up
> with a patch to actually allow CONFIG_MODVERSIONS with Rust once
> these have been sorted out.
>
> A short background recap: Unlike C, Rust source code doesn't have
> sufficient information about the final ABI, as the compiler has
> considerable freedom in adjusting structure layout for improved
> performance [4], for example, which makes using a source code
> parser like genksyms a non-starter. Based on Matt's suggestion and
> previous feedback from maintainers, this series uses DWARF debugging
> information for computing versions. DWARF is an established and
> a relatively stable format, which includes all the necessary ABI
> details, and adding a CONFIG_DEBUG_INFO dependency for Rust symbol
> versioning seems like a reasonable trade-off.
>
> The first 16 patches of this series add a small tool for computing
> symbol versions from DWARF, called gendwarfksyms. When passed a
> list of exported symbols and an object file, the tool generates
> an expanded type string for each symbol, and computes symbol CRCs
> similarly to genksyms. gendwarfksyms is written in C and uses libdw
> to process DWARF, mainly because of the existing support for C host
> tools that use elfutils (e.g., objtool). The next two patches ensure
> that debugging information is present where we need it and fix a
> compilation issue with x86 asm-prototypes.h. The last patch adds
> gendwarfksyms as an alternative to genksyms.
>
> A quick note about performance: On my development system, building
> x86_64 defconfig with MODVERSIONS takes about 59.4s with gcc 13
> (avg. of ten runs). Adding DEBUG_INFO_DWARF5 increases the build
> time by ~23% to 73.3s. Switching from GENKSYMS to GENDWARFKSYMS
> reduces the build time by 6% to 68.9s, which is still ~16% slower
> than genksyms without debugging information. Therefore, if you
> already build kernels with debugging information, gendwarfksyms
> should be slightly faster. YMMV, of course.
>
> Things would change with LTO, because we won't have full DWARF
> until we have an ELF binary, which means we'd have to process
> vmlinux.o. This version of gendwarfksyms is still single-threaded
> as it seems we can't rely on libdw to be thread-safe. Processing
> a ThinLTO x86_64 defconfig vmlinux.o on my system takes ~2m16s,
> and would have to happen even on incremental builds, just like
> LTO linking itself. As cross-language LTO presumably isn't wildly
> popular yet, gendwarfksyms intentionally depends in !LTO in this
> version.
>
> Looking forward to hearing your thoughts!
>

Hi Sami,

so this work is on top of Linux v6.11-rc3 - can you tag it as gendwarfksyms=
-v2?

Thanks.

Best regards,
-Sedat-

https://github.com/samitolvanen/linux/tree/gendwarfksyms
https://github.com/samitolvanen/linux/tags

> Sami
>
> [1] https://lore.kernel.org/lkml/20240617175818.58219-17-samitolvanen@goo=
gle.com/
> [2] https://lore.kernel.org/lkml/ZnIZEtkkQWEIGf9n@bombadil.infradead.org/
> [3] https://lore.kernel.org/lkml/20240806212106.617164-1-mmaurer@google.c=
om/
> [4] https://lore.kernel.org/rust-for-linux/CAGSQo005hRiUZdeppCifDqG9zFDJR=
wahpBLE4x7-MyfJscn7tQ@mail.gmail.com/
>
> ---
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
> Sami Tolvanen (19):
>   tools: Add gendwarfksyms
>   gendwarfksyms: Add symbol list handling
>   gendwarfksyms: Add address matching
>   gendwarfksyms: Add support for type pointers
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
>   gendwarfksyms: Add support for declaration-only data structures
>   gendwarfksyms: Add support for reserved structure fields
>   export: Add __gendwarfksyms_ptr_ references to exported symbols
>   x86/asm-prototypes: Include <asm/ptrace.h>
>   kbuild: Add gendwarfksyms as an alternative to genksyms
>
>  arch/x86/include/asm/asm-prototypes.h     |   1 +
>  include/linux/export.h                    |  15 +
>  kernel/module/Kconfig                     |  31 +
>  scripts/Makefile                          |   3 +-
>  scripts/Makefile.build                    |  34 +-
>  scripts/gendwarfksyms/.gitignore          |   2 +
>  scripts/gendwarfksyms/Makefile            |  12 +
>  scripts/gendwarfksyms/cache.c             |  51 ++
>  scripts/gendwarfksyms/crc32.c             |  69 ++
>  scripts/gendwarfksyms/crc32.h             |  34 +
>  scripts/gendwarfksyms/die.c               | 196 +++++
>  scripts/gendwarfksyms/dwarf.c             | 973 ++++++++++++++++++++++
>  scripts/gendwarfksyms/examples/declonly.c |  31 +
>  scripts/gendwarfksyms/examples/reserved.c |  66 ++
>  scripts/gendwarfksyms/gendwarfksyms.c     | 201 +++++
>  scripts/gendwarfksyms/gendwarfksyms.h     | 275 ++++++
>  scripts/gendwarfksyms/symbols.c           | 392 +++++++++
>  scripts/gendwarfksyms/types.c             | 557 +++++++++++++
>  18 files changed, 2936 insertions(+), 7 deletions(-)
>  create mode 100644 scripts/gendwarfksyms/.gitignore
>  create mode 100644 scripts/gendwarfksyms/Makefile
>  create mode 100644 scripts/gendwarfksyms/cache.c
>  create mode 100644 scripts/gendwarfksyms/crc32.c
>  create mode 100644 scripts/gendwarfksyms/crc32.h
>  create mode 100644 scripts/gendwarfksyms/die.c
>  create mode 100644 scripts/gendwarfksyms/dwarf.c
>  create mode 100644 scripts/gendwarfksyms/examples/declonly.c
>  create mode 100644 scripts/gendwarfksyms/examples/reserved.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.c
>  create mode 100644 scripts/gendwarfksyms/gendwarfksyms.h
>  create mode 100644 scripts/gendwarfksyms/symbols.c
>  create mode 100644 scripts/gendwarfksyms/types.c
>
>
> base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
> --
> 2.46.0.184.g6999bdac58-goog
>
>

