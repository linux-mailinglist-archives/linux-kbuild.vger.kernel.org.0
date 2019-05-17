Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72AAB2162E
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 11:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfEQJXG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 05:23:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:54340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727309AbfEQJXF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 05:23:05 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3D3682082E;
        Fri, 17 May 2019 09:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558084984;
        bh=UTPAiUc7RB9d6C7WvsNp1t7GDTwQE3Pq88e0AI+EJlY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gpmZlShoSsvaRn/C56aOalS+uP5WW9A0IJ/TATsZj+oa/qfXC2fApISgSrL+AQ8CQ
         /qmJzkJyOjpgyc9vkYDcgu5PGBT9bchvandSTP9nP4QkgN/BpRQYvGmYqfivSrsuZH
         2moZumkTdzySO7ClSa5nqjlarwaLCGe3YCsaJZxA=
Date:   Fri, 17 May 2019 11:23:02 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ivan Babrou <ivan@cloudflare.com>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190517092302.GA5235@kroah.com>
References: <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble>
 <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda wrote:
> On Fri, May 17, 2019 at 10:51 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
> > > On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > > >
> > > > Right; if there is anything you can reproduce on linus.git I'll happily
> > > > have a look. If it doesn't reproduce all you have to do is find the
> > > > patches that make it work and ask Greg.
> > >
> > > Just to clarify: Linus' master is clean of these issues with GCC 9.1.1.
> >
> > Great!  Care to find the patches that did that work and send me the git
> > commit ids so that I can queue them up?  I don't have gcc9 here yet on
> > my systems, so I can not test for this.
> 
> I am unsure about the perf and the objtools parts (Peter/Josh?), but
> about the -Wmissing-attributes I cleaned, they were these:
> 
> a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> init/cleanup_module")

That patch I applied now.

> c0d9782f5b6d ("Compiler Attributes: add support for __copy (gcc >= 9)")

This one will take some work to backport, let me see what is needed
here...

> ff98e20ef208 ("lib/crc32.c: mark crc32_le_base/__crc32c_le_base
> aliases as __pure")

I'll get to this as well.

thanks,

greg k-h
