Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13005362785
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 20:11:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244385AbhDPSLg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 14:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244362AbhDPSLf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 14:11:35 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C87E2C061574;
        Fri, 16 Apr 2021 11:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=iy+YquCQolFdhIFqaFYddxkruv3V6Zn88c7KpgInMyI=; b=oZ3MAr1HcgC8j/7GZ0Rqd8avEW
        oDQP525+WZ6SRSMzTL/fDoBmU2oyLhIPa6ZDdXj+E98Rfch1fmDBiEhxfqO0IgQTsOZCLtlXC4eGu
        Q9gbp7N2t4fyhg7zai6c0Wwhh5BA0yt+KznYssYMlVKFfW9Gu3cydiA94cU5G7o4IE2ZDbFxj71bS
        /DX+Vhnvo0arE6cdvR36QjL/A41Fn36WoIbviaI7C7Ft0yUUfad7wEs/9hCyuR7gM6N83bC5U8zcZ
        NyO2gnTg1HAE4A0PfneTSPaJXjidrc2ULpKLxgr0/3gaQjiR9oJ9rHwz5W0hLV/r8snMu50G4Zu4b
        hcanTdBw==;
Received: from willy by casper.infradead.org with local (Exim 4.94 #2 (Red Hat Linux))
        id 1lXStJ-00AHbV-FC; Fri, 16 Apr 2021 18:09:04 +0000
Date:   Fri, 16 Apr 2021 19:08:29 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Willy Tarreau <w@1wt.eu>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210416180829.GO2531743@casper.infradead.org>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <YHnG+GRwiMqgHGs5@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHnG+GRwiMqgHGs5@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 07:18:48PM +0200, Peter Zijlstra wrote:
> On Fri, Apr 16, 2021 at 07:10:17PM +0200, Miguel Ojeda wrote:
> 
> > Of course, UB is only a subset of errors, but it is a major one, and
> > particularly critical for privileged code.
> 
> I've seen relatively few UBSAN warnings that weren't due to UBSAN being
> broken.

Lucky you.

84c34df158cf215b0cd1475ab3b8e6f212f81f23

(i'd argue this is C being broken; promoting only as far as int, when
assigning to an unsigned long is Bad, but until/unless either GCC fixes
that or the language committee realises that being stuck in the 1970s
is Bad, people are going to keep making this kind of mistake)
