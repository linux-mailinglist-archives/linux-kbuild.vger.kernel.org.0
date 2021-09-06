Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15AB402091
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Sep 2021 22:05:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241869AbhIFTx3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Sep 2021 15:53:29 -0400
Received: from gate.crashing.org ([63.228.1.57]:53507 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241578AbhIFTx2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Sep 2021 15:53:28 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 186JmAuS020071;
        Mon, 6 Sep 2021 14:48:10 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 186Jm8MM020070;
        Mon, 6 Sep 2021 14:48:08 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Mon, 6 Sep 2021 14:48:08 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Florian Weimer <fweimer@redhat.com>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210906194808.GY1583@gate.crashing.org>
References: <20210904131911.GP1583@gate.crashing.org> <871r644bd2.fsf@oldenburg.str.redhat.com> <CAHk-=wi+XKYN+3u=_fm=ExqpEaHdER0XuKxVauHYVCPKpKR97Q@mail.gmail.com> <20210904191531.GS1583@gate.crashing.org> <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com> <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com> <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com> <87lf49wodu.fsf@oldenburg.str.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87lf49wodu.fsf@oldenburg.str.redhat.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 08:27:25PM +0200, Florian Weimer wrote:
> * Linus Torvalds:
> 
> > We use the compiler intrinsics without the C library header files for
> > everything else, so doing so for <stdarg.h> seems to actually be a
> > clarification and improvement.
> 
> This is an exaggeration.  On several architectures, the kernel cannot
> use the vector built-ins directly.  Some of the implementing headers are
> very special and intertwined with the compiler.  <stdarg.h> is currently
> not such a case, but it's just not technically not feasible to avoid
> dependencies on all compiler headers.  I think this considerably weakens
> the case against <stdarg.h> because the compiler version is so obviously
> harmless.

Exactly Florian.  Thank you for so clearly making the point.

> What the kernel is doing here is imposing an unnecesary constraint on
> compiler development.  Basically, you are telling compiler writers that
> implementing features with the help of header files is a bad idea
> because it makes it more difficult to use them from the kernel.  (See
> the proposed exceptions for vector code.)

Either it will constrain the compiler development, or perhaps more
likely, building the kernel will break in ways that the kernel people
will blame the compiler developers for.

The compiler headers (standard or arch-specific, same reason here) are
there because it decouples the user (that doesn't mean "userland", it
means the kernel here) from the builtins.  Decoupling has many
advantages.  The most obvious in general is you can use nicer names in
a header file, names that can step on the user's toes (like "bool" vs.
"_Bool", which is essentially all that <stdbool.h> does).  But another
huge advantage of decoupling is it allows the compiler more freedom in
bugfixing (or any other maintenance / new development).

It is low probability that there are bugs in the compiler's standard
headers, and it's not likely the kernel's ad-hoc imitation of it has
bugs, this is all so small after all (but have I mentioned the
c46bbf5d2def commit?)

So there is no big pressure for changing anything here.  But OTOH it
clearly is not a good idea to remove the existing uses of standard
headers.  No upsides, various downsides, and some of those can be very
costly.


Segher
