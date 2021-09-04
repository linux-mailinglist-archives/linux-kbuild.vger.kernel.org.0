Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 006B5400CD0
	for <lists+linux-kbuild@lfdr.de>; Sat,  4 Sep 2021 21:19:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232750AbhIDTUu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 4 Sep 2021 15:20:50 -0400
Received: from gate.crashing.org ([63.228.1.57]:33112 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232744AbhIDTUu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 4 Sep 2021 15:20:50 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 184JFW0f025749;
        Sat, 4 Sep 2021 14:15:32 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 184JFVsP025744;
        Sat, 4 Sep 2021 14:15:31 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Sat, 4 Sep 2021 14:15:31 -0500
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
Message-ID: <20210904191531.GS1583@gate.crashing.org>
References: <CAK7LNAQ0Q6CdXaD-dVGj_e3O3JYs_crpejWKpXHYQJYxyk-1VQ@mail.gmail.com> <CAHk-=wgoX0pVqNMMOcrhq=nuOfoZB_3qihyHB3y1S8qo=MDs6w@mail.gmail.com> <3b461878-a4a0-2f84-e177-9daf8fe285e7@kernel.org> <878s0c4vng.fsf@oldenburg.str.redhat.com> <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com> <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Sep 04, 2021 at 10:22:25AM -0700, Linus Torvalds wrote:
> On Sat, Sep 4, 2021 at 8:19 AM Florian Weimer <fweimer@redhat.com> wrote:
> > In any case, it would be nice to know what the real motivation is.
> 
> I don't know about the original motivation, but the reason I like that
> patch after-the-fact is that I've actually been in situations where I
> test out self-built compilers without installing them.

Then you probably know that that is quite hard to do correctly.  And
installing the compiler (into a temporary dir that you can just blow
away after you are done with it) is trivial (see for example
<https://gcc.gnu.org/install/finalinstall.html> line 11 or so).

Also, the standard headers are *part of* the compiler.  Including those
(like <stdarg.h> here) that are required for freestanding
implementations.

> Then it's convenient to have a completely standalone kernel tree.

Yes, and you certainly do not want to mix in anything userspace,
accidentally or not.  But these "freestanding" headers already have to
make sure they do not do that, and they are used by many OSes and
embedded-style things, so you can have some confidence that this
actually works.

And the C standard requires you to use these headers to use some
features of the C language (variable arguments in this specific case).
You can of course mimic whatever some implementation does and hope that
will work on some other implementations, and on future versions of that
first implementation as well.  But that is imo not a good idea, just
using the standard headers (which are required, and are there on all
implementations I have heard of, without bugs) is a much simpler idea,
much more future-proof, much less maintenance.

> Nobody cares about things like <stdatomic.h> They are completely
> irrelevant for the kernel, exactly because we've always just done our
> own, or used __builtin_xyz() for things.

The Linux kernel needs (or wants) stronger primitives than provided
there, yeah, so you could not even use it as the underlying
implementation for the semantics the kernel wants (which it could do
with <stdint.h> to implement u64 etc.)

> <stdarg.h> is the only actual core header file that we have always
> taken from the installed system headers - because historically it
> really was required. Everything else we can just do ourselves.

You also need <stdint.h> and <stddef.h>.  These are much simpler to
implement of course, but see for example the c46bbf5d2def commit I
mentioned before.  Some of these compiler headers might have been buggy
(or non-existent) historically, but that is very long ago, you really
can expect at least C99 to be there (and work correctly) nowadays :-)


Segher
