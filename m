Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEA83D312C
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jul 2021 03:18:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232917AbhGWAiA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 22 Jul 2021 20:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232905AbhGWAh7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Jul 2021 20:37:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AD9C061575;
        Thu, 22 Jul 2021 18:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=WwS1LaIGUIRtAl4RX67oXHqtnkZGSLpu40O95p0Ahlc=; b=iY3hsy88NC4WR6KINmTuScd3nJ
        1Nb7Qa1yP11v42t/Abvtl485R53ZB2n8oWQTs//xGmQes7f7lcZUlEDfws94kcynhRmmP1dMf1Rb5
        1Zn2i0P5tX/mDRzG0/Hi9FIOCK8+Iw675WzBKez81GOjauxj1Wpec1qkQtQjbmrDr808qEMzDMuRY
        E585Ywv9zpJXw8uJ5vsSg1Wnn19z9cLA2iV42VRhtHfRls6JKb+FO+Popo4FUA+rEkf6bhZmbG9FH
        Q7H7630hzuBmDbHh1meQSLtkNJvRvtzVowEYkooMTiXbJL7CVA+asYcZxL5NHMnPCK7scqtxBy4/i
        DQmSKXLA==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m6jp9-00AsRo-1G; Fri, 23 Jul 2021 01:18:03 +0000
Date:   Fri, 23 Jul 2021 02:17:58 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Wedson Almeida Filho <wedsonaf@google.com>
Cc:     Finn Behrens <finn@kloenk.dev>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Christoph Hellwig <hch@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/17] Rust support
Message-ID: <YPoYxiq63QcfUXg+@casper.infradead.org>
References: <20210704202756.29107-1-ojeda@kernel.org>
 <YOVNJuA0ojmeLvKa@infradead.org>
 <CANiq72mKPFtB4CtHcc94a_y1V4bEOXXN2CwttQFvyzwXJv62kw@mail.gmail.com>
 <YOWjLmg/Z7kr2+tx@kroah.com>
 <YOW1Nj8+a2Yth2++@google.com>
 <YOXB7FRqldZik2Xn@kroah.com>
 <BFD5298D-00CD-4FEF-AE77-61E69AF78604@kloenk.dev>
 <YOZNuEtNbsLxRM0R@casper.infradead.org>
 <YPn3fgDX8uNkF8Vp@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPn3fgDX8uNkF8Vp@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jul 22, 2021 at 11:55:58PM +0100, Wedson Almeida Filho wrote:
> Hey Matthew,
> 
> On Thu, Jul 08, 2021 at 01:58:32AM +0100, Matthew Wilcox wrote:
> > Why are you so resistant to writing a real driver that deals with actual
> > hardware?  
> 
> I don't think it was so much resistance but rather a prioritisation thing. Have
> you by any chance seen the gpio driver I posted a couple of days ago?

I haven't seen it, no ...

> > A simple NVMe driver is less than a thousand lines of C.
> > I know the one in the kernel now is ridiculously complicated and has
> > been thoroughly messed up with abstractions to support NVMeoF instead
> > of having a separate driver, but it's really a simple interface at heart.
> 
> The latest NVMe spec is 452 pages long, which seems to contradict your claim
> that it's simple.

As I said, they've put all kinds of crap into NVMe these days.
If you look at the 1.0e spec, it's 127 pages.

> In any case, translating less than 1K lines of C shouldn't be
> too hard (after I've built the abstractions, of course). Would you mind sharing
> the simple driver you mention above?

Unfortunately, most of the early versions were lost during the
kernel.org breakin.  If you check out commit 5da273fe3fd1 and look at
drivers/block/nvme.c, you'll see a driver that's about 2000 lines.
