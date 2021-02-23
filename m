Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 300573225F2
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Feb 2021 07:32:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhBWGcp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 01:32:45 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:19622 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhBWGcj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 01:32:39 -0500
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 11N6VWNQ027721;
        Tue, 23 Feb 2021 15:31:32 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 11N6VWNQ027721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614061892;
        bh=i56WdVsWktzkTtf2ykDokTjRmIRG0eQTLJqtolZ9vCE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dNVFGlgRcBIC59FANfaIVHanyyxPmqNxyCWG36eowAqP8fBjqa1D9yDPJd51M6bYm
         nX5ev5jtATG72y+veg3HsaTqhD499nJsS+Ij/P7v2S+e4rBzJschIKO2tZRGQuav4a
         lUsY0eJh8tXg4PhkLYkD3rVX4piIZvLMkuiInILQjbV2yfPgmTOsxx/qLLZcTeTHGT
         jFNKikCVh9JQ/TUmLOU/c1S0FthQpAEChk7LT1yi0Xbj4D4TbWbq5yotkG4PXTVMwa
         yE0pU85KrSvDzo2PpIoVl1+A/QTAtUm52ApsA8+xSb8qA7oDGpmEVAJM2HC3XMLHrc
         yfRYqJWFQYrHw==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id z7so9217156plk.7;
        Mon, 22 Feb 2021 22:31:32 -0800 (PST)
X-Gm-Message-State: AOAM531hJQWQZS0i/PUoqUjlLD4MTtiZC+4dEZhqWc+ghqvspNfsQuu/
        ATMGLrqyvxfVA2ygijvXEQUV9m29DCXdrVmFr4M=
X-Google-Smtp-Source: ABdhPJx8LCxSkJhDZ9fEucr6DWMc5kde3IXJe9NZMo9kEKJtiYNWeidCR1G8RePwZm8NFIXjoBOzcFv1N8CRuKMGY38=
X-Received: by 2002:a17:90a:5510:: with SMTP id b16mr27655654pji.87.1614061891643;
 Mon, 22 Feb 2021 22:31:31 -0800 (PST)
MIME-Version: 1.0
References: <20210222125916.4168804-1-geert@linux-m68k.org>
In-Reply-To: <20210222125916.4168804-1-geert@linux-m68k.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 23 Feb 2021 15:30:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
Message-ID: <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
Subject: Re: [PATCH] f2fs: compress: Allow modular (de)compression algorithms
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 22, 2021 at 9:59 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> If F2FS_FS is modular, enabling the compressions options
> F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
> algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
> modular, as the former depend on an intermediate boolean
> F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.
>
> Indeed, if a boolean symbol A depends directly on a tristate symbol B
> and selects another tristate symbol C:
>
>     tristate B
>
>     tristate C
>
>     bool A
>       depends on B
>       select C
>
> and B is modular, then C will also be modular.
>
> However, if there is an intermediate boolean D in the dependency chain
> between A and B:
>
>     tristate B
>
>     tristate C
>
>     bool D
>       depends on B
>
>     bool A
>       depends on D
>       select C
>
> then the modular state won't propagate from B to C, and C will be
> builtin instead of modular.
>
> Fix this by making the various compression options depend directly on
> F2FS_FS using a big if/endif block.  Drop the now superfluous
> dependencies on F2FS_FS from individual symbols.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> Perhaps the propagation logic in Kconfig should be fixed instead?
> Else people may reintroduce this issue when removing seemingly-unneeded
> dependencies.

I checked the code in menu_finalize(), and this seems to work like this.

I discussed the oddity of the select behavior before
(https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/),
but I was not confident about what the right direction was.


Anyway, the behavior is obscure from the current code.

If you want to make this more robust,
you can write as follows:

config F2FS_FS
        tristate "F2FS filesystem support"
        depends on BLOCK
        select NLS
        select CRYPTO
        select CRYPTO_CRC32
        select F2FS_FS_XATTR if FS_ENCRYPTION
        select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
        select LZO_COMPRESS if F2FS_FS_LZO
        select LZO_DECOMPRESS if F2FS_FS_LZO
        select LZ4_COMPRESS if F2FS_FS_LZ4
        select LZ4_DECOMPRESS if F2FS_FS_LZ4
        select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
        select ZSTD_COMPRESS if F2FS_FS_ZSTD
        select ZSTD_DECOMPRESS if F2FS_FS_ZSTD

The code is a bit clumsy, but it is clear
that the module (F2FS_FS) is selecting the
compress/decompress libraries.






> ---
>  fs/f2fs/Kconfig | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 62e638a49bbf089a..20a82ecb72b42f84 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -20,9 +20,10 @@ config F2FS_FS
>
>           If unsure, say N.
>
> +if F2FS_FS
> +
>  config F2FS_STAT_FS
>         bool "F2FS Status Information"
> -       depends on F2FS_FS
>         default y
>         help
>           /sys/kernel/debug/f2fs/ contains information about all the partitions
> @@ -35,7 +36,6 @@ config F2FS_STAT_FS
>
>  config F2FS_FS_XATTR
>         bool "F2FS extended attributes"
> -       depends on F2FS_FS
>         default y
>         help
>           Extended attributes are name:value pairs associated with inodes by
> @@ -70,7 +70,6 @@ config F2FS_FS_SECURITY
>
>  config F2FS_CHECK_FS
>         bool "F2FS consistency checking feature"
> -       depends on F2FS_FS
>         help
>           Enables BUG_ONs which check the filesystem consistency in runtime.
>
> @@ -78,7 +77,6 @@ config F2FS_CHECK_FS
>
>  config F2FS_FAULT_INJECTION
>         bool "F2FS fault injection facility"
> -       depends on F2FS_FS
>         help
>           Test F2FS to inject faults such as ENOMEM, ENOSPC, and so on.
>
> @@ -86,7 +84,6 @@ config F2FS_FAULT_INJECTION
>
>  config F2FS_FS_COMPRESSION
>         bool "F2FS compression feature"
> -       depends on F2FS_FS
>         help
>           Enable filesystem-level compression on f2fs regular files,
>           multiple back-end compression algorithms are supported.
> @@ -137,3 +134,5 @@ config F2FS_FS_LZORLE
>         default y
>         help
>           Support LZO-RLE compress algorithm, if unsure, say Y.
> +
> +endif
> --
> 2.25.1
>


--
Best Regards
Masahiro Yamada
