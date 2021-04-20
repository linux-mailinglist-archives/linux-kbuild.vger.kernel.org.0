Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511553651F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Apr 2021 07:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbhDTF4y (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Apr 2021 01:56:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:38326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229523AbhDTF4y (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Apr 2021 01:56:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 67D3A613AB;
        Tue, 20 Apr 2021 05:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618898183;
        bh=AoItUNHEmXnc+WhY2vv+SDiIYZaBYyxKKaEUuXAKOnc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=yLRHRao1YeRo1rP34FLTq5Is/ZFLkWDWN7ziGMV42m6yUr9uorGazd96OODAevqDc
         Zy+74225py/5k41YW2OiG0SJx+qR07nqmxOOwVFAKSNf5AD+EADJXM7cuaTZCzUczv
         rST2Q3jy3oulKqsudlwEGMhwNbfv/6/dBO2EdG8Q=
Date:   Tue, 20 Apr 2021 07:56:18 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Willy Tarreau <w@1wt.eu>,
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
Message-ID: <YH5tAqLr965MNZyW@kroah.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <20210416173717.GA10846@1wt.eu>
 <CAKwvOd=RadTs7Skv6KUBo4qZQtdi0kugTzxvZM+5X_2gstjyaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOd=RadTs7Skv6KUBo4qZQtdi0kugTzxvZM+5X_2gstjyaQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 05:24:33PM -0700, Nick Desaulniers wrote:
> On Fri, Apr 16, 2021 at 10:39 AM Willy Tarreau <w@1wt.eu> wrote:
> >
> > resources usage, I'm really not convinced at all it's suited for
> > low-level development. I understand the interest of the experiment
> > to help the language evolve into that direction, but I fear that
> > the kernel will soon be as bloated and insecure as a browser, and
> > that's really not to please me.
> 
> Dunno, I don't think the introduction of Rust made Firefox _more_ insecure.
> https://wiki.mozilla.org/Oxidation#Within_Firefox
> 
> I pray no executives ever see Dmitry Vyukov's 2019 Linux Plumbers Conf
> talk "Reflections on kernel quality, development process and testing."
> https://www.youtube.com/watch?v=iAfrrNdl2f4
> or his 2018 Linux Security Summit talk "Syzbot and the Tale of
> Thousand Kernel Bugs" https://www.youtube.com/watch?v=qrBVXxZDVQY
> (and they're just fuzzing the syscall interface and USB devices.
> Imagine once folks can more easily craft malformed bluetooth and wifi
> packets.)
> 
> I'd imagine the first term that comes to mind for them might be
> "liability."  They are quite sensitive to these vulnerabilities with
> silly names, logos, and websites.  There are many of us that believe
> an incremental approach of introducing a memory safe language to our
> existing infrastructure at the very least to attempt to improve the
> quality of drivers for those that choose to use such tools is a better
> approach.

I would LOVE it if some "executives" would see the above presentations,
because then they would maybe actually fund developers to fix bugs and
maintain the kernel code, instead of only allowing them to add new
features.

Seriously, that's the real problem, that Dmitry's work has exposed, the
lack of people allowed to do this type of bugfixing and maintenance on
company time, for something that the company relies on, is a huge issue.
"executives" feel that they are willing to fund the initial work and
then "throw it over the wall to the community" once it is merged, and
then they can forget about it as "the community" will maintain it for
them for free.  And that's a lie, as Dmitry's work shows.

The world creates new use cases and testing ability all the time, which
exposes bugs that have been around in old code.  Once the bugs are fixed
in that layer of code, the next layer down can finally be tested and
then look, more corner cases of issues.

Rewriting the kernel in another language is not going to fix the
majority of the issues that fuzzing finds here automagically, as that
work has exposed us to things like fault-injection and malicious USB
packets that no language would have saved us from "automatically".  All
of those code paths deal with "unsafe" data that doesn't magically
become "safe" because we switch languages.

And over time, what we have determined is "safe" has changed!  People
forget that only a few years ago have we decided that the kernel now has
to protect userspace programs from malicious hardware.  That's a major
shift in thinking, now data that we used to blindly trust can not be
trusted at all.  And "executives" want us to fix all of those issues for
free, when really it's a major design shift for loads of kernel
subsystems to handle this new threat model.

So yes, please spread that talk around.  Maybe then will we actually get
funding and support to FIX the bugs that those tools test.  Right now,
the primary fixer of those findings are _INTERNS_ as that's all
companies are willing to fund to fix this type of thing.

And don't get me started on the inability for "executives" to fund other
parts of Linux that they rely on, because they want "other companies" to
do it instead.  The tragedy-of-the-commons is a real threat to Linux,
and always has been...

thanks,

greg k-h
