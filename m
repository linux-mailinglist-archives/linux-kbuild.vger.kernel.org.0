Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BE93363D6E
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 10:27:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbhDSI1c (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 04:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbhDSI1c (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 04:27:32 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D63F4C06174A;
        Mon, 19 Apr 2021 01:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=DBMoV/cX0cKYwtE9SxJVrR1aR8cR7qkDyUhKQJS3Otk=; b=A0baORrD+G2oufCB44y+zQaf6Z
        tzVFCPRFc3jisZMvJFjuS0b3X+MdxYOHuDFAhOzwEfmw7on3iIp7vVA9ISvN85wEi7Z9xNukphDER
        qc83ko727XedAalO3uJ1SRUG6e4yZYxpU+y2vntG8Up8piSMhL1CkvGp1UtJNuGIWlVBVGuD0wx/1
        e/hZzi8CVnL4sM/dsC9Ec1ZeYMvJWwYaPLzXWN4zsdb1hHegQRzE9yTImLKifb6iq+kFTCje/Rwjw
        a2TZNV4ThUO8Xu0ilaIBiL9PvmGQikjaa2qBD6j8wsBzu1VsgbJhG6IH4BQS0slHduK/ZmG+w1TnO
        ed5muYIA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lYPFC-009QQ4-EQ; Mon, 19 Apr 2021 08:26:58 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 050AC300212;
        Mon, 19 Apr 2021 10:26:57 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id D96F12C14C5BA; Mon, 19 Apr 2021 10:26:57 +0200 (CEST)
Date:   Mon, 19 Apr 2021 10:26:57 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 09:53:06AM +0200, Paolo Bonzini wrote:
> On 19/04/21 09:32, Peter Zijlstra wrote:
> > On Sat, Apr 17, 2021 at 04:51:58PM +0200, Paolo Bonzini wrote:
> > > On 16/04/21 09:09, Peter Zijlstra wrote:
> > > > Well, the obvious example would be seqlocks. C11 can't do them
> > > 
> > > Sure it can.  C11 requires annotating with (the equivalent of) READ_ONCE all
> > > reads of seqlock-protected fields, but the memory model supports seqlocks
> > > just fine.
> > 
> > How does that help?
> > 
> > IIRC there's two problems, one on each side the lock. On the write side
> > we have:
> > 
> > 	seq++;
> > 	smp_wmb();
> > 	X = r;
> > 	Y = r;
> > 	smp_wmb();
> > 	seq++;
> > 
> > Which C11 simply cannot do right because it does't have wmb.
> 
> It has atomic_thread_fence(memory_order_release), and
> atomic_thread_fence(memory_order_acquire) on the read side.

https://godbolt.org/z/85xoPxeE5

void writer(void)
{
    atomic_store_explicit(&seq, seq+1, memory_order_relaxed);
    atomic_thread_fence(memory_order_acquire);

    X = 1;
    Y = 2;

    atomic_store_explicit(&seq, seq+1, memory_order_release);
}

gives:

writer:
        adrp    x1, .LANCHOR0
        add     x0, x1, :lo12:.LANCHOR0
        ldr     w2, [x1, #:lo12:.LANCHOR0]
        add     w2, w2, 1
        str     w2, [x0]
        dmb     ishld
        ldr     w1, [x1, #:lo12:.LANCHOR0]
        mov     w3, 1
        mov     w2, 2
        stp     w3, w2, [x0, 4]
        add     w1, w1, w3
        stlr    w1, [x0]
        ret

Which, afaict, is completely buggered. What it seems to be doing is
turning the seq load into a load-acquire, but what we really need is to
make sure the seq store (increment) is ordered before the other stores.


