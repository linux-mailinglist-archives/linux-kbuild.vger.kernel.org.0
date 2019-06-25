Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEDF52615
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2019 10:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728574AbfFYIIh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 Jun 2019 04:08:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:48044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726663AbfFYIIh (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 04:08:37 -0400
Received: from localhost (f4.8f.5177.ip4.static.sl-reverse.com [119.81.143.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2472720883;
        Tue, 25 Jun 2019 08:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561450116;
        bh=oB8iqr1i19hzHNCzE1bZqAZ7bPwZH73g0FCvB0iVx/I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JDOmCIxG0tXtzBe9WXSL+LgB3zwqi/iKj1oDSoZVEJe49hroTZIcWl/x51tIuo+aR
         DJjDNWuC4PHacSRXt5opN5n7qNMPyGAThDdC2f1+2bY8oypObGfNYYisohJiUaabCS
         qlfORgMCmllngGGTMBGAcZw6mdo9ibs6qGeTrHDE=
Date:   Tue, 25 Jun 2019 16:08:30 +0800
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ignat Korchagin <ignat@cloudflare.com>
Cc:     Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Ivan Babrou <ivan@cloudflare.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Ingo Molnar <mingo@redhat.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        kernel-team <kernel-team@cloudflare.com>
Subject: Re: Linux 4.19 and GCC 9
Message-ID: <20190625080830.GA19729@kroah.com>
References: <CANiq72muyjE3XPjmtQgJpGaqWR=YBi6KVNT3qe-EMXP7x+q_rQ@mail.gmail.com>
 <20190517152200.GI8945@kernel.org>
 <CABWYdi2Xsp4AUhV1GwphTd4-nN2zCZMmg5y7WheNc67KrdVBfw@mail.gmail.com>
 <4FE2D490-F379-4CAE-9784-9BF81B7FE258@kernel.org>
 <CABWYdi2XXPYuavF0p=JOEY999M4z3_rk-8xsi3N=do=d7k09ig@mail.gmail.com>
 <20190610151407.GS21245@kernel.org>
 <20190610152542.GA4132@kroah.com>
 <20190610191417.GW21245@kernel.org>
 <CALrw=nFcp-+C7ceTFj=R=aG0Z5OpRRVXFoUxUoh=CjcfW79-+g@mail.gmail.com>
 <20190625075029.GC19452@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625075029.GC19452@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 25, 2019 at 03:50:29PM +0800, Greg KH wrote:
> On Mon, Jun 24, 2019 at 11:42:34AM +0100, Ignat Korchagin wrote:
> > Hi Greg,
> > 
> > > > For us it seems applying the following 4 mainline patches makes 4.19.x
> > > > branch perf compile with GCC-9:
> > > >
> > > > 4d0f16d059ddb91424480d88473f7392f24aebdc: perf ui helpline: Use
> > > > strlcpy() as a shorter form of strncpy() + explicit set nul
> > > > b6313899f4ed2e76b8375cf8069556f5b94fbff0: perf help: Remove needless
> > > > use of strncpy()
> > > > 5192bde7d98c99f2cd80225649e3c2e7493722f7: perf header: Fix unchecked
> > > > usage of strncpy()
> > > > 97acec7df172cd1e450f81f5e293c0aa145a2797: perf data: Fix 'strncat may
> > > > truncate' build failure with recent gcc
> > > >
> > > > I also checked that 4.19.49 compiles fine with GCC 9, although with a
> > > > lot of warnings, mostly from objtool, like "warning: objtool:
> > > > sock_register()+0xd: sibling call from callable instruction with
> > > > modified stack frame". But it's a start.
> > > >
> > > > Can we apply the above-mentioned patches, please?
> > 
> > > I'll look into these after the next round of kernels are released.  I
> > 
> > Did you by any chance forget to queue these patches? :) (the build is
> > still broken for GCC 9.1)
> 
> I am on the road and getting to backports for this stuff is on the
> bottom of my list until next week at the earliest, sorry.

Oh nevermind, I just queued them up now.

If there are any other gcc9 patches that you see that I've missed,
please let me know.

Now, to try to track down the fix for all of those build warnings, those
need to get fixed up...

thanks,

greg k-h
