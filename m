Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F8E61C3FC4
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 May 2020 18:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgEDQZH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 May 2020 12:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728158AbgEDQZH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 May 2020 12:25:07 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AECC061A0E;
        Mon,  4 May 2020 09:25:06 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id x17so21699933wrt.5;
        Mon, 04 May 2020 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=OXI+BTNRpGZudxYaIqga7shYaaL0hbXwRkiRxDAedGE=;
        b=n+Da1qavXq+VLl7EbiGW3NHJpvhdnx5chaT1GtIRiaEG00SB5ojaj1K+KbK8bDP6aG
         Ksao4+YqOaIxm+J+hyXcknwShRyOZ+2YFHuWdDMkERZRQYX5zDSgZgOCVmrbaWS98vuA
         1c4SIXV8PjXjcJfm6Rlvj74ML6fafvXQxhCsc9NxCBFj5tqqugztD9fY+GJQz218TT2e
         9CIEIAW4KIv/4gUZE+DOEjvMIvsY15O8/J3WiKrw6pKtXbmjgkLQY/+r5jNmX3Zu2qKa
         wwItLJE0mJcns/XZ8EfJ2rjzEkCJkPAqt5f3DaxMzQs2+85xEQ6AGEL8QZD9TCbbC8jD
         HJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=OXI+BTNRpGZudxYaIqga7shYaaL0hbXwRkiRxDAedGE=;
        b=lpeEsMew2ua6abaEIDO+PRLfNxO1chE/PgYNyg+Urh5mn9b+ml/xae5M1499tBv3rf
         A7d53YceUs6jnyCeCuqv0l61pE5Q0XacEYWtcf959Vgn+MgPtbs5c6dWRNfQW3GRxAGw
         RkIWBoiGb2bodeBZrV+kSZDoJQzt5tgrD1ZBHreeNgYdpjeBVa1dRdzql+qBA82Efbwy
         LPZRUAbmiH2OHLR/WHT34yovZl/FkdbMB04Apq5hQ9dInQWCyOENqpJXahsZvOWo5icL
         sehIz4eySBlKapERknPVCcCx3bDkpvP/tTm3rS0odQipTUHrh7HZ7WTZ8DSCpxUiDJpu
         /edA==
X-Gm-Message-State: AGi0PuapegtfrkFHpJIbxAlcTF6GvT2eZxFgnqP7vImxVGqD8GCx9LDo
        ifUY0XYRAYarVtRM7VkxjtIhSokW/7cWvFdCViQ=
X-Google-Smtp-Source: APiQypK5cBqhjtoJjwh1iIi/KEwMt6BLscrlqPvZOZqfY9fxYkvKvxeH5xgmMwqMYio48KcLClH5yCf8AN7zC3t71zA=
X-Received: by 2002:adf:d0ce:: with SMTP id z14mr21441898wrh.179.1588609505573;
 Mon, 04 May 2020 09:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200504031340.7103-1-nick.desaulniers@gmail.com>
In-Reply-To: <20200504031340.7103-1-nick.desaulniers@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 4 May 2020 18:25:00 +0200
Message-ID: <CA+icZUUOaqeKeh6n4BJq2k6XQWAfNghUj57j42ZX5qyd3iOmLw@mail.gmail.com>
Subject: Re: [PATCH] Makefile: support compressed debug info
To:     Nick Desaulniers <nick.desaulniers@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 4, 2020 at 5:13 AM Nick Desaulniers
<nick.desaulniers@gmail.com> wrote:
>
> As debug information gets larger and larger, it helps significantly save
> the size of vmlinux images to compress the information in the debug
> information sections. Note: this debug info is typically split off from
> the final compressed kernel image, which is why vmlinux is what's used
> in conjunction with GDB. Minimizing the debug info size should have no
> impact on boot times, or final compressed kernel image size.
>
> All of the debug sections will have a `C` flag set.
> $ readelf -S <object file>
>
> $ bloaty vmlinux.gcc75.compressed.dwarf4 -- \
>     vmlinux.gcc75.uncompressed.dwarf4
>
>     FILE SIZE        VM SIZE
>  --------------  --------------
>   +0.0%     +18  [ = ]       0    [Unmapped]
>  -73.3%  -114Ki  [ = ]       0    .debug_aranges
>  -76.2% -2.01Mi  [ = ]       0    .debug_frame
>  -73.6% -2.89Mi  [ = ]       0    .debug_str
>  -80.7% -4.66Mi  [ = ]       0    .debug_abbrev
>  -82.9% -4.88Mi  [ = ]       0    .debug_ranges
>  -70.5% -9.04Mi  [ = ]       0    .debug_line
>  -79.3% -10.9Mi  [ = ]       0    .debug_loc
>  -39.5% -88.6Mi  [ = ]       0    .debug_info
>  -18.2%  -123Mi  [ = ]       0    TOTAL
>
> $ bloaty vmlinux.clang11.compressed.dwarf4 -- \
>     vmlinux.clang11.uncompressed.dwarf4
>
>     FILE SIZE        VM SIZE
>  --------------  --------------
>   +0.0%     +23  [ = ]       0    [Unmapped]
>  -65.6%    -871  [ = ]       0    .debug_aranges
>  -77.4% -1.84Mi  [ = ]       0    .debug_frame
>  -82.9% -2.33Mi  [ = ]       0    .debug_abbrev
>  -73.1% -2.43Mi  [ = ]       0    .debug_str
>  -84.8% -3.07Mi  [ = ]       0    .debug_ranges
>  -65.9% -8.62Mi  [ = ]       0    .debug_line
>  -86.2% -40.0Mi  [ = ]       0    .debug_loc
>  -42.0% -64.1Mi  [ = ]       0    .debug_info
>  -22.1%  -122Mi  [ = ]       0    TOTAL
>

