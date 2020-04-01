Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEAC19A51A
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 08:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731725AbgDAGLh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 02:11:37 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:32349 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAGLg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 02:11:36 -0400
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 0316BTPv029946;
        Wed, 1 Apr 2020 15:11:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 0316BTPv029946
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585721490;
        bh=R55qrFxMB1D2pHAEH2G7LutEbvVqxktsxI6xh1JrVFw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mPud/LiNMFrwmYfuo2fwsbbvNXUoa/+30gdTMHCLxSs3Uz7N/g14p8NKh7Iw03WTf
         ccPTqe8q4SusRe/0nxsMJC7IzcZcn3SX3BPBwGPIQNwh/S9KXDnGQn74BpqMiZuk6h
         /MVbpiGYgb672yJwfIf9kUadM/dLtR1ri3A4uVWC/z8GOAOQn/KdFsYaLeJwTZn+n1
         DRSVh+5fLGzoCC5couLEE8VMe4q/byJU2y1j5h4KC/SaKyY/VAIM/wYBm//qsEbist
         mpJJJKnHWHG0slFQ2sQS3OFES7RHnPI/M+VOKIVb7QmbGV/gFgf7FK98JGPfc6hs/8
         NpKraQMQss2Og==
X-Nifty-SrcIP: [209.85.217.47]
Received: by mail-vs1-f47.google.com with SMTP id e138so15082866vsc.11;
        Tue, 31 Mar 2020 23:11:30 -0700 (PDT)
X-Gm-Message-State: AGi0PuZnkZP/RNzF9m2zi/R4zCg96i9lVs+DNc/jpUIHMXX4BXVvFR7u
        za1ulz8rQZYyZuUV7/mhbFT4ScaGyUSp22eio9c=
X-Google-Smtp-Source: APiQypKyOsBpcEI5EI0xhWIk2qk00xcoHvAoJ8ZYj0oCranem9XpNrlzg2/Ftttj9LMlPiW2wBCw6sC1z6JjDp+vux4=
X-Received: by 2002:a67:6542:: with SMTP id z63mr16010836vsb.179.1585721489076;
 Tue, 31 Mar 2020 23:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200317202404.GA20746@ubuntu-m2-xlarge-x86> <20200317215515.226917-1-ndesaulniers@google.com>
 <20200327224246.GA12350@ubuntu-m2-xlarge-x86> <CAK7LNAShb1gWuZyycLAGWm19EWn17zeNcmdPyqu1o=K9XrfJbg@mail.gmail.com>
 <CAK7LNAQ3=jUu4aa=JQB8wErUGDd-Vr=cX_yZSdP_uAP6kWZ=pw@mail.gmail.com>
 <CAKwvOd=5AG1ARw6JUXmkuiftuShuYHKLk0ZnueuLhvOdMr5dOA@mail.gmail.com>
 <20200330190312.GA32257@ubuntu-m2-xlarge-x86> <CAK7LNAT1HoV5wUZRdeU0+P1nYAm2xQ4tpOG+7UtT4947QByakg@mail.gmail.com>
 <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
In-Reply-To: <CAKwvOd==U6NvvYz8aUz8fUNdvz27pKrn8X5205rFadpGXzRC-Q@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 1 Apr 2020 15:10:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR0PPxibFVC5F07mytz4J2BbwQkpHcquH56j7=S_Mqj2g@mail.gmail.com>
Message-ID: <CAK7LNAR0PPxibFVC5F07mytz4J2BbwQkpHcquH56j7=S_Mqj2g@mail.gmail.com>
Subject: Re: [PATCH v2] Makefile.llvm: simplify LLVM build
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sandeep Patil <sspatil@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 1, 2020 at 3:39 AM Nick Desaulniers <ndesaulniers@google.com> wrote:
>
> On Mon, Mar 30, 2020 at 11:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Tue, Mar 31, 2020 at 4:03 AM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > On Mon, Mar 30, 2020 at 11:58:19AM -0700, Nick Desaulniers wrote:
> > > > On Sat, Mar 28, 2020 at 6:57 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > >
> > > > > I also had planned to provide a single switch to change
> > > > > all the tool defaults to LLVM.
> > > > >
> > > > > So, supporting 'LLVM' is fine, but I'd rather want this
> > > > > look symmetrical, and easy to understand.
> > > > >
> > > > > CPP        = $(CC) -E
> > > > > ifneq ($(LLVM),)
> > > >
> > > > Yes, a simple if statement is much simpler than the overly complex patch I had.
> > > >
> > > > > CC         = $(LLVM_DIR)clang
> > > >
> > > > Do we need $LLVM_DIR? Shouldn't users just have that in their $PATH?
> > > >
> > > > Also, I think we need to support suffixed binaries, as debian
> > > > distributes these with version suffixes, as Nathan points out.  Or do
> > > > the debian packages install suffixed binaries AND path versioned
> > > > non-suffixed binaries?
> > >
> > > I think the idea here is that ultimately, the suffixed versions of clang
> > > that Debian has in /usr/bin are symlinks to binaries in
> > > /usr/lib/llvm-#/bin; as a result, a user could say
> > > LLVM_DIR=/usr/lib/llvm-#/bin/ and all of those tools would be picked up
> > > automatically. I am not really sure what is better.
>
> $ sudo apt install clang-8
> $ which clang-8
> /usr/bin/clang-8
> $ ls -l `!!`
> /usr/bin/clang-8 -> ../lib/llvm-8/bin/clang
> $ ls /usr/lib/llvm-8/bin
> <non suffixed versions>
>
> Ok, so Nathan, it looks like we don't need the version suffixes.
> Instead, we can be more explicit with our $PATH, and only add the
> above (and bintutils).  I was thinking supporting the suffix was
> required for our CI, but it seems like maybe not.
>
> > I periodically build the latest llvm from the trunk,
> > and install it under my home directory.
> > So, I just thought it would be useful to
> > allow a user to specify the llvm directory.
> > Of course, I can do the equivalent by tweaking PATH, but
> > I hesitate to make the non-released version my default.
>
> Respectfully, I strongly disagree.  This should be handled by
> modifications to $PATH, either by your shell's .rc file when you
> always want it, or exported for a session when you want it, or
> prefixed to an invocation for the duration of that command.  We should
> not have a new variable just for the path of a few tools.
>
> Rather than `make LLVM_DIR=~/llvm-project LLVM=1`, you can do
> `PATH=$PATH:~/llvm-project make LLVM=1`. (or export it manually or via
> your shell .rc, depending on how comfortable you are with that
> version).
>
> > Having both LLVM_DIR and LLVM_SUFFIX seems verbose.
>
> I agree, so maybe just LLVM=y, and we can support both non-standard
> locations and debian suffixes via modifications to PATH.



OK, so we will start with the boolean switch 'LLVM'.

People can use PATH to cope with directory path and suffixes.


-- 
Best Regards
Masahiro Yamada
