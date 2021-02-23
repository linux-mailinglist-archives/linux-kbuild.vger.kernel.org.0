Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2142E322689
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Feb 2021 08:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBWHnW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 23 Feb 2021 02:43:22 -0500
Received: from mail-oi1-f172.google.com ([209.85.167.172]:34446 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230178AbhBWHnT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 23 Feb 2021 02:43:19 -0500
Received: by mail-oi1-f172.google.com with SMTP id w69so7056462oif.1;
        Mon, 22 Feb 2021 23:43:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WJFI5RyzuifHOR96lwKCSFonlTIiLRUIGVDJn5EnP2g=;
        b=YVI/zdRD9Dev8PAgAEBAvI1E2M7HcUH43Y9XF64bQ8EBtz61I9NjypxEIgvOJ8g68A
         A2FE4Ac8RDY2l3o0eEcXBLf0vlHJEbA4fFj6th7Usn4TKJumCYU1EhDnCJ8qWikkpvaG
         tHLhR+J6hgxUcLuCZKUGruAJDO3bUpiak5/Rav2Jb5tQMbHxyiZVvJjoNbXxb/cGwpJS
         ez7EoXtteefdHt+jTsKdBT3KzhxAc+ErGDSRlwXrNfuepWO/Tm2oHV3gvcBVatNG6vze
         FQTm9+kqDbym1SlXxSWdeOSTgNF9m9alnsaM3Jdj3c72SGY+R+40dPp/LVHpNBW9rKH8
         Qkew==
X-Gm-Message-State: AOAM533keDhlCOUV+2SgRewEZHZHxkg4g+pS/ca+JyqHWKsFfXNsW5ZR
        3IUyj3aC5whTlWZaLoTG/TvqIR8Y1geZg2EyQXKZXPxZLUI=
X-Google-Smtp-Source: ABdhPJxwLA+IJ2oFZ0i1C36eBSf9oCeHNZMyyblRWQXyCdK6Xd17NBm7c6MpnurOGmZ/pbWEvX+1HBvWalN3LSvmV8U=
X-Received: by 2002:aca:d908:: with SMTP id q8mr17857257oig.148.1614066157844;
 Mon, 22 Feb 2021 23:42:37 -0800 (PST)
MIME-Version: 1.0
References: <20210222125916.4168804-1-geert@linux-m68k.org> <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
In-Reply-To: <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Feb 2021 08:42:26 +0100
Message-ID: <CAMuHMdX-t4Z27RnWn0Sp1AoO3A=+aT8GXkcGC5gSArtm+W9w1Q@mail.gmail.com>
Subject: Re: [PATCH] f2fs: compress: Allow modular (de)compression algorithms
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-f2fs-devel@lists.sourceforge.net,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Tue, Feb 23, 2021 at 7:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Mon, Feb 22, 2021 at 9:59 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > If F2FS_FS is modular, enabling the compressions options
> > F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
> > algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
> > modular, as the former depend on an intermediate boolean
> > F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.
> >
> > Indeed, if a boolean symbol A depends directly on a tristate symbol B
> > and selects another tristate symbol C:
> >
> >     tristate B
> >
> >     tristate C
> >
> >     bool A
> >       depends on B
> >       select C
> >
> > and B is modular, then C will also be modular.
> >
> > However, if there is an intermediate boolean D in the dependency chain
> > between A and B:
> >
> >     tristate B
> >
> >     tristate C
> >
> >     bool D
> >       depends on B
> >
> >     bool A
> >       depends on D
> >       select C
> >
> > then the modular state won't propagate from B to C, and C will be
> > builtin instead of modular.
> >
> > Fix this by making the various compression options depend directly on
> > F2FS_FS using a big if/endif block.  Drop the now superfluous
> > dependencies on F2FS_FS from individual symbols.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > Perhaps the propagation logic in Kconfig should be fixed instead?
> > Else people may reintroduce this issue when removing seemingly-unneeded
> > dependencies.
>
> I checked the code in menu_finalize(), and this seems to work like this.
>
> I discussed the oddity of the select behavior before
> (https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/),
> but I was not confident about what the right direction was.
>
>
> Anyway, the behavior is obscure from the current code.
>
> If you want to make this more robust,
> you can write as follows:
>
> config F2FS_FS
>         tristate "F2FS filesystem support"
>         depends on BLOCK
>         select NLS
>         select CRYPTO
>         select CRYPTO_CRC32
>         select F2FS_FS_XATTR if FS_ENCRYPTION
>         select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
>         select LZO_COMPRESS if F2FS_FS_LZO
>         select LZO_DECOMPRESS if F2FS_FS_LZO
>         select LZ4_COMPRESS if F2FS_FS_LZ4
>         select LZ4_DECOMPRESS if F2FS_FS_LZ4
>         select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
>         select ZSTD_COMPRESS if F2FS_FS_ZSTD
>         select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>
> The code is a bit clumsy, but it is clear
> that the module (F2FS_FS) is selecting the
> compress/decompress libraries.

Actually the above is what I tried first ;-)  Works fine.

Then I started to look for similar cases in other file systems (e.g.
EROFS_FS_ZIP), and discovered the issue doesn't happen there, which
sparked my investigation.  So I settled on the direct dependency,
because it keeps all compression-related logic together.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
