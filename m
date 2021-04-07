Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A7FC356EA7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 16:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229942AbhDGOas (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 10:30:48 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16668 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbhDGOar (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 10:30:47 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 137EU59t000332;
        Wed, 7 Apr 2021 23:30:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 137EU59t000332
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617805805;
        bh=MVRjyvotamx0gGxHkxCvFT+m/YZf+2TbVDcNiqVSJD8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ejks8/6nhbUZ2BweBH1E08Gn4kIOSuUvT8rr3ckt7oJDcBZopuA9vYygo7RERY56B
         1lnFnu8Ugd8CzgX26j1+PU9RLtqR5NCq+cZv/M89Fqu/TCzmhzZ5eqGRnAjaN87gOD
         nho3tuCxZRrGj0WgQ0d+4x8fdps6cRniOJG2kSCG+y9DUb3jEoxcY+jTLRP9KOa+FN
         AwuRABJVW0oaCIGB8ZZjPnBSi+aj6TIfLtq48x3SrwwL3O/I0Q2hs03bU6UNRevg8j
         fa2wIp/rqwCo98Z4Mujgeyqg8lOXilveueTUgwGnubdn9QYzNkTM1nY/G3ei2g+W6O
         Uud9m0SI/Nc6g==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id h20so9433132plr.4;
        Wed, 07 Apr 2021 07:30:05 -0700 (PDT)
X-Gm-Message-State: AOAM530GtyV/gg+LfPwp2UvBiMoGepzBrYeWI5G+YQkSna63A+lRA4d7
        aQHkMHNl7+PdAAQuUJAxLoULeIMRwxev0nVQWBo=
X-Google-Smtp-Source: ABdhPJziQ0BjpbrjRb7L/3qJ6OIKZU2K1LdHVqg7/W3ygxcpNpdQW7zByiAXv9R1/osGLuFJTg0PV7QnW/5XTAyDteY=
X-Received: by 2002:a17:90a:f68a:: with SMTP id cl10mr3554255pjb.87.1617805804515;
 Wed, 07 Apr 2021 07:30:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210331133811.3221540-1-masahiroy@kernel.org> <20210331133811.3221540-9-masahiroy@kernel.org>
In-Reply-To: <20210331133811.3221540-9-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 23:29:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCmTMtS+4MxTKJDcdCxtDfBTgXkZPUssjrWbmoPYuwAA@mail.gmail.com>
Message-ID: <CAK7LNASCmTMtS+4MxTKJDcdCxtDfBTgXkZPUssjrWbmoPYuwAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] kbuild: remove CONFIG_MODULE_COMPRESS
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Chris Wilson <chris@chris-wilson.co.uk>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nick Terrell <terrelln@fb.com>,
        Valentin Schneider <valentin.schneider@arm.com>,
        Vlastimil Babka <vbabka@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 31, 2021 at 10:39 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> CONFIG_MODULE_COMPRESS is only used to activate the choice for module
> compression algorithm. It will be simpler to make the choice visible
> all the time by adding CONFIG_MODULE_COMPRESS_NONE to allow the user to
> disable module compression.
>
> This is more consistent with the "Kernel compression mode" and "Built-in
> initramfs compression mode" choices.
>
> CONFIG_KERNEL_UNCOMPRESSED and CONFIG_INITRAMFS_COMPRESSION_NONE are
> available to choose to not compress the kernel, initrd, respectively.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  init/Kconfig | 45 ++++++++++++++++++++++++++-------------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 019c1874e609..3ca1ffd219c4 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2225,40 +2225,47 @@ config MODULE_SIG_HASH
>         default "sha384" if MODULE_SIG_SHA384
>         default "sha512" if MODULE_SIG_SHA512
>
> -config MODULE_COMPRESS
> -       bool "Compress modules on installation"
> +choice
> +       prompt "Module compression mode"
>         help
> +         This option allows you to choose the algorithm which will be used to
> +         compress modules when 'make modules_install' is run. (or, you can
> +         choose to not compress modules at all.)
>
> -         Compresses kernel modules when 'make modules_install' is run; gzip or
> -         xz depending on "Compression algorithm" below.
> +         External modules will also be compressed in the same way during the
> +         installation.
>
> -         module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
> +         For modules inside an initrd or initramfs, it's more efficient to
> +         compress the whole initrd or initramfs instead.
>
> -         Out-of-tree kernel modules installed using Kbuild will also be
> -         compressed upon installation.
> +         This is fully compatible with signed modules.
>
> -         Note: for modules inside an initrd or initramfs, it's more efficient
> -         to compress the whole initrd or initramfs instead.
> +         Please note that the tool used to load modules needs to support the
> +         corresponding algorithm. module-init-tools MAY support gzip, and kmod
> +         MAY support gzip and xz.
>
> -         Note: This is fully compatible with signed modules.
> +         Your build system needs to provide the appropriate compression tool
> +         to compress the modules.
>
> -         If in doubt, say N.
> +         If in doubt, select 'None'.
>
> -choice
> -       prompt "Compression algorithm"
> -       depends on MODULE_COMPRESS
> -       default MODULE_COMPRESS_GZIP
> +config MODULE_COMPRESS_NONE
> +       bool "None"
>         help
> -         This determines which sort of compression will be used during
> -         'make modules_install'.
> -
> -         GZIP (default) and XZ are supported.
> +         Do not compress modules. The installed modules are suffixed
> +         with .ko.
>
>  config MODULE_COMPRESS_GZIP
>         bool "GZIP"
> +       help
> +         Compress modules with XZ. The installed modules are suffixed


This should be "Compress modules with GZIP."


I will fix it when applied.







> +         with .ko.gz.
>
>  config MODULE_COMPRESS_XZ
>         bool "XZ"
> +       help
> +         Compress modules with XZ. The installed modules are suffixed
> +         with .ko.xz.
>
>  endchoice
>
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
