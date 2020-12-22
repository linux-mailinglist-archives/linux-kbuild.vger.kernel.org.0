Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88DC22E05DA
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Dec 2020 06:51:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbgLVFut (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Dec 2020 00:50:49 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:48070 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgLVFut (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Dec 2020 00:50:49 -0500
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 0BM5nqMD015924
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Dec 2020 14:49:52 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 0BM5nqMD015924
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1608616193;
        bh=EBvXdRY+d1lrx2vcNiN6ATTD4Ub5dmjyJ2wzYRmdWWw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ThFBhDMlJYc4QC7oxjx7yjZmWkmuYbnywn/2eKqFtn0Rh9XRkCLil3rBoElKMWnpM
         smOpDyP+K9toTCz79Ds7ixHpH4cvhwjWUfGuTVvtqPJbcATwk56syb71m1dFeB4TIp
         fcYUf+vv1ABGedcks/Nh4Xb+AfH7J0mHJKnG/3wgRE9bUkHORs87Cxi7BOwY+D3RVW
         mX4rCXed7JdDIZDoVL90fNFQuBO6mkM4iRVf4ZRIChFT1IEZXoBhDEZNsSLffERqKx
         AsTicldRgRgfg5XxUPvGL7YpPofogNCHtrP5wb3o9vQv+6M7yJWme+6yNEupDBsS5n
         bF4D8zMIbLrpQ==
X-Nifty-SrcIP: [209.85.214.177]
Received: by mail-pl1-f177.google.com with SMTP id s15so2445231plr.9
        for <linux-kbuild@vger.kernel.org>; Mon, 21 Dec 2020 21:49:52 -0800 (PST)
X-Gm-Message-State: AOAM533xSot7Lv1ywdyEbtt8973RjJoztF/KXTEuEZQ2MYLNdrixLX1O
        FFaNgzCaMesBlsqitZRZlRbV7MU8nQx0c9idzUo=
X-Google-Smtp-Source: ABdhPJxCcTi2Gieovv4fbVKWq0QAKCruCX4olGVQAcGgeRGbIy3YAuZIvloznqBqnao5/daLMojS9N0ONMNx1F8YEn8=
X-Received: by 2002:a17:902:9b91:b029:db:f003:c5eb with SMTP id
 y17-20020a1709029b91b02900dbf003c5ebmr19479031plp.1.1608616191687; Mon, 21
 Dec 2020 21:49:51 -0800 (PST)
MIME-Version: 1.0
References: <boris.20201125161355@codesynthesis.com> <CAK7LNAR+OkuHyELBYvcFZpO1b-bKe5rmodtGSuzxPhZsGwTSQA@mail.gmail.com>
 <boris.20201202094405@codesynthesis.com> <CAK7LNASeAM8FTqrLz0bKCPNLvzgqiG3HdadVA4CsMkMXOVRbwg@mail.gmail.com>
 <boris.20201221152859@codesynthesis.com>
In-Reply-To: <boris.20201221152859@codesynthesis.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 22 Dec 2020 14:49:14 +0900
X-Gmail-Original-Message-ID: <CAK7LNASr46SwexEigXutmA=jVpFqbi9QDQ_zom+HV5XynrrBOQ@mail.gmail.com>
Message-ID: <CAK7LNASr46SwexEigXutmA=jVpFqbi9QDQ_zom+HV5XynrrBOQ@mail.gmail.com>
Subject: Re: kconfig: diagnostics cleanups
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Dec 21, 2020 at 11:05 PM Boris Kolpackov
<boris@codesynthesis.com> wrote:
>
> Masahiro Yamada <masahiroy@kernel.org> writes:
>
> > On Wed, Dec 2, 2020 at 5:06 PM Boris Kolpackov <boris@codesynthesis.com> wrote:
> >
> > > > Boris Kolpackov <boris@codesynthesis.com> wrote:
> > > >
> > > > > 1. Add 'warning' word to $(warning-if) output:
> > >
> > > This will make the diagnostics consistent with other places in kconfig
> > > where warnings are issued (see conf_warrning() in confdata.c).
> >
> >
> > 'warning:' from C code and $(warning-if) are implemented
> > in different layers. So, I do not think it is necessary
> > to prepend 'warning:'.
>
> What does it matter to the user, who sees the inconsistent
> diagnostics, that they are implemented in different layers?
>
>
> > More importantly, I cannot find a good way to print
> > multiple lines of error messages when $(error ...) is hit.
> > I prefer wrapping a long message in 80-columns.
> >
> >
> > After all, the best way I came up with for GNU Make is to use
> > $(error ) for the last line, and $(warning ) for the rest.
> >
> > $(warning This is the first line)
> > $(warning This is the second line)
> > $(error This is the last line)
> >
> >
> > masahiro@grover:~$ make
> > Makefile:1: This is the first line
> > Makefile:2: This is the second line
> > Makefile:3: *** This is the last line.  Stop.
> >
> >
> > This works, except the small flaw, "***".
>
> IMO, there is a much bigger flaw: there is no way for the user
> to know that these three lines are about the same error.


It is clear from the context.

For example, this case.

https://github.com/torvalds/linux/blob/v5.3/Makefile#L213


masahiro@grover:~/ref/linux$ make SUBDIRS=drivers  -j24
Makefile:213: ================= WARNING ================
Makefile:214: 'SUBDIRS' will be removed after Linux 5.3
Makefile:215:
Makefile:216: If you are building an individual subdirectory
Makefile:217: in the kernel tree, you can do like this:
Makefile:218: $ make path/to/dir/you/want/to/build/
Makefile:219: (Do not forget the trailing slash)
Makefile:220:
Makefile:221: If you are building an external module,
Makefile:222: Please use 'M=' or 'KBUILD_EXTMOD' instead
Makefile:223: ==========================================

  ERROR: Kernel configuration is invalid.
         include/generated/autoconf.h or include/config/auto.conf are missing.
         Run 'make oldconfig && make prepare' on kernel src to fix it.

make: *** [Makefile:686: include/config/auto.conf] Error 1



The filename:lineno prefixes are noisy, but it is clear enough
for me to understand.




> If you want this ability, then let's find a way do it properly
> rather than spreading further hacks. For example, in the build
> system I am working on, we have suport for multi-line diagnostics
> records that to the user look like this:
>
> Makefile:3: error: This is the first line
>   This is the second line
>   This is the last line

I also thought about this possibility.

define newline


endef


$(warning This is first line$(newline) \
  This is the second line$(newline) \
  This is the last line\
)


masahiro@grover:~$ make
Makefile:7: This is first line
 This is the second line
 This is the last line


But, I do not like this format.

I do not want to have a complex macro
to fix the indentation, either.



>
> > If you want, you can include 'warning: ' in the message,
> > but you would not be able to get rid of it if it were
> > printed by default.
>
> You can get rid of it by using $(info).
>
>
> > In a little more thought, I'd rather go opposite;
> > make $(warning-if) and $(error-if) as simple as
> > just printing the given message without any prefix.
> >
> > https://patchwork.kernel.org/project/linux-kbuild/patch/20201221094650.283511-1-masahiroy@kernel.org/
>
> Wouldn't showing the position in the Kconfig file where
> the error/warning has originated be much, much more useful
> than the occasional need to print multi-line messages?


The idea in my mind is to give each build-in function
as small functionality as possible.

Since Kconfig already supports $(filename) and $(lineno).

The current functionality can be achieved by a macro.




>
> > > > > 2. Print $(info) output to stderr instead of stdout.
> > >
> > > There are two reasons:
> > >
> > > 1. Error, warning, and info are different diagnostics levels. It was
> > >    surprising to me that the first two go to stderr while info goes
> > >    to stdout. For example, as a user, if I redirect stderr, I would
> > >    naturally expect all the diagnostics to go there.
> > >
> > > 2. More importantly, stdout is used by terminal-based UI configurators.
> > >    So depending on exactly when $(info) is issued, its output could either
> > >    be clobbered by UI (so the user won't notice it) or it can clobber UI
> > >    (so the user will see broken UI).
> >
> >
> > I do not think this is overly problematic
> > because Kconfig enters the GUI mode after
> > parsing all Kconfig files.
>
> How is me (as a user) redirecting stderr to a location of
> my choosing and only ending up with half of the diagnostics
> there (with the other half silently overridden by the GUI)
> not problematic?

This is a hypothetical argument since we have no user of $(info).
$(info) is not a warning.
The change is unneeded.



>
> > Also, if my new patch lands, [...]
>
> I hope it does not.
>
> In one of your emails you've said that you believe the kconfig
> implementation is very immature (which I wholly agree with) and
> you would like to clean it up. To me one of the biggest signs
> of this immaturity is various inconsistencies and the changes I
> am proposing were to address some of the more user-visible ones.
> It's baffling to me that you not only find my changes unnecessary
> but actually propose changes which in my view would only exacerbate
> the problem. It seems we understand very differently what exactly
> is immature about kconfig.

Probably so.


-- 
Best Regards
Masahiro Yamada
