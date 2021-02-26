Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3C4E3261CE
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Feb 2021 12:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhBZLLF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 06:11:05 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:21965 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229556AbhBZLLD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 06:11:03 -0500
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 11QB9oRn021085;
        Fri, 26 Feb 2021 20:09:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 11QB9oRn021085
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1614337791;
        bh=FFT/oqy9Tdm+9fNoO5+/eHYDaXl4/fLpccymluZSbRk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ng2m7mwPpY8FHosFpIjQRL23HwJSs/HPaZn+PfJCJCPFA9TBGv0BUBVq0SYa/uRGO
         PYCM2buRGmWeHmYeKTA7PKdTw2OdwMkTyERzP1LZhTLqbID0NUDJUPj8+XKI9Px/VS
         I4F6hS6Fe8W2Glw6nAtfYG5LAErnIwOfZlCpunX7i7sXDghZvfnA49SAbgPxGwb4O1
         L3/hzRmjUQu1rKGWOcDkUafJJor1XW6IiPgLkL6o9lN6QfihGgwvmUuEHhHRtqfflj
         gr6dgnEQML2r3efkAdt1Tkv51bqOYUJZIGl/dutxoV8PGhHZEx0DaUmyddxayH712U
         kp/RjpWkPf5zg==
X-Nifty-SrcIP: [209.85.215.176]
Received: by mail-pg1-f176.google.com with SMTP id g4so6036003pgj.0;
        Fri, 26 Feb 2021 03:09:50 -0800 (PST)
X-Gm-Message-State: AOAM53343u2ggSGJzMmQt4jUN5lDGr1HkVJTA198jTTiRm02f3uBrmn7
        yHoTjRwdAI/30LdgNn/28WusH3mCCQGuPxdEOhg=
X-Google-Smtp-Source: ABdhPJzp2injQKm4gFYlgJXgvIF1/jHRI4vas5sveZg40W3AXUlCM0Pk/VO4QocCGoho8eCkS8NvSM76sVnXor/tDIQ=
X-Received: by 2002:a62:1412:0:b029:1ec:bc11:31fd with SMTP id
 18-20020a6214120000b02901ecbc1131fdmr2623654pfu.76.1614337790138; Fri, 26 Feb
 2021 03:09:50 -0800 (PST)
MIME-Version: 1.0
References: <20210226100640.2827925-1-geert@linux-m68k.org>
In-Reply-To: <20210226100640.2827925-1-geert@linux-m68k.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 26 Feb 2021 20:09:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNARG+AU2ZBFEo8+tqEGSuS2_yv2QpSc3kVDKtrAw6PRTpA@mail.gmail.com>
Message-ID: <CAK7LNARG+AU2ZBFEo8+tqEGSuS2_yv2QpSc3kVDKtrAw6PRTpA@mail.gmail.com>
Subject: Re: [PATCH v2] f2fs: compress: Allow modular (de)compression algorithms
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Feb 26, 2021 at 7:10 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
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
> ---
> v2:
>   - Move the selects to F2FS_FS instead of adding direct dependencies
>     on F2FS_FS.
> ---
>  fs/f2fs/Kconfig | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
> index 62e638a49bbf089a..cca79029a577151c 100644
> --- a/fs/f2fs/Kconfig
> +++ b/fs/f2fs/Kconfig
> @@ -7,6 +7,15 @@ config F2FS_FS
>         select CRYPTO_CRC32
>         select F2FS_FS_XATTR if FS_ENCRYPTION
>         select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
> +       select LZ4_COMPRESS if F2FS_FS_LZ4
> +       select LZ4_DECOMPRESS if F2FS_FS_LZ4
> +       select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
> +       select LZO_COMPRESS if F2FS_FS_LZO
> +       select LZO_COMPRESS if F2FS_FS_LZORLE

This line is redundant because
F2FS_FS_LZORLE depends on F2FS_FS_LZO.


> +       select LZO_DECOMPRESS if F2FS_FS_LZO
> +       select LZO_DECOMPRESS if F2FS_FS_LZORLE

Ditto.


> +       select ZSTD_COMPRESS if F2FS_FS_ZSTD
> +       select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>         help
>           F2FS is based on Log-structured File System (LFS), which supports
>           versatile "flash-friendly" features. The design has been focused on


-- 
Best Regards
Masahiro Yamada
