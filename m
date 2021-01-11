Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FCBF2F1E01
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Jan 2021 19:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390470AbhAKS3O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 11 Jan 2021 13:29:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390469AbhAKS3O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Jan 2021 13:29:14 -0500
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com [IPv6:2607:f8b0:4864:20::734])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BE04C061786;
        Mon, 11 Jan 2021 10:28:34 -0800 (PST)
Received: by mail-qk1-x734.google.com with SMTP id h4so408726qkk.4;
        Mon, 11 Jan 2021 10:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ExTGI1xPKNq4svVK8CHLz8qefNJSyDheErjNSIGWfZ4=;
        b=YYffgrENxRJQcTsL0yqhA7FrKx1Hkd/gDDpAE1Uhy0DuRc+FLL88lcZu/xG/QEF6aX
         IyYoJKxRhFEVT1EshDCkR7+UCtV6uoWOBBXStinXTvidZ2gvoLJpMnwQxwqNmtqpMNqg
         eZoXHV77NwXAvIPiAJMMT1pceSzmpiIsiaiCMUsnmyQG1EJunG3Ce7QYLY3t2dDG+IUi
         Z8YQb9B3OICTNK0ScFPDbn4Z0mMCkZ3We9mbWB+fHfG+/JG6xCntwPO8ZRVhSU8pC1RF
         07PnyjPB6wlyw/+TVo40ktJjT8YnTKmKVeRSWDo8MLp2ewPxzv4W9Tbb3y5ZvPUZ9nv/
         mzgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ExTGI1xPKNq4svVK8CHLz8qefNJSyDheErjNSIGWfZ4=;
        b=tYGH4GKA1kOSRehvZqr4+Mf+P5lvsBNa4g9t27u6jyXnHEHJkR36/T1iJautfliCzO
         f0cBwWV8/SnU+VIoElxMx0jMnPF7Ycpu5XWOMClidmrFWdwaMPKUvjK1CM8vhgNKtyjA
         yKU42+qNW33OCBfExxReSwPOtlL5ymZNQTcfYDLUJx63X1r1yxMRD9jV2c2W9iYOwJjM
         2XjOGsJGWMo6YCcmogxnZzKBb+hYGt88P752buHJzop8aU/bN8eNuWNPi1kfgeMZkXag
         rtD3a+YKJJLm6tTZdW+zss/JLiQlH/dz0uXhOPNl6ry2vpW6CR4f0IHGodnzxfkuSKh0
         WZzA==
X-Gm-Message-State: AOAM533a74mauWJVM5wFMc5D/dQE8xvD8IP7mbqTFgiPAU1wKO4mOMSy
        w5EI7snM///HpiY1k45kTvso35pOP+ZiGw==
X-Google-Smtp-Source: ABdhPJxqOPGIAmd28x6rr4jzh1TSGIWuX+9SrfehHjib9sM4AevbyanVEqzUI62bl8rGBeoXPgBS3g==
X-Received: by 2002:a37:b985:: with SMTP id j127mr606560qkf.85.1610389713257;
        Mon, 11 Jan 2021 10:28:33 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id g26sm332942qka.76.2021.01.11.10.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jan 2021 10:28:32 -0800 (PST)
Date:   Mon, 11 Jan 2021 11:28:31 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210111182831.GB758023@ubuntu-m3-large-x86>
References: <20210111081821.3041587-1-morbo@google.com>
 <CA+icZUUUTEdRNbmORy4X=UqMHLMEfD186o2mh23v_mXGBM8Anw@mail.gmail.com>
 <CAGG=3QUHWkuF0Q-=tNO5PztqtxuKYgyQy_EbBLyL0xNQ7TjgoQ@mail.gmail.com>
 <CA+icZUX0dtfOFLqyG_NOHgFnbwnOKEBP7Fo+RxgjhzuL3FPA9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+icZUX0dtfOFLqyG_NOHgFnbwnOKEBP7Fo+RxgjhzuL3FPA9g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jan 11, 2021 at 10:57:35AM +0100, Sedat Dilek wrote:
> On Mon, Jan 11, 2021 at 10:17 AM Bill Wendling <morbo@google.com> wrote:
> >
> > On Mon, Jan 11, 2021 at 12:39 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
> > >
> > > On Mon, Jan 11, 2021 at 9:18 AM 'Bill Wendling' via Clang Built Linux
> > > <clang-built-linux@googlegroups.com> wrote:
> > > >
> > > > From: Sami Tolvanen <samitolvanen@google.com>
> > > >
> > > > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > > > profile, the kernel is instrumented with PGO counters, a representative
> > > > workload is run, and the raw profile data is collected from
> > > > /sys/kernel/debug/pgo/profraw.
> > > >
> > > > The raw profile data must be processed by clang's "llvm-profdata" tool before
> > > > it can be used during recompilation:
> > > >
> > > >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > > >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > > >
> > > > Multiple raw profiles may be merged during this step.
> > > >
> > > > The data can be used either by the compiler if LTO isn't enabled:
> > > >
> > > >     ... -fprofile-use=vmlinux.profdata ...
> > > >
> > > > or by LLD if LTO is enabled:
> > > >
> > > >     ... -lto-cs-profile-file=vmlinux.profdata ...
> > > >
> > > > This initial submission is restricted to x86, as that's the platform we know
> > > > works. This restriction can be lifted once other platforms have been verified
> > > > to work with PGO.
> > > >
> > > > Note that this method of profiling the kernel is clang-native and isn't
> > > > compatible with clang's gcov support in kernel/gcov.
> > > >
> > > > [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> > > >
> > >
> > > Hi Bill and Sami,
> > >
> > > I have seen the pull-request in the CBL issue tracker and had some
> > > questions in mind.
> > >
> > > Good you send this.
> > >
> > > First of all, I like to fetch any development stuff easily from a Git
> > > repository.
> >
> > The version in the pull-request in the CBL issue tracker is roughly
> > the same as this patch. (There are some changes, but they aren't
> > functionality changes.)
> >
> > > Can you offer this, please?
> > > What is the base for your work?
> > > I hope this is (fresh released) Linux v5.11-rc3.
> > >
> > This patch (and the PR on the CBL issue tracker) are from top-of-tree Linux.
> >
> > > I myself had some experiences with a PGO + ThinLTO optimized LLVM
> > > toolchain built with the help of tc-build.
> > > Here it takes very long to build it.
> > >
> > > This means I have some profile-data archived.
> > > Can I use it?
> > >
> > LLVM is more tolerant of "stale" profile data than gcov, so it's
> > possible that your archived profile data would still work, but I can't
> > guarantee that it will be better than using new profile data.
> >
> > > Is an own PGO + ThinLTO optimized LLVM toolchain pre-requirement for
> > > this or not?
> > > That is one of my important questions.
> > >
> > Do you mean that the LLVM tools (clang, llc, etc.) are compiled with
> > PGO + ThinLTO?
> >
> 
> Yes.
> 
> - Sedat -

No, having an optimized LLVM toolchain is not a requirement of this
patchset. It will make compiling the kernel faster but it does nothing
more than that.

Cheers,
Nathan
