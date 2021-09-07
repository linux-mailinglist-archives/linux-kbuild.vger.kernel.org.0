Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB855402FC6
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Sep 2021 22:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346779AbhIGUcD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 16:32:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346573AbhIGUcC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 16:32:02 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62BB0C0613C1
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Sep 2021 13:30:55 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id f18so366418lfk.12
        for <linux-kbuild@vger.kernel.org>; Tue, 07 Sep 2021 13:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BHU/b6iOWML31rDQD4Y7YAaTs9mMyU/Uk/P4sJ2b7NA=;
        b=hVpdIZlAApogbIH1JgUwHFhlKoiKgiQ2kK6X+akQnUfn8TUcb2vVBov14g68Y1PY31
         BZyxcWoyIZ+b42y6O0Kpb6WAwvPBy4u332g1OTHulr9ASmM9k6VK8JXzqbaYxKAVTQ/q
         bzh3HwUrbmdxYfMYNocX0hvnds2j35kLTGkp8gJ1c8ixfC3oGPJ5w3y3jRvPHlKvC9P/
         L4uzM9YwaqpxJKzL61Idmre2I7HXFdD1wQu6ycvx2e8pEsKiwSWgRx9dtd2tOQj/6rMZ
         RA98YjsfXP0yoYR1l77PV/AZsU0FDvNILFp/SrizCxbOyiFphCgAc8ANJHKhgVtw3NcJ
         eiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BHU/b6iOWML31rDQD4Y7YAaTs9mMyU/Uk/P4sJ2b7NA=;
        b=VIISKAVrdYX3zRQzzPrzNlzp18Qodapf+DrTLNjwZL9O+o5tlN7VP+RU5gfXLjzhqm
         qQrywEwHRdDK78rGnGDm5A6j/ZlX+qScaNv1h2K+p61GcPfMWEEEDxLoT9lrUwM3Z/70
         Kda9kAharehlCd0IVQ7ldZO190KxDI+k4GBOzOnmViu0G+dEwb6JrVuIw79onSWiSb/A
         5n1BdNsj80ZFutbLAs7eFCYLUxzBrkhwxVZhu9/EtfIqa2me9c2hPljXq3pnEySRiz5e
         EWQKDW/gzdG/L2P+fxARyxTOv5Eq5UgvuXR5cGKFsIbP9KkO36cxM/ktixhP8CS5s4re
         dLjg==
X-Gm-Message-State: AOAM5304UqRDaf7WlM3NdIDsi/I6kupngu9LZYKkxvutaU22xOn6PaVE
        Y8/zucSPUvSUqcxm1WISoqTfGg2YSH4LfM32J5t6OQ==
X-Google-Smtp-Source: ABdhPJzFVFDAojI+TEXcMkjX9qjJ7m1oCYmJv/nUmDIInkxoBZhahPTy/fe1PAmjUHYBPltHTjtGqD8vibWxslCWngU=
X-Received: by 2002:a05:6512:2291:: with SMTP id f17mr149141lfu.489.1631046652902;
 Tue, 07 Sep 2021 13:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com> <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
In-Reply-To: <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 7 Sep 2021 13:30:42 -0700
Message-ID: <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 7, 2021 at 12:16 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Sep 7, 2021 at 11:39 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > The above commit seems as though it was merged in response to
> > https://lore.kernel.org/linux-hardening/CAHk-=wj4EG=kCOaqyPEq5VXa97kyUHsBpBn3DWwE91qcnDytOQ@mail.gmail.com/.
>
> No. It was merged in response of _years_ of pain, with the last one
> just being the final drop.

Well, I think it's important to enumerate some of the pain points
explicitly so that we might all better understand what they are, and
come to an agreement together on what the right way to resolve them
is.

Impulse commits without discussion over a holiday weekend are firmly
in the category of "I wish you'd rather not have done that."

Let's look closer at the final drop.  I think there's a bigger question here:
1. did the CI have enough time to run in multiple configurations with
multiple toolchains to even find a warning, let alone report it?
2. what did the developer do with the report (if they even got it, see
1 above)? Ignore it? Proceed with the PR anyways?

it looks to me as though the "final drop" fits into 1 above. I'm not
sure that -Werror is the correct way to resolve issues from that.

> I'm not going to revert that change. I probably will have to limit it
> (by making that WERROR option depend on certain expectations), but
> basically any maintainer who has code that causes warnings should
> expect that they will have to fix those warnings.

I'm not 100% against it; I think it could land in a more useful
variation. But it would be good to discuss that on-list, and give it
time to soak. This is a conversation we should be having with CI
maintainers IMO, and folks that maintain the build infra, at least.
I'm happy to kick off that discussion with this RFC.

> If it's clang that generates bogus warnings, then we'll have to start
> disable clang warnings. The clang people tend to be proud of thir
> fewer false positives, but so far looking at things, I am not
> convinced.

Now you're just attacking a strawman.

> And I'm most definitely not convinced when the "let's finally enable
> -Werror after years of talking about it", people end up going "but but
> but I have thousands of warnings".

The kernel is full of thousands of warnings at the moment.  It might
not be for your limited set of configs, targets, and toolchains, but
the folks running CI are very very well aware that the kernel is far
from enabling -Werror seriously.

Any given maintainer sending you a PR cannot (and should not, IMO)
know under what combination of configs, targets, and toolchains you'll
test under, and -Werror isn't going to help them figure it out.

Not every commit that makes its way to mainline has spent equal
amounts of soak time in -next. (I suspect there are commits going into
mainline that spent zero time in -next, not just from you).  Patches
merged by maintainers shortly before the merge window open have
minimal coverage compared to older commits they've accepted.  So CI
systems can't find diagnostics (warnings/errors) in various
combinations of config/target/toolchain if patches are skipping -next
or spending a short amount of time in -next.

To be clear, you have merged patches into mainline that broke the
build for combinations of configs/targets/toolchains that you are not
testing.  It's not realistic for you or any one person to test all
such combinations either.  Other software projects have solved this by
relying on bots to handle merges. Bots that don't forget to test
combinations of various targets, or enable developers to ignore
warnings (if the warnings are even reported).

> That's the POINT of that commit. That "but but but I have thousands of
> warnings" is not acceptable.
>
> I spent hours yesterday getting rid of some warnings. It shouldn't be
> on me fixing peoples code. It shouldn't be on me noticing that people
> send me crap that warns.

I agree. I disagree that -Werror will solve that.  Developers will get
the same report from 0day bot, just now as an error rather than
warning, and they will continue to ignore the report because "well it
works for me."  (Maybe I'm attacking the strawman now).

> And it really shouldn't be "Linus cares about warnings, so
> configurations that Linus doesn't test can continue for years to have
> them".

I agree, and we have been making progress on this. I'd say the advent
of the various CI systems over the past 5 years is a much welcomed
improvement in at least understanding which combinations are exposing
issues.

> My "no warnings" policy isn't exactly new, and people shouldn't be
> shocked when I then say "time to clean up *YOUR* house too".

We have been cleaning house, for nearly half a decade in my
experience. Fixing warnings in the Linux kernel for all possible
configs, targets, and toolchains while the toolchains continue to add
more diagnostics is more sisyphean than digging a hole in wet sand.
-- 
Thanks,
~Nick Desaulniers
