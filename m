Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BC9A3080F0
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 23:10:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhA1WJn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 17:09:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54632 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229658AbhA1WJm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 17:09:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1611871693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kOJTlDiAp+anCAKFi1PTZAWVwlPCpb+mMwrxIH+Y2fY=;
        b=fFsuL5OB7SbIm1dtIFcj/dR2KxUiXCzA6GqPiHU0okDoDijj5SZXCdQcKm1/cJHlzii/l1
        1YS+fo8QKCYSSiK4Il7qhR/2+XDI5OKyN6pHkN7iSh/2X0hZQD8aJv+Aj/MbGggbOldk2X
        8Hx+mFLH0kcArf5ciEtJD2gOss70wRA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-nlqn8EtLP9edGLfr02XzBA-1; Thu, 28 Jan 2021 17:08:09 -0500
X-MC-Unique: nlqn8EtLP9edGLfr02XzBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 916868042A6;
        Thu, 28 Jan 2021 22:08:07 +0000 (UTC)
Received: from treble (ovpn-120-118.rdu2.redhat.com [10.10.120.118])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D2DD5C1BB;
        Thu, 28 Jan 2021 22:08:05 +0000 (UTC)
Date:   Thu, 28 Jan 2021 16:08:03 -0600
From:   Josh Poimboeuf <jpoimboe@redhat.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
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
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external
 modules
Message-ID: <20210128220803.fixcmuv4ceq5m7dy@treble>
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
 <20210128205207.awdbh4bmx56pxxjl@treble>
 <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
 <CAHk-=wh+3PWi2NuoQ0hbSyLpOHjaBWKcgX6N7+PfPkXzNAfMwA@mail.gmail.com>
 <20210128213409.qxnclchjyq6v23up@treble>
 <CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 01:45:51PM -0800, Linus Torvalds wrote:
> On Thu, Jan 28, 2021 at 1:34 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
> >
> > On Thu, Jan 28, 2021 at 01:23:11PM -0800, Linus Torvalds wrote:
> > > THAT workaround is long gone, but I didn't check what other ones we
> > > might have now. But the gcc version checks we _do_ have are not
> > > necessarily about major versions at all (ie I trivially found checks
> > > for 4.9, 4.9.2, 5.1, 7.2 and 9.1).
> >
> > Then maybe the check should be same major.minor?
> 
> Well, how many of them are actually about things that generate
> incompatible object code?
> 
> The main one I can think of is the KASAN ABI version checks, but
> honestly, I think that's irrelevant. I really hope no distros enable
> KASAN in user kernels.
> 
> Another version check I looked at was the one that just checks whether
> the compiler natively supports __builtin_mul_overflow() or not - it
> doesn't generate incompatible object code, it just takes advantage of
> a compiler feature if one exists. You can mix and match those kinds of
> things well enough.
> 
> So I'd really like to hear actual hard technical reasons with
> examples, for why you'd want to add this test in the first place.

Unfortunately I don't have technical reasons beyond what we've already
discussed, found from code inspection.

This patch was born from a discussion where wildly different opinions
were expressed about whether such a mismatch scenario (or even external
modules in general!) would be supported at all.

So I guess the goal is to clarify (in the code base) to what extent
compiler mismatches are supported/allowed/encouraged.  Because they
definitely happen in the real world, but a lot of people seem to be
sticking their head in the sand about it.

If we decide it's not a cut-and-dry makefile check, then the policy
should at least be documented.

I'd prefer the warning though, since nobody's going to read the docs.

> No hand-waving "different compiler versions don't work together".
> Because that's simply not true.
> 
> > And convert it to a strongly worded warning/disclaimer?
> 
> A warning might be better for the simple reason that it wouldn't cause
> people to just fix it with "make oldconfig".
> 
> Maybe you haven't looked at people who compile external modules, but
> they always have various "this is how to work around issues with
> version XYZ". That "make oldconfig" would simply just become the
> workaround for any build errors.
> 
> And a warning might be more palatable even if different compiler
> version work fine together. Just a heads up on "it looks like you
> might be mixing compiler versions" is a valid note, and isn't
> necessarily wrong. Even when they work well together, maybe you want
> to have people at least _aware_ of it.

Sounds reasonable.

-- 
Josh

