Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F143A1DC55D
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 04:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726979AbgEUCtF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 May 2020 22:49:05 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:65504 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726954AbgEUCtE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 22:49:04 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 04L2maKe001769;
        Thu, 21 May 2020 11:48:37 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 04L2maKe001769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590029317;
        bh=+1pPHahrtwrCs5XxeEk28u3oetsrJ5xJvorudmks/Ak=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=S+RecnEutDPf3inL8J6th1DrhYnid6Cx5bnXEDEz3x72TL5LwBw2mdS0o/xI03Sna
         X4tXm95DvdhDY+B153CE8QmimLGX/CTz40dDRiULLQh7dkXQh2jNdj8PpWO3b8ZK1h
         uUeJcy12XWIQyWqbEJWRkgqEKDL1TNQ9omP5vAbeQbAhwMq2r/5IYohkVjXF9rj4O/
         BofMLQhsgvM/FvybTw6k7IfNCm904B1HPw/PKaaje7v3svZDANrlRi3vjtZj7XC7bw
         dkQqj85VP2EsdDjjp8mctdRIUdDUf8o1jWa1tN60oPZ/dJZzvEW8bPMS2oExOyRmZX
         uN25S7ZkwCl+A==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id k3so2067288ual.8;
        Wed, 20 May 2020 19:48:36 -0700 (PDT)
X-Gm-Message-State: AOAM532s8DYirhKlF6+HcBYBYcdSgm5SgsbpsfuIcd/knmwUhk8Of477
        ZqYExvaAairHgl7t6++oIt4lKZ8T+KeKXNwQd7Y=
X-Google-Smtp-Source: ABdhPJwWsv11TCsudV79Gv+p//ZclSKqNmbbJYf1sZ0usGUtYQVNNqs2nP8VT9NEOehuGTboP9sS3KN47mmXBw00Qe8=
X-Received: by 2002:ab0:7298:: with SMTP id w24mr5868586uao.95.1590029315782;
 Wed, 20 May 2020 19:48:35 -0700 (PDT)
MIME-Version: 1.0
References: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com> <20200520193637.6015-1-ndesaulniers@google.com>
In-Reply-To: <20200520193637.6015-1-ndesaulniers@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 21 May 2020 11:47:59 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS_PMz9r3e1UcuM+r18JC2KeM2RqGOms1u3kVzN_N1MmA@mail.gmail.com>
Message-ID: <CAK7LNAS_PMz9r3e1UcuM+r18JC2KeM2RqGOms1u3kVzN_N1MmA@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: support compressed debug info
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        David Blaikie <blakie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 21, 2020 at 4:36 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
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
> For x86_64 defconfig + LLVM=1 (before):
> Elapsed (wall clock) time (h:mm:ss or m:ss): 3:22.03
> Maximum resident set size (kbytes): 43856
>
> For x86_64 defconfig + LLVM=1 (after):
> Elapsed (wall clock) time (h:mm:ss or m:ss): 3:32.52
> Maximum resident set size (kbytes): 1566776
>
> Suggested-by: David Blaikie <blakie@google.com>
> Suggested-by: Fangrui Song <maskray@google.com>


Suggested-by -> Reviewed-by

https://patchwork.kernel.org/patch/11524939/#23349551



> Suggested-by: Nick Clifton <nickc@redhat.com>


I do not know where this tag came from.

Nick Clifton taught us the version rule of binutils,but did not state
anything about this patch itself.

https://patchwork.kernel.org/patch/11524939/#23355175


> Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>

I do not see the source of this tag, either...



> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---

 snip

> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -225,6 +225,21 @@ config DEBUG_INFO_REDUCED
>           DEBUG_INFO build and compile times are reduced too.
>           Only works with newer gcc versions.
>
> +config DEBUG_INFO_COMPRESSED
> +       bool "Compressed debugging information"
> +       depends on DEBUG_INFO
> +       depends on $(cc-option,-gz=zlib)
> +       depends on $(as-option,-Wa,--compress-debug-sections=zlib)

This does not work. (always false)
You cannot enable this option.

The comma between -Wa and --compress-debug-sections=zlib
is eaten by Kconfig parser because commas are delimiters
of function parameters.


Please write like this.

    depends on $(as-option,-Wa$(comma)--compress-debug-sections=zlib)





> +       depends on $(ld-option,--compress-debug-sections=zlib)
> +       help
> +         Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
> +         5.0+, binutils 2.26+, and zlib.
> +
> +         Users of dpkg-deb via scripts/package/builddeb may
> +         wish to set the $KDEB_COMPRESS env var to "none" to avoid recompressing
> +         the debug info again with a different compression scheme, which can
> +         result in larger binaries.

No. This is not correct.

CONFIG_DEBUG_INFO_COMPRESSED compresses the only debug info part.
The other parts still get by benefit from the default KDEB_COMPRESS=xz.


The numbers are here:


CONFIG_DEBUG_INFO_COMPRESSED=y
-rw-r--r-- 1 masahiro masahiro 209077584 May 21 11:19
linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-26_amd64.deb


CONFIG_DEBUG_INFO_COMPRESSED=y and KDEB_COMPRESS=none
-rw-r--r-- 1 masahiro masahiro 643051712 May 21 11:22
linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-27_amd64.deb


CONFIG_DEBUG_INFO_COMPRESSED=n
-rw-r--r-- 1 masahiro masahiro 112200308 May 21 11:40
linux-image-5.7.0-rc5+-dbg_5.7.0-rc5+-30_amd64.deb




For the deb package size perspective,
it is better to keep KDEB_COMPRESS as default.

The main motivation for changing KDEB_COMPRESS
is the build speed.  (see commit 1a7f0a34ea7d05)




CONFIG_DEBUG_INFO_COMPRESSED has a downside
for the debug deb package, but we need to accept it.









-- 
Best Regards
Masahiro Yamada
