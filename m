Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1A0B19ECB3
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2020 18:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgDEQqO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 5 Apr 2020 12:46:14 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:56167 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgDEQqO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 5 Apr 2020 12:46:14 -0400
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 035GjvtX031028;
        Mon, 6 Apr 2020 01:45:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 035GjvtX031028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1586105158;
        bh=LDPKC1ers4KTra5PaosAQKb9OtIhKkb2IRgJKJ1PucE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Y5QCnFozrWTlxaHtyTykbkZ0Ddh7rTi7pFwk4XaWcyMFcnULagcpHiEla1zY9Wmzl
         OHmDY+LuUu8rVfFyHsB7HinrRAsqQ2JvfOOnayI3dEJ0KGU4gSbSQh/lluFfkixUQ1
         LJw/fi8trFtq0blreMEYLNcnjKGcPcSwxN3zhNAO1OzV3UFoxEcxW7OPBJcqKQQP/U
         wGcwKlcQoGov6w2BdQDHei0cYKQtJPsTr9LpALXRxdZ6KrAygTIetbGRiFy6Zbb3y2
         4f5ejtXS6je98Bzd0aNSONhVddx/Swm2yhz/dYmxnNo6vCCMzGtCvN2l37XgM7Dza6
         cWGn8ZkwFbXrQ==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id m15so3852274uao.3;
        Sun, 05 Apr 2020 09:45:57 -0700 (PDT)
X-Gm-Message-State: AGi0Pubu2v7hgfCF+lt6QKdoEEX6gpHGGLbdNXJBgmQgXl9n4lhrw6MK
        pwg7SDyQgTApUjR6l3fI5tZs891xkFoOwg1YVPc=
X-Google-Smtp-Source: APiQypIJjTRv4/QIF7T7DcDr8dCRlMy7i4kMOc03WYHXZyFiwa5KFZs/MqC1iS0miqJ/J+/Jvp2NsoHJThWlwjI/jjQ=
X-Received: by 2002:ab0:20d6:: with SMTP id z22mr12839027ual.121.1586105156303;
 Sun, 05 Apr 2020 09:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200403051709.22407-1-masahiroy@kernel.org> <CAKwvOdnaZ6qDVxaPY-GEH8pdUkzH6eqm16ok9_wzRSVRG-1kiQ@mail.gmail.com>
