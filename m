Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71D4F2DFC8A
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Dec 2020 15:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbgLUOGB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 21 Dec 2020 09:06:01 -0500
Received: from codesynthesis.com ([188.40.148.39]:41398 "EHLO
        codesynthesis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726860AbgLUOGB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 21 Dec 2020 09:06:01 -0500
Received: from brak.codesynthesis.com (unknown [102.68.73.213])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by codesynthesis.com (Postfix) with ESMTPSA id 07E4A5EFBA;
        Mon, 21 Dec 2020 14:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codesynthesis.com;
        s=mail1; t=1608559518;
        bh=6GYoEsj2uSf1ZojP9Ry2qCZC+RJmueDGKf/2in2yGWA=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:From;
        b=c4wmI8NSBVZJbyfdHz9OwcEw6uoFbIrWmDZUMYHV7rDY2erBFcXfeUpt5J2VvRzJt
         6pKtUHAq7N5fIdSikEzvj+o/LdV/5t54iULdaSO5xqJNs6H+Hhg9nEZ4wB35OWFbr/
         LGzrqaJFDUdSVBAWeC5+xpP9i8/nuHTTvrXClvTJl4hzIzKg360s3ZSNCvqwQj9KmI
         o4839iVsNAfdBMN/JHz/hPO+t1BcoOES1O5rTRw8pxahq5mEGXNPPz2D33tOTtIS/D
         MT5OXvq4EoKXDzQn7Q/dCup0epx7r+pekA0SN9xTVKwIZxZoKQSx4YJuQ9NEwYYu/p
         Awio07L4qy7yg==
Received: by brak.codesynthesis.com (Postfix, from userid 1000)
        id 4C5F81A800C4; Mon, 21 Dec 2020 16:05:14 +0200 (SAST)
Date:   Mon, 21 Dec 2020 16:05:14 +0200
From:   Boris Kolpackov <boris@codesynthesis.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: kconfig: diagnostics cleanups
Message-ID: <boris.20201221152859@codesynthesis.com>
References: <boris.20201125161355@codesynthesis.com>
 <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
 <boris.20201202094405@codesynthesis.com>
 <CAK7LNASeAM8FTqrLz0bKCPNLvzgqiG3HdadVA4CsMkMXOVRbwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASeAM8FTqrLz0bKCPNLvzgqiG3HdadVA4CsMkMXOVRbwg@mail.gmail.com>
Organization: Code Synthesis
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> writes:

> On Wed, Dec 2, 2020 at 5:06 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
>
> > > Boris Kolpackov <boris@codesynthesis.com> wrote:
> > >
> > > > 1. Add 'warning' word to $(warning-if) output:
> >
> > This will make the diagnostics consistent with other places in kconfig
> > where warnings are issued (see conf_warrning() in confdata.c).
> 
> 
> 'warning:' from C code and $(warning-if) are implemented
> in different layers. So, I do not think it is necessary
> to prepend 'warning:'.

What does it matter to the user, who sees the inconsistent
diagnostics, that they are implemented in different layers?


> More importantly, I cannot find a good way to print
> multiple lines of error messages when $(error ...) is hit.
> I prefer wrapping a long message in 80-columns.
> 
> 
> After all, the best way I came up with for GNU Make is to use
> $(error ) for the last line, and $(warning ) for the rest.
> 
> $(warning This is the first line)
> $(warning This is the second line)
> $(error This is the last line)
> 
> 
> masahiro@grover:~$ make
> Makefile:1: This is the first line
> Makefile:2: This is the second line
> Makefile:3: *** This is the last line.  Stop.
>  
> 
> This works, except the small flaw, "***".

IMO, there is a much bigger flaw: there is no way for the user
to know that these three lines are about the same error.

If you want this ability, then let's find a way do it properly
rather than spreading further hacks. For example, in the build
system I am working on, we have suport for multi-line diagnostics
records that to the user look like this:

Makefile:3: error: This is the first line
  This is the second line
  This is the last line

 
> If you want, you can include 'warning: ' in the message,
> but you would not be able to get rid of it if it were
> printed by default.

You can get rid of it by using $(info).

 
> In a little more thought, I'd rather go opposite;
> make $(warning-if) and $(error-if) as simple as
> just printing the given message without any prefix.
> 
> https://patchwork.kernel.org/project/linux-kbuild/patch/20201221094650.283511-1-masahiroy@kernel.org/

Wouldn't showing the position in the Kconfig file where
the error/warning has originated be much, much more useful
than the occasional need to print multi-line messages?


> > > > 2. Print $(info) output to stderr instead of stdout.
> >
> > There are two reasons:
> >
> > 1. Error, warning, and info are different diagnostics levels. It was
> >    surprising to me that the first two go to stderr while info goes
> >    to stdout. For example, as a user, if I redirect stderr, I would
> >    naturally expect all the diagnostics to go there.
> >
> > 2. More importantly, stdout is used by terminal-based UI configurators.
> >    So depending on exactly when $(info) is issued, its output could either
> >    be clobbered by UI (so the user won't notice it) or it can clobber UI
> >    (so the user will see broken UI).
> 
> 
> I do not think this is overly problematic
> because Kconfig enters the GUI mode after
> parsing all Kconfig files.

How is me (as a user) redirecting stderr to a location of
my choosing and only ending up with half of the diagnostics
there (with the other half silently overridden by the GUI)
not problematic?

 
> Also, if my new patch lands, [...]

I hope it does not.

In one of your emails you've said that you believe the kconfig
implementation is very immature (which I wholly agree with) and
you would like to clean it up. To me one of the biggest signs
of this immaturity is various inconsistencies and the changes I
am proposing were to address some of the more user-visible ones.
It's baffling to me that you not only find my changes unnecessary
but actually propose changes which in my view would only exacerbate
the problem. It seems we understand very differently what exactly
is immature about kconfig.
