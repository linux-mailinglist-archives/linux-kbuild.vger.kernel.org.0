Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2B552F9D0F
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 11:47:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388185AbhARKpd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 05:45:33 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36761 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389854AbhARK3s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 05:29:48 -0500
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10IASTTY023252;
        Mon, 18 Jan 2021 19:28:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10IASTTY023252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610965709;
        bh=7R+jrlEFTtM8ivWOebbRe5Tr5JLNwiG3elxHqh7MWEw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RdwhR2sLaIu+zCxJHY1QL8jg5Tkt/TFdSsXeyO/1lAj2qoznF54UDUWbhqYvxoJ30
         DpQjIZ7g4I3SrtUPDd8D1mJJeWa/0ZhtCcdNKdTHc3rRTvUOgBipOw8Bo7rGaYoZBk
         WHeLlc0FDMMfnbEgaFp/IA+P1wBAButgSPzyTvexsGrYoVrT5NvTkLwsTWolsBQu5Y
         53btERbCFttlOOdA8WFb+KBdEoT1i2PohZjr2eaRDwkI+94HGZAQP0deOW6ASEw1wj
         OFshKEmLCajhg0dDm5XVTKmSfVvUI9xUuN5Ce5PJIY5OgT+cR6PpeNP1bTeB6Y34aK
         bGlx+USEvPjRg==
X-Nifty-SrcIP: [209.85.215.170]
Received: by mail-pg1-f170.google.com with SMTP id v19so10631636pgj.12;
        Mon, 18 Jan 2021 02:28:29 -0800 (PST)
X-Gm-Message-State: AOAM531azA980D/HUmH0Kg9ajQmwhyhTvCzIcM45l8GTCV4ufthGmHge
        X43rShpbAHFuYo0N3+LhepofEpbkI6uYNm08pgM=
X-Google-Smtp-Source: ABdhPJw6msd+KxQVIPbbk6AZYgOXkI337Y4pGbvghaGRvAoT2bSh8bv6GWnleW+caZdVst2SxmkIyIbkbEXCKNTZsqE=
X-Received: by 2002:a62:820d:0:b029:1ad:d810:6805 with SMTP id
 w13-20020a62820d0000b02901add8106805mr25588983pfd.63.1610965708553; Mon, 18
 Jan 2021 02:28:28 -0800 (PST)
MIME-Version: 1.0
References: <20210118014951.250815-1-sashal@kernel.org> <YAVTDETPaJuaRPfc@kroah.com>
In-Reply-To: <YAVTDETPaJuaRPfc@kroah.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 18 Jan 2021 19:27:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAStfNj0hvotctFonezQKQSbJfxU1HrwzWmyDc0+68fQ4Q@mail.gmail.com>
Message-ID: <CAK7LNAStfNj0hvotctFonezQKQSbJfxU1HrwzWmyDc0+68fQ4Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Sasha Levin <sashal@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 18, 2021 at 6:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jan 17, 2021 at 08:49:51PM -0500, Sasha Levin wrote:
> > SUBLEVEL only has 8 bits of space, which means that we'll overflow it
> > once it reaches 256.
> >
> > Few of the stable branches will imminently overflow SUBLEVEL while
> > there's no risk of overflowing VERSION.
> >
> > Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
> > should create a better balance between the different version numbers we
> > use.
> >
> > The downside here is that Linus will have 8 bits less to play with, but
> > given our current release cadence (~10 weeks), the number of Linus's
> > fingers & toes (20), and the current VERSION (5) we can calculate that
> > VERSION will overflow in just over 1,000 years, so I'm kicking this can
> > down the road.
> >
> > Cc: stable@kernel.org
> > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > ---
> >  Makefile | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 9e73f82e0d863..dc2bad7a440d8 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1252,8 +1252,8 @@ endef
> >
> >  define filechk_version.h
> >       echo \#define LINUX_VERSION_CODE $(shell                         \
> > -     expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> > -     echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
> > +     expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
> > +     echo '#define KERNEL_VERSION(a,b,c) (((a) << 24) + ((b) << 16) + (c))'
>
> As much as I agree, this will break in-tree users of LINUX_VERSION_CODE
> that try to suck out the version/patchlevel number of the kernel release
> into their own fields.  Things like USB host controller strings, v4l
> ioctl reports, scsi driver ioctls, and other places do fun bit-movements
> to try to unreverse this bit packing.


I can see a checkpatch warning about LINUX_VERSION_CODE.

See line 4528 of scripts/checkpatch.pl


  WARN("LINUX_VERSION_CODE",
       "LINUX_VERSION_CODE should be avoided, code should be for the
version to which it is merged\n" . $herecurr);



It helps external modules to be compiled for multiple kernel versions.

#if KERNEL_VERSION_CODE < KERNEL_VERSION(5, 4, 0)
    code for the kernel versions older than 5.4.0
#endif


The upstream code does not do this.
But, LINUX_VERSION_CODE is actually used in many places...





> So how about we just provide a "real" version/subversion/revision
> #define as well, and clean up all in-kernel users, so we can get this to
> work, and we can change it in the future more easily.
>
> thanks,
>
> greg k-h



-- 
Best Regards
Masahiro Yamada
