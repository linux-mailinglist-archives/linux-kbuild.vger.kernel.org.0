Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E8D62CBD86
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Dec 2020 13:55:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgLBMzA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Dec 2020 07:55:00 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21995 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727872AbgLBMy7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Dec 2020 07:54:59 -0500
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 0B2CrwPt017022;
        Wed, 2 Dec 2020 21:53:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 0B2CrwPt017022
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1606913639;
        bh=vuORpWynQ+msTy9A4pkjY7EdykIPuUY4fBkBLNdds1I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1nx16JblC790bJmAZ1xYHXKZmc+9fDqZL78J7JuybTSn+d6qi1hgoiwyXKfY9Renl
         ZuBPRQ08/6zgwW86WJuHuFZBVsToZo/KmRMxJa+CrY8iVWSiKxUdlcTnrc/YWJ4/yV
         +aIdXBpEirv7o3ySgJPrHjz/H03t6FITkCRj6s532jnDdVTiEnbYFEgX+2p3mpYVVr
         DGDQcCeHklmU492sTaCON76ZbDFEx1c/sO2FEp/ctz02C6CBrw0QekQSEMR4sipqzL
         cmCvhhdrQYbWGzIh7vuz00Stzj82NvPeVHjjUzg+NgODvXCCQ6gfZh0Qo8fpJMNsni
         x+r1llflpQMCg==
X-Nifty-SrcIP: [209.85.214.172]
Received: by mail-pl1-f172.google.com with SMTP id r2so1081389pls.3;
        Wed, 02 Dec 2020 04:53:59 -0800 (PST)
X-Gm-Message-State: AOAM530G2CaT5n3kCuc2CXzOLyUdANskbNCd5qqIEY1h3k4w/jOs0UUd
        T8I0jC+WqqvwfBr2jRkn/46Hi+YUVUZqn4DU0Y4=
X-Google-Smtp-Source: ABdhPJzMK5zIztsquJ9LK5mqh5a3c9+MhxuXmUXbnBxX8NfGje2IPM6eNOgc2zbjgVpFz60/pBOVwLfSSL/v+BDGPUM=
X-Received: by 2002:a17:90a:5905:: with SMTP id k5mr2288609pji.198.1606913638531;
 Wed, 02 Dec 2020 04:53:58 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
 <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
 <CAHk-=winw=9xh6SmFJPZgi8ngVR-ECTA-kDAAU3DEPLMoUrzVA@mail.gmail.com>
 <CAHk-=wjU4DCuwQ4pXshRbwDCUQB31ScaeuDo1tjoZ0_PjhLHzQ@mail.gmail.com>
 <CAK7LNAQtABssBH2LGThgv-F3_aSrz9Hd-ra9Yyu4-FFzY1nsUw@mail.gmail.com> <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com>
In-Reply-To: <CAHk-=whK0aQxs6Q5ijJmYF1n2ch8cVFSUzU5yUM_HOjig=+vnw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 2 Dec 2020 21:53:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQGHjLYteCt+8BXSY-5CB0gaO1JtHY-SpPFrfdchoHKrQ@mail.gmail.com>
Message-ID: <CAK7LNAQGHjLYteCt+8BXSY-5CB0gaO1JtHY-SpPFrfdchoHKrQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Emese Revfy <re.emese@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Linus,

On Sun, Nov 29, 2020 at 3:28 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Nov 27, 2020 at 11:05 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > As for the cc1plus cost, I got a similar result.
> >
> > Running scripts/gcc-plugin.sh directly
> > took me 0.5 sec, which is a fourth
> > of the allmodconfig run-time.
> >
> > Actually, I did not know this shell script
> > was so expensive to run...
>
> So it turns out that one reason it's so expensive to run is that it
> does a *lot* more than it claims to do.
>
> It says "we need a c++ compiler that supports the designated
> initializer GNU extension", but then it actually includes a header
> file from hell, rather than just test designated initializers.
>
> This patch makes the cc1plus overhead go down a lot. That said, I'm
> doubtful we really want gcc plugins at all, considering that the only
> real users have all apparently migrated to clang builtin functionality
> instead.
>
>         Linus


The attached patch looks OK to me.

Just a nit:
Now that the test code does not include any header,
you can also delete
"-I $srctree/gcc-plugins -I $gccplugins_dir/include"


If you apply it directly, please feel free to add

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



-- 
Best Regards
Masahiro Yamada
