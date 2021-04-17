Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B3F3630AC
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 16:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236569AbhDQOg4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 10:36:56 -0400
Received: from wtarreau.pck.nerim.net ([62.212.114.60]:51833 "EHLO 1wt.eu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236517AbhDQOg4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 10:36:56 -0400
Received: (from willy@localhost)
        by pcw.home.local (8.15.2/8.15.2/Submit) id 13HEaKSO015819;
        Sat, 17 Apr 2021 16:36:20 +0200
Date:   Sat, 17 Apr 2021 16:36:20 +0200
From:   Willy Tarreau <w@1wt.eu>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210417143620.GB15678@1wt.eu>
References: <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <YHnG+GRwiMqgHGs5@hirez.programming.kicks-ass.net>
 <20210416180829.GO2531743@casper.infradead.org>
 <YHrDwdQwEk2mSQWa@hirez.programming.kicks-ass.net>
 <20210417114623.GA15120@1wt.eu>
 <YHrvq6/d4iw8SLAc@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHrvq6/d4iw8SLAc@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 04:24:43PM +0200, Peter Zijlstra wrote:
> On Sat, Apr 17, 2021 at 01:46:23PM +0200, Willy Tarreau wrote:
> > For me the old trick of casting one side as long long still works:
> > 
> >   unsigned long long mul3264(unsigned int a, unsigned int b)
> >   {
> >         return (unsigned long long)a * b;
> >   }
> > 
> > i386:
> >   00000000 <mul3264>:
> >      0: 8b 44 24 08           mov    0x8(%esp),%eax
> >      4: f7 64 24 04           mull   0x4(%esp)
> >      8: c3                    ret    
> > 
> > x86_64:
> >   0000000000000000 <mul3264>:
> >      0: 89 f8                 mov    %edi,%eax
> >      2: 89 f7                 mov    %esi,%edi
> >      4: 48 0f af c7           imul   %rdi,%rax
> >      8: c3                    retq   
> > 
> > Or maybe you had something else in mind ?
> 
> Last time I tried it, the thing refused :/ which is how we ended up with
> mul_u32_u32() in asm.

Oh I trust you, I do remember having noticed it on one gcc version as
well (maybe 4.5). But I've been successfully using this since 2.95, and
could quickly recheck that 4.7, 4.8, 5.4, 6.5, 7.4, 9.3 and 11-trunk do
produce the code above, which is reassuring, as we all prefer to limit
the amount of asm statements.

Willy
