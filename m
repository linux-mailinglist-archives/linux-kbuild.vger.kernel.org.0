Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDFA304377
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 17:12:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405079AbhAZQLj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 11:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404642AbhAZQFy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 11:05:54 -0500
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10B7C061A29;
        Tue, 26 Jan 2021 08:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=JH2sQI58od0xGBtZkjCcZFqHlgfaX4NaN7zGq9O0+9Y=; b=imOXpyr+CGs3ITzYf0b3iOjGMk
        7+TVcmqZt2bp26YWSnfYjX+DbDjo9eZ43CB3OZrDEjyoVfCU4JoaD3ZA+MdQj0Ktm8URPnojsYVv1
        +Fk5/H1h3hYHJTmeLtgHDxpegDiZ4vIBIaCjfpL7VoLlcfpLqGHBZpcpJ6+skN2jd9gHMKmvi5Usm
        AeohIoZ39cmiHNmywfRUk9IMZbDp3PTGyY5AVNVc7fzcRDleSruFGtQxmAt295gN2t1goR4o4CCkv
        6hhfuutOQj7P7btCVm1wj0cccPvZydX7jN3C6IH/9gvvt3ooJ0j3QBTT7Mpn9GzCoCzEQj43NW5Bw
        Ty2GJlRA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1l4Qq2-0008JW-EJ; Tue, 26 Jan 2021 16:05:06 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 1BFB23019CE;
        Tue, 26 Jan 2021 17:05:04 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 086E92027D383; Tue, 26 Jan 2021 17:05:04 +0100 (CET)
Date:   Tue, 26 Jan 2021 17:05:03 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Greg KH <greg@kroah.com>, Justin Forbes <jforbes@redhat.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-hardening@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Ondrej Mosnacek <omosnace@redhat.com>
Subject: Re: [PATCH RFC] gcc-plugins: Handle GCC version mismatch for OOT
 modules
Message-ID: <YBA9r13+1uuyDYuR@hirez.programming.kicks-ass.net>
References: <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com>
 <20210126145155.kcfbnzfqg5qugvcl@treble>
 <YBAyGU7H8E98xKng@hirez.programming.kicks-ass.net>
 <20210126154651.itfrnhwfistia3ss@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126154651.itfrnhwfistia3ss@treble>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 09:46:51AM -0600, Josh Poimboeuf wrote:
> On Tue, Jan 26, 2021 at 04:15:37PM +0100, Peter Zijlstra wrote:
> > On Tue, Jan 26, 2021 at 08:51:55AM -0600, Josh Poimboeuf wrote:
> > > User space mixes compiler versions all the time.  The C ABI is stable.
> > > 
> > > What specifically is the harder issue you're referring to?
> > 
> > I don't think the C ABI captures nearly enough. Imagine trying to mix a
> > compiler with and without asm-goto support (ok, we fail to build without
> > by now, but just imagine).
> > 
> > No C ABI violated, but having that GCC extention vs not having it
> > radically changes the kernel ABI.
> > 
> > I think I'm with Greg here, just don't do it.
> 
> Ok, thank you for an actual example.  asm goto is a good one.
> 
> But it's not a cut-and-dry issue.  Otherwise how could modversions
> possibly work?
> 
> So yes, we should enforce GCC versions, but I still haven't seen a
> reason it should be more than just "same compiler and *major* version".

Why bother? rebuilding the kernel and all modules is a matter of 10
minutes at most on a decently beefy build box.

What actual problem are we trying to solve here?
