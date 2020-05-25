Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718321E06BD
	for <lists+linux-kbuild@lfdr.de>; Mon, 25 May 2020 08:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726572AbgEYGOC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 25 May 2020 02:14:02 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:29996 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729125AbgEYGOC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 25 May 2020 02:14:02 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 04P6DftV011010;
        Mon, 25 May 2020 15:13:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 04P6DftV011010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590387222;
        bh=oENAvSU374xQl925hQWWrFTQfS/J2U0fWJOwnfp1JZM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gY6qMMgyC9ptd9cxKW7s/cReF1LuMEWAwdLOgytXCN8mP3JXQF22E0Gf62mzumEFx
         oMt75M5Gjv2d7KgNvaYXa5VMBC+PYpmPoJyBYHrTqvOWDn5dFB5oMVR1ozyfZ5tFDE
         ZxmICLuiwiBRNrLKuTWO6bOWo4R5mjc9xjSUmgYid1dFPN3VgDy7boq4+jmD/RDLcw
         17FxreBOVpJIfF7+wm2BsbPDPY4uzNLb5TdJXwNq2IDT/XtSqrb415C6gBRxSInT3c
         SU4kbErUj8LeL6C6G6J53LbKrzsv0egeNQ9UPMyaVxzqSee9mkl4ACDeMpGdtp/iy0
         XaxwOy+5xidcQ==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id l15so9376776vsr.3;
        Sun, 24 May 2020 23:13:41 -0700 (PDT)
X-Gm-Message-State: AOAM531xNXFa4UUih0OyQRbqBSoRcuP7bSk2x4IGr1m1DJKMTb8Clp33
        m5zYKUq4/NEE0dHw/Pp012mLm1QZI1YqeKLRhEY=
X-Google-Smtp-Source: ABdhPJwhygBmEYDbMBYsZQ9wkj1QmW/2tf70n5T8CJ/9qywv1nCjnFTQWJvZprdvc+EugW2Am2wLdFzoU//9qDS4AIA=
X-Received: by 2002:a67:d016:: with SMTP id r22mr16696665vsi.215.1590387220542;
 Sun, 24 May 2020 23:13:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com>
 <1590226253.lnkg0jun9x.astroid@bobo.none> <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
 <20200523165355.GA5570@ravnborg.org>
In-Reply-To: <20200523165355.GA5570@ravnborg.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 25 May 2020 15:13:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATwkmndM9yOV2=ytnGnSh5hS3dH3pdz-Yun00uFPa8j+Q@mail.gmail.com>
Message-ID: <CAK7LNATwkmndM9yOV2=ytnGnSh5hS3dH3pdz-Yun00uFPa8j+Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     Nicholas Piggin <npiggin@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sami Tolvanen <samitolvanen@google.com>,
        Kees Cook <keescook@chromium.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Sam,

Thanks for the comments.

On Sun, May 24, 2020 at 1:54 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Masahiro.
>
> On Sun, May 24, 2020 at 12:12:35AM +0900, Masahiro Yamada wrote:
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
> >
> >
> > > This is why we added incremental linking in the first place. I suppose
> > > it could be made conditional for platforms that can use this
> > > optimization.
> > >
> > > What'd be really nice is if we could somehow build and link kallsyms
> > > without relinking everything twice, and if we could do section mismatch
> > > analysis without making that vmlinux.o as well. I had a few ideas but
> > > not enough time to do much work on it.
> >
> >
> > Right, kallsyms links 3 times. (not twice)
> >
> >
> > Hmm, I think Sami's main motivation is Clang LTO.
> >
> > LTO is very time-consuming.
> > So, the android common kernel implements Clang LTO
> > in the pre modpost stage:
> >
> >
> > 1) LTO against vmlinux.o
> >
> > 2) modpost against vmlinux.o
> >
> > 3) Link vmlinux.o + kallsyms into vmlinux
> >    (this requires linking 3 times)
>
> We have kallsyms we had to link three times because the linking
> increased the object a little in size so symbols did not match.
> The last time was added more or less only to check that we did
> have stable symbol addresses.


