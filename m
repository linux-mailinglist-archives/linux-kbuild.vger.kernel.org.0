Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E731CEC82
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 07:47:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725814AbgELFr0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 01:47:26 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:18221 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725776AbgELFrZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 01:47:25 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 04C5kpFe011058;
        Tue, 12 May 2020 14:46:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 04C5kpFe011058
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589262412;
        bh=Y4CSQCxX6HAtnNhBU0tpzYr3DlItdMgGqz9SOPIEeBI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vKm7GrcQ7LkapiE20ThRI6vSfO+Jqi4WvBvYfn++A6wd28hZzqeHPuAeXsZhfrJB6
         hY/8StTbH4WMiuZMTPJzRTVVAGyOPT5X94Z4UzY6QRgCrKn1Ev60udz0D1mPcE2w4E
         LHHNUw7kMxv0lVLuucojOxVbm+rGHgSRc9BVF/4OgNYe8+sGgVyaObYE8t9C0JJzJ3
         gHS5PKiNgqJR98bPoBrcDZI8/pt0GFg/mmVboaT8ykI9RKjEAhN9/cF8twQGhChHZn
         Vcv1bTVLQUKwCVYNNUBaSdTmxOHnhz1bJr1vKfI2jNPBjFGgVriSG2DnGRD6uRT6ME
         WCd2tyb1pIZgA==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id g2so7139654vsb.4;
        Mon, 11 May 2020 22:46:52 -0700 (PDT)
X-Gm-Message-State: AGi0PubTm4m2ylCmsGKk1tRSkMStej5Wt570ceKEtc31LU71Q6f85l7A
        0vOK/7bHiK5D5y02IoodKSkvgk1xHVdWb9FbmMk=
X-Google-Smtp-Source: APiQypKiCHG9qj0WL3c4VsFRZFhkkZZH//F+MLSQvxfE6GgQj6+gJGmQUsPynQRXCzeoggwBrR9BjfEFH5dvSnHxAdE=
X-Received: by 2002:a67:db0d:: with SMTP id z13mr14345298vsj.155.1589262411057;
 Mon, 11 May 2020 22:46:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com> <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
In-Reply-To: <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 May 2020 14:46:15 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR+pm-_nd5=B2OeLpimW42FXxm8TQUMru9DR_asT3qYnA@mail.gmail.com>
Message-ID: <CAK7LNAR+pm-_nd5=B2OeLpimW42FXxm8TQUMru9DR_asT3qYnA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Nick Desaulniers <nick.desaulniers@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sedat,


