Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE7A1DF496
	for <lists+linux-kbuild@lfdr.de>; Sat, 23 May 2020 06:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729808AbgEWETo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 23 May 2020 00:19:44 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:22223 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbgEWETn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 23 May 2020 00:19:43 -0400
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 04N4JFFQ010653;
        Sat, 23 May 2020 13:19:16 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 04N4JFFQ010653
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1590207556;
        bh=RNoJbDbbBcLxV6rl8Fj4qfXJ6yim+zf4HGZeqjR4a1g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=E10VqfQIRMmNyVhzChr6ZKBHXQrMBnKCPQML9HZyW1v9g76oLzxWagTDtIEHPqUWl
         hmuXyVVsSR3VvfUdeJIDtngRbqBHakzEgEQqO6u0WMiUHtDwMlZDr8Le7s65+qqoti
         ENOyFbDC2WqiCjuYFvL8CikqPLo7AFT0knruJTe0MqAXOCOR2zhL8MDsK6Kj2Qgo8x
         LIG1Ee56HaK3ewffpR+2tnGi5647kYEdgeHKx2lHdHCcreMIqbY+hvl0XzCoq+5hzr
         G19ShBaEEBZ0lW1B0VGejQKLutNbMgtwNFur+A+EbRRr0zv7ShnJgBxfEz4Vh4VTEx
         BRWTLQklrgd5w==
X-Nifty-SrcIP: [209.85.222.42]
Received: by mail-ua1-f42.google.com with SMTP id b13so4475189uav.3;
        Fri, 22 May 2020 21:19:16 -0700 (PDT)
X-Gm-Message-State: AOAM530IlZ9h3fHuR4MrvVaNkx8BzwS6wfN76TY6qg67unwn3lSn48N3
        n4bFALn5vEoPbcLJ2vrX18gGU/Wux9L3w7zy75c=
X-Google-Smtp-Source: ABdhPJw2cv3u062hO6R+LOtLTJcXjI7T8W/sufipbLNiVjSUAy9kUd8zvk77S220SDmryfox9N/qIWRWKKmmUugWkQA=
X-Received: by 2002:ab0:3245:: with SMTP id r5mr12152251uan.109.1590207555035;
 Fri, 22 May 2020 21:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200517094859.2376211-1-masahiroy@kernel.org>
 <20200517094859.2376211-4-masahiroy@kernel.org> <20200519102133.GA279905@hirez.programming.kicks-ass.net>
 <CAK7LNARkUkdRsW0D5cc5cEtXFJfnKhiVuZvrD6T1Xg3sr9kv=A@mail.gmail.com> <20200520122920.GB325280@hirez.programming.kicks-ass.net>
In-Reply-To: <20200520122920.GB325280@hirez.programming.kicks-ass.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 23 May 2020 13:18:38 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQf_VTA31tFQAbZUkwLWihhqqiQqYQw6RqD93u-Ch4ZJg@mail.gmail.com>
Message-ID: <CAK7LNAQf_VTA31tFQAbZUkwLWihhqqiQqYQw6RqD93u-Ch4ZJg@mail.gmail.com>
Subject: Re: [PATCH 03/29] modpost: add read_text_file() and get_line() helpers
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 20, 2020 at 9:29 PM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, May 20, 2020 at 09:17:45PM +0900, Masahiro Yamada wrote:
>
> > The specification [1] says this:
> >
> > "The value returned may be less than nbyte if the number of bytes
> > left in the file is less than nbyte, if the read() request was
> > interrupted by a signal, or if the file is a pipe or FIFO or
> > special file and has fewer than nbyte bytes immediately available
> > for reading."
> >
> >
> > This case does not meet any of 'if ...' parts.
>
> So nobody ever ^Z's their build? I really don't think you can assume
> that you'll never get a signal. That's just asking for trouble.
>
> Doing the right thing here is 'trivial', there is absolutely no reason
> to not do it.


In my testing, read() seems robust against ^Z,
but perhaps it might be implementation-defined ?


I think you are right.
We can gain extra safety with a trivial change.

--
Best Regards
Masahiro Yamada
