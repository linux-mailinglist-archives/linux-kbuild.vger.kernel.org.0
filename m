Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 658AA43F371
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Oct 2021 01:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231489AbhJ1Xah (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 28 Oct 2021 19:30:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231434AbhJ1Xag (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 28 Oct 2021 19:30:36 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DB41C061745
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Oct 2021 16:28:09 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j9so16971772lfu.7
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Oct 2021 16:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v2NZVqDWdoVucsv8uhkHaXgoKbQvyvz0JI/8C3axFj0=;
        b=RnCAwZVxy7QKt+LZUrPTZt2C46+fJhrIILG0woPvFNPB0ITXfELJIWLn+ekVwQeW6u
         NCUfuuIOawzPAVWuS4eFW2z+Ey3R04FKVosZU3vLihK/dPK0PE8pd22bYLucsVQSCSfG
         n8FlDzunt6v0xBsXM+bJYA3cC4SduIDEpYPYOj3TJy1wlbGERNyv7Y7x1VmlOXbA42AB
         XqfHIlVO9v/aUkppqMqU2ILMDDmXLof3+lnI4neUiQ0QfcfGY8D8Bbi6WeXes7AKMw6/
         Hbp3Cxr7TynW0ezKPi/rZ3ZcU7CSG+ad/tG/zjWZsv6InOUSwfYFG3r1bPvWowatc2Fd
         FkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v2NZVqDWdoVucsv8uhkHaXgoKbQvyvz0JI/8C3axFj0=;
        b=WHDdFKFA4k9SRChY8e8VkXK/UgiWAHTvjHOgbYRDgXTSiFM3Uz9iM5bfMGUsfOpYCK
         ZTBV3v8vA+Jq2LpX5ZUA/b6UdwXGfdULrYRxOdoGKEDcwS/P+Bq0jnSSb/7oPDlwdT+f
         sBJNc46KJG8LHJgefOhamy7Kh6gxmo5lJhTPSFDUggYn/0cDlYZs86Q+XvB1tljYvMci
         fF3jHyS2qRmTX2mdZaGreGC5nOGaTHLxvoUG15B8dT+5CrfPwlSlE3MptwkPSEYJ7vvv
         0p19AH3Xbum7xpIeJBIicDvYu3oojuiUfwQSo+Aw9XKlwJpN14MpJRq8oZVzEgthyIE1
         TsTA==
X-Gm-Message-State: AOAM533qwRnMR/y77cEqsg8pmTQVpAUR33iKtqAJHi3tvUhxyBGqWN2G
        suD8W/FJWqiI8cbUPJEBgt0Bwh1G2KcStmHZxTPGOg==
X-Google-Smtp-Source: ABdhPJxyPCMzLSMX6BMpvUfaQg/tFqyUsmyDB2tZULGDfZBfJ9oA5/75vCUWsEtI+hqFXwHppll/S/RkQLTZUTmyHkw=
X-Received: by 2002:a05:6512:228a:: with SMTP id f10mr6932000lfu.489.1635463686807;
 Thu, 28 Oct 2021 16:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <YXqpFHeY26sEbort@hirez.programming.kicks-ass.net>
 <CAK7LNATUpgfKJvjp0+8H6VfMLMio9+BCoyj00mAO8FcaVGCqjg@mail.gmail.com>
 <YXqwZq53WUiTeqI7@hirez.programming.kicks-ass.net> <YXqyHhWGJfDkuxjP@hirez.programming.kicks-ass.net>
 <YXq72/yPe76DhDLu@hirez.programming.kicks-ass.net> <YXrhZoOgv5dtFMTs@archlinux-ax161>
 <20211028204855.GP174703@worktop.programming.kicks-ass.net>
In-Reply-To: <20211028204855.GP174703@worktop.programming.kicks-ass.net>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 28 Oct 2021 16:27:55 -0700
Message-ID: <CAKwvOd=x9E=7WcCiieso-CDiiU-wMFcXL4W3V5j8dq7BL5QT+w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Support clang-$ver builds
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        X86 ML <x86@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 28, 2021 at 1:49 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Thu, Oct 28, 2021 at 10:44:06AM -0700, Nathan Chancellor wrote:
>
> > I like the first iteration of this idea most, as CC=clang does not
> > currently imply using all LLVM tools. There are some architectures that
> > work with CC=clang but not LLVM=1 so I am not sure we want that meaning
> > to change.
>
> Could such architecture set a CONFIG symbol to indicate they're
> handicapped and have that make the Makefile not use the full LLVM suite?

At this point, it's just powerpc and s390 where the assembler in llvm
needs more work. Every other arch we can compile we generally can
generally link. (modulo some long tail configs).

> > 2. Update the documentation to describe using the
> >
> >    $ PATH=/usr/lib/llvm-#/bin:$PATH make LLVM=1 ...
> >
> >    trick. This has been the preferred method for using different
> >    versions of LLVM but it has never been documented anywhere. This
> >    would allow us to keep the current build infrastructure while giving
> >    people clear instructions for how to handle different versions of
> >    clang. As Peter has noted, this would require people who are not
> >    familiar with building with LLVM to be constantly looking at the
> >    documentation to remember the command to invoke, whereas with
> >    LLVM=-#, it is easy to remember.
>
> Right, this is no more than a crude hack and is super unfriendly. It
> should never have been accepted.

Lots of tools modify PATH in your `.bashrc` or `.zshrc` etc.  I don't
see how that's any different, other than one off commands in which you
actually intend to use a specific version.

> So how about we do the below instead? Then the normal way of things will
> be:
>
>  $ make CC=clang-12
>
> and it will all *just*work*. The incomplete LLVM archs can revert back
> to the old hybrid (clang+binutils) way of things by doing:
>
>  $ make CC=clang LLVM=0
>
> Which explicitly states, use clang but don't use the full llvm suite. Or
> they can do that CONFIG_LLVM_BROKEN (or whatever) to have them default
> to LLVM=0
>
> ifdef CONFIG_LLVM_BROKEN
> LLVM ?= 0
> endif
>
> in front of the CC magic in the below patch should take care of that.

I don't think setting CC should affect LD and friends (if you were
suggesting that CC=clang-12 replace LLVM=1).  Like Nathan, I'm
sympathetic and think that your first patch is probably closer to what
I'd accept, but it needs to handle non-suffixed versions (looks like
it should) and add this info to Documentations/kbuild/llvm.rst.
-- 
Thanks,
~Nick Desaulniers
