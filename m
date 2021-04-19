Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFBF36400F
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Apr 2021 13:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234399AbhDSLB4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Apr 2021 07:01:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:33664 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234214AbhDSLB4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Apr 2021 07:01:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4E53861246;
        Mon, 19 Apr 2021 11:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618830086;
        bh=qsDArnwJVzibESZVccOE2Q7ffEL8x4mAoZLAUkykqig=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JVIuru1c4j0f7F7o8TqoAhubCUl9A6l+IBPhqIWRTrfF1LVIkiIPu49+7WZUzUov5
         7CfyPLjgnIESJVZ4rDX0xcLLYmx3IQ4qcwS4kA7WnltYEat6qvBjiCCwwJ02Ma1i7W
         u9pRIHojz6b0ckAGO2EWzvoqcYvL/mV6N2yTfP26k7lBwxn7LolxP9r/1OHVRBJhhO
         zzlpzMADappAqTjjaOXuDm+fpAOgxRAP0LW/211c3dtOUBreI6LkBnzV2sPl1qs8Ep
         pXZtub2VcL1F1oc97N/nJf7uEPjD38dccdg+aJq2eHst7p9katVucoHW4uZHOToDBU
         0uaGPD/EL8NqA==
Date:   Mon, 19 Apr 2021 12:01:21 +0100
From:   Will Deacon <will@kernel.org>
To:     Paolo Bonzini <pbonzini@redhat.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Wedson Almeida Filho <wedsonaf@google.com>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <20210419110120.GA29869@willie-the-truck>
References: <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com>
 <YHk4DZE1ZWTiBB1f@hirez.programming.kicks-ass.net>
 <aa6e44ab-e223-73aa-279e-8103732460ac@redhat.com>
 <YH0yCTgL0raKrmYg@hirez.programming.kicks-ass.net>
 <7287eac3-f492-bab1-9ea8-b89ceceed560@redhat.com>
 <YH0+0VQ1XC8+rv20@hirez.programming.kicks-ass.net>
 <3a874b15-5c21-9ed9-e5c3-995f915cba79@redhat.com>
 <YH1PGfC1qSjKB6Ho@hirez.programming.kicks-ass.net>
 <a6297428-c4c6-f03b-49c7-6026c3d16d30@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6297428-c4c6-f03b-49c7-6026c3d16d30@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Apr 19, 2021 at 11:40:54AM +0200, Paolo Bonzini wrote:
> On 19/04/21 11:36, Peter Zijlstra wrote:
> > On Mon, Apr 19, 2021 at 11:02:12AM +0200, Paolo Bonzini wrote:
> > > > void writer(void)
> > > > {
> > > >       atomic_store_explicit(&seq, seq+1, memory_order_relaxed);
> > > >       atomic_thread_fence(memory_order_acquire);
> > > 
> > > This needs to be memory_order_release.  The only change in the resulting
> > > assembly is that "dmb ishld" becomes "dmb ish", which is not as good as the
> > > "dmb ishst" you get from smp_wmb() but not buggy either.
> > 
> > Yuck! And that is what requires the insides to be
> > atomic_store_explicit(), otherwise this fence doesn't have to affect
> > them.
> 
> Not just that, even the write needs to be atomic_store_explicit in order to
> avoid a data race.atomic_store_explicit

https://wg21.link/P0690

was an attempt to address this, but I don't know if any of the ideas got
adopted in the end.

Will
