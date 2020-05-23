Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0681DF7F3
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2020 17:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387888AbgEWPNo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 May 2020 11:13:44 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:64850 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387815AbgEWPNo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 May 2020 11:13:44 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 04NFDCE2003781;
        Sun, 24 May 2020 00:13:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 04NFDCE2003781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590246793;
        bh=xJmXTYj50sybR72Tmu0sL1rVl2NmiVU6DlqCC3wSc0I=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XEiMNJ6DOrq1OLjWkeqGTh/y6ilQV+akPqWRATkxQSSUDvzYdDEMSPFdDdRR6UJa2
         Ch6rFVy8yw36X7KHFHo+H0nIpLYeqNWa8vwYYwxbpuxFcfKJtdQsKZqrOKTeap5WM7
         9uZaB294gE82R1aG7uYZSIBmHLDf+BL3bc5w6oWSPVr3iUKQqt9hslqQy4xCP9V/jI
         brrwhOoBWD5MRAZKqajhiyY/kV++BZRMsAOn9j3aARmAPVf/f5QmO2hDavXkfQqX6Z
         oqQbRYsSBsDHbBxPF9o8sD9bRoqko/kZlTW/bLPsaOFs6DAgGgo4REDCaz2vy6CRca
         sqeR90S4Ar5pA==
X-Nifty-SrcIP: [209.85.221.180]
Received: by mail-vk1-f180.google.com with SMTP id j28so3307909vkn.8;
        Sat, 23 May 2020 08:13:12 -0700 (PDT)
X-Gm-Message-State: AOAM533mGg9TMPNAFwqWFNpy6jTLiifBeGa/YC+jepTp44R7QRbsRxo2
        DSb+FbJZ6vF32UdVcflzw4vZhgJcZnTtg4/syCE=
X-Google-Smtp-Source: ABdhPJxXuyApTJV+/vLVj3aF7laPSePeL/0+ORcYCVzUfZ7CG5bybj9ZaWHd9RNE3Ro9OuD/azIjmmmnjg/T/HhRNKo=
X-Received: by 2002:a1f:1652:: with SMTP id 79mr1180703vkw.26.1590246791400;
 Sat, 23 May 2020 08:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200521202716.193316-1-samitolvanen@google.com>
 <CAK7LNARq3g5vA6vy9449SHsKQmbwJrQDSBz4ZbH1pBEvPmusuA@mail.gmail.com>
 <CAK7LNASm2t-Dkr+p_EWvqf_eoKn5R2iXWuBHnTB9n6MUxr3-pQ@mail.gmail.com> <1590226253.lnkg0jun9x.astroid@bobo.none>
In-Reply-To: <1590226253.lnkg0jun9x.astroid@bobo.none>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 24 May 2020 00:12:35 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
Message-ID: <CAK7LNAR_-q3jhaUzDpkC3ej_DpAerzMsORT-tFw_3AwX7xM0Yw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
To:     Nicholas Piggin <npiggin@gmail.com>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Sami Tolvanen <samitolvanen@google.com>,
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

Hi Nicholas,
(+CC: Sam Ravnborg)


On Sat, May 23, 2020 at 7:06 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Masahiro Yamada's message of May 23, 2020 3:44 am:
> > + Michael, and PPC ML.
> >
> > They may know something about the reason of failure.
>
> Because the linker can't put branch stubs within object code sections,
> so when you incrementally link them too large, the linker can't resolve
> branches into other object files.


Ah, you are right.

So, this is a problem not only for PPC
but also for ARM (both 32 and 64 bit), etc.

ARM needs to insert a veneer to jump far.

Prior to thin archive, we could not compile
ARCH=arm allyesconfig because
drivers/built-in.o was too large.

This patch gets us back to the too large
incremental object situation.

With my quick compile-testing,
ARCH=arm allyesconfig
and ARCH=arm64 allyesconfig are broken.


> This is why we added incremental linking in the first place. I suppose
> it could be made conditional for platforms that can use this
> optimization.
>
> What'd be really nice is if we could somehow build and link kallsyms
> without relinking everything twice, and if we could do section mismatch
> analysis without making that vmlinux.o as well. I had a few ideas but
> not enough time to do much work on it.


Right, kallsyms links 3 times. (not twice)


Hmm, I think Sami's main motivation is Clang LTO.

LTO is very time-consuming.
So, the android common kernel implements Clang LTO
in the pre modpost stage:


1) LTO against vmlinux.o

2) modpost against vmlinux.o

3) Link vmlinux.o + kallsyms into vmlinux
   (this requires linking 3 times)



If we move LTO to 3), we need to do LTO 3 times.

And, this was how GCC LTO was implemented in 2014,
(then rejected by Linus).


How to do modpost without making vmlinux.o ?

In old days, the section mismatch analysis was done
against the final vmlinux.


