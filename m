Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56E67430DD5
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Oct 2021 04:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237252AbhJRC3O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Oct 2021 22:29:14 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20267 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236699AbhJRC3O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 22:29:14 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 19I2Ql7B017729;
        Mon, 18 Oct 2021 11:26:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 19I2Ql7B017729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1634524008;
        bh=CiKo8CHQVDAYWhyEvx7oI0REWtFRrpPJ7yxT1ESbFKg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gaLRaXIfNuPKnPWutWzEdKQpcjA3jnLWOJOmS7BRjbzTc6Fxe+uQrpcSt3jkL35HT
         d4WxqL8R6GBQELN+N5sK7ycgG6d7eoETC4ZrsH8uTvvhSPwFlaFYGbH1JPaMNoXymK
         h++ut5c92z2kWES4R3ehNexoGVAuU7ZXzL7AH/aSylJUWHoh78DlprM9TIA33ipJdc
         +i1GfNR5G4o5RpV4hM/SRBTmN1Y4JRHJML3fVTxDKufhJQQ5Tf7ZmFbLulJDATCRFS
         RmuDBUsCK5OD17YeJDclGJ2QMzaG2xRhVmYLvB3YyMkSyjgl/ZGr+pUPIVw3Bzn7rI
         AOSdzL9hZTy/Q==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id d5so706120pfu.1;
        Sun, 17 Oct 2021 19:26:47 -0700 (PDT)
X-Gm-Message-State: AOAM533S/0oWYZZKBp1NDDf9W/8IPYO1IB/ZW0OIv/lulG76WqK2BPEW
        aY0ejss4OGS2L9nMTFhYP8/CGGUyJ8yMlX+hdOI=
X-Google-Smtp-Source: ABdhPJy9gm8P7B1asPwCiUSjXBUtJ16OpMwhLR6MZDeTRjWK6YoBBOXbASiDe5KBfewnaNhwdyByUY5AidZhLJPoBWw=
X-Received: by 2002:a63:d64c:: with SMTP id d12mr21299144pgj.186.1634524007031;
 Sun, 17 Oct 2021 19:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.22.394.2110172002450.4761@hadrien>
 <7e5485df-a17b-304b-627d-9a85d2464df3@infradead.org> <alpine.DEB.2.22.394.2110172041010.4761@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2110172041010.4761@hadrien>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 18 Oct 2021 11:26:10 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS2H9n9NSpmMk_AkX1N9JRa_5Rk9Sgeguq_9uepzd1f5w@mail.gmail.com>
Message-ID: <CAK7LNAS2H9n9NSpmMk_AkX1N9JRa_5Rk9Sgeguq_9uepzd1f5w@mail.gmail.com>
Subject: Re: build reproducibility
To:     Julia Lawall <julia.lawall@inria.fr>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 18, 2021 at 3:42 AM Julia Lawall <julia.lawall@inria.fr> wrote:
>
>
>
> On Sun, 17 Oct 2021, Randy Dunlap wrote:
>
> > On 10/17/21 11:12 AM, Julia Lawall wrote:
> > > Hello,
> > >
> > > If I do the following:
> > >
> > > git clean -dfx
> > > cp saved_config .config
> > > make olddefconfig && make && make modules_install && make install
> > >
> > > Should I always end up with the same kernel, regardless of the kernel that
> > > is currently running on the machine?
> > >
> > > I see a large performance difference between Linux 5.10 and all versions
> > > afterwards for a particular benchmark.  I am unable to bisect the problem
> > > eg between 5.10 and 5.11, because as soon as I come to a kernel that gives
> > > the bad performance, all of the kernels that I generate subsequently in
> > > the bisecting process (using the above commands) also have the bad
> > > performance.
> > >
> > > It could of course be that I have completely misinterpreted the problem,
> > > and it has nothing to do with the kernel.  But I have tested the program a
> > > lot when only working on variants of Linux 5.9.  I only start to have
> > > problems when I use versions >= 5.11.
> >
> > Hi,
> >
> > My "guess" is that this has something to do with the build
> > reusing some current file(s) that need to be rebuilt.
> > I.e., adding a "make clean" or "make proper" might be needed.
>
> This was my guess too.  But I have the git clean -dfx.  I did a comparison
> with make distclean and this does a little more (mostly some files in
> tools).
>
> thanks,
> julia
>


'git clean -dfx' is a very hard cleaning.
So, you are doing a full build in every step of bisecting.

I have no idea to explain the symptom you observed:
 "as soon as I come to a kernel that gives
 the bad performance, all of the kernels that I generate subsequently in
 the bisecting process"


If you desire perfect reproducibility, you can check
   Documentation/kbuild/reproducible-builds.rst
But, I doubt slight differences such as timestamps
can explain the large performance difference.


If you are chasing the performance issue,
commit cf536e185869d4815 said
CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_*
might be useful to eliminate the possibility
of code alignment.


Otherwise, I have no more idea...






-- 
Best Regards
Masahiro Yamada
