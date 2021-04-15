Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6783360385
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 09:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhDOHkP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 03:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231429AbhDOHkO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 03:40:14 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7461C06175F
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 00:39:51 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id z8so26017243ljm.12
        for <linux-kbuild@vger.kernel.org>; Thu, 15 Apr 2021 00:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xMBHOqRNLVRMS07iUqFEuZb5xzgm/L59GDWK4D2fxw4=;
        b=leylOg12nQE524kr0iJBrc+3WKLv4y/Hr5k7IgmS9wIeRIoKk3K3kBQZ+l1u5onlWf
         7hMszo1+KSbkquXbRUDMs0h5PriyyDK0btcwTDupomKAB6Y8Ris9NqziYPOH8qt5xXxE
         Bo3vY6j9/lbvx0S28JJMgof1BZSn3j1xLx8q7e2JEs0I3ukRVBOTdrvjFwvU/5SZ0RyD
         E3ettyogrKmL23WA9z2PVGh1nLHj0wLLTLJV13LeGvvp8MXof54Ngv7h9xlqHfGiK3fv
         t1RAupcbqj5JhAV1oF3ZyQoqcoBWL2CyNacOtLXajyqgnMSm9Xf/KugQ8R73+oXSdwNW
         ycLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xMBHOqRNLVRMS07iUqFEuZb5xzgm/L59GDWK4D2fxw4=;
        b=t/tb2pF3yS4C26tb2r/NikTEd22yf2Ui/PTFebEVGah76nF3lqQGxRQl4GGOHm+E0v
         CzOoWTiL5P90MbWaSmbaBQiVBSLqhymc3+T9Rh6kc5rPP/G51VS+w8ejF3HbgOmvI8RI
         AUx8z2KGYBAIXd123xjVemEg6vklk5l7SBG2p7VIxkfN9L8cbsoh5ziqkWo0bhoEizEV
         3yNQYMVjTWXs+w/t3rsJlrJ/P3SWCuHn+LI8YgGR3P4XmQK4o9OO5wK+AI3SrCEGMUtu
         2j41iqvZwn5h+kZgh8tenomkSLzZtH3rCP670N6eh2fJ9gZmE7psqZedPO+Of1W6/qc/
         vfAQ==
X-Gm-Message-State: AOAM532GgPPx9ZT8J+BlGLP+AGy335EpIfe2Zh7clH7MuAlBylO/4L4a
        KKNU84XXAm9vIJwJK8k6v1KSCkgSxOAL28lx1H3Fvg==
X-Google-Smtp-Source: ABdhPJzKJCLVxMyPPIOdJxtB78ccCcPVTYA4Gw6TmU/x85vr96OM7FRzJcBabBmcCKR2n70fjgFYyOGv9iShj4W78Ek=
X-Received: by 2002:a2e:968a:: with SMTP id q10mr1048369lji.0.1618472389953;
 Thu, 15 Apr 2021 00:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
 <CAKwvOd=Vo3wwm-egc6fTa7gD4dsrc77OvBhUy8e+VM=LujRCfg@mail.gmail.com> <YHfm+tCYp+I1C5I/@kroah.com>
In-Reply-To: <YHfm+tCYp+I1C5I/@kroah.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 15 Apr 2021 00:39:38 -0700
Message-ID: <CAKwvOdmx1whzPhofkPZ3GXgjDqV4=xQ5Ph_VX_eM+bqBZE1rFA@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 12:10 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 14, 2021 at 04:24:45PM -0700, Nick Desaulniers wrote:
> > On Wed, Apr 14, 2021 at 12:35 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > >
> > > On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
> > > >
> > > > From: Miguel Ojeda <ojeda@kernel.org>
> > > >
> > > > A set of Rust modules that showcase how Rust modules look like
> > > > and how to use the abstracted kernel features.
> > >
> > > Honestly, I'd like to see a real example. This is fine for testing,
> > > but I'd like to see something a bit more real, and a bit less special
> > > than the Android "binder" WIP that comes a few patches later.
> > >
> > > Would there be some kind of real driver or something that people could
> > > use as a example of a real piece of code that actually does something
> > > meaningful?
> >
> > Are you suggesting that they "rewrite it in Rust?" :^P *ducks*
>
> Well, that's what they are doing here with the binder code :)

I know, but imagine the meme magic if Linus said literally that!
Missed opportunity.

> Seriously, binder is not a "normal" driver by any means, the only way
> you can squint at it and consider it a driver is that it has a char
> device node that it uses to talk to userspace with.  Other than that,
> it's very stand-alone and does crazy things to kernel internals, which
> makes it a good canidate for a rust rewrite in that it is easy to
> benchmark and no one outside of one ecosystem relies on it.
>
> The binder code also shows that there is a bunch of "frameworks" that
> need to be ported to rust to get it to work, I think the majority of the
> rust code for binder is just trying to implement core kernel things like
> linked lists and the like.  That will need to move into the rust kernel
> core eventually.
>
> The binder rewrite here also is missing a number of features that the
> in-kernel binder code has gotten over the years, so it is not
> feature-complete by any means yet, it's still a "toy example".
>
> > (sorry, I couldn't help myself) Perhaps it would be a good exercise to
> > demonstrate some of the benefits of using Rust for driver work?
>
> I've been talking with the developers here about doing a "real" driver,
> as the interaction between the rust code which has one set of lifetime
> rules, and the driver core/model which has a different set of lifetime
> rules, is going to be what shows if this actually can be done or not.
> If the two can not successfully be "bridged" together, then there will
> be major issues.
>
> Matthew points out that a nvme driver would be a good example, and I
> have a few other thoughts about what would be good to start with for
> some of the basics that driver authors deal with on a daily basis
> (platform driver, gpio driver, pcspkr driver, /dev/zero replacement), or
> that might be more suited for a "safety critical language use-case" like
> the HID parser or maybe the ACPI parser (but that falls into the rewrite
> category that we want to stay away from for now...)

Sage advice, and it won't hurt to come back with more examples.
Perhaps folks in the Rust community who have been itching to get
involved in developing their favorite operating system might be
interested?

One technique for new language adoption I've seen at Mozilla and
Google has been a moratorium that any code in <newlang> needs to have
a fallback in <oldlang> in case <newlang> doesn't work out.  Perhaps
that would be a good policy to consider; you MAY rewrite existing
drivers in Rust, but you MUST provide a C implementation or ensure one
exists as fallback until further notice.  That might also allay
targetability concerns.

> Let's see what happens here, this patchset is a great start that
> provides the core "here's how to build rust in the kernel build system",
> which was a non-trivial engineering effort.  Hats off to them that "all"
> I had to do was successfully install the proper rust compiler on my
> system (not these developers fault), and then building the kernel code
> here did "just work".  That's a major achievement.

For sure, kudos folks and thanks Greg for taking the time to try it
out and provide feedback plus ideas for more interesting drivers.
-- 
Thanks,
~Nick Desaulniers