Hi Nick,

thanks for the patch.

I have slightly modified it to adapt to Linux v5.7-rc4 (what was your base?).

Which linker did you use and has it an impact if you switch from
ld.bfd to ld.lld?

I tried a first normal run and in a 2nd one with
CONFIG_DEBUG_INFO_COMPRESSED=y both with clang-10 and ld.lld-10.

My numbers (sizes in MiB):

[ diffconfig ]

$ scripts/diffconfig /boot/config-5.7.0-rc4-1-amd64-clang
/boot/config-5.7.0-rc4-2-amd64-clang
 BUILD_SALT "5.7.0-rc4-1-amd64-clang" -> "5.7.0-rc4-2-amd64-clang"
+DEBUG_INFO_COMPRESSED y

[ compiler and linker ]

$ clang-10 -v
ClangBuiltLinux clang version 10.0.1
(https://github.com/llvm/llvm-project
92d5c1be9ee93850c0a8903f05f36a23ee835dc2)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /home/dileks/src/llvm-toolchain/install/bin
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/8
Found candidate GCC installation: /usr/lib/gcc/x86_64-linux-gnu/9
Selected GCC installation: /usr/lib/gcc/x86_64-linux-gnu/10
Candidate multilib: .;@m64
Candidate multilib: 32;@m32
Candidate multilib: x32;@mx32
Selected multilib: .;@m64

$ ld.lld-10 -v
LLD 10.0.1 (https://github.com/llvm/llvm-project
92d5c1be9ee93850c0a8903f05f36a23ee835dc2) (compatible with GNU
linkers)

[ sizes vmlinux ]

$ du -m 5.7.0-rc4-*/vmlinux*
409     5.7.0-rc4-1-amd64-clang/vmlinux
7       5.7.0-rc4-1-amd64-clang/vmlinux.compressed
404     5.7.0-rc4-1-amd64-clang/vmlinux.o
324     5.7.0-rc4-2-amd64-clang/vmlinux
7       5.7.0-rc4-2-amd64-clang/vmlinux.compressed
299     5.7.0-rc4-2-amd64-clang/vmlinux.o

[ readelf (.debug_info as example) ]

$ readelf -S vmlinux.o
  [33] .debug_info       PROGBITS         0000000000000000  01d6a5e8
       0000000006be1ee6  0000000000000000           0     0     1

$ readelf -S vmlinux.o
  [33] .debug_info       PROGBITS         0000000000000000  01749f18
       0000000002ef04d2  0000000000000000   C       0     0     1 <---
XXX: "C (compressed)" Flag

Key to Flags:
  W (write), A (alloc), X (execute), M (merge), S (strings), I (info),
  L (link order), O (extra OS processing required), G (group), T (TLS),
  C (compressed), x (unknown), o (OS specific), E (exclude),
  l (large), p (processor specific)

[ sizes linux-image debian packages ]

$ du -m 5.7.0-rc4-*/linux-image*.deb
47      5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
424     5.7.0-rc4-1-amd64-clang/linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
47      5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
771     5.7.0-rc4-2-amd64-clang/linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb

