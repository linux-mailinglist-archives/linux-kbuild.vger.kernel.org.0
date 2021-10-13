Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE1342B248
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Oct 2021 03:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhJMBhF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Oct 2021 21:37:05 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:54782 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhJMBhF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Oct 2021 21:37:05 -0400
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 19D1YjgN010005;
        Wed, 13 Oct 2021 10:34:45 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 19D1YjgN010005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634088885;
        bh=Rum5tYvv5Fo1dRwnGCxHyKMZgx+WDyy9BHLvS2hSW2c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b3tYroIrUf8xtVNAyrYAprxjm9+4krBIcXjGTza3sVk7r2PMCI0Dc183TARIT8dCx
         lkOnnIGBXuYTGa6FYHHu4Z5Gay0rp2DgUIMGNG8XRICoYzwjH0kWxOD3KPN3/S/R5I
         mYeOKVlEqMqAKkEAYEJX7ivJ4E+/lXn2QiWIRItMDgwTro1lEoqdxd9UuQ43OpfILi
         0+CWXXwVfBlTcyseBIVKm05vrxZvfqDS0hUBl5W8Ew/dEft8q6nk59LFXAknnTS/Ck
         tHFxAGNBDCl47Aufhv+mrmapYTz0sWbLwLq97uLAjfaCHwA6mN3cXtoosmJoxqeIgm
         sTR97bM8uOE5Q==
X-Nifty-SrcIP: [209.85.215.180]
Received: by mail-pg1-f180.google.com with SMTP id e7so764387pgk.2;
        Tue, 12 Oct 2021 18:34:45 -0700 (PDT)
X-Gm-Message-State: AOAM533OYXo0nbH3fHWJqwk7hnNmY+Jr6dUPeLWBKeovLoU/kO0oux+A
        cvOTAjDhq88z1YPEXQMv28IFVIp7cyCOX6wZj8k=
X-Google-Smtp-Source: ABdhPJx74hz1HXrwV9KFueIsSEub6ZjaQ3PXlDu2yws3N9VLdQgcBUCbjABYJ7am6LjIUW4dReFUoKYAL+gC7pWhfi8=
X-Received: by 2002:a63:3d8f:: with SMTP id k137mr25871214pga.21.1634088884658;
 Tue, 12 Oct 2021 18:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211012170121.31549-1-vegard.nossum@oracle.com>
In-Reply-To: <20211012170121.31549-1-vegard.nossum@oracle.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 13 Oct 2021 10:34:07 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT_0PnW0opWQoCiF5mWH4YEKxXHbdiTrSGqGFRv5nhY=w@mail.gmail.com>
Message-ID: <CAK7LNAT_0PnW0opWQoCiF5mWH4YEKxXHbdiTrSGqGFRv5nhY=w@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: only prompt for compressors that are actually usable
To:     Vegard Nossum <vegard.nossum@oracle.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 13, 2021 at 2:01 AM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
> If a given compression algorithm for the kernel image is not usable on
> the host system, there is no point prompting for it.
>
> We can use the kconfig preprocessing feature to check if the command is
> available or not. I've chosen to test this using "which", which exits
> with success if the given command exists in PATH (or it is an absolute
> path), which mimics exactly how it would be found in the kernel's
> Makefiles.
>
> This uses the make variables that are set in Makefile and/or the
> command line, so you can do e.g.
>
>   make KGZIP=pigz menuconfig
>
> and it will test for the correct program.
>
> I am intentionally adding these dependencies to e.g. KERNEL_LZ4, as
> opposed to HAVE_KERNEL_LZ4, since the latter are "select"-ed
> unconditionally by the architectures that use them, so they are not
> suitable for depending on anything else.
>
> I've put RFC in the subject as maybe there are downsides to this that
> I'm not aware of.
>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---


I think we should keep the host-tools dependency open in general.
You can easily install necessary packages.








>  init/Kconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 11f8a845f259d..f03f2b7962027 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -250,6 +250,7 @@ choice
>  config KERNEL_GZIP
>         bool "Gzip"
>         depends on HAVE_KERNEL_GZIP
> +       depends on $(success,which $(KGZIP))
>         help
>           The old and tried gzip compression. It provides a good balance
>           between compression ratio and decompression speed.
> @@ -257,6 +258,7 @@ config KERNEL_GZIP
>  config KERNEL_BZIP2
>         bool "Bzip2"
>         depends on HAVE_KERNEL_BZIP2
> +       depends on $(success,which $(KBZIP2))
>         help
>           Its compression ratio and speed is intermediate.
>           Decompression speed is slowest among the choices.  The kernel
> @@ -267,6 +269,7 @@ config KERNEL_BZIP2
>  config KERNEL_LZMA
>         bool "LZMA"
>         depends on HAVE_KERNEL_LZMA
> +       depends on $(success,which $(LZMA))
>         help
>           This compression algorithm's ratio is best.  Decompression speed
>           is between gzip and bzip2.  Compression is slowest.
> @@ -275,6 +278,7 @@ config KERNEL_LZMA
>  config KERNEL_XZ
>         bool "XZ"
>         depends on HAVE_KERNEL_XZ
> +       depends on $(success,which $(XZ))
>         help
>           XZ uses the LZMA2 algorithm and instruction set specific
>           BCJ filters which can improve compression ratio of executable
> @@ -290,6 +294,7 @@ config KERNEL_XZ
>  config KERNEL_LZO
>         bool "LZO"
>         depends on HAVE_KERNEL_LZO
> +       depends on $(success,which $(KLZOP))
>         help
>           Its compression ratio is the poorest among the choices. The kernel
>           size is about 10% bigger than gzip; however its speed
> @@ -298,6 +303,7 @@ config KERNEL_LZO
>  config KERNEL_LZ4
>         bool "LZ4"
>         depends on HAVE_KERNEL_LZ4
> +       depends on $(success,which $(LZ4))
>         help
>           LZ4 is an LZ77-type compressor with a fixed, byte-oriented encoding.
>           A preliminary version of LZ4 de/compression tool is available at
> @@ -310,6 +316,7 @@ config KERNEL_LZ4
>  config KERNEL_ZSTD
>         bool "ZSTD"
>         depends on HAVE_KERNEL_ZSTD
> +       depends on $(success,which $(ZSTD))
>         help
>           ZSTD is a compression algorithm targeting intermediate compression
>           with fast decompression speed. It will compress better than GZIP and
> --
> 2.23.0.718.g5ad94255a8
>


-- 
Best Regards
Masahiro Yamada
