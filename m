Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC811CEFDE
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 10:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgELI7a (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 04:59:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726193AbgELI7a (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 04:59:30 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E91BC061A0C;
        Tue, 12 May 2020 01:59:25 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id f4so6661870iov.11;
        Tue, 12 May 2020 01:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=mgvGrSBn4Z3elWdlR4h/uRqag8YgI6/1Az/oywN8U8E=;
        b=Zxl5nYqS0K/mIp5V3EW+D703aILU7OmO8imXcJybeSM/rpI1MtzeH1Irj1rSHgmSYU
         hLJ6ZZDAK4P5DcNa8WsZ6BZu7iZ9IXSR9DPXx/MPtVt6eMFZ17lxMToXsliumHJEm1FE
         hRi90/h9I6wgaomceBJthVWY8HUx0445GQZqZf3fIgNljBeG7DCMqbFeD2SLM/umsdyC
         f/AFJLR+vlZM8iRsL+me+tVBE90JQqOrDlL/Hl/k/OmfaRg46n4oQ8xmA5I280uos66J
         2qEy8Va7BECc+gxkreeQJvD+S4Y+1dPUkkID1UofxT2BVN8mxEgg75KohjMiV5LKS/m3
         KT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=mgvGrSBn4Z3elWdlR4h/uRqag8YgI6/1Az/oywN8U8E=;
        b=JTiULvLMCcBBox8iSYEblYdZSuDrc8Pd63/IGt5Ti8G61qJcUxo1qUoqZQNjjfij9z
         PxlvnYkccPO8KsdgZbwcBVGXwen4GUrSw0wDlBwptjdXLTuH87cHSOBtffoetJEeSBrY
         PcgjVDAcB6zqSdhBxqvQHmS/C0YRjNc8Op6qd2+n2Ia0luRg/FZ3EtGnfQICfKq7lKpw
         ibuQ2SKnv8ZTavJouvmZ3pY3d4TgDWnxuVR17qMK+c+AFq2WwzLoS9u3JYF119BSq/3A
         ZQuiRzsIpunyMZOQVpaj4SrKPp6Tr0IMGL2C0RuZOIiB8UuHoMa1z9of1hEZZ8cyiBOd
         kDqw==
X-Gm-Message-State: AGi0PuZ+5RyGVwJpgvJ1i+8YawnFtjDqkwXl3fVrlxclOLlUKdplDOnh
        qXFQgbidM86CdPeCQJS2OCAkGkvLnyCrEG/3HXvPb0Ku
X-Google-Smtp-Source: APiQypLjt9tWT6TF4DF/oazBQeHsILYmzpx19gDHVXsIHQ19acIXI3z0zTrILNX8Q1iAp0L/kH2cBd3ymvNJCzMNczY=
X-Received: by 2002:a5e:c814:: with SMTP id y20mr19147281iol.135.1589273964630;
 Tue, 12 May 2020 01:59:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
 <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com> <CAK7LNAR+pm-_nd5=B2OeLpimW42FXxm8TQUMru9DR_asT3qYnA@mail.gmail.com>
In-Reply-To: <CAK7LNAR+pm-_nd5=B2OeLpimW42FXxm8TQUMru9DR_asT3qYnA@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Tue, 12 May 2020 10:59:13 +0200
Message-ID: <CA+icZUUdRk9TYOSb5mzqBrfAsHYCRAy0ciNtKZJxbTdv-KaHpQ@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Masahiro Yamada <masahiroy@kernel.org>
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

On Tue, May 12, 2020 at 7:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Hi Sedat,
>
>
> On Tue, May 5, 2020 at 1:25 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
> > <nick.desaulniers@gmail.com> wrote:
> > >
> > > As debug information gets larger and larger, it helps significantly save
> > > the size of vmlinux images to compress the information in the debug
> > > information sections. Note: this debug info is typically split off from
> > > the final compressed kernel image, which is why vmlinux is what's used
> > > in conjunction with GDB. Minimizing the debug info size should have no
> > > impact on boot times, or final compressed kernel image size.
> > >
> > > All of the debug sections will have a `C` flag set.
> > > $ readelf -S <object file>
> > >
> > > $ bloaty vmlinux.gcc75.compressed.dwarf4 -- \
> > >     vmlinux.gcc75.uncompressed.dwarf4
> > >
> > >     FILE SIZE        VM SIZE
> > >  --------------  --------------
> > >   +0.0%     +18  [ = ]       0    [Unmapped]
> > >  -73.3%  -114Ki  [ = ]       0    .debug_aranges
> > >  -76.2% -2.01Mi  [ = ]       0    .debug_frame
> > >  -73.6% -2.89Mi  [ = ]       0    .debug_str
> > >  -80.7% -4.66Mi  [ = ]       0    .debug_abbrev
> > >  -82.9% -4.88Mi  [ = ]       0    .debug_ranges
> > >  -70.5% -9.04Mi  [ = ]       0    .debug_line
> > >  -79.3% -10.9Mi  [ = ]       0    .debug_loc
> > >  -39.5% -88.6Mi  [ = ]       0    .debug_info
> > >  -18.2%  -123Mi  [ = ]       0    TOTAL
> > >
> > > $ bloaty vmlinux.clang11.compressed.dwarf4 -- \
> > >     vmlinux.clang11.uncompressed.dwarf4
> > >
> > >     FILE SIZE        VM SIZE
> > >  --------------  --------------
> > >   +0.0%     +23  [ = ]       0    [Unmapped]
> > >  -65.6%    -871  [ = ]       0    .debug_aranges
> > >  -77.4% -1.84Mi  [ = ]       0    .debug_frame
> > >  -82.9% -2.33Mi  [ = ]       0    .debug_abbrev
> > >  -73.1% -2.43Mi  [ = ]       0    .debug_str
> > >  -84.8% -3.07Mi  [ = ]       0    .debug_ranges
> > >  -65.9% -8.62Mi  [ = ]       0    .debug_line
> > >  -86.2% -40.0Mi  [ = ]       0    .debug_loc
> > >  -42.0% -64.1Mi  [ = ]       0    .debug_info
> > >  -22.1%  -122Mi  [ = ]       0    TOTAL
> > >
> >
> > Hi Nick,
> >
> > thanks for the patch.
> >
> > I have slightly modified it to adapt to Linux v5.7-rc4 (what was your base?).
> >
> > Which linker did you use and has it an impact if you switch from
> > ld.bfd to ld.lld?
> >
> > I tried a first normal run and in a 2nd one with
> > CONFIG_DEBUG_INFO_COMPRESSED=y both with clang-10 and ld.lld-10.
> >
> > My numbers (sizes in MiB):
> >
> > [ diffconfig ]
> >
> > $ scripts/diffconfig /boot/config-5.7.0-rc4-1-amd64-clang
> > /boot/config-5.7.0-rc4-2-amd64-clang
> >  BUILD_SALT "5.7.0-rc4-1-amd64-clang" -> "5.7.0-rc4-2-amd64-clang"
> > +DEBUG_INFO_COMPRESSED y
> >
> > [ compiler and linker ]
> >
> > $ clang-10 -v
> > ClangBuiltLinux clang version 10.0.1
> > (https://github.com/llvm/llvm-project
> > 92d5c1be9ee93850c0a8903f05f36a23ee835dc2)
> > Target: x86_64-unknown-linux-gnu
> > Thread model: posix
> > InstalledDir: /home/dileks/src/llvm-toolchain/install/bin
> > Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
> > Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
> > Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
> > Selected GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
> > Candidate multilib: .;@m64
> > Candidate multilib: 32;@m32
> > Candidate multilib: x32;@mx32
> > Selected multilib: .;@m64
> >
> > $ ld.lld-10 -v
> > LLD 10.0.1 (https://github.com/llvm/llvm-project
> > 92d5c1be9ee93850c0a8903f05f36a23ee835dc2) (compatible with GNU
> > linkers)
> >
> > [ sizes vmlinux ]
> >
> > $ du -m 5.7.0-rc4-*/vmlinux*
> > 409     5.7.0-rc4-1-amd64-clang/vmlinux
> > 7       5.7.0-rc4-1-amd64-clang/vmlinux.compressed
> > 404     5.7.0-rc4-1-amd64-clang/vmlinux.o
> > 324     5.7.0-rc4-2-amd64-clang/vmlinux
> > 7       5.7.0-rc4-2-amd64-clang/vmlinux.compressed
> > 299     5.7.0-rc4-2-amd64-clang/vmlinux.o
> >
> > [ readelf (.debug_info as example) ]
> >
> > $ readelf -S vmlinux.o
> >   [33] .debug_info       PROGBITS         0000000000000000  01d6a5e8
> >        0000000006be1ee6  0000000000000000           0     0     1
> >
> > $ readelf -S vmlinux.o
> >   [33] .debug_info       PROGBITS         0000000000000000  01749f18
> >        0000000002ef04d2  0000000000000000   C       0     0     1 <---
> > XXX: "C (compressed)" Flag
> >
> > Key to Flags:
> >   W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
> >   L (link order), O (extra OS processing required), G (group), T (TLS),
> >   C (compressed), x (unknown), o (OS specific), E (exclude),
> >   l (large), p (processor specific)
> >
> > [ sizes linux-image debian packages ]
> >
> > $ du -m 5.7.0-rc4-*/linux-image*.deb
> > 47      5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> > 424     5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> > 47      5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> > 771     5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> >
> > [ sizes linux-git dir (compilation finished ]
> >
> > 5.7.0-rc4-1-amd64-clang: 17963   /home/dileks/src/linux-kernel/linux
> > 5.7.0-rc4-2-amd64-clang: 14328   /home/dileks/src/linux-kernel/linux
> >
> > [ xz compressed linux-image-dbg packages ]
> >
> > $ file linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> > linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb:
> > Debian binary package (format 2.0), with control.tar.xz, data
> > compression xz
> > $ file linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> > linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb:
> > Debian binary package (format 2.0), with control.tar.xz, data
> > compression xz
> >
> > [ file-lists ]
> >
> > $ dpkg --contents
> > linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> > | wc -l
> > 4395
> > $ dpkg --contents
> > linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> > | wc -l
> > 4395
> >
> > [ file-lists vmlinux ]
> >
> > $ dpkg --contents
> > linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
> > | grep vmlinux
> > -rwxr-xr-x root/root 428588312 2020-05-04 06:15
> > ./usr/lib/debug/lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
> > lrwxrwxrwx root/root         0 2020-05-04 06:15
> > ./usr/lib/debug/boot/vmlinux-5.7.0-rc4-1-amd64-clang ->
> > ../lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
> > lrwxrwxrwx root/root         0 2020-05-04 06:15
> > ./usr/lib/debug/vmlinux-5.7.0-rc4-1-amd64-clang ->
> > lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
> >
> > $ dpkg --contents
> > linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
> > | grep vmlinux
> > -rwxr-xr-x root/root 339341456 2020-05-04 12:24
> > ./usr/lib/debug/lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
> > lrwxrwxrwx root/root         0 2020-05-04 12:24
> > ./usr/lib/debug/boot/vmlinux-5.7.0-rc4-2-amd64-clang ->
> > ../lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
> > lrwxrwxrwx root/root         0 2020-05-04 12:24
> > ./usr/lib/debug/vmlinux-5.7.0-rc4-2-amd64-clang ->
> > lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
> >
> > [ conclusion ]
> >
> > As you can see there is a size-reduction in case of vmlinux/vmlinux.o
> > (debug) files...
> > ...and my linux-git directory in total is smaller: 17963M vs. 14328M.
> >
> > But the resulting linux-image-dbg file is much fatter: 424M vs. 711M.
> > XZ-compressing the gz/zlib-compressed vmlinux (debug) file results in
> > a fatter linux-image-dbg package.
>
>
> I also confirmed that, but this would not
> be a blocker of this patch.
>

Hi Masahiro,

No, it is not a blocker.
I have this patch now in my Linux v5.7-rc5 series.

I see a lot of more benefits concerning disc-usage - in my linux-git
and a reduced vmlinux file when I wanted to test with QEMU.

Feel free to add:
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

- Sedat -

> Users can disable CONFIG_DEBUG_INFO_COMPRESSED
> if they care about the debug package size.
>
>
>
>
>
> --
> Best Regards
> Masahiro Yamada
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAK7LNAR%2Bpm-_nd5%3DB2OeLpimW42FXxm8TQUMru9DR_asT3qYnA%40mail.gmail.com.