[ sizes linux-git dir (compilation finished ]

5.7.0-rc4-1-amd64-clang: 17963   /home/dileks/src/linux-kernel/linux
5.7.0-rc4-2-amd64-clang: 14328   /home/dileks/src/linux-kernel/linux

[ xz compressed linux-image-dbg packages ]

$ file linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb:
Debian binary package (format 2.0), with control.tar.xz, data
compression xz
$ file linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb:
Debian binary package (format 2.0), with control.tar.xz, data
compression xz

[ file-lists ]

$ dpkg --contents
linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
| wc -l
4395
$ dpkg --contents
linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
| wc -l
4395

[ file-lists vmlinux ]

$ dpkg --contents
linux-image-5.7.0-rc4-1-amd64-clang-dbg_5.7.0~rc4-1~bullseye+dileks1_amd64.deb
| grep vmlinux
-rwxr-xr-x root/root 428588312 2020-05-04 06:15
./usr/lib/debug/lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
lrwxrwxrwx root/root         0 2020-05-04 06:15
./usr/lib/debug/boot/vmlinux-5.7.0-rc4-1-amd64-clang ->
../lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux
lrwxrwxrwx root/root         0 2020-05-04 06:15
./usr/lib/debug/vmlinux-5.7.0-rc4-1-amd64-clang ->
lib/modules/5.7.0-rc4-1-amd64-clang/vmlinux

$ dpkg --contents
linux-image-5.7.0-rc4-2-amd64-clang-dbg_5.7.0~rc4-2~bullseye+dileks1_amd64.deb
| grep vmlinux
-rwxr-xr-x root/root 339341456 2020-05-04 12:24
./usr/lib/debug/lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
lrwxrwxrwx root/root         0 2020-05-04 12:24
./usr/lib/debug/boot/vmlinux-5.7.0-rc4-2-amd64-clang ->
../lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux
lrwxrwxrwx root/root         0 2020-05-04 12:24
./usr/lib/debug/vmlinux-5.7.0-rc4-2-amd64-clang ->
lib/modules/5.7.0-rc4-2-amd64-clang/vmlinux

[ conclusion ]

As you can see there is a size-reduction in case of vmlinux/vmlinux.o
(debug) files...
...and my linux-git directory in total is smaller: 17963M vs. 14328M.

But the resulting linux-image-dbg file is much fatter: 424M vs. 711M.
XZ-compressing the gz/zlib-compressed vmlinux (debug) file results in
a fatter linux-image-dbg package.

For a usage of vmlinux (debug) in a VM scenario this might be nice but
seen from a debian repository perspective not.

For the sake of completeness:  I have just installed and booted the
"normal" linux-image debian package - not the debug packages.

Thanks.

Regards,
- Sedat -

> Suggested-by: David Blaikie <blakie@google.com>
> Signed-off-by: Nick Desaulniers <nick.desaulniers@gmail.com>
> ---
>  Makefile          | 5 +++++
>  lib/Kconfig.debug | 9 +++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 981eb902384b..313a054e5dc6 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -825,6 +825,11 @@ ifdef CONFIG_DEBUG_INFO_REDUCED
>  DEBUG_CFLAGS   += $(call cc-option, -femit-struct-debug-baseonly) \
>                    $(call cc-option,-fno-var-tracking)
>  endif
> +
> +ifdef CONFIG_DEBUG_INFO_COMPRESSED
> +DEBUG_CFLAGS   += -gz=zlib
> +KBUILD_LDFLAGS += --compress-debug-sections=zlib
> +endif
>  endif
>
>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index f6f9a039f736..1f4a47ba6c1b 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -213,6 +213,15 @@ config DEBUG_INFO_REDUCED
>           DEBUG_INFO build and compile times are reduced too.
>           Only works with newer gcc versions.
>
> +config DEBUG_INFO_COMPRESSED
> +       bool "Compressed debugging information"
> +       depends on DEBUG_INFO
> +       depends on $(cc-option,-gz=zlib)
> +       depends on $(ld-option,--compress-debug-sections=zlib)
> +       help
> +         Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
> +         5.0+.
> +
>  config DEBUG_INFO_SPLIT
>         bool "Produce split debuginfo in .dwo files"
>         depends on DEBUG_INFO
> --
> 2.17.1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200504031340.7103-1-nick.desaulniers%40gmail.com.
