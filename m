Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6728F356EBE
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 16:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241875AbhDGOeB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 10:34:01 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:50129 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbhDGOeA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 10:34:00 -0400
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 137EXYoh012783;
        Wed, 7 Apr 2021 23:33:35 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 137EXYoh012783
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1617806015;
        bh=6v/t8YW4fUxKSYn99A4YEhTxEl23osNDyu0ZPsHBv2M=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GpZ+NATu3MeNUvfJMR2kIxq3HgbWzutWhjPvvh04MkiqJh6f86UgkAZUNtyPUs1NE
         NfsLsvIojurLwvECVNa0Zz393OpeAV+I6zwpfJ5LcU7ceuVJo/DmZ1054Lx4S81qc/
         RlF2qTBoMK8sLbdEfAMRilnvPlAJVdRecrrL25o5rUrU/6lRzbassIIZHToj0BpeAt
         dXW6pK1SHo31+8ZMsP4Id3d0tOIpoh5QvA7dr97d/ssg4DL369lxgGIwg6rZEDqCQH
         Qi2PUOZfv8q94Dr42AWGvTzHKm7Q5ugLEWtSge3snQ5GfMyiyFpbD8T6E8BSaaAWaX
         aFWVRmifAzPxg==
X-Nifty-SrcIP: [209.85.215.181]
Received: by mail-pg1-f181.google.com with SMTP id d10so8357439pgf.12;
        Wed, 07 Apr 2021 07:33:34 -0700 (PDT)
X-Gm-Message-State: AOAM532uEXuv0PSN21neIU++Bcul40jtifBUL4XF7H0DAJSPgL++kzbD
        1jq8u2AhxOwjnASdXHL7YjrX4DZ2lizvyRl8Un8=
X-Google-Smtp-Source: ABdhPJzRnytYAujPGOJnjw1p4W5q2KPncm6OEVMwxawx6SvO8IHhg09oOhKZzZepE70E0cuuRAeRzZE87+7tSs1yz1o=
X-Received: by 2002:aa7:8814:0:b029:21d:d2ce:7be with SMTP id
 c20-20020aa788140000b029021dd2ce07bemr3016290pfo.80.1617806014220; Wed, 07
 Apr 2021 07:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
In-Reply-To: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 7 Apr 2021 23:32:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAToxp4DDAjJfaa9tsP5Fmep7YorfD7ObyEGtJ6_4ioc_A@mail.gmail.com>
Message-ID: <CAK7LNAToxp4DDAjJfaa9tsP5Fmep7YorfD7ObyEGtJ6_4ioc_A@mail.gmail.com>
Subject: Re: [PATCH] init: add support for zstd compressed modules
To:     Piotr Gorski <lucjan.lucjanov@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 30, 2021 at 8:33 PM Piotr Gorski <lucjan.lucjanov@gmail.com> wrote:
>
> kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.
>
> Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> ---
>  Makefile     | 7 +++++--
>  init/Kconfig | 9 ++++++---
>  2 files changed, 11 insertions(+), 5 deletions(-)



Piort, sorry for bothering you,
but could you rebase on top of this
clean-up patch set?

https://patchwork.kernel.org/project/linux-kbuild/list/?series=458809

or

git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild


The module compression code should not be placed
in the top Makefile.





> diff --git a/Makefile b/Makefile
> index 5160ff8903c1..82f4f4cc2955 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1156,8 +1156,8 @@ endif # INSTALL_MOD_STRIP
>  export mod_strip_cmd
>
>  # CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
> -# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
> -# or CONFIG_MODULE_COMPRESS_XZ.
> +# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP,
> +# CONFIG_MODULE_COMPRESS_XZ, or CONFIG_MODULE_COMPRESS_ZSTD.
>
>  mod_compress_cmd = true
>  ifdef CONFIG_MODULE_COMPRESS
> @@ -1167,6 +1167,9 @@ ifdef CONFIG_MODULE_COMPRESS
>    ifdef CONFIG_MODULE_COMPRESS_XZ
>      mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
>    endif # CONFIG_MODULE_COMPRESS_XZ
> +  ifdef CONFIG_MODULE_COMPRESS_ZSTD
> +    mod_compress_cmd = $(ZSTD) -T0 --rm -f -q
> +  endif # CONFIG_MODULE_COMPRESS_ZSTD
>  endif # CONFIG_MODULE_COMPRESS
>  export mod_compress_cmd
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 8c2cfd88f6ef..86a452bc2747 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2250,8 +2250,8 @@ config MODULE_COMPRESS
>         bool "Compress modules on installation"
>         help
>
> -         Compresses kernel modules when 'make modules_install' is run; gzip or
> -         xz depending on "Compression algorithm" below.
> +         Compresses kernel modules when 'make modules_install' is run; gzip,
> +         xz, or zstd depending on "Compression algorithm" below.
>
>           module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
>
> @@ -2273,7 +2273,7 @@ choice
>           This determines which sort of compression will be used during
>           'make modules_install'.
>
> -         GZIP (default) and XZ are supported.
> +         GZIP (default), XZ, and ZSTD are supported.
>
>  config MODULE_COMPRESS_GZIP
>         bool "GZIP"
> @@ -2281,6 +2281,9 @@ config MODULE_COMPRESS_GZIP
>  config MODULE_COMPRESS_XZ
>         bool "XZ"
>
> +config MODULE_COMPRESS_ZSTD
> +       bool "ZSTD"
> +
>  endchoice
>
>  config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
> --
> 2.31.0.97.g1424303384
>


--
Best Regards
Masahiro Yamada
