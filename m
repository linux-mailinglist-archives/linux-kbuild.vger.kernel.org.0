Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C07316FE8E
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Feb 2020 13:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgBZMBf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 26 Feb 2020 07:01:35 -0500
Received: from conssluserg-03.nifty.com ([210.131.2.82]:30600 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbgBZMBf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Feb 2020 07:01:35 -0500
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 01QC1CtU011814;
        Wed, 26 Feb 2020 21:01:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 01QC1CtU011814
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582718473;
        bh=eXTv3XS960d93mdHxhl8i6TVCJ/l9qSZuAjHESIHG2s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RiBwv/nbo06+ybabZje9MLku45Btk+6OGVb0x+n8SbOsRq5wOgQeMxYIMddVUVaEy
         /JH6ws7acdEX8lba97FEDcMat2KV3KLj/4JiNJrgQFhmDY0tUVswH3PS0Kc1GZVbFS
         pKtJzRf1LSygraPW/jZk1rt2Hxsmd/ptzcS53n0c2h0nIx9G+ZR0OTovyE8HJLrNWP
         SlcdFB0PV5KN1b0BId85rEDHqCls859/m3gOVXtn8FzUCZj9rP6DzOtkIn4kxQwxtx
         OHOa2T8kqE7rIHOV9fXnqy/dozEHe5SWprLTTkSe6By3tBuf4js0wlrf2RauUUbExz
         a+j8TT8sdb+wQ==
X-Nifty-SrcIP: [209.85.217.51]
Received: by mail-vs1-f51.google.com with SMTP id a2so1613631vso.3;
        Wed, 26 Feb 2020 04:01:12 -0800 (PST)
X-Gm-Message-State: APjAAAVEu2Ktc608rmrfnnZS8iwGiLuNc4pyH6+iVcTepwxBInWWTQuZ
        eyOjAfvlvxfLNpv2hxqW00e3nlx7PmNKskWyfB0=
X-Google-Smtp-Source: APXvYqx3LP0q+bkiPVV09PznkyGCTfst/gdYLLu7IP0hS6bM01tzLTzARRP6CwmtiftJ0tFjVgP7GdJLXugAuCGYN2g=
X-Received: by 2002:a05:6102:190:: with SMTP id r16mr3585123vsq.215.1582718471427;
 Wed, 26 Feb 2020 04:01:11 -0800 (PST)
MIME-Version: 1.0
References: <20200224174129.2664-1-ndesaulniers@google.com>
 <CAK7LNASNsOmyqFWYtJHB4UcHAed5C_isWvMJ4MKHu0O=yUy=8w@mail.gmail.com> <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
In-Reply-To: <CAKwvOd=mPg79CrYnDm8=z0iJpKL0FHm9J5qZF0_A6BFXBv8Dow@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 26 Feb 2020 21:00:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ83rLAm1GcvrgJbinyAVPpM_SoxfO7RdOAfmXyg2tBdQ@mail.gmail.com>
Message-ID: <CAK7LNAQ83rLAm1GcvrgJbinyAVPpM_SoxfO7RdOAfmXyg2tBdQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation/llvm: add documentation on building w/ Clang/LLVM
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 26, 2020 at 5:52 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Mon, Feb 24, 2020 at 4:34 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Feb 25, 2020 at 2:41 AM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > Added to kbuild documentation. Provides more official info on building
> > > kernels with Clang and LLVM than our wiki.
> > >
> > > Suggested-by: Kees Cook <keescook@chromium.org>
> > > Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> > > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > > ---
> >
> >
> > Perhaps, is it better to explicitly add it to MAINTAINERS?
> >
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -4118,6 +4118,7 @@ W:        https://clangbuiltlinux.github.io/
> >  B:     https://github.com/ClangBuiltLinux/linux/issues
> >  C:     irc://chat.freenode.net/clangbuiltlinux
> >  S:     Supported
> > +F:     Documentation/kbuild/llvm.rst
> >  K:     \b(?i:clang|llvm)\b
>
> I'm happy to leave it to the maintainers of Documentation/.  Otherwise
> we have a file for which there is no MAINTAINER, which seems
> ambiguous.

It is common that MAINTAINERS lists per-file (per-driver) maintainers.
It does not necessarily mean a person who picks up patches.

scripts/get_maintainer.pl lists maintainers that
match any F:, N:, K: patterns.
So, both Doc and Kbuild maintainers/ML will still be listed.

Having said that, it is up to you. Either is fine with me.
Another pattern 'K: \b(?i:clang|llvm)\b'  covers this file anyway.


(BTW, I am also happy to see your name as the maintainer of this entry.)


Thanks.

--
Best Regards
Masahiro Yamada
