Return-Path: <linux-kbuild+bounces-3250-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A7962048
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 09:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1612870AF
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2024 07:04:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E88D158524;
	Wed, 28 Aug 2024 07:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJnEg8XH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE5C158216;
	Wed, 28 Aug 2024 07:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724828688; cv=none; b=pt8h/wITf+PFdckuQHC1CBDpawORvHnVGxwGw9EBnd4HahBBfLICq6A3Uua5lDMoq/DIwSQe4oUgibUY5TkZkT7xZDrpHxtbDzdBANtJMz8mkVnkaywHxXNyXAnVhbaO4J/ioioq6S5IpFaqDwsU3Oe1LVIOXxYHn373lX4Gh0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724828688; c=relaxed/simple;
	bh=MfhCO+aoPnT7bM1llexzkTVmEUkUQSkDOaZ2GJAPLhs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhQDbzVaEF+HG2bg38KnVdwDJT7ytBjZ+IR+5AU6z22PzG0q7GrcdqG2JCU9ap5pd90VLLD04CKQevyO0Mh5BUnA6EtHliNuqHanL32zvzfsYr2T9ZnCygbtuHQm35Lxy/lRkcxsC6kmXP4yfD2InE/WolalA9elsvwJKpT3TQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJnEg8XH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5303DC4FEF9;
	Wed, 28 Aug 2024 07:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724828687;
	bh=MfhCO+aoPnT7bM1llexzkTVmEUkUQSkDOaZ2GJAPLhs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RJnEg8XHQzcZJRjFCtDHovzcfiKwd5ChEQJzlD8rJUl/+FTwndfEltv0KQYAaN0ve
	 PIBdifKIFRM5k4uTkKmG6QogiIljTLnomJu1VoymavRqtX67q4scvdKvlNS3ut/0LL
	 F/dx4T+GdcdK4grHLf6KK0MYyEG5i3iGoKrrzj50kgiaqzaZueugti5i3HYasBUJp+
	 lN/nVjZ+3qiW8Tmrtt6OcD8rcFUc5fwojlZ4TP9qb3vtdFsB6wjphS8RK+vWUWHFbt
	 cKPwH6pE1ToGDGgmh2czEhfRfuGdzHrkwncCiSFzFp9Mq1hXAcxyJch4wTOdN6G59J
	 kIsr2t+L60ApQ==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5334a8a1af7so6231388e87.2;
        Wed, 28 Aug 2024 00:04:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGOUQWmi3sAIJ7SFJFwz4PwyS1xk6Mi2HrYSIkus2lam8MLSb9L3KDQtqmj3Pq2EVWkcTzWEa9V3hAtswFyw==@vger.kernel.org, AJvYcCWOLiYhes0/QXQgK1fVnUy1s/BqMgdJ9GUFZ0n+tKociEjOa6kEz8onLL1rOtdHNBkIug7JQXcEVRzxlfg=@vger.kernel.org, AJvYcCWw9udLh7Cqc4a+gSGiogFH+dVkcM+p6XXBXzXabnVoNuSXkS99b7vQlj6Xz1KPkSJORZybi8SkqScmTzqmvVw=@vger.kernel.org, AJvYcCXmIGrz5OYAynpjQHdJRVUuQbOuoJGz4rZNoA04grnhvJP9bswniwgXg+kVe1ghntNfAvCYtJ8ptgWLSDWn@vger.kernel.org
X-Gm-Message-State: AOJu0YwY0TcHchOrJGhPige8L1tGPUJ1wWHOioGqjPfVwIdgzOJXnpzg
	IYit0SkJYoRGH9WTu20hXGqBIjAUHZBaaqrkFwNfkHvisoD37Lq0sBxOA1JW9Oon6eJs8+JPBOH
	q6tXE97shtamGVXO8U0MzjGIoEMw=