On Tue, May 5, 2020 at 1:25 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
> <nick.desaulniers@gmail.com> wrote:
> >
> > As debug information gets larger and larger, it helps significantly save
> > the size of vmlinux images to compress the information in the debug
> > information sections. Note: this debug info is typically split off from
> > the final compressed kernel image, which is why vmlinux is what's used
> > in conjunction with GDB. Minimizing the debug info size should have no
> > impact on boot times, or final compressed kernel image size.
> >
> > All of the debug sections will have a `C` flag set.
> > $ readelf -S <object file>
> >
> > $ bloaty vmlinux.gcc75.compressed.dwarf4 -- \
> >     vmlinux.gcc75.uncompressed.dwarf4
> >
> >     FILE SIZE        VM SIZE
> >  --------------  --------------
> >   +0.0%     +18  [ = ]       0    [Unmapped]
> >  -73.3%  -114Ki  [ = ]       0    .debug_aranges
> >  -76.2% -2.01Mi  [ = ]       0    .debug_frame
> >  -73.6% -2.89Mi  [ = ]       0    .debug_str
> >  -80.7% -4.66Mi  [ = ]       0    .debug_abbrev
> >  -82.9% -4.88Mi  [ = ]       0    .debug_ranges
> >  -70.5% -9.04Mi  [ = ]       0    .debug_line
> >  -79.3% -10.9Mi  [ = ]       0    .debug_loc
> >  -39.5% -88.6Mi  [ = ]       0    .debug_info
> >  -18.2%  -123Mi  [ = ]       0    TOTAL
> >
> > $ bloaty vmlinux.clang11.compressed.dwarf4 -- \
> >     vmlinux.clang11.uncompressed.dwarf4
> >
> >     FILE SIZE        VM SIZE
> >  --------------  --------------
> >   +0.0%     +23  [ = ]       0    [Unmapped]
> >  -65.6%    -871  [ = ]       0    .debug_aranges
> >  -77.4% -1.84Mi  [ = ]       0    .debug_frame
> >  -82.9% -2.33Mi  [ = ]       0    .debug_abbrev
> >  -73.1% -2.43Mi  [ = ]       0    .debug_str
> >  -84.8% -3.07Mi  [ = ]       0    .debug_ranges
> >  -65.9% -8.62Mi  [ = ]       0    .debug_line
> >  -86.2% -40.0Mi  [ = ]       0    .debug_loc
> >  -42.0% -64.1Mi  [ = ]       0    .debug_info
> >  -22.1%  -122Mi  [ = ]       0    TOTAL
> >
>
> Hi Nick,
>
> thanks for the patch.
>
> I have slightly modified it to adapt to Linux v5.7-rc4 (what was your base?).
>
> Which linker did you use and has it an impact if you switch from
> ld.bfd to ld.lld?
>
> I tried a first normal run and in a 2nd one with
> CONFIG_DEBUG_INFO_COMPRESSED=y both with clang-10 and ld.lld-10.
>
> My numbers (sizes in MiB):
>
> [ diffconfig ]
>
> $ scripts/diffconfig /boot/config-5.7.0-rc4-1-amd64-clang
> /boot/config-5.7.0-rc4-2-amd64-clang
>  BUILD_SALT "5.7.0-rc4-1-amd64-clang" -> "5.7.0-rc4-2-amd64-clang"
> +DEBUG_INFO_COMPRESSED y
>
> [ compiler and linker ]
>
> $ clang-10 -v
> ClangBuiltLinux clang version 10.0.1
> (https://github.com/llvm/llvm-project
> 92d5c1be9ee93850c0a8903f05f36a23ee835dc2)
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
> InstalledDir: /home/dileks/src/llvm-toolchain/install/bin
> Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
> Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
> Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
> Selected GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
> Candidate multilib: .;@m64
> Candidate multilib: 32;@m32
> Candidate multilib: x32;@mx32
> Selected multilib: .;@m64
>
> $ ld.lld-10 -v
> LLD 10.0.1 (https://github.com/llvm/llvm-project
> 92d5c1be9ee93850c0a8903f05f36a23ee835dc2) (compatible with GNU
> linkers)
>
> [ sizes vmlinux ]
>
> $ du -m 5.7.0-rc4-*/vmlinux*
> 409     5.7.0-rc4-1-amd64-clang/vmlinux
> 7       5.7.0-rc4-1-amd64-clang/vmlinux.compressed
> 404     5.7.0-rc4-1-amd64-clang/vmlinux.o
> 324     5.7.0-rc4-2-amd64-clang/vmlinux
> 7       5.7.0-rc4-2-amd64-clang/vmlinux.compressed
> 299     5.7.0-rc4-2-amd64-clang/vmlinux.o
>
> [ readelf (.debug_info as example) ]
>
> $ readelf -S vmlinux.o
>   [33] .debug_info       PROGBITS         0000000000000000  01d6a5e8
>        0000000006be1ee6  0000000000000000           0     0     1
>
> $ readelf -S vmlinux.o
>   [33] .debug_info       PROGBITS         0000000000000000  01749f18
>        0000000002ef04d2  0000000000000000   C       0     0     1 <---
> XXX: "C (compressed)" Flag
>
> Key to Flags:
>   W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
>   L (link order), O (extra OS processing required), G (group), T (TLS),
>   C (compressed), x (unknown), o (OS specific), E (exclude),
>   l (large), p (processor specific)
>
> [ sizes linux-image debian packages ]
>
> $ du -m 5.7.0-rc4-*/linux-image*.deb
> 47      5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> 424     5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> 47      5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> 771     5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
>
> [ sizes linux-git dir (compilation finished ]
>
> 5.7.0-rc4-1-amd64-clang: 17963   /home/dileks/src/linux-kernel/linux
> 5.7.0-rc4-2-amd64-clang: 14328   /home/dileks/src/linux-kernel/linux
>
> [ xz compressed linux-image-dbg packages ]
>
> $ file linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb:
> Debian binary package (format 2.0), with control.tar.xz, data
> compression xz
> $ file linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb:
> Debian binary package (format 2.0), with control.tar.xz, data
> compression xz
>
> [ file-lists ]
>
> $ dpkg --contents
> linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> | wc -l
> 4395
> $ dpkg --contents
> linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> | wc -l
> 4395
>
> [ file-lists vmlinux ]
>
> $ dpkg --contents
> linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> | grep vmlinux
> -rwxr-xr-x root/root 428588312 2020-05-04 06:15
> ./usr/lib/debug/lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
> lrwxrwxrwx root/root         0 2020-05-04 06:15
> ./usr/lib/debug/boot/vmlinux-5.7.0-rc4-1-amd64-clang ->
> ../lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
> lrwxrwxrwx root/root         0 2020-05-04 06:15
> ./usr/lib/debug/vmlinux-5.7.0-rc4-1-amd64-clang ->
> lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
>
> $ dpkg --contents
> linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> | grep vmlinux
> -rwxr-xr-x root/root 339341456 2020-05-04 12:24
> ./usr/lib/debug/lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
> lrwxrwxrwx root/root         0 2020-05-04 12:24
> ./usr/lib/debug/boot/vmlinux-5.7.0-rc4-2-amd64-clang ->
> ../lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
> lrwxrwxrwx root/root         0 2020-05-04 12:24
> ./usr/lib/debug/vmlinux-5.7.0-rc4-2-amd64-clang ->
> lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
>
> [ conclusion ]
>
> As you can see there is a size-reduction in case of vmlinux/vmlinux.o
> (debug) files...
> ...and my linux-git directory in total is smaller: 17963M vs. 14328M.
>
> But the resulting linux-image-dbg file is much fatter: 424M vs. 711M.
> XZ-compressing the gz/zlib-compressed vmlinux (debug) file results in
> a fatter linux-image-dbg package.


I also confirmed that, but this would not
be a blocker of this patch.

Users can disable CONFIG_DEBUG_INFO_COMPRESSED
if they care about the debug package size.





-- 
Best Regards
Masahiro Yamada
