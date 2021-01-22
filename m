Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CD2E2FFA17
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 02:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbhAVBoR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 20:44:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726576AbhAVBoP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 20:44:15 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91F4EC0613ED;
        Thu, 21 Jan 2021 17:43:35 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id y19so8127510iov.2;
        Thu, 21 Jan 2021 17:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=ZrJ80j43VKcZseBzjEDXZkPUTdnyBRJJDoCKdAeE1fI=;
        b=BZHLJs8y7K7z7YH/cc5895ObD9XSbV79EkAZkoaVlzFA/QZxYwP7ZMPn1HmaLZKPrf
         WvMBu8rtxXlYkkCIZomHFjjLjP4fyPuLS6Xq+spyMsUajuQDZLcHrGZzi9ZzIeV1o8dO
         6Jk5Fhir96oK70iFJ/gmVvJXlyfsqVprd2Cv2XlDY+nrg3DCRBi4Ibac2Lrf903p/uz7
         xNuoAyXv7lQty/qBiiL82W5cFdFvxRt4tIbmwTJ03Z5jQ0oWxzMoIUfGb+60+5m4CDIV
         WBZV+F9gWwhXpVpRpwJaGBBwqouWi2mbEePE+miVKPhr7HkgHoU7QgYnR705S+I+V+rS
         4obA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=ZrJ80j43VKcZseBzjEDXZkPUTdnyBRJJDoCKdAeE1fI=;
        b=e0tYzEvyIZ8nCM/BUyv+toeQGxfeqccuzT3QHArUfr83F2Rom5E2PR0MgM1VW7ZC9u
         W1gbF9p+TAYR52u4NQPvcGNNvwQxwNVW7WS//zgF2iyUpGLAafFBxWaDDlqERukCmM8A
         wty/iEZnUo54tCrQHEdbI9w94mybc2fnD34zNKR6l9PEK2VQx0kUXxWsZiO+LBqnaaU3
         5nFWjmSZ5QXKg3ayDD8aJoYxPtbZOZvKlDk62CXqzP3T76dk3W0Nognp8vPwqMrvI6LP
         s/aLsndfYyX0IAszMKHS1A+7babUkDDZkR+0mHSB/I9ZJuXXt8d9+lLxqZa+LWee5259
         g/3g==
X-Gm-Message-State: AOAM533K93/eQsliw5P5ZDjnIgQj07C8GQQIYZu/GTaZxwSfizOeZxoh
        Zz/aQAfxCnMmm//d61bDpe6tTP8XIaCfSd/zECI=
X-Google-Smtp-Source: ABdhPJymx8Bn1sq6nZPrF1cpZiJAS8Lcdh9suUKk0PTc/fDL0K+W66e6vcTP510AgmBpJ28Ps5j79WbRVqRvfnuMAzQ=
X-Received: by 2002:a5e:970c:: with SMTP id w12mr919750ioj.171.1611279814937;
 Thu, 21 Jan 2021 17:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <CA+icZUW63tP7kzWCKofJH0E0xA7yLCYpSOYz_aw1D4mkhNhW=w@mail.gmail.com>
 <CAKwvOd==OfKHKzhWVGAQs5bFJ9qSbm8WRkX7qDF+FQd-p1gdNQ@mail.gmail.com>
In-Reply-To: <CAKwvOd==OfKHKzhWVGAQs5bFJ9qSbm8WRkX7qDF+FQd-p1gdNQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 22 Jan 2021 02:43:22 +0100
Message-ID: <CA+icZUWfgu2aHRTJZWSd6hjk58YkmU7ey4iRk=8=wVf5twSMAA@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 22, 2021 at 2:34 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Jan 20, 2021 at 6:21 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > Hi,
> >
> > When I looked through the code I wondered why we do not add a
> > "CONFIG_PGO_CLANG_PROFDATA" which can be helpful when doing the PGO
> > rebuild with a vmlinux.profdata.
> >
> > This introduces a "PGO_PROFDATA" to turn on/off to pass
> > "-fprofile-use=vmlinux.profdata" (see CFLAGS_PGO_CLANG_PROFDATA in
> > top-level Makefile).
> >
> > If we turn off via "PGO_PROFILE := n" in several Makefiles - we should
> > do the same and add "PGO_PROFDATA := n" to the same Makefiles?
> >
> > Please see the attached diff.
>
> This is a good idea; something that I brought up in initial code
> review (on github).  Would it be ok with you to land the core first,
> then follow up with this suggestion?
>
> Also, AutoFDO production builds are so incredibly similar to PGO
> builds that I could see a possible path forward:
> 1. land PGO upstream
> 2. adds docs for AutoFDO
> 3. consider a config for hardcoding the location of the profiling data
> so that we don't need to specify it at the command line invocation of
> make.
>

I made a v3 - with some small nits.
The idea was to do the "PGO-rebuild" handling a bit easier.

But as you say that can wait.

Some personal notes:

I will be very happy when people verify/confirm what's going on with
PGO-rebuild + LLVM_IAS=1.
As said GNU/AS and PGO-rebuild is fine.
( This seems to be independent of clang-12 or clang-11. )
( This seems to be independent of DWARF v4 or v5 enabled. )

The benefit here I saw was a reduction in build-time of 00:30 seen
from a total 04:30 when using a PGO-rebuilt Linux-kernel.
Approx. 10%?

This is not much compared to a ThinLTO + PGO optimized LLVM toolchain
whcih saved here 40% of build-time.

- Sedat -
