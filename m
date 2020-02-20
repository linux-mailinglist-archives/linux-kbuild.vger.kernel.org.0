Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB1B166244
	for <lists+linux-kbuild@lfdr.de>; Thu, 20 Feb 2020 17:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgBTQVn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 20 Feb 2020 11:21:43 -0500
Received: from pb-smtp1.pobox.com ([64.147.108.70]:63092 "EHLO
        pb-smtp1.pobox.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728090AbgBTQVm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 11:21:42 -0500
Received: from pb-smtp1.pobox.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id E65C64F1EF;
        Thu, 20 Feb 2020 11:21:39 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=pobox.com; h=date:from:to
        :cc:subject:in-reply-to:message-id:references:mime-version
        :content-type; s=sasl; bh=tEarpC/Bn383C0Nl/hZcNVP7D7g=; b=yMJErf
        H7MQGMLt+NbBtOhx65j3BmpFHaaIqkAfTZnbjfxXXg1GSKGd+VveVdSlhpZElx31
        Nd+zRVAtSTB4MOS9PqkQeC7rlRnuVo2qf5RJGLNRFy99dJ3hfgBLu++/wKINSjJu
        J2jvLiCpY59f7MF5B6Kswlcv78fMMnnFnFkhE=
Received: from pb-smtp1.nyi.icgroup.com (unknown [127.0.0.1])
        by pb-smtp1.pobox.com (Postfix) with ESMTP id D8BF54F1EE;
        Thu, 20 Feb 2020 11:21:39 -0500 (EST)
        (envelope-from nico@fluxnic.net)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=fluxnic.net;
 h=date:from:to:cc:subject:in-reply-to:message-id:references:mime-version:content-type; s=2016-12.pbsmtp; bh=wqttWhXrTH73nFlmloyzuYlfEV4LPzzHbRl0rCtH0Nw=; b=R3wf0Jbw3PeOzAbxjOBsAY+QXlohs5NoY2O/WkH9pTiiXaA0xZ8L5KfGIj13kTF+hz1CaOmFMSXkK4nlkSINzwd5s9gkAupKv2+Wd0P1qLaIP5Py0uCRUAWj6JwUw82cj2b+eoJpmMiWKy7/yFL5NUuuL1NinxfMfc1wVC7Imlk=
Received: from yoda.home (unknown [24.203.50.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by pb-smtp1.pobox.com (Postfix) with ESMTPSA id 0D12C4F1ED;
        Thu, 20 Feb 2020 11:21:39 -0500 (EST)
        (envelope-from nico@fluxnic.net)
Received: from xanadu.home (xanadu.home [192.168.2.2])
        by yoda.home (Postfix) with ESMTPSA id 0B3BB2DA01AD;
        Thu, 20 Feb 2020 11:21:38 -0500 (EST)
Date:   Thu, 20 Feb 2020 11:21:37 -0500 (EST)
From:   Nicolas Pitre <nico@fluxnic.net>
To:     Masahiro Yamada <masahiroy@kernel.org>
cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
In-Reply-To: <CAK7LNASubs2oJ8-a-amsEhWjYrfpAx8QxeTzH4PnKsELKyLaUw@mail.gmail.com>
Message-ID: <nycvar.YSQ.7.76.2002201117050.1559@knanqh.ubzr>
References: <20200219074950.23344-1-masahiroy@kernel.org> <nycvar.YSQ.7.76.2002191046520.1559@knanqh.ubzr> <CAK7LNASubs2oJ8-a-amsEhWjYrfpAx8QxeTzH4PnKsELKyLaUw@mail.gmail.com>
User-Agent: Alpine 2.21 (LFD 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Pobox-Relay-ID: 12855D8C-53FD-11EA-A719-C28CBED8090B-78420484!pb-smtp1.pobox.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 20 Feb 2020, Masahiro Yamada wrote:

> Hi Nicolas,
> 
> On Thu, Feb 20, 2020 at 1:16 AM Nicolas Pitre <nico@fluxnic.net> wrote:
> >
> > On Wed, 19 Feb 2020, Masahiro Yamada wrote:
> >
> > > As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> > > by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> > > possible value is BAZ=n.
> >
> > I don't think this is right. The imply keyword provide influence over
> > another symbol but it should not impose any restrictions. If BAR=m then
> > BAZ should still be allowed to be m or n.
> >
> > > @@ -174,6 +174,9 @@ applicable everywhere (see syntax).
> > >       n               y               n               N/m/y
> > >       m               y               m               M/y/n
> > >       y               y               y               Y/n
> > > +     n               m               n               N/m
> > > +     m               m               m               M/n
> > > +     y               m               n               N
> >
> > Here the last line shoule be y m n N/m.
> >
> > Generally speaking, the code enabled by FOO may rely on functionalities
> > provided by BAZ only when BAZ >= FOO. This is accomplished with
> > IS_REACHABLE():
> >
> >         foo_init()
> >         {
> >                 if (IS_REACHABLE(CONFIG_BAZ))
> >                         baz_register(&foo);
> >                 ...
> >         }
> >
> > So if FOO=y and BAZ=m then IS_REACHABLE(CONFIG_BAZ) will be false. Maybe
> > adding a note to that effect linked to the "y m n N/m" line in the table
> > would be a good idea.
> >
> 
> I also thought so.
> 
> I agree IS_REACHABLE() is much saner approach.
> 
> So, do you agree to change the current behavior
> as follows?
> 
> 
> index d0111dd26410..47dbfd1ee003 100644
> --- a/Documentation/kbuild/kconfig-language.rst
> +++ b/Documentation/kbuild/kconfig-language.rst
> @@ -173,7 +173,7 @@ applicable everywhere (see syntax).
>         ===             ===             =============   ==============
>         n               y               n               N/m/y
>         m               y               m               M/y/n
> -       y               y               y               Y/n
> +       y               y               y               Y/m/n
>         y               n               *               N
>         ===             ===             =============   ==============
> 

Yes. That should have been the case all along.


Nicolas
