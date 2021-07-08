Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E5823C18DE
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Jul 2021 20:04:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbhGHSHO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Jul 2021 14:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230106AbhGHSHO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Jul 2021 14:07:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975B0C06175F
        for <linux-kbuild@vger.kernel.org>; Thu,  8 Jul 2021 11:04:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id f13so17789037lfh.6
        for <linux-kbuild@vger.kernel.org>; Thu, 08 Jul 2021 11:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yiCMe5lXnOMqVQwnybceaVdm0JMGJkLwBf5CkHBvdcQ=;
        b=KNyqlaWo68XAF1LEi/Zau37GxADoq7fDPldzB3kK0hRCO+hZWFs2TLfp/mSArdh64R
         8qgqFLrCf8nl0PgdG8YRDRjKsa8ENd3u9rtwfoOP0bPsUPJt7+GvL8y39VPwtowmoFLH
         hngpkVaUOiYi8u5Ux53PA1rRxZwL5Zm1IpkKf1kDFRAPeIes+B6QRQ9+64fFGlWdHc5T
         d7isaO66eQxpycEVitQxHmvDFRv2PbUKz2jKb74maumSHYmZvwQxWCvpcbrrIpMCLanI
         TA5FMBWVS8mUqjINC67OZaa11oOiQXYx73Phjt3BvAyRr+u0wGraPi+ydBAOi85/4fNt
         cjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yiCMe5lXnOMqVQwnybceaVdm0JMGJkLwBf5CkHBvdcQ=;
        b=L4xwbNcYFKmqyumTXmr4WzJYQsCsOKoh+iF8PqsXQl4UXNmxY0/9L/ht6w0srMnW8h
         ZZsLsbawA/rQhBpSabuolNmMmiMP6D4SX/s7JB2cmMBE1DD6v8L/gnmXfq8bgSD+qWBZ
         VQ1Zh9eBIto9j9bkG7qVP2W0IMNccKGx3ppuNxI6wUyV86hX4KDQB6tX/6BYcrJiAq/q
         M3J6j71VSSsPueQXBzv81sMpA9lNfpPQLXuY/wOwZoD+LOZKT1fLzR3MCMLi9/fksqRG
         rQsWwf/TPwGTXVNlTDT2XVAGP18JueTxA2cIbZp6WbiVvTJDFBiWsFGKhn1qmtfV1572
         cfLw==
X-Gm-Message-State: AOAM533i245FbiZz83qeiQO99CduUjj2DO7Nalq2eGOrgFzI47MhNwq6
        AGMxdKFhg1vIY6oBt6QpgV9GtszvROsXnYtliyABXg==
X-Google-Smtp-Source: ABdhPJyIFUQPbKflqF/C86UvPHbrRVN8BNDcuBn4arckRcNxvlI3kPz4SkAQllBsJa3/ypnpuIB51jOp8MPnnvUGYZY=
X-Received: by 2002:a19:5f04:: with SMTP id t4mr25450735lfb.297.1625767469586;
 Thu, 08 Jul 2021 11:04:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210707224310.1403944-1-ndesaulniers@google.com>
 <YOaR1ZjToP/kgNsC@infradead.org> <CAK8P3a1ctLcHuLZfBJ7wXHRmidpQZ4EZdML1nqPJVGYVTgHmaw@mail.gmail.com>
In-Reply-To: <CAK8P3a1ctLcHuLZfBJ7wXHRmidpQZ4EZdML1nqPJVGYVTgHmaw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 8 Jul 2021 11:04:18 -0700
Message-ID: <CAKwvOdkaifETNvtTA3O9EToVHAK0N50wkT-bHOpQ2RmFg7qk0A@mail.gmail.com>
Subject: Re: [PATCH 0/2] infer CROSS_COMPILE from ARCH for LLVM=1 LLVM_IAS=1
To:     Arnd Bergmann <arnd@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 8, 2021 at 12:27 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Thu, Jul 8, 2021 at 7:49 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Wed, Jul 07, 2021 at 03:43:08PM -0700, Nick Desaulniers wrote:
> > > We get constant feedback that the command line invocation of make is too
> > > long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
> > > target triple, or is an absolute path outside of $PATH, but it's mostly
> > > redundant for a given ARCH.
> > >
> > > Instead, let's infer it from ARCH, and move some flag handling into a
> > > new file included from the top level Makefile.
> >
> > Why only for LLVM?  I really hate the mess we currently have with
> > ARCH and CROSS_COMPILE.

I agree.

> > Being able to set both in .config (and maybe
> > even inferring CROSS_COMPILE where possible) would make my life so
> > much easier.
>
> I agree this would be best, but solving the problem for llvm is
> trivial with a 1:1
> mapping between ARCH= and --target= strings. Doing the same for gcc
> requires enumerating all possible target triples, and possibly deciding between
> different versions, e.g. when your path contains

Yes. There is a seldom used Kbuild macro for this: cc-cross-prefix.
It's hard coded to check for prefixed versions of gcc, but it will
handle the enumeration. Perhaps it could be used more widely, once we
know whether we're building with gcc or clang.  But as you note,
enumeration is kind of a waste of time for clang as these target
triples are known ahead of time.  I guess we could check that your
build of clang was configured with support for that target ARCH (since
you can disable backends when building clang), but I consider
disabling backends an antipattern, and I think the user will figure
out pretty quickly when they're trying to build a target that LLVM
doesn't support (whether due to configured-off or unimplemented
target).

> /usr/bin/powerpc64-linux-gnu-gcc-5.2.0
> /usr/bin/powerpc64-linux-gnu-gcc -> powerpc64-linux-gnu-gcc-5.2.0
> /usr/local/bin/ppc64le-linux-gcc-9
> ~/bin/powerpc/powerpc-linux-unknown-gcc-12.0.20210708.experimental
>
> all of these should be able to cross-build any powerpc kernel, but
> there is no obvious first choice (highest version, first in path,
> ordered list of target triples, ...). I tried coming up with a heuristic
> to pick a reasonable toolchain, but at some point gave up because
> I failed to express that in a readable bash or Makefile syntax.

Right; foremost in my mind was arm-linux-gnueabi-gcc vs
arm-linux-gnueabihf-gcc.  That's not even to mention the versioned
suffixes.

In terms of multiversion support; this series doesn't regress doing
things the hard/verbose way.  But I think for most users we can have a
simpler common case; folks can play with their $PATH or focus on more
hermetic builds if they want this new feature (CROSS_COMPILE
inference) AND support for multiple versions of the same toolchain.
-- 
Thanks,
~Nick Desaulniers
