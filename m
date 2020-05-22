Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BDC01DE5F4
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 13:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728506AbgEVL5N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 07:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728356AbgEVL5M (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 07:57:12 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28AA1C061A0E;
        Fri, 22 May 2020 04:57:12 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id d5so1541386ios.9;
        Fri, 22 May 2020 04:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=vVgEQoaZGULeKq6mOVsxabUK+ok8IXX8M0Wjc4JGWnw=;
        b=kT0kNKEyfZ38yYc5SMmwx2T1Oqc7KZL+SmsXED9fGxtRFFN5O2vDyvZNYu7XSJ9GwW
         RcNCYxCREvtCl6/clhzOl34+HzXvNp2k9CvhUXIbMi4LX18DtIHATmKBaa7GIuoQTwEg
         jWsr1xZDq6eQQTI4ubZDgKcPQdMTb4gZGIAVhDxKobIlRzY9QejjZ+oKtWJO/kU08fSS
         mskf/7ilGlBOTt3HE9XGEbpw5fDdYPzrnyYDJeWWFRAAUn+hiPwWrCPNhxrrA7ZIHye7
         cD3UgVB6A8suBUv3J+Gur4C72D0Ppeiou0Cfu3zhX4XKYCn8Lxy9QdM/B30EU5W0TH42
         0jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=vVgEQoaZGULeKq6mOVsxabUK+ok8IXX8M0Wjc4JGWnw=;
        b=GLqe3EcifULKfm5lNNbl+u79PYVq3KJieWzBBL9t+ZOMxu4XN1ta6Pk808euDzvVlD
         VfTZYx0/znRCn46BE+bxip/bEZZtE6T8fmO+rLS8pQyck8o49GOmr4Z6EYsz7lCVQq6Z
         xlsj8QY9qPyyC1/pRjHzvpvjooDNaZMWXe1jWnrFfKc7hokzIANNNQ0QcznmHoIYNKIS
         +qT8MO60VszPDwSLbQEiMITM/mMXM1RRSYA2T9/TEG1xjZmUtDThPSXeISYEK/2gAgkc
         bOqBK7Fb2zKELcHhkEz0mrwA36L5t+nMIpbIdqecuwnHkexqJCkqfqXWu59KlMZjh/YW
         /lfA==
X-Gm-Message-State: AOAM532wzgdozRcPHUzGgB+FKwaUpqv2IEJrkf89edu95rBWpINjkrZK
        qEj84xO7m6qVBjzHhnetV3Ocz7jxT2+yLzbM0MQ=
X-Google-Smtp-Source: ABdhPJxk5boNaYi9U3g95woHOFJGThEaM55bar9NM4pJy+F3Dzt+kO44UvNhnafLo77t8khyVSERsO2VQQna9aGqhpk=
X-Received: by 2002:a05:6602:2c45:: with SMTP id x5mr2690450iov.80.1590148631440;
 Fri, 22 May 2020 04:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=jOr4ZaLx-dSNTqZnGRATY1PZktUfu4JGWKRwRH=Ujnw@mail.gmail.com>
 <20200521220041.87368-1-ndesaulniers@google.com>
In-Reply-To: <20200521220041.87368-1-ndesaulniers@google.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 22 May 2020 13:56:59 +0200
Message-ID: <CA+icZUWGB8bp1UZHQpB_W8YL7SeN23h5V9NTq-p3jeUqO4MK+w@mail.gmail.com>
Subject: Re: [PATCH v3] Makefile: support compressed debug info
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Nick Clifton <nickc@redhat.com>,
        David Blaikie <blaikie@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Changbin Du <changbin.du@intel.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 22, 2020 at 12:00 AM Nick Desaulniers
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
> Suggested-by: David Blaikie <blaikie@google.com>
> Suggested-by: Nick Clifton <nickc@redhat.com>
> Suggested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Reviewed-by: Fangrui Song <maskray@google.com>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>

Re-tested V3 on top of Linux v5.7-rc6+ with Clang/LLD v10.0.1-rc1.

- Sedat -

> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V2 -> V3:
> * Fix blaikie@'s email addr.
> * Fix Fangrui's Reviewed-by tag as per Masahiro.
> * Fix help text as per Masahiro.
> * Fix -Wa$(comma)foo as per Masahiro.
>
> Changes V1 -> V2:
> * rebase on linux-next.
> * Add assembler flags as per Fangrui.
> * Add note about KDEB_COMPRESS+scripts/package/builddeb
>   as per Sedat and Masahiro.
> * Add note about bintutils version requirements as per Nick C.
> * Add note about measured increased build time and max RSS.
>  Makefile          |  6 ++++++
>  lib/Kconfig.debug | 17 +++++++++++++++++
>  2 files changed, 23 insertions(+)
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
> index b8f023e054b9..7fc82dcf814b 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -225,6 +225,23 @@ config DEBUG_INFO_REDUCED
>           DEBUG_INFO build and compile times are reduced too.
>           Only works with newer gcc versions.
>
> +config DEBUG_INFO_COMPRESSED
> +       bool "Compressed debugging information"
> +       depends on DEBUG_INFO
> +       depends on $(cc-option,-gz=zlib)
> +       depends on $(as-option,-Wa$(comma)--compress-debug-sections=zlib)
> +       depends on $(ld-option,--compress-debug-sections=zlib)
> +       help
> +         Compress the debug information using zlib.  Requires GCC 5.0+ or Clang
> +         5.0+, binutils 2.26+, and zlib.
> +
> +         Users of dpkg-deb via scripts/package/builddeb may find an increase in
> +         size of their debug .deb packages with this config set, due to the
> +         debug info being compressed with zlib, then the object files being
> +         recompressed with a different compression scheme. But this is still
> +         preferable to setting $KDEB_COMPRESS to "none" which would be even
> +         larger.
> +
>  config DEBUG_INFO_SPLIT
>         bool "Produce split debuginfo in .dwo files"
>         depends on DEBUG_INFO
> --
> 2.27.0.rc0.183.gde8f92d652-goog
>