85bd2fddd68e757da8e1af98f857f61a3c9ce647 changed
it to run modpost for individual .o files.

Then, 741f98fe298a73c9d47ed53703c1279a29718581
introduced vmlinux.o to use it for modpost.


The following two commits.
I did not fully understand the background, though.

I CC'ed Sam in case he may add some comments.





commit 85bd2fddd68e757da8e1af98f857f61a3c9ce647
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Mon Feb 26 15:33:52 2007 +0100

    kbuild: fix section mismatch check for vmlinux

    vmlinux does not contain relocation entries which is
    used by the section mismatch checks.
    Reported by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>

    Use the individual objects as inputs to overcome
    this limitation.
    In modpost check the .o files and skip non-ELF files.

    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>





commit 741f98fe298a73c9d47ed53703c1279a29718581
Author: Sam Ravnborg <sam@ravnborg.org>
Date:   Tue Jul 17 10:54:06 2007 +0200

    kbuild: do section mismatch check on full vmlinux

    Previously we did do the check on the .o files used to link
    vmlinux but that failed to find questionable references across
    the .o files.
    Create a dedicated vmlinux.o file used only for section mismatch checks
    that uses the defualt linker script so section does not get renamed.

    The vmlinux.o may later be used as part of the the final link of vmlinux
    but for now it is used fo section mismatch only.
    For a defconfig build this is instant but for an allyesconfig this
    add two minutes to a full build (that anyways takes ~2 hours).

    Signed-off-by: Sam Ravnborg <sam@ravnborg.org>












>
> Thanks,
> Nick
>
> >
> >
> > On Sat, May 23, 2020 at 2:41 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >>
> >> On Fri, May 22, 2020 at 5:27 AM Sami Tolvanen <samitolvanen@google.com> wrote:
> >> >
> >> > Instead of linking all compilation units again each time vmlinux_link is
> >> > called, reuse vmlinux.o from modpost_link.
> >> >
> >> > With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> >> > vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> >> > in the time spent in vmlinux_link).
> >> >
> >> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> >> > ---
> >> >  scripts/link-vmlinux.sh | 5 +----
> >> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >> >
> >> > diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> >> > index d09ab4afbda4..c6cc4305950c 100755
> >> > --- a/scripts/link-vmlinux.sh
> >> > +++ b/scripts/link-vmlinux.sh
> >> > @@ -77,11 +77,8 @@ vmlinux_link()
> >> >
> >> >         if [ "${SRCARCH}" != "um" ]; then
> >> >                 objects="--whole-archive                        \
> >> > -                       ${KBUILD_VMLINUX_OBJS}                  \
> >> > +                       vmlinux.o                               \
> >> >                         --no-whole-archive                      \
> >> > -                       --start-group                           \
> >> > -                       ${KBUILD_VMLINUX_LIBS}                  \
> >> > -                       --end-group                             \
> >> >                         ${@}"
> >> >
> >> >                 ${LD} ${KBUILD_LDFLAGS} ${LDFLAGS_vmlinux}      \
> >> >
> >> > base-commit: b85051e755b0e9d6dd8f17ef1da083851b83287d
> >> > --
> >> > 2.27.0.rc0.183.gde8f92d652-goog
> >> >
> >>
> >>
> >> I like this patch irrespective of CLANG_LTO, but
> >> unfortunately, my build test failed.
> >>
> >>
> >> ARCH=powerpc failed to build as follows:
> >>
> >>
> >>
> >>   MODPOST vmlinux.o
> >>   MODINFO modules.builtin.modinfo
> >>   GEN     modules.builtin
> >>   LD      .tmp_vmlinux.kallsyms1
> >> vmlinux.o:(__ftr_alt_97+0x20): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+4b1c
> >> vmlinux.o:(__ftr_alt_97+0x164): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+1cf78
> >> vmlinux.o:(__ftr_alt_97+0x288): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+1dac4
> >> vmlinux.o:(__ftr_alt_97+0x2f0): relocation truncated to fit:
> >> R_PPC64_REL14 against `.text'+1e254
> >> make: *** [Makefile:1125: vmlinux] Error 1
> >>
> >>
> >>
> >> I used powerpc-linux-gcc
> >> available at
> >> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/9.2.0/
> >>
> >>
> >> Build command:
> >>
> >> make -j24 ARCH=powerpc  CROSS_COMPILE=powerpc-linux-  defconfig all
> >>
> >>
> >> Could you check it please?
> >>
> >>
> >>
> >> I will apply it to my test branch.
> >> Perhaps, 0-day bot may find more failure cases.
> >>
> >>
> >> --
> >> Best Regards
> >> Masahiro Yamada
> >
> >
> >
> > --
> > Best Regards
> > Masahiro Yamada
> >



--
Best Regards
Masahiro Yamada
