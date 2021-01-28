Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83F43081C1
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Jan 2021 00:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231174AbhA1XTa (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 18:19:30 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:45827 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229757AbhA1XTa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 18:19:30 -0500
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10SNISG3015178;
        Fri, 29 Jan 2021 08:18:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10SNISG3015178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611875909;
        bh=gDOJYkuVycQhQHityvqx6lSAzcCjYfOTMUw5/5cFeLw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UF9DoPaF9gLy4gVSyPp/2lzmLQdkty1yvUULVY72Bk/oiywHPws24k8wmnWQok6Ir
         UX13azFCGw23Yl1ZCTsSKrFx7n4eOTBMO1rvP6/xhOthUWhwQdzp5W1LoccIy1nmT5
         mwk87F++gb8RKq7fPcfytbBhRoVGB9TUyRumuWkYyR009hFPkt3vZ8QDkbKldQHXAo
         CD0iq7WQl7RYZXsuo1Nv/BCCU/zlrsH3Qc4fA7/zjAAsy5bKwj3Lu4iKfsHLij83QV
         5NVk7GjS1qOcldab98M04i87qzSL4iL/IrFsqVwodZBnVEEFwsdopwsQBhYiiJpmOp
         P2rCBbsYNL9zg==
X-Nifty-SrcIP: [209.85.210.171]
Received: by mail-pf1-f171.google.com with SMTP id w18so5011774pfu.9;
        Thu, 28 Jan 2021 15:18:28 -0800 (PST)
X-Gm-Message-State: AOAM533vYDN//aRCrgERFXIfwTLiouYVS2bD0H8tf+Wvaep3j7WjrZWe
        gx2NrDVAodEFlP/THhz7/9dmovKNd6YUQuILTZE=
X-Google-Smtp-Source: ABdhPJyLXvl2z9W5RHDaUqo/WioksPhE3dPxKUm63ezd2bWlEZnPmFaEaqyjpUk3kWp+nQ4l1xoDs3WpwN+8k3c1V7w=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr1674647pgi.175.1611875907921;
 Thu, 28 Jan 2021 15:18:27 -0800 (PST)
MIME-Version: 1.0
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
 <20210128205207.awdbh4bmx56pxxjl@treble> <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
 <CAHk-=wh+3PWi2NuoQ0hbSyLpOHjaBWKcgX6N7+PfPkXzNAfMwA@mail.gmail.com>
 <20210128213409.qxnclchjyq6v23up@treble> <CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com>
 <20210128220803.fixcmuv4ceq5m7dy@treble>
In-Reply-To: <20210128220803.fixcmuv4ceq5m7dy@treble>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 29 Jan 2021 08:17:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNARE3KO-kqdsXAbt9d9+3EqqutYd6iNki_rU2-Q9GkakbA@mail.gmail.com>
Message-ID: <CAK7LNARE3KO-kqdsXAbt9d9+3EqqutYd6iNki_rU2-Q9GkakbA@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Justin Forbes <jforbes@redhat.com>,
        Ondrej Mosnacek <omosnace@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>,
        David Laight <David.Laight@aculab.com>,
        Jessica Yu <jeyu@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 29, 2021 at 7:08 AM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Jan 28, 2021 at 01:45:51PM -0800, Linus Torvalds wrote:
> > On Thu, Jan 28, 2021 at 1:34 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> > >
> > > On Thu, Jan 28, 2021 at 01:23:11PM -0800, Linus Torvalds wrote:
> > > > THAT workaround is long gone, but I didn't check what other ones we
> > > > might have now. But the gcc version checks we _do_ have are not
> > > > necessarily about major versions at all (ie I trivially found checks
> > > > for 4.9, 4.9.2, 5.1, 7.2 and 9.1).
> > >
> > > Then maybe the check should be same major.minor?
> >
> > Well, how many of them are actually about things that generate
> > incompatible object code?
> >
> > The main one I can think of is the KASAN ABI version checks, but
> > honestly, I think that's irrelevant. I really hope no distros enable
> > KASAN in user kernels.
> >
> > Another version check I looked at was the one that just checks whether
> > the compiler natively supports __builtin_mul_overflow() or not - it
> > doesn't generate incompatible object code, it just takes advantage of
> > a compiler feature if one exists. You can mix and match those kinds of
> > things well enough.
> >
> > So I'd really like to hear actual hard technical reasons with
> > examples, for why you'd want to add this test in the first place.
>
> Unfortunately I don't have technical reasons beyond what we've already
> discussed, found from code inspection.
>
> This patch was born from a discussion where wildly different opinions
> were expressed about whether such a mismatch scenario (or even external
> modules in general!) would be supported at all.
>
> So I guess the goal is to clarify (in the code base) to what extent
> compiler mismatches are supported/allowed/encouraged.  Because they
> definitely happen in the real world, but a lot of people seem to be
> sticking their head in the sand about it.
>
> If we decide it's not a cut-and-dry makefile check, then the policy
> should at least be documented.
>
> I'd prefer the warning though, since nobody's going to read the docs.
>
> > No hand-waving "different compiler versions don't work together".
> > Because that's simply not true.
> >
> > > And convert it to a strongly worded warning/disclaimer?
> >
> > A warning might be better for the simple reason that it wouldn't cause
> > people to just fix it with "make oldconfig".
> >
> > Maybe you haven't looked at people who compile external modules, but
> > they always have various "this is how to work around issues with
> > version XYZ". That "make oldconfig" would simply just become the
> > workaround for any build errors.
> >
> > And a warning might be more palatable even if different compiler
> > version work fine together. Just a heads up on "it looks like you
> > might be mixing compiler versions" is a valid note, and isn't
> > necessarily wrong. Even when they work well together, maybe you want
> > to have people at least _aware_ of it.
>
> Sounds reasonable.
>
> --
> Josh
>

[1]

First, let me explain how Kbuild works w.r.t the compiler version
check.

When working on the kernel tree, Kbuild automatically detects
the compiler upgrade (this is done by comparing the output
of '$(CC) --version'), and invokes Kconfig to sync the configuration.
So, the .config is updated even if you do not explicitly
do "make oldconfig".


When working on external modules, in contrast,
Kbuild does not attempt to update anything in the kernel tree.
This makes sense since the build tree, /lib/modules/$(uname -r)/build/
is read-only.
You cannot manually run Kconfig either because the config targets
are hidden for external modules.

$ make M=../qemu-build/extmod  oldconfig
make: *** No rule to make target 'oldconfig'.  Stop.



[2]

As for this patch, it is wrong to do this check in the Makefile
parse stage.

"make M=...  clean"
"make M=...  help"

etc. will fail.
Such targets do not require the compiler in the first place.

This check must be done before starting building something,


Also, this patch is not applicable.
gcc-version.sh and clang-version.sh do not exist.
See linux-next.



[3]
Peterz already pointed out asm-goto as an example of ABI mismatch.

I remember a trouble reported in the past due
to the mismatch of -mstack-protector-guard-offset.

https://bugzilla.kernel.org/show_bug.cgi?id=201891

This has already been fixed,
and it will no longer happen though.





--
Best Regards




Masahiro Yamada
