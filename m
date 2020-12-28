Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D292E4200
	for <lists+linux-kbuild@lfdr.de>; Mon, 28 Dec 2020 16:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2633084AbgL1PQY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 28 Dec 2020 10:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2632860AbgL1PQC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Dec 2020 10:16:02 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BD52C061794;
        Mon, 28 Dec 2020 07:15:22 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id d9so9630432iob.6;
        Mon, 28 Dec 2020 07:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=B/njducXxllObqBRojPsd+9t2F8x7xww868SuqkaFxg=;
        b=m+jh0VbmwW6JTSexgtBJq+6UxE7NwoHsBBJsKF2/tQgh7YWxKuibr4PyKy5Qz3KBRS
         KeSOiaI6mxLhov65xTkp3QMJnNKYSXEOqeAdWLOCb5ZRljSymLBnA7flAAbPovNM+cNq
         YnTSL7LaMeJcAzQnnZSUJT2RS67mJwINriq1YUM8nvZQxPwEr3Wx5yEMLP7K+b+Y9tl6
         7ROD8bRDaJyHBL2cXelwhTHtxp4ZsBAbZtjiZ9yqAabnxSO5hvKCsD1dOJjMxt/arN4z
         JbTyxUp2VQKn+WVKm90QdI0s1hB19q6+sQ+q4x3+87OotIymiMn+silK1+X1kBVpj7X3
         sMHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=B/njducXxllObqBRojPsd+9t2F8x7xww868SuqkaFxg=;
        b=jzuT4nYoLlKrxXE6MUGvCY3nnpFoYPvUzIf1tFty9k9EnEU93Ji+bfyNPwLnxljd8v
         Bgu2rZXWa+t6p2KD/AXYzthsycS3UdV3KmoKRBzZIGkaEdObakwZtDr1iaeOSIjjGZCS
         7j1Llt8h/bcDNqyL3PZW4bh7RU+Xt03QfnVZPjqMnOkkql4Q9qGZ5UfGPh3E+Y/QCxGW
         jJc2A7UagINjkMLgZUcWT4uRAe7V9DexRp2KAh7L7rx56Yofdb3jYWbbjQtEhzehwZQs
         XyLvXHs6w3blp3bNeXHzmbuC4McAmr7PmOpgMh4Go3QOsotM+qc35Zii9KPhuWtapNqM
         Jd7g==
X-Gm-Message-State: AOAM5332Hqm58G/tq6ro3zankrNPB8mxQ19Gw/79mmEIpZ0wSIUhvLf3
        2/6+WLnz1TBSjmgSvXH4RaedEQqOxf8c1etaus0=
X-Google-Smtp-Source: ABdhPJx0rxwNH4V3tZN77nRczWmdFqGtdaMRu64XADVnNZKNAJIF8Q/vq/pFIb6za8NgyqKwhQ7GEKX5dVBwuLhewHg=
X-Received: by 2002:a6b:92c4:: with SMTP id u187mr36162470iod.57.1609168521415;
 Mon, 28 Dec 2020 07:15:21 -0800 (PST)
MIME-Version: 1.0
References: <20201204011129.2493105-1-ndesaulniers@google.com>
 <20201204011129.2493105-3-ndesaulniers@google.com> <CAKwvOdkZEiHK01OD420USb0j=F0LcrnRbauv9Yw26tu-GRbYkg@mail.gmail.com>
 <CA+icZUW19o=bEcT6wOZ+9Yt6UtAoZ2-9ijNadC101_dMfn-VVA@mail.gmail.com>
In-Reply-To: <CA+icZUW19o=bEcT6wOZ+9Yt6UtAoZ2-9ijNadC101_dMfn-VVA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 28 Dec 2020 16:15:09 +0100
Message-ID: <CA+icZUWwNWVQDYUCoo6TQNBOtMqwwEuLJuNO2c8gvihs6jTGOA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Kbuild: DWARF v5 support
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Jakub Jelinek <jakub@redhat.com>,
        Fangrui Song <maskray@google.com>,
        Caroline Tice <cmtice@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nick Clifton <nickc@redhat.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Dec 27, 2020 at 7:47 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Fri, Dec 4, 2020 at 2:13 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> >
