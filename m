Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A04253DDF2B
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Aug 2021 20:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhHBSaj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Aug 2021 14:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbhHBSaj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Aug 2021 14:30:39 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65837C06175F
        for <linux-kbuild@vger.kernel.org>; Mon,  2 Aug 2021 11:30:29 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id n6so25038559ljp.9
        for <linux-kbuild@vger.kernel.org>; Mon, 02 Aug 2021 11:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c8TcBGmyR9gclpUTkI1EdTWgQL1bdhzCcbivOvr1tM4=;
        b=v+2nSFB6R4xfg/1tRswVpbesqfqMlOMTxeSwgzMS4/Je0T7YWpDFciMvXDj/YmcHVX
         vEwaADhXQCoYhzoLIaNLkXJjaROZ4R7yoBBpoX9KMHr1FoyAQ1Hj8m08ewwPdsp+pr4S
         5Kpmafn2K2Ybh85YE8HjB6Mp8p9QDOroDFNVgrIArn75HGzLx/8GskkaguIxomSJsomq
         e2WIfWELptmicmQU0v7+mrbduh+nALynM4fk7OUQJMoOdop3vZovwSCbMIpQjhH0TuiS
         /vyZebrXqmUCnNJwdZF+lmeG9e/7YTo4uUVOp69lDkhEzFcwlziRsErEMQ6gTcZXgLc4
         Wwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c8TcBGmyR9gclpUTkI1EdTWgQL1bdhzCcbivOvr1tM4=;
        b=NMOXTC8XJ+YNmEhY39/i4bCwbEJkcHQ8mJwqRxqJEkU/G7gABuUEawDOrV1hh/U8kw
         KUg69xr035VmtNOGl7JfDInDMJbCiSW/NFRU/bgGmHV8GuJUqqBIjRyjnyenw72UqJj+
         BmIR/KMVySsGUV28uW4p5BUeLSAXPbM+D5xSNzwsu7hNlaEXUXMp1/0gbZnQQwCmn7m0
         0tYJcbRTJnWXbSCuTug/d7m/whMQMwCqLGjoSC7nOTgQzee8bwmCkMSqoA0paWSD3ouD
         5kST1ZB3XbA3i3gRZDZuQpEBugOvSD826ttf0qvXhrvyGov4H3ZqCaun6zYciGHfC9bk
         +u5g==
X-Gm-Message-State: AOAM532tfPZF8t0jeugnDRTIlxHcGjaCgfDrKmmFTGKSBdpjXWwCIzbW
        BS6Kmm62J+gNL13NjKK2+OTEI6eLb5kVlH7CU6txXQ==
X-Google-Smtp-Source: ABdhPJy5Ow0zC41Zhsdb1BrDBMubmUcVpcxtgtXXRjyz8DDjCNGpRcSs4JzP79rXKVn/nFxRpF22FiQlMKNBAg8+lDE=
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr12114926ljj.495.1627929027452;
 Mon, 02 Aug 2021 11:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210730215708.276437-1-ndesaulniers@google.com>
 <20210730215708.276437-4-ndesaulniers@google.com> <20210730231252.r6fi6c3i6obbcgfi@google.com>
 <CAK7LNASSpc8JBivPGFSvxMdgh6+emwav9YPmnygrdPkX-Q1a+A@mail.gmail.com>
In-Reply-To: <CAK7LNASSpc8JBivPGFSvxMdgh6+emwav9YPmnygrdPkX-Q1a+A@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Mon, 2 Aug 2021 11:30:16 -0700
Message-ID: <CAKwvOdnUOAAkWBcwSB2+0swJdkxSja+6QBorqdqD++6q8DY7Kg@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] Documentation/llvm: update CROSS_COMPILE inferencing
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Fangrui Song <maskray@google.com>, Miguel Ojeda <ojeda@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jul 30, 2021 at 5:05 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Jul 31, 2021 at 8:12 AM Fangrui Song <maskray@google.com> wrote:
> >
> > On 2021-07-30, Nick Desaulniers wrote:
> > >+For example, to cross-compile the arm64 kernel::
> > >+
> > >+      ARCH=arm64 make LLVM=1 LLVM_IAS=1
> >
> > Is  ARCH=arm64 make LLVM=1 LLVM_IAS=1
> >
> > preferred over
> >
> >    make ARCH=arm64 LLVM=1 LLVM_IAS=1
> >
> > ?
>
>
> I do not think so.
>
> For consistency,
>
>    make ARCH=arm64 LLVM=1 LLVM_IAS=1
>
> or
>
>    ARCH=arm64 LLVM=1 LLVM_IAS=1 make
>
> might be preferred.
>
>
>
> But, in the same doc, I see an example, which
> mixes up the env variables and a make variable.
>
>      ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make CC=clang

Perhaps it's just muscle memory from when I started working on Nexus
phone kernels ~5 years ago; that's how our build scripts invoked make
(with ARCH and CROSS_COMPILE as env vars).

IIRC, GNU make has the notion of `origin` for variables.
https://www.gnu.org/software/make/manual/html_node/Origin-Function.html
So "before `make`" would be "environment" and "after `make`" would be
"command line."

I'm rereading the section on assignment to see if one of the
assignment operators was affected by origin.
https://www.gnu.org/software/make/manual/html_node/Setting.html
https://www.gnu.org/software/make/manual/html_node/Flavors.html#Flavors

I could have sworn that due to one of the assignment operators
(perhaps `?=`) that the orderings weren't commutative.
$ make ARCH=arm64 LLVM=1 LLVM_IAS=1 -j72
works
$ ARCH=arm64 LLVM=1 LLVM_IAS=1 make -j72
also works.  Hmm...maybe I misremembered the issue then.

Ok, I will reorder all instances to use the command line rather than
env vars in v6.
-- 
Thanks,
~Nick Desaulniers
