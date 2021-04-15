Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38B743602FF
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 09:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231266AbhDOHLQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 03:11:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:42716 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230118AbhDOHLQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 03:11:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BACD6611AD;
        Thu, 15 Apr 2021 07:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618470653;
        bh=l10X+vv5dBXcCRCNYL3D6TNyby9Y/mbKe5evcjbSDSE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fRu6Pltpvgw1T16C8/s7fBg1XzHMQN24KoKIRaCbHA1fe3Xo0Vl8m5zetxLdUei2P
         Fq5k+6Pdi6WGffZkmhg1bwFLdtHLNImkUHzfyDLaae2P8BqEYlb9cvNyC1TlBi1EzN
         Zv4m5f1Huyww/1N7oQTFjmOsWgxduiKgkZNYa05w=
Date:   Thu, 15 Apr 2021 09:10:50 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
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
Subject: Re: [PATCH 09/13] Samples: Rust examples
Message-ID: <YHfm+tCYp+I1C5I/@kroah.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
 <CAKwvOd=Vo3wwm-egc6fTa7gD4dsrc77OvBhUy8e+VM=LujRCfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=Vo3wwm-egc6fTa7gD4dsrc77OvBhUy8e+VM=LujRCfg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 14, 2021 at 04:24:45PM -0700, Nick Desaulniers wrote:
> On Wed, Apr 14, 2021 at 12:35 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, Apr 14, 2021 at 11:47 AM <ojeda@kernel.org> wrote:
> > >
> > > From: Miguel Ojeda <ojeda@kernel.org>
> > >
> > > A set of Rust modules that showcase how Rust modules look like
> > > and how to use the abstracted kernel features.
> >
> > Honestly, I'd like to see a real example. This is fine for testing,
> > but I'd like to see something a bit more real, and a bit less special
> > than the Android "binder" WIP that comes a few patches later.
> >
> > Would there be some kind of real driver or something that people could
> > use as a example of a real piece of code that actually does something
> > meaningful?
> 
> Are you suggesting that they "rewrite it in Rust?" :^P *ducks*

Well, that's what they are doing here with the binder code :)

Seriously, binder is not a "normal" driver by any means, the only way
you can squint at it and consider it a driver is that it has a char
device node that it uses to talk to userspace with.  Other than that,
it's very stand-alone and does crazy things to kernel internals, which
makes it a good canidate for a rust rewrite in that it is easy to
benchmark and no one outside of one ecosystem relies on it.

The binder code also shows that there is a bunch of "frameworks" that
need to be ported to rust to get it to work, I think the majority of the
rust code for binder is just trying to implement core kernel things like
linked lists and the like.  That will need to move into the rust kernel
core eventually.

The binder rewrite here also is missing a number of features that the
in-kernel binder code has gotten over the years, so it is not
feature-complete by any means yet, it's still a "toy example".

> (sorry, I couldn't help myself) Perhaps it would be a good exercise to
> demonstrate some of the benefits of using Rust for driver work?

I've been talking with the developers here about doing a "real" driver,
as the interaction between the rust code which has one set of lifetime
rules, and the driver core/model which has a different set of lifetime
rules, is going to be what shows if this actually can be done or not.
If the two can not successfully be "bridged" together, then there will
be major issues.

Matthew points out that a nvme driver would be a good example, and I
have a few other thoughts about what would be good to start with for
some of the basics that driver authors deal with on a daily basis
(platform driver, gpio driver, pcspkr driver, /dev/zero replacement), or
that might be more suited for a "safety critical language use-case" like
the HID parser or maybe the ACPI parser (but that falls into the rewrite
category that we want to stay away from for now...)

Let's see what happens here, this patchset is a great start that
provides the core "here's how to build rust in the kernel build system",
which was a non-trivial engineering effort.  Hats off to them that "all"
I had to do was successfully install the proper rust compiler on my
system (not these developers fault), and then building the kernel code
here did "just work".  That's a major achievement.

thanks,

greg k-h