X-Google-Smtp-Source: AGHT+IEf4PFpd61AAYvVul2r3LocOq7T2Sn5db/vGtRGzWkE5TJ5A1H43CxsTMSyL+bS8oJZ3n+yIiQcZz9iUIjaXWI=
X-Received: by 2002:a05:6512:124b:b0:52e:9f6b:64 with SMTP id
 2adb3069b0e04-5346c6431bdmr588887e87.34.1724828685754; Wed, 28 Aug 2024
 00:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
In-Reply-To: <20240815173903.4172139-21-samitolvanen@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 28 Aug 2024 16:04:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ0dHq3eALkvGDSCyVKOvhBqwCEG3BTQ0h52Xq_1YNu2A@mail.gmail.com>
Message-ID: <CAK7LNAQ0dHq3eALkvGDSCyVKOvhBqwCEG3BTQ0h52Xq_1YNu2A@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@google.=
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


Splitting a new tool into small chunks makes line-by-line review difficult.

For example, 02/19 adds malloc().

03/19 immediately replaces it with calloc().

Then, I wonder why you did not add calloc() in the first place.





And, I do not think it is so "small".
It is bigger than the current genksyms.


$ find scripts/genksyms/ -type f | xargs wc | tail -n 1
 1986  5633 45864 total
$ find scripts/gendwarfksyms/ -type f | xargs wc | tail -n 1
 2859  7670 69105 total





> symbol versions from DWARF, called gendwarfksyms. When passed a
> list of exported symbols and an object file,


Why is "a list of exported symbols" passed separately?

