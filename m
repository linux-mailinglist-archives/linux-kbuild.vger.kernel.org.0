Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41161363E9F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 11:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237884AbhDSJhB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 05:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbhDSJhA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 05:37:00 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6174EC06174A;
        Mon, 19 Apr 2021 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Zoaz+arrG2VoAZjnSLaqhvfG02ozKoF1dTuBza5it3M=; b=W4oysXhUdmJlxpQdkFI2LUz+wM
        8LokRUVSAv+dEETIHyKSaa6m0HVnUZbebSF23/G65TXk1zPxRuW4lOLHj2p1bmx8Mgjl0RIWhtlN5
        LvRCoRNcoQfhZksJGhKmajbV27npBzi7xOVMEMZ6OVLBUHIeTeuXXMt2Ctc81SWhCVTqM9D7wP3pM
        GmgpI64jyAMnsgL3JI84E1C9vvZElMrQSV8s1cZpKbS2cl/FHYmFarkc+pLTAhi/otwFWmxhR3/VT
        1ZnhAhY4vwyiqyDNDE9O78PwLX/h4eKlL6rsznTl1o/1Zw9DXQdBBzDeRfhzgmrVHkuB4qORDjM/s
        7IpOoiCg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lYQKQ-009ZJU-N7; Mon, 19 Apr 2021 09:36:26 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id DD1C130021C;
        Mon, 19 Apr 2021 11:36:25 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C0E762015BC7C; Mon, 19 Apr 2021 11:36:25 +0200 (CEST)
Date:   Mon, 19 Apr 2021 11:36:25 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
 <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 11:02:12AM +0200, Paolo Bonzini wrote:
> > void writer(void)
> > {
> >      atomic_store_explicit(&seq, seq+1, memory_order_relaxed);
> >      atomic_thread_fence(memory_order_acquire);
> 
> This needs to be memory_order_release.  The only change in the resulting
> assembly is that "dmb ishld" becomes "dmb ish", which is not as good as the
> "dmb ishst" you get from smp_wmb() but not buggy either.

Yuck! And that is what requires the insides to be
atomic_store_explicit(), otherwise this fence doesn't have to affect
them.

I also don't see how this is better than seq_cst.

But yes, not broken, but also very much not optimal.
