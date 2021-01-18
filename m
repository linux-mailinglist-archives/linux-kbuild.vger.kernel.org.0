Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7C402FAAED
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 21:08:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388479AbhARKqD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Jan 2021 05:46:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:45666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390169AbhARKdN (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Jan 2021 05:33:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id A031620784;
        Mon, 18 Jan 2021 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610965952;
        bh=O8rxHjohu5zf7IH0KL94YVasVxp2kmKJRdlQVrIOQwk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ac4oQ0wFZSxiNkrxiliiEGGoz+brl+ws6TptiNTSFKQEOgSLDb7ZsTtybbLLx+6T9
         awYyW9CVCZNYLILoEpTXfUOU1BC8Uwd+ArVVpeYqdO4JRXu2LM/xRQEbpJ9gfNRjJo
         H8oENSXZqN9NL6LIBKlD++FrO4lYzQsM7LRykBr4=
Date:   Mon, 18 Jan 2021 11:32:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Sasha Levin <sashal@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        stable@kernel.org
Subject: Re: [PATCH] kbuild: give SUBLEVEL more room in KERNEL_VERSION
Message-ID: <YAVjvf67ckxwIppN@kroah.com>
References: <20210118014951.250815-1-sashal@kernel.org>
 <YAVTDETPaJuaRPfc@kroah.com>
 <CAK7LNAStfNj0hvotctFonezQKQSbJfxU1HrwzWmyDc0+68fQ4Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAStfNj0hvotctFonezQKQSbJfxU1HrwzWmyDc0+68fQ4Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 18, 2021 at 07:27:51PM +0900, Masahiro Yamada wrote:
> On Mon, Jan 18, 2021 at 6:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sun, Jan 17, 2021 at 08:49:51PM -0500, Sasha Levin wrote:
> > > SUBLEVEL only has 8 bits of space, which means that we'll overflow it
> > > once it reaches 256.
> > >
> > > Few of the stable branches will imminently overflow SUBLEVEL while
> > > there's no risk of overflowing VERSION.
> > >
> > > Thus, give SUBLEVEL 8 more bits which will be stolen from VERSION, this
> > > should create a better balance between the different version numbers we
> > > use.
> > >
> > > The downside here is that Linus will have 8 bits less to play with, but
> > > given our current release cadence (~10 weeks), the number of Linus's
> > > fingers & toes (20), and the current VERSION (5) we can calculate that
> > > VERSION will overflow in just over 1,000 years, so I'm kicking this can
> > > down the road.
> > >
> > > Cc: stable@kernel.org
> > > Signed-off-by: Sasha Levin <sashal@kernel.org>
> > > ---
> > >  Makefile | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 9e73f82e0d863..dc2bad7a440d8 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1252,8 +1252,8 @@ endef
> > >
> > >  define filechk_version.h
> > >       echo \#define LINUX_VERSION_CODE $(shell                         \
> > > -     expr $(VERSION) \* 65536 + 0$(PATCHLEVEL) \* 256 + 0$(SUBLEVEL)); \
> > > -     echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))'
> > > +     expr $(VERSION) \* 16777216 + 0$(PATCHLEVEL) \* 65536 + 0$(SUBLEVEL)); \
> > > +     echo '#define KERNEL_VERSION(a,b,c) (((a) << 24) + ((b) << 16) + (c))'
> >
> > As much as I agree, this will break in-tree users of LINUX_VERSION_CODE
> > that try to suck out the version/patchlevel number of the kernel release
> > into their own fields.  Things like USB host controller strings, v4l
> > ioctl reports, scsi driver ioctls, and other places do fun bit-movements
> > to try to unreverse this bit packing.
> 
> 
> I can see a checkpatch warning about LINUX_VERSION_CODE.
> 
> See line 4528 of scripts/checkpatch.pl
> 
> 
>   WARN("LINUX_VERSION_CODE",
>        "LINUX_VERSION_CODE should be avoided, code should be for the
> version to which it is merged\n" . $herecurr);
> 
> 
> 
> It helps external modules to be compiled for multiple kernel versions.
> 
> #if KERNEL_VERSION_CODE < KERNEL_VERSION(5, 4, 0)
>     code for the kernel versions older than 5.4.0
> #endif
> 
> 
> The upstream code does not do this.
> But, LINUX_VERSION_CODE is actually used in many places...

Yes, it is used in a number of user/kernel apis for various reasons.

And the above patch will break them :(

thanks,

greg k-h