All necessary information is available in the object file.
(The export symbols are listed in the .export_symbol section.



> the tool generates
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



I do not know if this is worthwhile.


And, it is obviously a build error.

gendwarfksyms cannot create %.symtypes from %.c.


The following is the step to see the build error.




$ make mrproper
$ make x86_64_defconfig
#
# No change to .config
#
$ scripts/config -e DEBUG_INFO_DWARF5 -e MODVERSIONS -e GENDWARFKSYMS
$ make olddefconfig
#
# configuration written to .config
#
$ make kernel/fork.symtypes
  SYNC    include/config/auto.conf.cmd
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
  SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_32_ia32.h
  SYSHDR  arch/x86/include/generated/asm/unistd_64_x32.h
  SYSTBL  arch/x86/include/generated/asm/syscalls_64.h
  HOSTCC  arch/x86/tools/relocs_32.o
  HOSTCC  arch/x86/tools/relocs_64.o
  HOSTCC  arch/x86/tools/relocs_common.o
  HOSTLD  arch/x86/tools/relocs
  HOSTCC  scripts/gendwarfksyms/gendwarfksyms.o
  HOSTCC  scripts/gendwarfksyms/cache.o
  HOSTCC  scripts/gendwarfksyms/crc32.o
  HOSTCC  scripts/gendwarfksyms/die.o
  HOSTCC  scripts/gendwarfksyms/dwarf.o
  HOSTCC  scripts/gendwarfksyms/symbols.o
  HOSTCC  scripts/gendwarfksyms/types.o
  HOSTLD  scripts/gendwarfksyms/gendwarfksyms
  HOSTCC  scripts/selinux/genheaders/genheaders
  HOSTCC  scripts/selinux/mdp/mdp
  HOSTCC  scripts/kallsyms
  HOSTCC  scripts/sorttable
  HOSTCC  scripts/asn1_compiler
  WRAP    arch/x86/include/generated/uapi/asm/bpf_perf_event.h
  WRAP    arch/x86/include/generated/uapi/asm/errno.h
  WRAP    arch/x86/include/generated/uapi/asm/fcntl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctl.h
  WRAP    arch/x86/include/generated/uapi/asm/ioctls.h
  WRAP    arch/x86/include/generated/uapi/asm/ipcbuf.h
  WRAP    arch/x86/include/generated/uapi/asm/param.h
  WRAP    arch/x86/include/generated/uapi/asm/poll.h
  WRAP    arch/x86/include/generated/uapi/asm/resource.h
  WRAP    arch/x86/include/generated/uapi/asm/socket.h
  WRAP    arch/x86/include/generated/uapi/asm/sockios.h
  WRAP    arch/x86/include/generated/uapi/asm/termbits.h
  WRAP    arch/x86/include/generated/uapi/asm/termios.h
  WRAP    arch/x86/include/generated/uapi/asm/types.h
  WRAP    arch/x86/include/generated/asm/early_ioremap.h
  WRAP    arch/x86/include/generated/asm/mcs_spinlock.h
  WRAP    arch/x86/include/generated/asm/irq_regs.h
  WRAP    arch/x86/include/generated/asm/kmap_size.h
  WRAP    arch/x86/include/generated/asm/local64.h
  WRAP    arch/x86/include/generated/asm/mmiowb.h
  WRAP    arch/x86/include/generated/asm/module.lds.h
  WRAP    arch/x86/include/generated/asm/rwonce.h
  WRAP    arch/x86/include/generated/asm/unaligned.h
  GEN     arch/x86/include/generated/asm/orc_hash.h
  UPD     include/config/kernel.release
  UPD     include/generated/uapi/linux/version.h
  UPD     include/generated/utsrelease.h
  UPD     include/generated/compile.h
  CC      scripts/mod/empty.o
  HOSTCC  scripts/mod/mk_elfconfig
  MKELF   scripts/mod/elfconfig.h
  HOSTCC  scripts/mod/modpost.o
  CC      scripts/mod/devicetable-offsets.s
  UPD     scripts/mod/devicetable-offsets.h
  HOSTCC  scripts/mod/file2alias.o
  HOSTCC  scripts/mod/sumversion.o
  HOSTCC  scripts/mod/symsearch.o
  HOSTLD  scripts/mod/modpost
  UPD     include/generated/timeconst.h
  CC      kernel/bounds.s
  UPD     include/generated/bounds.h
  CC      arch/x86/kernel/asm-offsets.s
  UPD     include/generated/asm-offsets.h
  CALL    scripts/checksyscalls.sh
  CHKSHA1 include/linux/atomic/atomic-arch-fallback.h
  CHKSHA1 include/linux/atomic/atomic-instrumented.h
  CHKSHA1 include/linux/atomic/atomic-long.h
  DESCEND objtool
  HOSTCC  /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep.o
  HOSTLD  /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep-in.o
  LINK    /home/masahiro/workspace/linux-kbuild/tools/objtool/fixdep
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/exe=
c-cmd.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/hel=
p.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/pag=
er.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/par=
se-options.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/run=
-command.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/sig=
chain.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/sub=
cmd-config.o
  LD      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/lib=
subcmd-in.o
  AR      /home/masahiro/workspace/linux-kbuild/tools/objtool/libsubcmd/lib=
subcmd.a
  INSTALL libsubcmd_headers
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/arch/x86/spec=
ial.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/arch/x86/deco=
de.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/arch/x86/orc.=
o
  LD      /home/masahiro/workspace/linux-kbuild/tools/objtool/arch/x86/objt=
ool-in.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/weak.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/check.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/special.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/builtin-check=
.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/elf.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/objtool.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/orc_gen.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/orc_dump.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libstring.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/libctype.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/str_error_r.o
  CC      /home/masahiro/workspace/linux-kbuild/tools/objtool/librbtree.o
  LD      /home/masahiro/workspace/linux-kbuild/tools/objtool/objtool-in.o
  LINK    /home/masahiro/workspace/linux-kbuild/tools/objtool/objtool
  SYM     kernel/fork.symtypes
nm: 'kernel/fork.o': No such file
error: gendwarfksyms: main: open failed for 'kernel/fork.o': No such
file or directory












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





--
Best Regards
Masahiro Yamada

