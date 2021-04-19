Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39288363DAB
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 10:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238290AbhDSIgE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 04:36:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238262AbhDSIf4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 04:35:56 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE328C06174A;
        Mon, 19 Apr 2021 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=MzstDp0klphgOp7a2sZHFPQlmjiV2TLi0ke2ptY9o0k=; b=aC9S2N9D2XUKcx2oukFZkmx0Ws
        lK/9B4aUWUI64d7CzgHYvB0yRX7gHRrEoLHHOn6e65yVn4zoVytrteYeC+VGzGI/0yGxGRrXxfoTg
        X2qCNDlHXGMseBgBLSVPWvet3Dh37edBEQitwC/oqx5HY3gicvhS+rseDsNNIGfaPk0VEWhtGvqge
        HTKvkpDbsF6bbzOW5aryOFMCkvK5qtBSzcXN34IZmn6/XYrjf2rcjZMHnwvsLMusMdnswnY2mxbIg
        n+M3NF+hg08LeUnFpJQuMSK8bpIb5qPM232YJ5v4boP+vqK5aSWzEyLO0OJs89m/zAgIznzizvIW9
        rrreqJaw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lYPNJ-009RUB-Vt; Mon, 19 Apr 2021 08:35:22 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3AC7630020C;
        Mon, 19 Apr 2021 10:35:21 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 28F972C14C5BA; Mon, 19 Apr 2021 10:35:21 +0200 (CEST)
Date:   Mon, 19 Apr 2021 10:35:21 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YH1Ayc6UncJ32uQZ@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
 <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 10:26:57AM +0200, Peter Zijlstra wrote:

> https://godbolt.org/z/85xoPxeE5

That wants _Atomic on the seq definition for clang.

> void writer(void)
> {
>     atomic_store_explicit(&seq, seq+1, memory_order_relaxed);
>     atomic_thread_fence(memory_order_acquire);
> 
>     X = 1;
>     Y = 2;
> 
>     atomic_store_explicit(&seq, seq+1, memory_order_release);
> }
> 
> gives:
> 
> writer:
>         adrp    x1, .LANCHOR0
>         add     x0, x1, :lo12:.LANCHOR0
>         ldr     w2, [x1, #:lo12:.LANCHOR0]
>         add     w2, w2, 1
>         str     w2, [x0]
>         dmb     ishld
>         ldr     w1, [x1, #:lo12:.LANCHOR0]
>         mov     w3, 1
>         mov     w2, 2
>         stp     w3, w2, [x0, 4]
>         add     w1, w1, w3
>         stlr    w1, [x0]
>         ret
> 
> Which, afaict, is completely buggered. What it seems to be doing is
> turning the seq load into a load-acquire, but what we really need is to
> make sure the seq store (increment) is ordered before the other stores.

Put differently, what you seem to want is store-acquire, but there ain't
no such thing.
