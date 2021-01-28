Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 014BA3080B9
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Jan 2021 22:47:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231547AbhA1Vqz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Jan 2021 16:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhA1Vqv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Jan 2021 16:46:51 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1695FC061573
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:46:11 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id q8so9619825lfm.10
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aulEyvePMTpx/72fW0hN1PIWw4ZHfny70yTPEo93PYU=;
        b=EltLr0XGGrfIy4QTWkG2B3ar+vWLaQrnqB5//XwlmUzMK7AbvbR3Fvsi/PLk6LXnAP
         39t+8Aq5fgrYmP/03KD8K0WUDa6Jeo8fWJP1i+c2XHl1g/zAYPwmeQzSrhjfA4MH0ozt
         WrbO52L591kyaFSGgd/9ste+nBDt1KFlJkMhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aulEyvePMTpx/72fW0hN1PIWw4ZHfny70yTPEo93PYU=;
        b=AAfFt0OPA2Byk/t3QOP6J8uyQYr2VX7EX2FrpEgBnbzHi652qFHMmDb5qmtj3e31Lb
         khZ1dufqKSVN4LzC3BTNKU9d9zw3oecFdzdLf6S+yul091EtypDo8ln44rk5A5764ctt
         UT7OEWUQyMhd5uOMPPV6xjsEI0SWg5RxdWFD5G/nxQIa2R4thUFtNdjgJRrbYhT8daWb
         si1xjoydVKB/dfoLwf82soB/kjjkCFJyPITXvKHB6lH/SOEDCZBxFh4ZRJstj+Cb953r
         EIV6ynIPdn9VdBZjewQkpq8ul5Dn+zf8HOc3wMWwY/NFl3p5sm5Lzh5yWaE+vHSImSQj
         h5Fg==
X-Gm-Message-State: AOAM5326sKgnmbv1CNrgqtbcD2qH0eoNiyeYvXt0mSkUdakkAB10qLEW
        1rcoOG4NNx1jvmiLrEFZ0jf/YZvUBRrdQw==
X-Google-Smtp-Source: ABdhPJwAH2ddnAcjfe+SceTIZs7j4FSq0qpcZ7Mh1fQX9gt7akrLgvMJ7KshReikL9oFy7dr/HgyKA==
X-Received: by 2002:a05:6512:202c:: with SMTP id s12mr482927lfs.221.1611870369201;
        Thu, 28 Jan 2021 13:46:09 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com. [209.85.167.52])
        by smtp.gmail.com with ESMTPSA id f20sm1804044lfm.71.2021.01.28.13.46.07
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 13:46:08 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id b2so9677627lfq.0
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jan 2021 13:46:07 -0800 (PST)
X-Received: by 2002:a05:6512:516:: with SMTP id o22mr147014lfb.487.1611870367595;
 Thu, 28 Jan 2021 13:46:07 -0800 (PST)
MIME-Version: 1.0
References: <fff056a7c9e6050c2d60910f70b6d99602f3bec4.1611863075.git.jpoimboe@redhat.com>
 <CAHk-=wih0rLHsPXodpXJw_0F3bJqu=Pb_YNmPCSsYU_huoMwZA@mail.gmail.com>
 <20210128205207.awdbh4bmx56pxxjl@treble> <CAHk-=wgh4DaZvTcFfBcDMKc1QXkKjwny_Z0H5JfzdwMTNTBkSw@mail.gmail.com>
 <CAHk-=wh+3PWi2NuoQ0hbSyLpOHjaBWKcgX6N7+PfPkXzNAfMwA@mail.gmail.com> <20210128213409.qxnclchjyq6v23up@treble>
In-Reply-To: <20210128213409.qxnclchjyq6v23up@treble>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Thu, 28 Jan 2021 13:45:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com>
Message-ID: <CAHk-=wgjwhDy-y4mQh34L+2aF=n6BjzHdqAW2=8wri5x7O04pA@mail.gmail.com>
Subject: Re: [PATCH RFC] kbuild: Prevent compiler mismatch with external modules
To:     Josh Poimboeuf <jpoimboe@redhat.com>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 1:34 PM Josh Poimboeuf <jpoimboe@redhat.com> wrote:
>
> On Thu, Jan 28, 2021 at 01:23:11PM -0800, Linus Torvalds wrote:
> > THAT workaround is long gone, but I didn't check what other ones we
> > might have now. But the gcc version checks we _do_ have are not
> > necessarily about major versions at all (ie I trivially found checks
> > for 4.9, 4.9.2, 5.1, 7.2 and 9.1).
>
> Then maybe the check should be same major.minor?

Well, how many of them are actually about things that generate
incompatible object code?

The main one I can think of is the KASAN ABI version checks, but
honestly, I think that's irrelevant. I really hope no distros enable
KASAN in user kernels.

Another version check I looked at was the one that just checks whether
the compiler natively supports __builtin_mul_overflow() or not - it
doesn't generate incompatible object code, it just takes advantage of
a compiler feature if one exists. You can mix and match those kinds of
things well enough.

So I'd really like to hear actual hard technical reasons with
examples, for why you'd want to add this test in the first place.

No hand-waving "different compiler versions don't work together".
Because that's simply not true.

> And convert it to a strongly worded warning/disclaimer?

A warning might be better for the simple reason that it wouldn't cause
people to just fix it with "make oldconfig".

Maybe you haven't looked at people who compile external modules, but
they always have various "this is how to work around issues with
version XYZ". That "make oldconfig" would simply just become the
workaround for any build errors.

And a warning might be more palatable even if different compiler
version work fine together. Just a heads up on "it looks like you
might be mixing compiler versions" is a valid note, and isn't
necessarily wrong. Even when they work well together, maybe you want
to have people at least _aware_ of it.

              Linus
