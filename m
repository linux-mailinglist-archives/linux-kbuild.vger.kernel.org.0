Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 563162F0F8B
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 10:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728803AbhAKJ61 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 04:58:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728747AbhAKJ61 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 04:58:27 -0500
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4283C061786;
        Mon, 11 Jan 2021 01:57:46 -0800 (PST)
Received: by mail-il1-x12a.google.com with SMTP id q5so17717019ilc.10;
        Mon, 11 Jan 2021 01:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=j5tKtkam/Ub1Md37B64s62bHI597iFY5nKOCVt15ZyM=;
        b=DQxOQePu1f+CNNPICvfkgHa84Fbf8AlNxPNV6ghJ4t2BwGM8JkCbEGbLcNi9CXSRnc
         MzeK5k+viO8ZKl/v5g+v8flEroGTb4h/QQB24XOCj0u382KRixPxng+uQGYkKtv4Bbko
         q+MIkVGc/+jj4b9hIOyTJqp1h3Ese30G4/xnU3uOa1rECHMcN72vuQbhfHQxL6TmBNVo
         EAS1mC8S3+/zfyIepZBcMCTYiiG+FH8H/5FOnxsD/wko9MZcXPQWlWo6q234pcSMPPkK
         c/dj8jZCRW3zk8vlprQEVwYuP9A7o1SELF4ccP2OZgOihZw0JZATHhyxCwkH4YuNuQQJ
         kRRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=j5tKtkam/Ub1Md37B64s62bHI597iFY5nKOCVt15ZyM=;
        b=M8JiJkCkH4IUriz3EAEXWz9Vfwp3fsjZgpyuBpCAc5FMklIk0VaQcza6DVf1NHxMQL
         OWkzKpkenPApHwnrKPlUlS0CMwcFfSnIkXsNwtfZ5o5L5ioRgplpMCMN9xz25+pTfGWR
         c0rAJ3FQAdGWO+J/2oRsl3sDqOsnLQLSOYS2aEgydEm8+60hLsJmTFKj62i629d4+Ypp
         tXDDO21+iD5PxPu8PTaD/2tN0D3Ett5gcyVKMv8TMMsETm7HmkLFlM7XKgvsjE+h5dMp
         AMgKJyTUskk7qR0fIYk8veVodVgXpKbEItswhPEv9Qq7atp6/+quhVexJK5q6NsSIVO2
         izew==
X-Gm-Message-State: AOAM5323QclLNWEl2hWJqQXaM9w0+ih+fKoPdtwReBsR28gsl5V4gYdt
        0zG2XxWhktyQYJaOgCzN0+oyXocOzGVLqqzPJG3cVRLGC5Y=
X-Google-Smtp-Source: ABdhPJwk5lY6v7HKoEEASQWkDydI1fEGTlefVwheDttp2GtidFIWoSG5Tf7yohRZNlriF4xgoqGYylZcU/NSqYHtKTk=
X-Received: by 2002:a92:c045:: with SMTP id o5mr5291338ilf.10.1610359066132;
 Mon, 11 Jan 2021 01:57:46 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <CA+icZUUUTEdRNbmORy4X=UqMHLMEfD186o2mh23v_mXGBM8Anw@mail.gmail.com>
 <CAGG=3QUHWkuF0Q-=tNO5PztqtxuKYgyQy_EbBLyL0xNQ7TjgoQ@mail.gmail.com>
In-Reply-To: <CAGG=3QUHWkuF0Q-=tNO5PztqtxuKYgyQy_EbBLyL0xNQ7TjgoQ@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 11 Jan 2021 10:57:35 +0100
Message-ID: <CA+icZUX0dtfOFLqyG_NOHgFnbwnOKEBP7Fo+RxgjhzuL3FPA9g@mail.gmail.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 11, 2021 at 10:17 AM Bill Wendling <morbo@google.com> wrote:
>
> On Mon, Jan 11, 2021 at 12:39 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> >
> > On Mon, Jan 11, 2021 at 9:18 AM 'Bill Wendling' via Clang Built Linux
> > <clang-built-linux@googlegroups.com> wrote:
> > >
> > > From: Sami Tolvanen <samitolvanen@google.com>
> > >
> > > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > > profile, the kernel is instrumented with PGO counters, a representative
> > > workload is run, and the raw profile data is collected from
> > > /sys/kernel/debug/pgo/profraw.
> > >
> > > The raw profile data must be processed by clang's "llvm-profdata" tool before
> > > it can be used during recompilation:
> > >
> > >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > >
> > > Multiple raw profiles may be merged during this step.
> > >
> > > The data can be used either by the compiler if LTO isn't enabled:
> > >
> > >     ... -fprofile-use=vmlinux.profdata ...
> > >
> > > or by LLD if LTO is enabled:
> > >
> > >     ... -lto-cs-profile-file=vmlinux.profdata ...
> > >
> > > This initial submission is restricted to x86, as that's the platform we know
> > > works. This restriction can be lifted once other platforms have been verified
> > > to work with PGO.
> > >
> > > Note that this method of profiling the kernel is clang-native and isn't
> > > compatible with clang's gcov support in kernel/gcov.
> > >
> > > [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> > >
> >
> > Hi Bill and Sami,
> >
> > I have seen the pull-request in the CBL issue tracker and had some
> > questions in mind.
> >
> > Good you send this.
> >
> > First of all, I like to fetch any development stuff easily from a Git
> > repository.
>
> The version in the pull-request in the CBL issue tracker is roughly
> the same as this patch. (There are some changes, but they aren't
> functionality changes.)
>
> > Can you offer this, please?
> > What is the base for your work?
> > I hope this is (fresh released) Linux v5.11-rc3.
> >
> This patch (and the PR on the CBL issue tracker) are from top-of-tree Linux.
>
> > I myself had some experiences with a PGO + ThinLTO optimized LLVM
> > toolchain built with the help of tc-build.
> > Here it takes very long to build it.
> >
> > This means I have some profile-data archived.
> > Can I use it?
> >
> LLVM is more tolerant of "stale" profile data than gcov, so it's
> possible that your archived profile data would still work, but I can't
> guarantee that it will be better than using new profile data.
>
> > Is an own PGO + ThinLTO optimized LLVM toolchain pre-requirement for
> > this or not?
> > That is one of my important questions.
> >
> Do you mean that the LLVM tools (clang, llc, etc.) are compiled with
> PGO + ThinLTO?
>

Yes.

- Sedat -
