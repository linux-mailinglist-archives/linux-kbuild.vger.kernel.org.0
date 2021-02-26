Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F51B326533
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Feb 2021 17:04:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhBZQE2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 11:04:28 -0500
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33605 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229915AbhBZQE0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 11:04:26 -0500
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 11QG2siE015402;
        Sat, 27 Feb 2021 01:02:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 11QG2siE015402
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614355375;
        bh=8j0Ze921wbGXQAuaG7gMVtTKBTCVeH8BFJy61xBEP9Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e5u5CidM19nmLu991NaCLy64wKVWMD+vtVRa/f2Z81hWFUO9qhzNsrfMuLYTKY/fG
         UyNqSVfF9ro/0JYf78I5N6x9Uq4MRIB6egqAdNMUUXGq80AFxqTLHewsOTWf2Wh/XP
         WUFuqKt7n+fFaIOEjdliI/yWItafLCJYekbcda85g5pXjm+km+9ZDNP+/TL+hW3i8Z
         iotgextVjsXGAYhIgM8M/yt9gUVkzuLA5Q1IvCt0ZQfsWo2t6WjaOzeBBbDUdJTQPa
         W5Xm6oyV0RBvOl7R74v3bO3y4lsLrQxf2IGAJPV93aNujK4D77n4atxUY0Kj42Fgyq
         lMsI4tX+HvilA==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id n10so6449173pgl.10;
        Fri, 26 Feb 2021 08:02:54 -0800 (PST)
X-Gm-Message-State: AOAM530QRWYkThP1CK1enhI4eYQuz9Dy2nFKunLmNBiPpNCcxmxPmfuh
        HjGMNOGSN2d92aXyKLp2ko/EvwMadeaW5s9jSoE=
X-Google-Smtp-Source: ABdhPJzagjyLLC9CISdik0AnO1ynuPjXffY/Np8yFsTj0zTkuff9TXl1Xy8eVL5XmDvuPnwjrACT4EqJYQvX6yNg07E=
X-Received: by 2002:a63:dd49:: with SMTP id g9mr3546859pgj.175.1614355373895;
 Fri, 26 Feb 2021 08:02:53 -0800 (PST)
MIME-Version: 1.0
References: <20210226155142.2909545-1-geert@linux-m68k.org>
In-Reply-To: <20210226155142.2909545-1-geert@linux-m68k.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 27 Feb 2021 01:02:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQnk2=4e_A0qd5Ke43DCMbpLRv45ydu81CGxr=JGc7s+g@mail.gmail.com>
Message-ID: <CAK7LNAQnk2=4e_A0qd5Ke43DCMbpLRv45ydu81CGxr=JGc7s+g@mail.gmail.com>
Subject: Re: [PATCH v3] f2fs: compress: Allow modular (de)compression algorithms
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

On Sat, Feb 27, 2021 at 12:51 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
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
> As modular dependency propagation through intermediate symbols is
> obscure, fix this in a robust way by moving the selection of tristate
> (de)compression algorithms from the boolean compression options to the
> tristate main F2FS_FS option.
>
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



> ---
> v3:
>   - Drop redundant selects (F2FS_FS_LZORLE depends on F2FS_FS_LZO),
>
> v2:
>   - Move the selects to F2FS_FS instead of adding direct dependencies
>     on F2FS_FS.
> ---
>  fs/f2fs/Kconfig | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 62e638a49bbf089a..7669de7b49cea189 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -7,6 +7,13 @@ config F2FS_FS
>         select CRYPTO_CRC32
>         select F2FS_FS_XATTR if FS_ENCRYPTION
>         select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
> +       select LZ4_COMPRESS if F2FS_FS_LZ4
> +       select LZ4_DECOMPRESS if F2FS_FS_LZ4
> +       select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
> +       select LZO_COMPRESS if F2FS_FS_LZO
> +       select LZO_DECOMPRESS if F2FS_FS_LZO
> +       select ZSTD_COMPRESS if F2FS_FS_ZSTD
> +       select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>         help
>           F2FS is based on Log-structured File System (LFS), which supports
>           versatile "flash-friendly" features. The design has been focused on
> @@ -94,8 +101,6 @@ config F2FS_FS_COMPRESSION
>  config F2FS_FS_LZO
>         bool "LZO compression support"
>         depends on F2FS_FS_COMPRESSION
> -       select LZO_COMPRESS
> -       select LZO_DECOMPRESS
>         default y
>         help
>           Support LZO compress algorithm, if unsure, say Y.
> @@ -103,8 +108,6 @@ config F2FS_FS_LZO
>  config F2FS_FS_LZ4
>         bool "LZ4 compression support"
>         depends on F2FS_FS_COMPRESSION
> -       select LZ4_COMPRESS
> -       select LZ4_DECOMPRESS
>         default y
>         help
>           Support LZ4 compress algorithm, if unsure, say Y.
> @@ -113,7 +116,6 @@ config F2FS_FS_LZ4HC
>         bool "LZ4HC compression support"
>         depends on F2FS_FS_COMPRESSION
>         depends on F2FS_FS_LZ4
> -       select LZ4HC_COMPRESS
>         default y
>         help
>           Support LZ4HC compress algorithm, LZ4HC has compatible on-disk
> @@ -122,8 +124,6 @@ config F2FS_FS_LZ4HC
>  config F2FS_FS_ZSTD
>         bool "ZSTD compression support"
>         depends on F2FS_FS_COMPRESSION
> -       select ZSTD_COMPRESS
> -       select ZSTD_DECOMPRESS
>         default y
>         help
>           Support ZSTD compress algorithm, if unsure, say Y.
> @@ -132,8 +132,6 @@ config F2FS_FS_LZORLE
>         bool "LZO-RLE compression support"
>         depends on F2FS_FS_COMPRESSION
>         depends on F2FS_FS_LZO
> -       select LZO_COMPRESS
> -       select LZO_DECOMPRESS
>         default y
>         help
>           Support LZO-RLE compress algorithm, if unsure, say Y.
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
