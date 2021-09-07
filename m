Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383C5402B35
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Sep 2021 16:57:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344856AbhIGO6F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 10:58:05 -0400
Received: from gate.crashing.org ([63.228.1.57]:41622 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344752AbhIGO6E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 10:58:04 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 187Eqm0Y009137;
        Tue, 7 Sep 2021 09:52:48 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 187EqlAQ009134;
        Tue, 7 Sep 2021 09:52:47 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 7 Sep 2021 09:52:47 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Jakub Jelinek <jakub@redhat.com>
Cc:     Linus Torvalds <torvalds@linuxfoundation.org>,
        Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210907145247.GH1583@gate.crashing.org>
References: <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com> <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com> <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com> <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org> <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com> <20210906215218.GA920497@tucnak>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210906215218.GA920497@tucnak>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 11:52:18PM +0200, Jakub Jelinek wrote:
> On Mon, Sep 06, 2021 at 02:08:58PM -0700, Linus Torvalds wrote:
> There is a stddef.h include too and that's it
> (I must say I don't see the reason for that include though).

Yeah me neither.  Maybe the header used NULL before?

> Other compiler provided headers (not talking about C++ now) also have no
> or very limited includes, including stddef.h, stdarg.h, stdatomic.h, etc.
> The only exceptions are tgmath.h which isn't usable without libc
> math.h/complex.h,

<tgmath.h> is only for hosted environments.  That requires a C library
for GCC (we do not implement this stuff ourselves).  The compiler and
the C library have to work together to get this done, and the relation
between GCC and Glibc has been a bit too tight for this, it is true.

But a kernel build is not in a hosted environment.

> in some cases stdint.h and limits.h which are in some
> configurations provided both by the C library and the compiler and include
> each other in that case (but e.g. stdint.h has an alternate version that
> only uses compiler provided builtin macros) and openacc.h.

On what targets is <stdint.h> still problematic?  And <limits.h>?


Segher
