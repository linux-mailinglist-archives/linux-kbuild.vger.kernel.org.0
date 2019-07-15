Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A399369B3C
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Jul 2019 21:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbfGOTNU (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Jul 2019 15:13:20 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:39971 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729432AbfGOTNU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jul 2019 15:13:20 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-99.corp.google.com [104.133.0.99] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6FJCkVS024453
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 15 Jul 2019 15:12:47 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id DFA1E420054; Mon, 15 Jul 2019 15:12:45 -0400 (EDT)
Date:   Mon, 15 Jul 2019 15:12:45 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH 4/4] debian: add generic rule file
Message-ID: <20190715191245.GD3068@mit.edu>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 15, 2019 at 08:56:25PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 15.07.19 14:28, Masahiro Yamada wrote:
> 
> >> The rule file contains a rule for creating debian/control and
> >> other metadata - this is done similar to the 'deb-pkg' make rule,
> >> scripts/packaging/mkdebian.
> > 
> > I saw a similar patch submission before, and negative feedback about it.
> 
> Do you recall what negative feedback exactly ?

It's possible I'm not remembering some of the feedback, but the only
thing I recall was the comment I made that I'd really like this use
case:

make O=/build/linux-build bindeb-pkg

to not break.  And as far as I can tell from the proposed patch series
(I haven't had a chance to experimentally verify it yet), I don't
think it should break anything --- I'm assuming that we will still
have a way of creating the debian/rules file in
/build/linux-build/debian/rules when doing a O= build, and that the
intdeb-pkg rule remains the same.  At least, it appears to be the case
from my doing a quick look at the patches.

> > Debian maintains its own debian/rules, and it is fine.
> 
> Not for me, I don't use it - given up trying to make anything useful
> out of it. It's extremly complex, practically undebuggable and doesn't
> even work w/o lots of external preparations.

Yeah, the official Debian debian/rules is optimized for doing a
distribution release, and in addition to the issues Enrico has raised,
last time I tried it, it was S-L-O-W since it was building a fully
generic kernel.  It's not at all useable for general developer use.

It sounds like what Enrico is trying to do is to enable running
"dpkg-buildpackage -us -uc -b" from the the top-level kernel package
as being easier than running "make bindeb-pkg".  I suspect this might
be because his goal is to integrate individual kernel builds from
using Debian's hermetic build / chroot systems (e.g., sbuild, pbuilder)?

     	       		      	       	       	      - Ted
