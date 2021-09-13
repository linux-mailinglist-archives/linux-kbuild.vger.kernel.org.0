Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D91FB409B23
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 19:42:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244362AbhIMRoM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 13:44:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242563AbhIMRoJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 13:44:09 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FAA0C061574
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Sep 2021 10:42:53 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id h9so22843309ejs.4
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Sep 2021 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/fXusuKKh/e5rHl3WvKLT7/eIYqq9n/M32FO5AEfQZ4=;
        b=Bb8jIWZyUA2JnH1dNvqA8PhazKDoFToI8m/EWHAoOqKLNqV8zTPjzKX6vSeXFJuKyf
         tIz9q+4BcBJIZrm/Iu+TQqerdjnjQiXXxiZVROuzlUAiYHdpJ05Qtsggzr+XxSztzHDf
         1zrSjLLUXzKthlfdL5NA8jPU2NHbiFKkxBxww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/fXusuKKh/e5rHl3WvKLT7/eIYqq9n/M32FO5AEfQZ4=;
        b=x724RKHTAlPLc6nX5g1VuyBnma1OjEBois6QaR3LIVHdcDkl6UcHwcr9IyK2Z40PnL
         Num6t56YDPrVTEhED0HU2Sz1lvcRHIQOxNUrKrnut6wXz5ugO/39f2fhqjVdoNB370me
         Q7qFc0OeBrLZnXDCY1Ae4Xjbgw9fZKT9am+Me3HBrFzfQHNbggVAMhgAIKxVq7A4t8I6
         w5ofUsemFm9b7V6fANKoUolFA7Np9OcPgZerlkdjhAnM+DzECUUz3kz7L5U2kx0YiJqT
         OiS3jaLFHlak+f/Dzikl/URv5N9J6bi94OZKMsjFy0mCUWgKY/O+V0BUDMTxtyvdfDBY
         wRmQ==
X-Gm-Message-State: AOAM5311L96AljesAVsGkT8rXWS3SYM34WN8Akq1e361le3axTEZxrYC
        PIblG3KPNdu5ZSA+EyM56yiil+rgcSYFHdkGXRg=
X-Google-Smtp-Source: ABdhPJyh7a7JCHdBiwpKi+Wr6CL2BcVqaN6sLshjdh3ALerRTzix/DDr8dTMjbzPZZvTiAlyEYbEmA==
X-Received: by 2002:a17:906:584:: with SMTP id 4mr14167833ejn.56.1631554971421;
        Mon, 13 Sep 2021 10:42:51 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id u10sm4200589eds.83.2021.09.13.10.42.51
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 10:42:51 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id i21so22835974ejd.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Sep 2021 10:42:51 -0700 (PDT)
X-Received: by 2002:a2e:1542:: with SMTP id 2mr11735241ljv.249.1631554960750;
 Mon, 13 Sep 2021 10:42:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com> <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org> <20210913093256.GA12225@amd>
 <87a6kgerdk.fsf@oldenburg.str.redhat.com>
In-Reply-To: <87a6kgerdk.fsf@oldenburg.str.redhat.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 13 Sep 2021 10:42:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj7M1_BXG2MXLv4OhjzjV-opy=5fE7+vafW5fHOyDrg+w@mail.gmail.com>
Message-ID: <CAHk-=wj7M1_BXG2MXLv4OhjzjV-opy=5fE7+vafW5fHOyDrg+w@mail.gmail.com>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
To:     Florian Weimer <fweimer@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev,
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

On Mon, Sep 13, 2021 at 2:50 AM Florian Weimer <fweimer@redhat.com> wrote:
>
> But there are also warnings which are emitted by the GCC middle-end (the
> optimizers), and turning on -Werror for those is very problematic.

People say that, but let's face it, that's simply not true.

There are real problematic warnings, and we just turn those warnings
off. People who want the self-flagellation can enable them with W=1
(or bigger values), and spend their life fighting stupid random
compiler warnings that have tons of false positives.

But the fact is, I've required a warning-free build on x86-64 for
anything I notice for the last several years by now, and it really
hasn't been a problem.

What _has_ been a problem is that (a) build bots don't care about and
(b) the configs I don't personally test (other non-x86-64
architectures stand out, but there's certainly been other
configuration issues too).

But "bogus compiler warnings" is very much *not* in that list of problems.

I've looked at a lot of the warnings that are now errors, and while a
number of them have made me go "So why didn't we see that on x86-64?"
not one of them has actually made me go "-Werror was wrong".

Because EVERY single one I've seen has been for something that should
have been fixed. Presumably long long ago, but the warning it
generated had been ignored.

So stop with the "some warnings just happen" crap. Outside of actual
compiler bugs, and truly stupid warnings (that we turn off), that's
simply not true.

And yes, those compiler bugs happen. The new warning already found one
issue with current gcc trunk (non-released). So right now the count is
"lots of valid warnings, and one compiler bug that was found _thanks_
to me enabling -Werror".

Yes, we have issues with having to work around older compiler bugs.
Those aren't going away, and yes, -Werror may well mean that
non-x86-64 people now have to deal with them.

And yes, this is painful. I'm very much aware of that. But we just
need to do it. Because the warnings don't go away on their own, and
not making them fatal clearly just means that they'll stay around
forever.

           Linus
