Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8381365224
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 08:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbhDTGRB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Apr 2021 02:17:01 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51902 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhDTGRA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Apr 2021 02:17:00 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13K6GDgI030948;
        Tue, 20 Apr 2021 08:16:13 +0200
Date:   Tue, 20 Apr 2021 08:16:13 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210420061613.GA30890@1wt.eu>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <20210416173717.GA10846@1wt.eu>
 <CAKwvOd=RadTs7Skv6KUBo4qZQtdi0kugTzxvZM+5X_2gstjyaQ@mail.gmail.com>
 <YH5tAqLr965MNZyW@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YH5tAqLr965MNZyW@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Apr 20, 2021 at 07:56:18AM +0200, Greg Kroah-Hartman wrote:
> I would LOVE it if some "executives" would see the above presentations,
> because then they would maybe actually fund developers to fix bugs and
> maintain the kernel code, instead of only allowing them to add new
> features.
> 
> Seriously, that's the real problem, that Dmitry's work has exposed, the
> lack of people allowed to do this type of bugfixing and maintenance on
> company time, for something that the company relies on, is a huge issue.
> "executives" feel that they are willing to fund the initial work and
> then "throw it over the wall to the community" once it is merged, and
> then they can forget about it as "the community" will maintain it for
> them for free.  And that's a lie, as Dmitry's work shows.

That's sadly the eternal situation, and I'm suspecting that software
development and maintenance is not identified as a requirement for a
large number of hardware vendors, especially on the consumer side where
margins are lower. A contractor is paid to develop a driver, *sometimes*
to try to mainline it (and the later they engage with the community, the
longer it takes in round trips), and once the code finally gets merged,
all the initial budget is depleted and no more software work will be
done.

Worse, we could imagine kicking unmaintained drivers faster off the
tree, but that would actually help these unscrupulous vendors by
forcing their customers to switch to the new model :-/  And most of
them wouldn't care either if their contributions were refused based
on their track record of not maintaining their code, since they often
see this as a convenience to please their customers and not something
they need (after all, relying on a bogus and vulnerable BSP has never
prevented from selling a device, quite the opposite).

In short, there is a parallel universe where running highly bogus and
vulnerable out-of-tree code seems like the norm and where there is no
sort of care for what is mainlined as it's possibly just made to look
"cool".

We also need to recognize that it's expectable that some vendors are
not willing to engage on supporting a driver for a decade if they
expect their device to last 5 years only, and maybe we should make
some rules clear about mainlining drivers and what to expect for
users (in which case the end of support would be clear and nobody
would be surprised if the driver is removed at the end of its
maintenance, barring a switch to a community maintainer).

Just my two cents,
Willy
