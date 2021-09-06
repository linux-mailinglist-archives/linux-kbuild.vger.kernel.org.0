Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 941DF401F29
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 19:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234036AbhIFRcU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 13:32:20 -0400
Received: from gate.crashing.org ([63.228.1.57]:39877 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229774AbhIFRcT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 13:32:19 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 186HR2QU010674;
        Mon, 6 Sep 2021 12:27:02 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 186HR1qh010671;
        Mon, 6 Sep 2021 12:27:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 6 Sep 2021 12:27:01 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210906172701.GX1583@gate.crashing.org>
References: <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com> <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com> <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com> <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com> <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com> <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 09:30:01AM -0700, Linus Torvalds wrote:
> On Mon, Sep 6, 2021 at 8:50 AM Segher Boessenkool
> <segher@kernel.crashing.org> wrote:
> > Yes they are.  It is the single standard way to get the functionality
> > you want.
> 
> Sorry, but 'standard' is the part that the kernel simply doesn't do.
> 
> Just face it. The kernel isn't written with all those standards that
> are designed for entirely different things in mind.

The kernel is written in C, and C is meant in part for implementing
things like kernels.

When I say "standard C" I mean "without the GNU C extensions".  All C
compilers implement standard C.  Only GCC implements all the GNU C
extensions, and implements most of them correctly.

> > I don't know why you think you can separate that.  Take <stdarg.h> --
> > there is no other (portable, standard) way to implement receiving
> > variadic arguments.
> 
> You clearly haven't actually read the thread.

?

Are you refering to something more than what is at
<https://lore.kernel.org/lkml/CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com/>
?  I did read that.  If I draw other conclusions, well, that happens.

> That was my whole argument.  For the _historical_ situation.

But this whole thread is about removing uses of <stdarg.h>, and
eventually removing the
  -nostdinc -isystem $(shell $(CC) -print-file-name=include)
thing (except in some places where it is next to impossible to
reimplement the compiler's implementation (instead of just very hard
and useless work, making all this more fragile in the process)).

That is not the past, that is the future.  A bleak future, if technical
decisions are based on FUD like "compiler headers are dangerous".


Segher
