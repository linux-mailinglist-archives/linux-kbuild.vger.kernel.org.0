Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B4A304234
	for <lists+linux-kbuild@lfdr.de>; Tue, 26 Jan 2021 16:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406233AbhAZPUi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 10:20:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390639AbhAZPU3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 10:20:29 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF415C061A29;
        Tue, 26 Jan 2021 07:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=9IyfDUY9gRwkXrwY1oV4vu/+hGxopMEms5A7OVkxUio=; b=Y2BMhbsgvYx926tj96xAEKz7yz
        8jK7gNSal72u30y2DwQWb+Kh2GIL7BjjMkXXz/C7hV2sc0mk+f7AZAi0P0XdwTOi8rcsO486yidly
        sBLkNALeLzZjVbAQDmG3A9dgLDiUyCdFHA+joVrTqcwapPjjG4dB32JW+wdBYH+SugaFIGcqHZ225
        BPxFf2GuXXbKens4VxEsDwXEDnzYg18z3zg4dV0QtS0xhhsvAn9wnLtsczmDHNtlw4jfkH5ogkYxI
        LtezdWH92r8nEgY0X/QOBUDkxsfrAbfF+Vhdj2ciCK55TaGET3hZ4x1ilVLgtw4o6VVJiHRk6p71k
        an8Dagng==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1l4Q4A-005oH1-8h; Tue, 26 Jan 2021 15:16:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 69F683019CE;
        Tue, 26 Jan 2021 16:15:37 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 4CA882144C091; Tue, 26 Jan 2021 16:15:37 +0100 (CET)
Date:   Tue, 26 Jan 2021 16:15:37 +0100
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
Message-ID: <YBAyGU7H8E98xKng@hirez.programming.kicks-ass.net>
References: <efe6b039a544da8215d5e54aa7c4b6d1986fc2b0.1611607264.git.jpoimboe@redhat.com>
 <CAK7LNAS=uOi=8xJU=NiKnXQW2iCazbErg_TX0gL9oayBiDffiA@mail.gmail.com>
 <20210125212755.jfwlqogpcarmxdgt@treble>
 <CAK7LNAS+EG9doX3qUmu4M3=mRNmdybSv4180Xnuubiwmsq0Agw@mail.gmail.com>
 <20210125220757.vxdsf6sttpy46cq7@treble>
 <YA/PLdX5m9f4v+Yl@kroah.com>
 <CAFbkSA0m1pqmXh29j6wJ9fG05yC72T1kNC0QU3rF7Oh2NoMwYQ@mail.gmail.com>
 <YBAeYaDReAc9VscA@kroah.com>
 <20210126145155.kcfbnzfqg5qugvcl@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126145155.kcfbnzfqg5qugvcl@treble>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 26, 2021 at 08:51:55AM -0600, Josh Poimboeuf wrote:
> User space mixes compiler versions all the time.  The C ABI is stable.
> 
> What specifically is the harder issue you're referring to?

I don't think the C ABI captures nearly enough. Imagine trying to mix a
compiler with and without asm-goto support (ok, we fail to build without
by now, but just imagine).

No C ABI violated, but having that GCC extention vs not having it
radically changes the kernel ABI.

I think I'm with Greg here, just don't do it.
