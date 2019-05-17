Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A48C7217E7
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 13:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728342AbfEQLwT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 07:52:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:35358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728530AbfEQLwT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 07:52:19 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1DD8320881;
        Fri, 17 May 2019 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558093938;
        bh=wTfeoUDSlYitiGXMhyDfQxA7a+A8OsIshrKrhzM5lrQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XKYzljB/sLwTcypgydTnEg1i7RaN5imBEvZeboTd6kAK3pM8AoJezETaUl/Mgsflh
         Upml8f5u0+n0IdxlpgpxWeV2f+72JDa1PqYQo9FDOCbfM+rI/8I1Wj1oWGhp66uo3y
         FxbcJ1r4b4vw9qUtNWoZv8mx6CHw6NvPFxlC3/FM=
Date:   Fri, 17 May 2019 13:52:16 +0200
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
Message-ID: <20190517115216.GB662@kroah.com>
References: <20190516225013.nvhwqi5tfwtby6qb@treble>
 <CABWYdi29E++jBw8boFZAiDZA7iT5NiJhnNmiHb-Rvd9+97hSVA@mail.gmail.com>
 <20190517050931.GB32367@kroah.com>
 <20190517073813.GB2589@hirez.programming.kicks-ass.net>
 <CANiq72nUPoNHWM-dJuFc3=4D2=8XMuvO0PgGPjviOv+EhrAWUw@mail.gmail.com>
 <20190517085126.GA3249@kroah.com>
 <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517092302.GA5235@kroah.com>
 <CANiq72=HpvQx1t+W3YwY-6Rdw1F6UJbVkAzJFdE61H668B8s2g@mail.gmail.com>
 <20190517094217.GA13913@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190517094217.GA13913@kroah.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 11:42:17AM +0200, Greg KH wrote:
> On Fri, May 17, 2019 at 11:27:41AM +0200, Miguel Ojeda wrote:
> > On Fri, May 17, 2019 at 11:23 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Fri, May 17, 2019 at 11:01:45AM +0200, Miguel Ojeda wrote:
> > >
> > > > a6e60d84989f ("include/linux/module.h: copy __init/__exit attrs to
> > > > init/cleanup_module")
> > >
> > > That patch I applied now.
> > 
> > Note that this one requires the second one (c0d9782f5b6d).
> 
> Oops, yeah, my build boxes just blew up :)
> 
> Let me go take the time to do this correctly now...

Ugh, that is a mess.  I'm going to leave this alone for now as I have
other things to work on.

If someone wants to send a properly backported set of patches, for
4.19.y and older, that would be wonderful :)

Otherwise this is going to have to wait for a while...

thanks,

greg k-h
