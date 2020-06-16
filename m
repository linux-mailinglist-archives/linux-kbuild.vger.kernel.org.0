Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 041121FA6A2
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2020 05:23:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgFPDXM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jun 2020 23:23:12 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:56385 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725978AbgFPDXL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jun 2020 23:23:11 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 05G3Mwxa012301;
        Tue, 16 Jun 2020 12:22:59 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 05G3Mwxa012301
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1592277779;
        bh=2/462jbz7jQVLiDVVWzKKcGk4qeztCSU3uhhsd45JF4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=wYYIk0FO0sb92e2n/k8NDpk1fopYb/hY4bojA+HZaTpXZg8QWF10eTYMBVFJzMMts
         f6EP6j6l/ayQFmsSHbv35ZUgEO5uZBLAiG+yQ3qkg5VNjtCekxFiQxOuCZdOkn6Biv
         J88nBCSBkcZX7wW+UcHl+pvbb6APUvlSs97EBsX4+eQbtoMorRPN72yAiHi/9u4yk1
         edXCX7WUDLOUIPyLAlUy8+5+TK/+ZysRuznDOeFpo4usH05y5bIyRCBh6EQ2JhBNho
         WBI473G6N9PPZ84EIDgMSY6irJ5wRVKJ2ZigU9k80QpP0XLXVIZhTnGMZF4OE4l6f9
         xG3ihqbqga5Gw==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id w20so6445108uaa.2;
        Mon, 15 Jun 2020 20:22:58 -0700 (PDT)
X-Gm-Message-State: AOAM533pHBxPPJ0xc5NiMdpyvCYz9z5D0/lwYDhk/VXSv8/bEbdpDhHN
        4pM7elSAiqT/YiK3NE58KMRnSkgprnupwuXWjOw=
X-Google-Smtp-Source: ABdhPJylS2uk1OU4K6oY6oUB9JpzLgAK28MZHSy9Ieuy0bzPvPbnNVm5vCKIc+H1HptOGXkvcNfJXLqC1s/sVZgEnTE=
X-Received: by 2002:ab0:156d:: with SMTP id p42mr462901uae.121.1592277777648;
 Mon, 15 Jun 2020 20:22:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
 <1590226253.lnkg0jun9x.astroid@bobo.none> <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
 <CABCJKufaMU1z-s4S+dHhg0iCyVynLGwsFJgYnYyiBaR=mZt-8w@mail.gmail.com>
In-Reply-To: <CABCJKufaMU1z-s4S+dHhg0iCyVynLGwsFJgYnYyiBaR=mZt-8w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 16 Jun 2020 12:22:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com>
Message-ID: <CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 16, 2020 at 6:47 AM Sami Tolvanen <samitolvanen@google.com> wrote:
>
> On Sat, May 23, 2020 at 8:13 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > Hi Nicholas,
> > (+CC: Sam Ravnborg)
> >
> >
> > On Sat, May 23, 2020 at 7:06 PM Nicholas Piggin <npiggin@gmail.com> wrote:
> > >
> > > Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> > > > + Michael, and PPC ML.
> > > >
> > > > They may know something about the reason of failure.
> > >
> > > Because the linker can't put branch stubs within object code sections,
> > > so when you incrementally link them too large, the linker can't resolve
> > > branches into other object files.
> >
> >
> > Ah, you are right.
> >
> > So, this is a problem not only for PPC
> > but also for ARM (both 32 and 64 bit), etc.
> >
> > ARM needs to insert a veneer to jump far.
> >
> > Prior to thin archive, we could not compile
> > ARCH=arm allyesconfig because
> > drivers/built-in.o was too large.
> >
> > This patch gets us back to the too large
> > incremental object situation.
> >
> > With my quick compile-testing,
> > ARCH=arm allyesconfig
> > and ARCH=arm64 allyesconfig are broken.
>
> Thanks for looking into this! Clang doesn't appear to have this issue
> with LTO because it always enables both -ffunction-sections and
> -fdata-sections. I confirmed that -ffunction-sections also fixes arm64
> allyesconfig with this patch. While I'm fine with reusing vmlinux.o
> only with LTO, how would you feel about enabling -ffunction-sections
> in the kernel by default?


I am OK if it works.

Please do compile tests for some architectures.
(especially, ARCH=powerpc defconfig, and ARCH=arm(64) allyesconfig)


Thank you.




-- 
Best Regards
Masahiro Yamada
