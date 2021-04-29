Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50C1D36EDBD
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Apr 2021 17:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240803AbhD2P7M (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Apr 2021 11:59:12 -0400
Received: from jptosegrel01.sonyericsson.com ([124.215.201.71]:2262 "EHLO
        JPTOSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233132AbhD2P7L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Apr 2021 11:59:11 -0400
X-Greylist: delayed 1205 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Apr 2021 11:59:11 EDT
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Willy Tarreau <w@1wt.eu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Nick Desaulniers <ndesaulniers@google.com>,
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
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com> <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <20210416173717.GA10846@1wt.eu>
 <CAKwvOd=RadTs7Skv6KUBo4qZQtdi0kugTzxvZM+5X_2gstjyaQ@mail.gmail.com>
 <YH5tAqLr965MNZyW@kroah.com> <20210420061613.GA30890@1wt.eu>
From:   peter enderborg <peter.enderborg@sony.com>
Message-ID: <e3c591db-a272-5048-7396-3e934b071aab@sony.com>
Date:   Thu, 29 Apr 2021 17:38:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210420061613.GA30890@1wt.eu>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DLnxHBFb c=1 sm=1 tr=0 a=9drRLWArJOlETflmpfiyCA==:117 a=IkcTkHD0fZMA:10 a=3YhXtTcJ-WEA:10 a=W69p7wgkjsnNkqErQOcA:9 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/20/21 8:16 AM, Willy Tarreau wrote:
> On Tue, Apr 20, 2021 at 07:56:18AM +0200, Greg Kroah-Hartman wrote:
>> I would LOVE it if some "executives" would see the above presentations,
>> because then they would maybe actually fund developers to fix bugs and
>> maintain the kernel code, instead of only allowing them to add new
>> features.
>>
>> Seriously, that's the real problem, that Dmitry's work has exposed, the
>> lack of people allowed to do this type of bugfixing and maintenance on
>> company time, for something that the company relies on, is a huge issue.
>> "executives" feel that they are willing to fund the initial work and
>> then "throw it over the wall to the community" once it is merged, and
>> then they can forget about it as "the community" will maintain it for
>> them for free.  And that's a lie, as Dmitry's work shows.
> That's sadly the eternal situation, and I'm suspecting that software
> development and maintenance is not identified as a requirement for a
> large number of hardware vendors, especially on the consumer side where
> margins are lower. A contractor is paid to develop a driver, *sometimes*
> to try to mainline it (and the later they engage with the community, the
> longer it takes in round trips), and once the code finally gets merged,
> all the initial budget is depleted and no more software work will be
> done.
>
> Worse, we could imagine kicking unmaintained drivers faster off the
> tree, but that would actually help these unscrupulous vendors by
> forcing their customers to switch to the new model :-/  And most of
> them wouldn't care either if their contributions were refused based
> on their track record of not maintaining their code, since they often
> see this as a convenience to please their customers and not something
> they need (after all, relying on a bogus and vulnerable BSP has never
> prevented from selling a device, quite the opposite).
>
> In short, there is a parallel universe where running highly bogus and
> vulnerable out-of-tree code seems like the norm and where there is no
> sort of care for what is mainlined as it's possibly just made to look
> "cool".


In the parallel universe where I spent most time everyone
now need to learn how to make their things to work
out-of-tree. And there is not much of business case trying
to fix and improve core parts of linux. The turn around have
increased a lot and there is no edge doing it.


> We also need to recognize that it's expectable that some vendors are
> not willing to engage on supporting a driver for a decade if they
> expect their device to last 5 years only, and maybe we should make
> some rules clear about mainlining drivers and what to expect for
> users (in which case the end of support would be clear and nobody
> would be surprised if the driver is removed at the end of its
> maintenance, barring a switch to a community maintainer).

Things have changed. Once upon a time the community was
happy if it could get hardware specs.


> Just my two cents,
> Willy


