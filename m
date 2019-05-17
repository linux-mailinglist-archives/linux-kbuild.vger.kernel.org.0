Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D289215B7
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 10:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727517AbfEQIv3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 04:51:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:42090 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726685AbfEQIv3 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 04:51:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 277C72082E;
        Fri, 17 May 2019 08:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558083088;
        bh=QdEb+VIPp2jJ9ZiyXfNNv/NuB+mmxGT0F6kB25tdnu8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PSkCleR7s4t9185eLljAWjKUkOOS5i5ZC+4hwMjhWOZ+IuVmd6S2/86yPLRj50OxZ
         fsnysZinfab2t7bIlFUicowCuMqfsU8HkdZFW3/LdFOReKtUwv+6KaugHQuXlCAfx+
         WVpz/P4g1bgZUe1X4dCVq3H20GeA9EbO/C9xU0Wo=
Date:   Fri, 17 May 2019 10:51:26 +0200
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
Message-ID: <20190517085126.GA3249@kroah.com>
References: <CABWYdi06NUOWRLingNuybgZZsTZPjhmsOx-9oCGK94qZGYbzcw@mail.gmail.com>
 <CANiq72kvpiC-i53AXM-YsCUvWroHQemmqxsXjnB330ZEeHahUg@mail.gmail.com>
 <CABWYdi1zhTTaN-GSgH0DnPfz7p=SRw0wts5QVYYVtfvoiS0qnQ@mail.gmail.com>
 <CANiq72=fsL5m2_e+bNovFCHy3=YVf53EKGtGE_sWvsAD=ONHuQ@mail.gmail.com>
 <20190516225013.nvhwqi5tfwtby6qb@treble>
 <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 10:35:29AM +0200, Miguel Ojeda wrote:
> On Fri, May 17, 2019 at 9:38 AM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Fri, May 17, 2019 at 07:09:31AM +0200, Greg KH wrote:
> > > On Thu, May 16, 2019 at 08:14:25PM -0700, Ivan Babrou wrote:
> > > > We are building the upstream kernel. There are a few patches, but
> > > > nothing related to objtool.
> > > >
> > > > Unless you mean mainline/stable by upstream, I haven't tried that. We
> > > > stick to LTS.
> > >
> > > Please work and all of these issues fixed up in Linus's tree and then I
> > > will be glad to take the fixed into the stable releases.
> >
> > Right; if there is anything you can reproduce on linus.git I'll happily
> > have a look. If it doesn't reproduce all you have to do is find the
> > patches that make it work and ask Greg.
> 
> Just to clarify: Linus' master is clean of these issues with GCC 9.1.1.

Great!  Care to find the patches that did that work and send me the git
commit ids so that I can queue them up?  I don't have gcc9 here yet on
my systems, so I can not test for this.

thanks,

greg k-h
