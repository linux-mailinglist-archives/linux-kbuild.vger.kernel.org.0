Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62EC7402AFC
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Sep 2021 16:46:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242953AbhIGOrJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 10:47:09 -0400
Received: from gate.crashing.org ([63.228.1.57]:50810 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244071AbhIGOrJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 10:47:09 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 187EfdkK007864;
        Tue, 7 Sep 2021 09:41:39 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 187EfcpQ007861;
        Tue, 7 Sep 2021 09:41:38 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 7 Sep 2021 09:41:38 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Linus Torvalds <torvalds@linuxfoundation.org>
Cc:     Jakub Jelinek <jakub@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        llvm@lists.linux.dev, linux-toolchains@vger.kernel.org
Subject: Re: [GIT PULL v2] Kbuild updates for v5.15-rc1
Message-ID: <20210907144138.GG1583@gate.crashing.org>
References: <CAHk-=wjc1rxah3xt8mKN=aCxQigjy3-hEf4xh_Y-r=MXAKVrag@mail.gmail.com> <20210906154642.GV1583@gate.crashing.org> <CAHk-=wj=WpWO_V86cZH99LgZGBbvdDb4wR26ce5van0hJqjzLA@mail.gmail.com> <20210906172701.GX1583@gate.crashing.org> <CAHk-=wh0MBVfA89WLWnCiSnJ2a=hSAoSxfG-jyf7JJeBDPK3ew@mail.gmail.com> <87lf49wodu.fsf@oldenburg.str.redhat.com> <20210906194808.GY1583@gate.crashing.org> <20210906201432.GZ920497@tucnak> <CAHk-=wi80NGPppGmBpc5zuGRAsv4_7qsDu7ehW515J2FJoezAQ@mail.gmail.com> <CAHk-=wikLP4KbTUUY_OKL6doyztjqFNKu_Q713vcrkjthc4S0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wikLP4KbTUUY_OKL6doyztjqFNKu_Q713vcrkjthc4S0g@mail.gmail.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Sep 06, 2021 at 02:24:39PM -0700, Linus Torvalds wrote:
> There are some *very* core header files that the kernel cannot include
> from outside. That "stdlib.h" thing already came up in the errors I
> quoted.
> 
> But I think you'll find that you guys want to include things like
> <errno.h> too, and you'll probably add others (<types.h>? things like
> that) simply because they always work fine in user space, and you'd
> not even notice.

Guess what.  We actually test this.  We do notice.  Except we don't,
because all those problems do not actually exist.

Long ago there were issues.  We do not live long ago now.

> I'm pretty sure you guys don't really want to deal with the pain that
> is crazy kernel people that have their very bare environment.

There are many other users that use freestanding environments.  Most of
them do use the standard headers.

> So you may *think* you want the kernel to use your header files
> "because compiler portability". Instead, you should be very thankful
> that we don't, and that you don't have to deal with our mess any more
> than you already do.

We would like it to be *less* pain, *less* unnecessary work, that is why
we would like the kernel to use the compiler headers.  Instead of what
the current patches do: getting rid of more of them, which will end up
as more work for everyone.


Segher
