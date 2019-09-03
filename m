Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 55233A6D06
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Sep 2019 17:38:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729578AbfICPit (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 3 Sep 2019 11:38:49 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:33299 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727667AbfICPit (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Sep 2019 11:38:49 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x83FcfWC009616;
        Wed, 4 Sep 2019 00:38:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x83FcfWC009616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1567525122;
        bh=ddsALsfzO0Qd/rlS27Z9Zxje7b1eMLR4GVZ55uvcTqA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=sfMjBj2S2X9l8J2e4Fx8ZAKzz7/7evDwry2dnzrludXKrQ+mZuz9w2xuSSQI4M+/S
         lawYclHxvJM5aO5e0nOOP77VQyUtKkdnXU+O9xDQ+F83eOMBTFW1GeHarV24kXWN+a
         mnCWAwNv6URtIYjO5ZAjdim1fDgldC5olOlK/hNyH+QoQPZLdcILNNTozDo40zCifh
         sDy6jFh8fJ2ujoa+8SYLpbyKPlBJwg4EgzylzMMqITQO19HXmmAL/MuKHHdry9iZco
         pbDY7NxFzeQaLbIn6SIzF6xr7MZvsOh5aOZqZnSvqPwwJZXSJ1bhoBhfpr2ltKNQCl
         7KWnWX3SKs24Q==
X-Nifty-SrcIP: [209.85.222.47]
Received: by mail-ua1-f47.google.com with SMTP id x2so5631790uar.8;
        Tue, 03 Sep 2019 08:38:42 -0700 (PDT)
X-Gm-Message-State: APjAAAVxEVN6I407s425E4zcEPAQPDVDuMSRwDitVhrQE4agoNyuTam0
        9JUwo4E24+qiU6IUuambOWo7h7GbyjLw1VtHVaY=
X-Google-Smtp-Source: APXvYqziWvsVfo+DPHXywxk2KF/QFGtnFxRq4I537vXTbMgRSrTiWQnlLgQHO6TfYsfWCtdi5x0mpqJRspDDhMaRbrI=
X-Received: by 2002:a9f:2213:: with SMTP id 19mr5138825uad.25.1567525121006;
 Tue, 03 Sep 2019 08:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <20190828055425.24765-2-yamada.masahiro@socionext.com> <20190828182017.GB127646@archlinux-threadripper>
 <CAKwvOd=r5Y8hQQBeKZ6zAokPdyeT2AVKFsdviTvwV5AyDQQHrw@mail.gmail.com> <20190829000551.GA62731@archlinux-threadripper>
In-Reply-To: <20190829000551.GA62731@archlinux-threadripper>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Wed, 4 Sep 2019 00:38:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARL45QYMR5PM0kte-y6_XSErsGgoUJ6zg421hK99VT=+w@mail.gmail.com>
Message-ID: <CAK7LNARL45QYMR5PM0kte-y6_XSErsGgoUJ6zg421hK99VT=+w@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: allow Clang to find unused static inline
 functions for W=1 build
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Sven Schnelle <svens@stackframe.org>,
        Xiaozhou Liu <liuxiaozhou@bytedance.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 29, 2019 at 9:05 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 04:28:30PM -0700, Nick Desaulniers wrote:
> > On Wed, Aug 28, 2019 at 11:20 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Wed, Aug 28, 2019 at 02:54:25PM +0900, Masahiro Yamada wrote:
> > > > GCC and Clang have different policy for -Wunused-function; GCC does not
> > > > warn unused static inline functions at all whereas Clang does if they
> > > > are defined in source files instead of included headers although it has
> > > > been suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> > > > warning for unused static inline functions").
> > > >
> > > > We often miss to delete unused functions where 'static inline' is used
> > > > in *.c files since there is no tool to detect them. Unused code remains
> > > > until somebody notices. For example, commit 075ddd75680f ("regulator:
> > > > core: remove unused rdev_get_supply()").
> > > >
> > > > Let's remove __maybe_unused from the inline macro to allow Clang to
> > > > start finding unused static inline functions. For now, we do this only
> > > > for W=1 build since it is not a good idea to sprinkle warnings for the
> > > > normal build.
> > > >
> > > > My initial attempt was to add -Wno-unused-function for no W=1 build
> > > > (https://lore.kernel.org/patchwork/patch/1120594/)
> > > >
> > > > Nathan Chancellor pointed out that would weaken Clang's checks since
> > > > we would no longer get -Wunused-function without W=1. It is true GCC
> > > > would detect unused static non-inline functions, but it would weaken
> > > > Clang as a standalone compiler at least.
> >
> > Got it. No problem.
> >
> > > >
> > > > Here is a counter implementation. The current problem is, W=... only
> > > > controls compiler flags, which are globally effective. There is no way
> > > > to narrow the scope to only 'static inline' functions.
> > > >
> > > > This commit defines KBUILD_EXTRA_WARN[123] corresponding to W=[123].
> > > > When KBUILD_EXTRA_WARN1 is defined, __maybe_unused is omitted from
> > > > the 'inline' macro.
> > > >
> > > > This makes the code a bit uglier, so personally I do not want to carry
> > > > this forever. If we can manage to fix most of the warnings, we can
> > > > drop this entirely, then enable -Wunused-function all the time.
> >
> > How many warnings?
>
> In an x86 defconfig build (one of the smallest builds we do), I see an
> additional 35 warnings that crop up:
>
> https://gist.github.com/003ba86ba60b4ac7e8109089d6cb1a5a
>
> > > >
> > > > If you contribute to code clean-up, please run "make CC=clang W=1"
> > > > and check -Wunused-function warnings. You will find lots of unused
> > > > functions.
> > > >
> > > > Some of them are false-positives because the call-sites are disabled
> > > > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > > > unused-function warnings because it is intended to be a hint for the
> > > > compiler optimization. I prefer #ifdef around the definition, or
> > > > __maybe_unused if #ifdef would make the code too ugly.
> > > >
> > > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > >
> > > I can still see warnings from static unused functions and with W=1, I
> > > see plenty more. I agree that this is uglier because of the
> > > __inline_maybe_unused but I think this is better for regular developers.
> > > I will try to work on these unused-function warnings!
> >
> > How many are we talking here?
> >
> > >
> > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> >
> > This is getting kind of messy.  I was more ok when the goal seemed to
> > be simplifying the definition of `inline`, but this is worse IMO.
>
> I guess if you want, we can just go back to v1 and have all unused
> function warnings hidden by default with clang. Fixing these warnings
> will take a significant amount of time given there will probably be a
> few hundred so I don't think having this warning hidden behind W=1 for
> that long is a good thing.
>
> Cheers,
> Nathan

I slightly prefer this version.

Either way we go, I want to fix -Wunused-function warnings,
then revert this patch as soon as possible.


--
Best Regards

Masahiro Yamada
