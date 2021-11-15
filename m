Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81D0D44FD16
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Nov 2021 03:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229773AbhKOCVa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 14 Nov 2021 21:21:30 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:60123 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229686AbhKOCV3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 Nov 2021 21:21:29 -0500
X-Greylist: delayed 5528 seconds by postgrey-1.27 at vger.kernel.org; Sun, 14 Nov 2021 21:20:56 EST
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 1AF2HPNI005642;
        Mon, 15 Nov 2021 11:17:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 1AF2HPNI005642
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1636942646;
        bh=zc50JpZynEpA7OOKlhPwk+0GNvGQo8rHuZdBYL+q53Q=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=khxVupkACbDQr76B6w9wiQ1s+K0FCF4Lqnd2fP/hjHTWjVfU0tClKPa/WjrnTx7M8
         nVewtUDY6fTLqtj3Oef5giEIlQICZaLAqN9iiBhTUUooDNjp3BIdjDNQp0oVZJDRFn
         ktnJfJpHp4w4Q9cnGBkhOX/XMsB6T5BE2NBU8tGDABlP1yKcQUIQsIiE7wvEeM2TNj
         v1caQp7Cl88Fb+1DkvzRLYV8aoShj6ZvOQNRekbUOGTCgUhgGz9lGw57ycGmL7rBLG
         GpZvWJ9klcwAOMmgauw4kWv3KQLxffXj8Lb/DzHuUPO/4hvhyKylOAiBRBy2LzGlZQ
         vBf+9+NC6A3qA==
X-Nifty-SrcIP: [209.85.216.43]
Received: by mail-pj1-f43.google.com with SMTP id np3so11530095pjb.4;
        Sun, 14 Nov 2021 18:17:25 -0800 (PST)
X-Gm-Message-State: AOAM5312T/03I/5NGvPDJnEvq0Qyrj5vc1wBf4dPhFagRgnrpzFWhyto
        vBWRnowW9vHw8OhPGHtyvARyEF9j73oNOry7Lj8=
X-Google-Smtp-Source: ABdhPJyFikcVi3ql5mZhpThJGUWZwvtHlezWtB27iVfwekznHJ1Oq05ojyhxuOyrcGZmIXNqJDJhl7JPd/gM3LprToM=
X-Received: by 2002:a17:902:c7d5:b0:143:72b7:2ca5 with SMTP id
 r21-20020a170902c7d500b0014372b72ca5mr31119559pla.20.1636942645141; Sun, 14
 Nov 2021 18:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20211114005725.GA27075@embeddedor> <YZF9MY6rRLQwdTgM@archlinux-ax161>
 <YZGnL3nfA5876hX3@archlinux-ax161> <20211115003501.GA43686@embeddedor>
 <CAK7LNAQY4Y-wnY8wQOuHh5eyVdUBGGP58Uu2aZSe+zdxt7km-A@mail.gmail.com> <20211115010001.GA44147@embeddedor>
In-Reply-To: <20211115010001.GA44147@embeddedor>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 15 Nov 2021 11:16:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNASOWJgoSqUgyrz3QLKjw9uj=PXcKEH7AOrwmNA9jNpVGw@mail.gmail.com>
Message-ID: <CAK7LNASOWJgoSqUgyrz3QLKjw9uj=PXcKEH7AOrwmNA9jNpVGw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Add support for -Wimplicit-fallthrough
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Nov 15, 2021 at 9:54 AM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> On Mon, Nov 15, 2021 at 09:44:40AM +0900, Masahiro Yamada wrote:
> > On Mon, Nov 15, 2021 at 9:30 AM Gustavo A. R. Silva
> > <gustavoars@kernel.org> wrote:
> > >
> >
> > Please use a subject prefix different than "kconfig:"
> >
> > I want to see "kconfig:' only for changes in scripts/kconfig/.
>
> How about kbuild for this case, instead?

Sounds good to me.



-- 
Best Regards
Masahiro Yamada
