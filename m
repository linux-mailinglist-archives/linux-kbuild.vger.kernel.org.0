Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5791DC2BF
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2020 01:21:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728683AbgETXVe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 May 2020 19:21:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728573AbgETXVb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 May 2020 19:21:31 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A718C061A0F
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2020 16:21:29 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id n15so2093737pjt.4
        for <linux-kbuild@vger.kernel.org>; Wed, 20 May 2020 16:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d9DQ+P49I61QAM9lR3N7+GDsq5XLFYN6aPsU2WBNwdA=;
        b=bCMe/xufpajCZo6YgMImSf+lTdCreI01DMnL4oJeCB9u0gQLrDRGQXxGTumbBbuvzh
         VcDJZT4Ny6BwS+JLq9FHho1IX9jfdQ5sOuExaKvGL2AH4X9KmCptFgKjxP7aRYaoUPhQ
         MvhYfmWH85jfcUsMu6h5WaoUBoQDcA5Xz5PjP4SSNumiMXRgBSoFPNgKFJXJAXaFSF7W
         Dj68ICN+nMquOckHkYDdNE2pkCqZco9LR5I/Z9OxvsAygMVao2Igz+p8fVdBRnQFah+G
         VJRV3RSxoanGFJDrODq6TgaQU6H2uRSdyfPYRmr1/x6IfXd439j6kC5Q1wyfsFdAE7Vi
         GUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d9DQ+P49I61QAM9lR3N7+GDsq5XLFYN6aPsU2WBNwdA=;
        b=Dj7ObbhmSeqGWqzUs4cBpN/oqX2WETejdRNJYv5AYYHkUhgkwSDK8rE76Vu0PdUCqq
         zLSEAVh2J4T5lUeHNSG3OUAtS+K09AGSz0eJmp7IxMzhmv/P9EUHj1nqL6gqqzQs9itq
         n+jAic9sFuBbM8vNt6lMP9KI7KWy3chVscRzHIqh8x7eczvCsYf66P6KsC0uYyNo1704
         T11Vo4l9rcP9ffyHPmhguYKCHTsFAyoMejmlm3p0GO7GlX4B8PLqp49nfaAPIQgaICOu
         5F6UXN7niY94FgdqQn4mZut5sqLNNj0nw20k3qJY86yRT/oP5RavCtl3olXx5l9iQbb0
         ISAQ==
X-Gm-Message-State: AOAM531babJadgWstrff+ZaXkCdGV+ehoa2TQ/JdHtnidXjPwgV3kj8k
        VO6/HlYwYNXp24EVGqwSQMNxJ2fxTqLYYOJd9LZPqQ==
X-Google-Smtp-Source: ABdhPJwOuhDXljbe3Nx6PNNntzvSd8QVlDkOKG7LEakLPOWFDiFba7EgO8kLFoBlCMhfiiYSeVeFn7z/GM0hKI6vqEs=
X-Received: by 2002:a17:90b:19cc:: with SMTP id nm12mr7431934pjb.25.1590016889009;
 Wed, 20 May 2020 16:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <10f4fb0b-1012-b0e6-af05-0aa5a906de21@redhat.com> <20200520193637.6015-1-ndesaulniers@google.com>
In-Reply-To: <20200520193637.6015-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 20 May 2020 16:21:17 -0700
Message-ID: <CAKwvOd=LvSSrg6ynWwnmg4oYS+Ti_rcUrQNudwQLCnEgt6Uzyg@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile: support compressed debug info
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sedat Dilek <sedat.dilek@gmail.com>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        David Blaikie <blaikie@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 20, 2020 at 12:36 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
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

Sorry, I have mistyped David's email, it should be:
Suggested-by: David Blaikie <blaikie@google.com>
(I missed the first `i` in the last name)

> Suggested-by: Fangrui Song <maskray@google.com>
> Suggested-by: Nick Clifton <nickc@redhat.com>
> Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * rebase on linux-next.
> * Add assembler flags as per Fangrui.
> * Add note about KDEB_COMPRESS+scripts/package/builddeb
>   as per Sedat and Masahiro.
> * Add note about bintutils version requirements as per Nick C.
> * Add note about measured increased build time and max RSS.
>
>  Makefile          |  6 ++++++
>  lib/Kconfig.debug | 15 +++++++++++++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 71687bfe1cd9..be8835296754 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -822,6 +822,12 @@ DEBUG_CFLAGS       += $(call cc-option, -femit-struct-debug-baseonly) \
>                    $(call cc-option,-fno-var-tracking)
>  endif
>
> +ifdef CONFIG_DEBUG_INFO_COMPRESSED
> +DEBUG_CFLAGS   += -gz=zlib
> +KBUILD_AFLAGS  += -Wa,--compress-debug-sections=zlib
> +KBUILD_LDFLAGS += --compress-debug-sections=zlib
> +endif
> +
>  KBUILD_CFLAGS += $(DEBUG_CFLAGS)
>  export DEBUG_CFLAGS
>
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index b8f023e054b9..5a423cbfaea4 100644
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
> +       depends on $(ld-option,--compress-debug-sections=zlib)
> +       help
> +         Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
> +         5.0+, binutils 2.26+, and zlib.
> +
> +         Users of dpkg-deb via scripts/package/builddeb may
> +         wish to set the $KDEB_COMPRESS env var to "none" to avoid recompressing
> +         the debug info again with a different compression scheme, which can
> +         result in larger binaries.
> +
>  config DEBUG_INFO_SPLIT
>         bool "Produce split debuginfo in .dwo files"
>         depends on DEBUG_INFO
> --
> 2.26.2.761.g0e0b3e54be-goog
>


-- 
Thanks,
~Nick Desaulniers
