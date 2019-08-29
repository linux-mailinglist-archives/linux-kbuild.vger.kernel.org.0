Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 141CBA0E83
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Aug 2019 02:05:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbfH2AF5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 20:05:57 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36677 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfH2AF5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 20:05:57 -0400
Received: by mail-wr1-f67.google.com with SMTP id y19so1552773wrd.3;
        Wed, 28 Aug 2019 17:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gCMPxZVoHiSuQIWWRJ0Qttndb5+aZBERg8YRY+XH0I8=;
        b=OrEbQDx9JHiXvFAAkRhBZCo40dT7uqo/z+yARTZHWuKT0sJ1SsJaIsCy5sxWQmnlM+
         88Tv1x5iYIHNh2Xm8zsrOVsmmBctW8A8+7xq/QposQip8KIv0z/dtbBoOE0rERz6JSY6
         w/cCcvBnHVgd/m6ltjLioki/oVEMvl+MHN8SqgLN/6/iLGd2DXZ0tPINzWaYfqVxOcD3
         7yYbCprTfB+DkfXny746BaQoj/xksNB4c7Kls/a8d7PwWFqCDepZ8LW57lzAJWQhALgR
         XlzeKr8P1BPG/OyThx2/nBm4jpSNVAYoJHRnu1GD/FRgcq1cpwGGDoS0wNckUXEf4fOy
         zfsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gCMPxZVoHiSuQIWWRJ0Qttndb5+aZBERg8YRY+XH0I8=;
        b=QS6FeoON8UkUdFWXxGyALX7lVUGSyW8S4EZ9jhn0+gZPR4lm6LG7FFIcExNbB6oAJs
         lEbVYzhfGA07Q/LSuF/QFaOaOu7Qouj7ZaIesLHWErq3PYo3xL9jhXvUOUUE6KSM7a7t
         9k7d0TD2yZL9KEDA6CeDZYmyRBKDdBs3PC1PzrCjJ5E++36yVP6ESS6JwoVLWTJzWXJX
         4aDRpyCGdc3ZOMvGsaxE+/8yDM5o/DPONIwWC8p7tN2YMqJlpy7SBtd4YTL3djLDy0RT
         dz77FsBcTUpEhOCPy33YBvoai7S3tc7aCU0Lw7q1ry2BYx5qz/LYtkRG/JZ4G/2wRxqX
         5aTQ==
X-Gm-Message-State: APjAAAUzGjPfdhcU9AekZYIc48H2u+DN3pFB2ohjdTpZmwJjaeLtPdQ6
        Ls5WxdLuEO5rYrN7jJtqrEI=
X-Google-Smtp-Source: APXvYqxobm+0QzlDnBCAltTC9mN+DzSswyuw4a17MJh4Z1gN0Ra0mgRZx6gJBerdembNaAEpXWshJA==
X-Received: by 2002:adf:e846:: with SMTP id d6mr7410153wrn.263.1567037153482;
        Wed, 28 Aug 2019 17:05:53 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
        by smtp.gmail.com with ESMTPSA id n8sm536310wro.89.2019.08.28.17.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 17:05:52 -0700 (PDT)
Date:   Wed, 28 Aug 2019 17:05:51 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
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
Subject: Re: [PATCH 2/2] kbuild: allow Clang to find unused static inline
 functions for W=1 build
Message-ID: <20190829000551.GA62731@archlinux-threadripper>
References: <20190828055425.24765-1-yamada.masahiro@socionext.com>
 <20190828055425.24765-2-yamada.masahiro@socionext.com>
 <20190828182017.GB127646@archlinux-threadripper>
 <CAKwvOd=r5Y8hQQBeKZ6zAokPdyeT2AVKFsdviTvwV5AyDQQHrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=r5Y8hQQBeKZ6zAokPdyeT2AVKFsdviTvwV5AyDQQHrw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2019 at 04:28:30PM -0700, Nick Desaulniers wrote:
> On Wed, Aug 28, 2019 at 11:20 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> >
> > On Wed, Aug 28, 2019 at 02:54:25PM +0900, Masahiro Yamada wrote:
> > > GCC and Clang have different policy for -Wunused-function; GCC does not
> > > warn unused static inline functions at all whereas Clang does if they
> > > are defined in source files instead of included headers although it has
> > > been suppressed since commit abb2ea7dfd82 ("compiler, clang: suppress
> > > warning for unused static inline functions").
> > >
> > > We often miss to delete unused functions where 'static inline' is used
> > > in *.c files since there is no tool to detect them. Unused code remains
> > > until somebody notices. For example, commit 075ddd75680f ("regulator:
> > > core: remove unused rdev_get_supply()").
> > >
> > > Let's remove __maybe_unused from the inline macro to allow Clang to
> > > start finding unused static inline functions. For now, we do this only
> > > for W=1 build since it is not a good idea to sprinkle warnings for the
> > > normal build.
> > >
> > > My initial attempt was to add -Wno-unused-function for no W=1 build
> > > (https://lore.kernel.org/patchwork/patch/1120594/)
> > >
> > > Nathan Chancellor pointed out that would weaken Clang's checks since
> > > we would no longer get -Wunused-function without W=1. It is true GCC
> > > would detect unused static non-inline functions, but it would weaken
> > > Clang as a standalone compiler at least.
> 
> Got it. No problem.
> 
> > >
> > > Here is a counter implementation. The current problem is, W=... only
> > > controls compiler flags, which are globally effective. There is no way
> > > to narrow the scope to only 'static inline' functions.
> > >
> > > This commit defines KBUILD_EXTRA_WARN[123] corresponding to W=[123].
> > > When KBUILD_EXTRA_WARN1 is defined, __maybe_unused is omitted from
> > > the 'inline' macro.
> > >
> > > This makes the code a bit uglier, so personally I do not want to carry
> > > this forever. If we can manage to fix most of the warnings, we can
> > > drop this entirely, then enable -Wunused-function all the time.
> 
> How many warnings?

In an x86 defconfig build (one of the smallest builds we do), I see an
additional 35 warnings that crop up:

https://gist.github.com/003ba86ba60b4ac7e8109089d6cb1a5a

> > >
> > > If you contribute to code clean-up, please run "make CC=clang W=1"
> > > and check -Wunused-function warnings. You will find lots of unused
> > > functions.
> > >
> > > Some of them are false-positives because the call-sites are disabled
> > > by #ifdef. I do not like to abuse the inline keyword for suppressing
> > > unused-function warnings because it is intended to be a hint for the
> > > compiler optimization. I prefer #ifdef around the definition, or
> > > __maybe_unused if #ifdef would make the code too ugly.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > I can still see warnings from static unused functions and with W=1, I
> > see plenty more. I agree that this is uglier because of the
> > __inline_maybe_unused but I think this is better for regular developers.
> > I will try to work on these unused-function warnings!
> 
> How many are we talking here?
> 
> >
> > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> This is getting kind of messy.  I was more ok when the goal seemed to
> be simplifying the definition of `inline`, but this is worse IMO.

I guess if you want, we can just go back to v1 and have all unused
function warnings hidden by default with clang. Fixing these warnings
will take a significant amount of time given there will probably be a
few hundred so I don't think having this warning hidden behind W=1 for
that long is a good thing.

Cheers,
Nathan