In-Reply-To: <CAKwvOdnaZ6qDVxaPY-GEH8pdUkzH6eqm16ok9_wzRSVRG-1kiQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 6 Apr 2020 01:45:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQybfcYiosNU+ybd-Q7-Y2dbLqBVN2XA00wCRnFAoqdew@mail.gmail.com>
Message-ID: <CAK7LNAQybfcYiosNU+ybd-Q7-Y2dbLqBVN2XA00wCRnFAoqdew@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support 'LLVM' to switch the default tools to Clang/LLVM
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        =?UTF-8?Q?Matthias_M=C3=A4nnich?= <maennich@google.com>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 4, 2020 at 3:24 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Thu, Apr 2, 2020 at 10:17 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > As Documentation/kbuild/llvm.rst implies, building the kernel with a
> > full set of LLVM tools gets very verbose and unwieldy.
> >
> > Provide a single switch 'LLVM' to use Clang and LLVM tools instead of
> > GCC and Binutils. You can pass LLVM=1 from the command line or as an
> > environment variable. Then, Kbuild will use LLVM toolchains in your
> > PATH environment.
> >
> > Please note LLVM=1 does not turn on the LLVM integrated assembler.
> > You need to explicitly pass AS=clang to use it. When the upstream
> > kernel is ready for the integrated assembler, I think we can make
> > it default.
>
> Having this behavior change over time may be surprising.  I'd rather
> that if you want to not use the integrated assembler, you explicitly
> negate it, or just don't use the LLVM=1 syntax, ie. `make CC=clang
> LD=ld.lld ...`.
>
> We could modify how `-no-integrated-as` is chosen when LLVM=1.
>
> make LLVM=1 LLVMIA=0 ... # add `-no-integrated-as`
> # what the flag is doesn't really matter to me, something shorter might be nice.
> make LLVM=1 # use all LLVM tools
>
> Since we got rid of $(AS), it would be appropriate to remove/change it
> there, since no one really relies on AS=clang right now. (We do have 1
> of our 60+ CI targets using it, but we can also change that trivially.
> So I think we have a lot of freedom to change how `-no-integrated-as`
> is set.
>
> This could even be independent of this patch.


I also thought a boolean flag is preferred.

AS=clang will not live long anyway, and
I hesitated to break the compatibility
for the short-term workaround.

But, if this is not a big deal, I can
replace AS=clang with LLVMIA=1.



> >
> > We discussed what we need, and we agreed to go with a simple boolean
> > switch (https://lkml.org/lkml/2020/3/28/494).
> >
> > Some items in the discussion:
> >
> > - LLVM_DIR
> >
> >   When multiple versions of LLVM are installed, I just thought supporting
> >   LLVM_DIR=/path/to/my/llvm/bin/ might be useful.
> >
> >   CC      = $(LLVM_DIR)clang
> >   LD      = $(LLVM_DIR)ld.lld
> >     ...
> >
> >   However, we can handle this by modifying PATH. So, we decided to not do
> >   this.
> >
> > - LLVM_SUFFIX
> >
> >   Some distributions (e.g. Debian) package specific versions of LLVM with
> >   naming conventions that use the version as a suffix.
> >
> >   CC      = clang$(LLVM_SUFFIX)
> >   LD      = ld.lld(LLVM_SUFFIX)
> >     ...
> >
> >   will allow a user to pass LLVM_SUFFIX=-11 to use clang-11 etc.,
> >   but the suffixed versions in /usr/bin/ are symlinks to binaries in
> >   /usr/lib/llvm-#/bin/, so this can also be handled by PATH.
> >
> > - HOSTCC, HOSTCXX, etc.
> >
> >   We can switch the host compilers in the same way:
> >
> >   ifneq ($(LLVM),)
> >   HOSTCC       = clang
> >   HOSTCXX      = clang++
> >   else
> >   HOSTCC       = gcc
> >   HOSTCXX      = g++
> >   endif
> >
> >   This may the right thing to do, but I could not make up my mind.
> >   Because we do not frequently switch the host compiler, a counter
> >   solution I had in my mind was to leave it to the default of the
> >   system.
> >
> >   HOSTCC       = cc
> >   HOSTCXX      = c++
> >
> >   Many distributions support update-alternatives to switch the default
> >   to GCC, Clang, or whatever, but reviewers were opposed to this
> >   approach. So, this commit does not touch the host tools.
>
> update-alternatives assumes you've installed Clang via a package manager?
> $ update-alternatives --list cc
> /usr/bin/gcc
> On my system even though clang and friends are in my PATH.
>
> And previously, there was feedback that maybe folks don't want to
> change `cc` on their systems just for Clang kernel builds.
> https://lkml.org/lkml/2020/3/30/836
> https://lkml.org/lkml/2020/3/30/838
>
> A goal for ClangBuiltLinux is to build a kernel image with no GCC or
> binutils installed on the host.  Let the record reflect that.  And
> there's been multiple complaints that the existing syntax is too long
> for specifying all of the tools.
>
> LLVM=1 is meant to be one flag.  Not `make LLVM=1 HOSTCC=clang
> HOSTCXX=clang`.  If folks want fine grain flexibility, use the
> existing command line interface, which this patch does not change.
> LLVM=1 is opinionated, and inflexible, because it makes a strong
> choice to enable LLVM for everything.
>
> Another reason why I don't want to change these over time, and why I
> want them all to be in sync is that there are 4 different CI systems
> for the kernel, and they are currently fragmented in terms of who is
> using what tools:
>
> KernelCI: CC=clang only
> Kbuild test robot aka 0day bot: CC=clang LD=ld.lld
> Linaro TCWG: CC=clang only
> our CI: a complete mix due to combinatorial explosion, but more
> coverage of LLVM than everyone else.
>
> That is a mess that we must solve.  Having 1 flag that works
> consistently across systems is one solution.  Now if those were all
> using LLVM=1, but some were enabling Clang's integrated assembler, and
> some weren't because we changed the default over time, then we'd be
> right back to this mismatch between systems.  I'd much rather draw the
> line in the sand, and say "this is how this flag will work, since day
> 1."  Maybe it's too rigid, but it's important to me that if we create
> something new to solve multiple objectives (1. simplifies existing
> interface. 2. turns on everything.) that it does so.  It is a partial
> solution, if it eliminates some of the flags while leaving others. I
> want a full solution.
>
> If folks want the flexibility to mix and match tools, the existing
> interface is capable.  But for us to track who is using what, we need
> 1 flag that we know is not different depending on the cc of the
> system.  Once clang's integrated assembler is good to go, we will
> begin recommending LLVM=1 to everyone.  And we want feedback if we
> regress building the host utilities during a kernel build, even if
> there are not many.
>
> I'm on the fence about having all of the above satisfied by one patch,
> or taking this patch as is and following up on the above two points
> (related to disabling `-no-integrated-as` and setting HOSTCC).  I
> trust your judgement and respect your decisions, so I'll defer to you
> Masahiro, but I need to make explicit the design goals.  Maybe with
> this additional context it can help inform the design.
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>


Thanks for the comments.

I'd rather want to do this incrementally,
making sure I am doing right.


The meaning of LLVM=1 may change over time.
It means "the recommended settings" at the moment.

If CI does not want to change the behavior across
kernel versions, it can pass individual variables
explicitly.

--
Best Regards
Masahiro Yamada