> > sigh...I ran a broken script to send the series which doesn't cc folks properly.
> > + lkml, linux-kbuild
> > (Might just resend, properly)
> >
> > On Thu, Dec 3, 2020 at 5:11 PM Nick Desaulniers <ndesaulniers@google.com> wrote:
> > >
> > > DWARF v5 is the latest standard of the DWARF debug info format.
> > >
> > > DWARF5 wins significantly in terms of size when mixed with compression
> > > (CONFIG_DEBUG_INFO_COMPRESSED).
> > >
> > > Link: http://www.dwarfstd.org/doc/DWARF5.pdf
> > >
> > > Patch 1 is a cleanup that lays the ground work and isn't DWARF
> > > v5 specific.
> > > Patch 2 implements Kconfig and Kbuild support for DWARFv5.
> > >
> > > Changes from v2:
> > > * Drop two of the earlier patches that have been accepted already.
> > > * Add measurements with GCC 10.2 to commit message.
> > > * Update help text as per Arvind with help from Caroline.
> > > * Improve case/wording between DWARF Versions as per Masahiro.
> > >
> > > Changes from the RFC:
> > > * split patch in 3 patch series, include Fangrui's patch, too.
> > > * prefer `DWARF vX` format, as per Fangrui.
> > > * use spaces between assignment in Makefile as per Masahiro.
> > > * simplify setting dwarf-version-y as per Masahiro.
> > > * indent `prompt` in Kconfig change as per Masahiro.
> > > * remove explicit default in Kconfig as per Masahiro.
> > > * add comments to test_dwarf5_support.sh.
> > > * change echo in test_dwarf5_support.sh as per Masahiro.
> > > * remove -u from test_dwarf5_support.sh as per Masahiro.
> > > * add a -gdwarf-5 cc-option check to Kconfig as per Jakub.
> > >
>
> I have tested v3 on top of Linux v5.10.3 on Debian/testing AMD64.
>
> Numbers talk - bullshit walks. [ Linus Torvalds ]
>
> [ 5.10.3-1-amd64-gcc10-bfd ]
>
> GNU-toolchain: GCC v10.2.1 and GNU/ld BFD v2.35.1
>
> 503096  vmlinux
> 6864    vmlinux.compressed
> 580104  vmlinux.o
>
> 701856  linux-image-5.10.3-1-amd64-gcc10-bfd-dbg_5.10.3-1~bullseye+dileks1_amd64.deb
>
> [ 5.10.3-1-amd64-clang-ias ]
>
> LLVM-toolchain: Clang and LLD v11.0.1-rc2
>
> 358424  vmlinux
> 7032    vmlinux.compressed
> 353788  vmlinux.o
>
> 508336  linux-image-5.10.3-1-amd64-clang-ias-dbg_5.10.3-1~bullseye+dileks1_amd64.deb
>
> [ 5.10.3-1-amd64-gcc10-bfd ]
>
> $ llvm-dwarfdump-11 vmlinux.o | head -15
> error: vmlinux.o:       file format elf64-x86-64
>
> .debug_info contents:
> decoding address ranges: invalid range list offset 0x265
> 0x00000000: Compile Unit: length = 0x0000001f, format = DWARF32,
> version = 0x0005, unit_type = DW_UT_compile, abbr_offset = 0x0000,
> addr_size = 0x08 (next unit at 0x00
> 000023)
>
> 0x0000000c: DW_TAG_compile_unit
>              DW_AT_stmt_list   (0x00000000)
>              DW_AT_ranges      (0x0000000c
>                 [0x0000000000000000, 0x000000000000021c)
>                 [0x0000000000000000, 0x000000000000019e)
>                 [0x0000000000000000, 0x0000000000002000))
>              DW_AT_name        ("head_64.S")
>              DW_AT_comp_dir    ("/home/dileks/src/linux-kernel/git")
>              DW_AT_producer    ("GNU AS 2.35.1")
>              DW_AT_language    (DW_LANG_Mips_Assembler)
>
> [ 5.10.3-1-amd64-clang-ias ]
>
> $ llvm-dwarfdump-11 vmlinux.o | head -15
> vmlinux.o:      file format elf64-x86-64
>
> .debug_info contents:
> 0x00000000: Compile Unit: length = 0x00000377, format = DWARF32,
> version = 0x0005, unit_type = DW_UT_compile, abbr_offset = 0x0000,
> addr_size = 0x08 (next unit at 0x00
> 00037b)
>
> 0x0000000c: DW_TAG_compile_unit
>              DW_AT_stmt_list   (0x00000000)
>              DW_AT_ranges      (0x0000000c
>                 [0x0000000000000000, 0x0000000000002000)
>                 [0x0000000000000000, 0x000000000000021c)
>                 [0x0000000000000000, 0x000000000000019e))
>              DW_AT_name        ("arch/x86/kernel/head_64.S")
>              DW_AT_comp_dir    ("/home/dileks/src/linux-kernel/git")
>              DW_AT_producer    ("Debian clang version 11.0.1-+rc2-1")
>              DW_AT_language    (DW_LANG_Mips_Assembler)
>

Some more numbers with Linux v5.11-rc1 and identical GNU and LLVM toolchains.

[ 5.11.0-rc1-1-amd64-gcc10-bfd ]

492     vmlinux
7       vmlinux.compressed
567     vmlinux.o
685     linux-image-5.11.0-rc1-1-amd64-gcc10-bfd-dbg_5.11.0~rc1-1~bullseye+dileks1_amd64.deb

[ 5.11.0-rc1-2-amd64-clang-ias ]

350     vmlinux
7       vmlinux.compressed
345     vmlinux.o
495     linux-image-5.11.0-rc1-2-amd64-clang-ias-dbg_5.11.0~rc1-2~bullseye+dileks1_amd64.deb

- Sedat -

 > Attached are my kernel config files.
>
> Feel free to add my:
>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> - sed@ -
>
> > > Nick Desaulniers (2):
> > >   Kbuild: make DWARF version a choice
> > >   Kbuild: implement support for DWARF v5
> > >
> > >  Makefile                          | 15 +++++++------
> > >  include/asm-generic/vmlinux.lds.h |  6 +++++-
> > >  lib/Kconfig.debug                 | 35 ++++++++++++++++++++++++++-----
> > >  scripts/test_dwarf5_support.sh    |  9 ++++++++
> > >  4 files changed, 53 insertions(+), 12 deletions(-)
> > >  create mode 100755 scripts/test_dwarf5_support.sh
> > >
> > > --
> > > 2.29.2.576.ga3fc446d84-goog
> > >
> >
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdkZEiHK01OD420USb0j%3DF0LcrnRbauv9Yw26tu-GRbYkg%40mail.gmail.com.
