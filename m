Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A92F36305B
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 15:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236129AbhDQN3x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 09:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231772AbhDQN3t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 09:29:49 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD9BBC061760
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 06:29:21 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id w186so11162969wmg.3
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Apr 2021 06:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ISBdoGIET+ZYznAio2FskDixMUDkKh8PC4/Pd4Loq2k=;
        b=d/Pja+DmXSa+DmZhRpIEt3/37I45Rs75tBubp/JfNW0JByklVj/oO1Mnpl+LGw4Miw
         s8mlIsXzOhdvN08Cwvzaknh9HE7sNEJwbpiFeunxRCkJ/1FRnctFHC8f+rWH2oM3eYFK
         MTXxU5dZXVeXwZYbTn0xfbnSLi5NFB3UxiiRg0juj/B+SUlMgWl0ZwombT8SJriD+iQc
         RDzmYTa2a0GkMdzoPk5pWWcCPGK7RMzCc1JYoUPe05/+cVNl+EpRizRV7UZfHMH+ylgW
         TyOQHeJrz/vlVZ93tboITgeFuJCSXE/A40E0JF7U+x1cZJJW5kc0u6Y73ZruuCx1HBmO
         OihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ISBdoGIET+ZYznAio2FskDixMUDkKh8PC4/Pd4Loq2k=;
        b=gvGG/a1y2K46zAoVPj2lkufS3SrcwhU8mktabKYWNd+TcpacsDx7xwsSFA7ttVAvPi
         Cnz7VlAE5mxHxNmrzSKh+OvxjA0WYyui7dPK3N/pod11klRS3hAe1xNoyLk5CSE6zDM/
         8kdHnbCP3yQPFPn3193DeFYD79c4zG4avFMBLUD5z/4SWD6DRjji1HQGafI8e9l7OgUa
         qbJBfM5EsUCfZz61nLgNvZjCm27SvycW8jjox5wyygc9jt/6HEPe3WGSsRPnyOgf02/N
         cao1DVsDUPwNfp0U1lJj0c0DhDABr3NiaH0fImpmk40XMDxeHOzH7tz7+aPWwP+Bp53D
         2U+w==
X-Gm-Message-State: AOAM531lh1Ecr4ymSBPf1pRsIam3VzYBYI3SdSRt0HntCkKG0ktzN2jd
        h2upknq/ED4BE+bLJ2Pht2IJ
X-Google-Smtp-Source: ABdhPJxHkMpcgFrhLR2HMnbWKLQatCZYeC3c/Fjg2tVXB+3E0vMDLf0rtIbABL9RYc1DU5ZHylo/cw==
X-Received: by 2002:a05:600c:4fc8:: with SMTP id o8mr12727799wmq.87.1618666160177;
        Sat, 17 Apr 2021 06:29:20 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:3c1c:8462:b77e:21a4])
        by smtp.gmail.com with ESMTPSA id l8sm12570438wme.18.2021.04.17.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 06:29:19 -0700 (PDT)
Date:   Sat, 17 Apr 2021 14:29:15 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Peter Zijlstra <peterz@infradead.org>, ojeda@kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHriqwf5XR0xWCi1@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <20210416150307.GJ2531743@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210416150307.GJ2531743@casper.infradead.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 04:03:07PM +0100, Matthew Wilcox wrote:
> Well, we could do that in C too.
> 
> struct unlocked_inode {
> 	spinlock_t i_lock;
> };
> 
> struct locked_inode {
> 	spinlock_t i_lock;
> 	unsigned short i_bytes;
> 	blkcnt_t i_blocks;
> };
> 
> struct locked_inode *lock_inode(struct unlocked_inode *inode)
> {
> 	spin_lock(&inode->i_lock);
> 	return (struct locked_inode *)inode;
> }

Indeed you can do this kind of thing in C, but as I said before (apologies if
I'm too repetitive on this) Rust forces you to do it the right way, whereas the
lack of enforcement in C leaves room for mistakes.

If you do add extensions to C to add some of these restrictions (and I encourage
you to pursue such extensions as we all benefit from better C), it is likely not
sufficient to reach the level of compile-time guarantee that Rust offers because
you need a whole slew of restrictions/enforcements.

I also note that academics have a formalisation of [a subset of] Rust that show
the soundness of these guarantees and the requirements on unsafe to compose
safely. So we're not talking about guesswork, there are formal machine-checked
proofs published about this (see for example
https://people.mpi-sws.org/~dreyer/papers/safe-sysprog-rust/paper.pdf).
