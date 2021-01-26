Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C728305884
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S313235AbhAZW75 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 17:59:57 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:49989 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726310AbhAZRIg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 12:08:36 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 690C55C0150;
        Tue, 26 Jan 2021 12:06:59 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Tue, 26 Jan 2021 12:06:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=qwfFt3bxRXewj3Ji7WJCSpm5uW3
        lIyqrwINNBr23TDE=; b=LY1MvYt3ENkqtV6DMKveGCYcFZVS9myFqWYKZj9iUMF
        xvVilvSjuUcevCa0oPex8V4sXLAIxT0cT2SxzAHWfo+irTBuybkq6o0XiMlJDtbj
        qh9kZkxgUeWc7ELSv3PJTBR1PAJpvtuA9k2k73Mhd5HxOAs0o/hvjRByjVxe9hcT
        rccpM1I9fMhy2Dhp0takF1F2PdV6Ys19zLWckZcHPlb9NAy5gVDdnvQD4HvoBZ3P
        5AHd6OnoCABpZoR5d5k0Vmr4cUSu7vQAKlW/AXi0/iaS0p4tfrmMS+a04lkdfdmC
        2jOCll1khnre4DFkEIVc99HiC2fc0qs1b0lufojMOzA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=qwfFt3
        bxRXewj3Ji7WJCSpm5uW3lIyqrwINNBr23TDE=; b=DaHDUfNO92aMLUDoEC6Pij
        IWA9jq76jtSSd5Fb4UgczheRT6/ku/u6KISIeiLbjtZFyPQp2kl9soEv8pnPSzg7
        bMZiU9S5Uum1C241WPT7hgGhXdba4TsZf59+emsiI1yw5CkZx2wTxdaU68aeKnny
        Dsn56SIfQGSzi/aGlwF7dsTVrFrrb1M6UqnFjigylswwvIfcpYDWWENAEopo74CN
        F9qgc8nCBItBh2RPkEW1w54QlNKAc+b7Vsxg+Zi923I2+XZBtd92ES81LiqPYpQY
        Wr6inGJjukF1hsmRmQMluWzkM9AXFob1T+k2+rMxALF8EB4agFB1cML5XR8sPM5g
        ==
X-ME-Sender: <xms:MkwQYPe37qAJXFKwS3G_wET_QD0Xg9apJgr3YlWSr2RNYbUWySuACQ>
    <xme:MkwQYFNalhDK2BRvi1-9nOJrxDJaxrv7Ywyay8P6BXWzB3l6hintD26A77-FmSdzw
    3I0O0FeuQ9CBw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeigdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepveeuheejgf
    ffgfeivddukedvkedtleelleeghfeljeeiueeggeevueduudekvdetnecukfhppeekfedr
    keeirdejgedrieegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepghhrvghgsehkrhhorghhrdgtohhm
X-ME-Proxy: <xmx:MkwQYIhfD1tbo2j9y-JjSNT22JjZqi4xK4b9uDDipiUPywXStIivZg>
    <xmx:MkwQYA9Jo9sNvsLe9ihhXsajhgqPcFjlBmX8-EkFa1lsPVw8KE4RUg>
    <xmx:MkwQYLtZQdDQ7qcgrI9wuZ-j0rwZ9ExdH5wHjQiJZBfbPSsMJvIJTQ>
    <xmx:M0wQYE8f52L-vUsl34iZvxR7ojnClQRkd6AOFB0lkdIgdDsqYnjdhQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        by mail.messagingengine.com (Postfix) with ESMTPA id D434A24005C;
        Tue, 26 Jan 2021 12:06:57 -0500 (EST)
Date:   Tue, 26 Jan 2021 18:06:55 +0100
From:   Greg KH <greg@kroah.com>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Justin Forbes <jforbes@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <YBBML2eB/IXcTvcn@kroah.com>
References: <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com>
 <20210126145155.kcfbnzfqg5qugvcl@treble>
 <YBAyGU7H8E98xKng@hirez.programming.kicks-ass.net>
 <20210126154651.itfrnhwfistia3ss@treble>
 <YBA9r13+1uuyDYuR@hirez.programming.kicks-ass.net>
 <CAFbkSA1CibJ6sp+LPLy3hpchLLH2B5__Lk31TLeVThXi5eZV7Q@mail.gmail.com>
 <20210126161934.z6sng4irl5teonvj@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126161934.z6sng4irl5teonvj@treble>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 10:19:34AM -0600, Josh Poimboeuf wrote:
> On Tue, Jan 26, 2021 at 10:15:52AM -0600, Justin Forbes wrote:
> > On Tue, Jan 26, 2021 at 10:05 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > On Tue, Jan 26, 2021 at 09:46:51AM -0600, Josh Poimboeuf wrote:
> > > > On Tue, Jan 26, 2021 at 04:15:37PM +0100, Peter Zijlstra wrote:
> > > > > On Tue, Jan 26, 2021 at 08:51:55AM -0600, Josh Poimboeuf wrote:
> > > > > > User space mixes compiler versions all the time.  The C ABI is stable.
> > > > > >
> > > > > > What specifically is the harder issue you're referring to?
> > > > >
> > > > > I don't think the C ABI captures nearly enough. Imagine trying to mix a
> > > > > compiler with and without asm-goto support (ok, we fail to build without
> > > > > by now, but just imagine).
> > > > >
> > > > > No C ABI violated, but having that GCC extention vs not having it
> > > > > radically changes the kernel ABI.
> > > > >
> > > > > I think I'm with Greg here, just don't do it.
> > > >
> > > > Ok, thank you for an actual example.  asm goto is a good one.
> > > >
> > > > But it's not a cut-and-dry issue.  Otherwise how could modversions
> > > > possibly work?
> > > >
> > > > So yes, we should enforce GCC versions, but I still haven't seen a
> > > > reason it should be more than just "same compiler and *major* version".
> > >
> > > Why bother? rebuilding the kernel and all modules is a matter of 10
> > > minutes at most on a decently beefy build box.
> > >
> > > What actual problem are we trying to solve here?
> > 
> > This is true for those of us used to working with source and building
> > by hand. For users who want everything packaged, rebuilding a kernel
> > package for install is considerably longer, and for distros providing
> > builds for multiple arches, we are looking at a couple of hours at
> > best.  From a Fedora standpoint, I am perfectly fine with it failing
> > if someone tries to build a module on gcc10 when the kernel was built
> > with gcc11.  It's tedious when the kernel was built with gcc11
> > yesterday, and a new gcc11 build today means that kernel needs to be
> > rebuilt.
> 
> Right.  It's a problem for distro users.  The compiler and kernel are in
> separate packages, with separate release cadences.  The latest compiler
> version may not exactly match what was used to build the latest kernel.

Given that distros _should_ be updating their kernel faster than the
compiler updates, what's the real issue here?  You build a kernel, and
all external modules, at the same time.  If you want to build them at
different times, you make your build system ensure they were the same
compiler so that you are "bug compatible".

And yes, it might be a pain if gcc11 gets updated every other day, but
as someone living with a "rolling-distro" you get used to it, otherwise
you just "pin" the build tools and keep that from happening.

This isn't a new thing, we've been doing this for decades, why is this
surprising?

thanks,

greg k-h