Usually vmlinux_link is invoked 3 times if CONFIG_KALLSYMS=y.

(kallsyms_step 1, kallsyms_step 2, and final vmlinux_link)

If the elf size does not match after kallsyms_step 2,
kallsyms_step 3 is invoked.

So, 4 times including the extra check pass.

If CONFIG_DEBUG_INFO_BTF=y, vmlinux_link is invoked
one more time.

So, linked 5 times at most.



>
> All this predates LTO stuff which we only introduced later.
>
> The reason for doing modpost on vmlinux.o was that we had cases
> where everything in drivers/ was fine but there was section mismatch
> references from arch/* to drivers/*
> This is back when there were much more drivers in arch/ than what we
> have today.
> And back then we also had much more to check ad we had cPU hotplug
> that could really cause section mismatches - this is no longer the case
> which is a good thing.
>
>
>
> ...
> >
> > The following two commits.
> > I did not fully understand the background, though.
> >
> > I CC'ed Sam in case he may add some comments.
> >
> > commit 85bd2fddd68e757da8e1af98f857f61a3c9ce647
> > Author: Sam Ravnborg <sam@ravnborg.org>
> > Date:   Mon Feb 26 15:33:52 2007 +0100
> >
> >     kbuild: fix section mismatch check for vmlinux
> >
> >     vmlinux does not contain relocation entries which is
> >     used by the section mismatch checks.
> >     Reported by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
> >
> >     Use the individual objects as inputs to overcome
> >     this limitation.
> >     In modpost check the .o files and skip non-ELF files.
> >
> >     Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>
>
> So we checked vmlinx - but vmlinx did have too much stripped away.
> so in reality nothing was checked.
> To allow the warnings to be as precise as possible move the checks
> out to the indovidual .o files.
> Sometimes the names was mangled a little so if warnigns was only
> reported on vmlinx level in could be difficult to track down the
> offender.
> This would then also do the check on .o files that had all the
> relocation symbols rtequired.
>
> >
> > commit 741f98fe298a73c9d47ed53703c1279a29718581
> > Author: Sam Ravnborg <sam@ravnborg.org>
> > Date:   Tue Jul 17 10:54:06 2007 +0200
> >
> >     kbuild: do section mismatch check on full vmlinux
> >
> >     Previously we did do the check on the .o files used to link
> >     vmlinux but that failed to find questionable references across
> >     the .o files.
> >     Create a dedicated vmlinux.o file used only for section mismatch checks
> >     that uses the defualt linker script so section does not get renamed.
> >
> >     The vmlinux.o may later be used as part of the the final link of vmlinux
> >     but for now it is used fo section mismatch only.
> >     For a defconfig build this is instant but for an allyesconfig this
> >     add two minutes to a full build (that anyways takes ~2 hours).
> >
> >     Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>
> But when we introduced check of the individual .o fiules we missed when
> the references spanned outside the .o files as explained previously.
> So included a link of vmlinx.o that did NOT drop the relocations
> so we could use it to check for the remaining section mismatch warnings.
>
> Remember - back when we started this we had many hundred warnings
> and it was a fight to keep that number low.
> But we also wanted to report as much as possible.
>
> There was back then several discussions if this was really worth the
> effort. How much was gained from discarding the memory where the
> section mismatch warnigns was triggered.
> In other words - how about just keeping the init code in memory so there
> were no illegal references anymore.
> That is something that is maybe worth to consiuder again as we have even
> less memory we save by throwing away the init code.
> But I think this is a topic for another mail thread.


I am not sure if we want to go as far as stop doing __init.
I want to reuse memory after initialization.

Anyway, the section mismatch checks highly rely on
REL or RELA.

The REL(A) sections do not exist in the final vmlinux,
or is useless at least. So, it does not work for most of
architectures.

If we use individual .o files, modpost cannot check
function calls to a different object file.

So, the conclusion is we definitely need vmlinux.o for section
mismatch checks.




--
Best Regards
Masahiro Yamada
