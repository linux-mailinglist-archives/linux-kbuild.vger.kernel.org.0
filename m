Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B393C3630A0
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Apr 2021 16:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236517AbhDQOZh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 17 Apr 2021 10:25:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233008AbhDQOZh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Apr 2021 10:25:37 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F09DC061574;
        Sat, 17 Apr 2021 07:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=3+RD4PGfvp8A2z71LoP4t3wAnw9CDL/WbCBC7uAAteM=; b=q0Jpc44KVVFF5wX6/JAAU5kxZu
        yXVOh6sJ8baO4d1QLkuxerJe9tpswK0Z+Gmcbrs+jb8pA3hKS0hhOeBsegcbAk4VoXCL5drcj7Kzq
        y/NCWE5azoAkvlidNr2BhmNOd0di39Im9F3BqyZNv1HjmRXa3cbnaqE9sheo0Lqx0IamYsWUm0LBM
        XXhaxK8O9juCcU3bnori7s0KqqqJt8XS2YzhF4CV0vseBNW5STTmv+eSycrdFEm1aKzpUpUTYhnwC
        bG4lrQYqqHWJfck/eQrGAsFPANzPq5OOKGeAz4nmhwpOxOc7mheTqnT73JaSik1FjXdX4jWJ9Y9i7
        QkjtlTLw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lXlsK-00BLUw-PW; Sat, 17 Apr 2021 14:24:48 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8901E30015A;
        Sat, 17 Apr 2021 16:24:43 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6829523CC6F09; Sat, 17 Apr 2021 16:24:43 +0200 (CEST)
Date:   Sat, 17 Apr 2021 16:24:43 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Willy Tarreau <w@1wt.eu>
Cc:     Matthew Wilcox <willy@infradead.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHrvq6/d4iw8SLAc@hirez.programming.kicks-ass.net>
References: <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
 <YHmMJWmzz2vZ3qQH@google.com>
 <YHmc2+bKQJ/XAATF@hirez.programming.kicks-ass.net>
 <YHmuX1NA5RF7C7XS@google.com>
 <20210416161444.GA10484@1wt.eu>
 <CANiq72nbkJFPmiJXX=L8PmkouKgKG1k-CxhZYpL1hcncYwa8JA@mail.gmail.com>
 <YHnG+GRwiMqgHGs5@hirez.programming.kicks-ass.net>
 <20210416180829.GO2531743@casper.infradead.org>
 <YHrDwdQwEk2mSQWa@hirez.programming.kicks-ass.net>
 <20210417114623.GA15120@1wt.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210417114623.GA15120@1wt.eu>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 17, 2021 at 01:46:23PM +0200, Willy Tarreau wrote:
> For me the old trick of casting one side as long long still works:
> 
>   unsigned long long mul3264(unsigned int a, unsigned int b)
>   {
>         return (unsigned long long)a * b;
>   }
> 
> i386:
>   00000000 <mul3264>:
>      0: 8b 44 24 08           mov    0x8(%esp),%eax
>      4: f7 64 24 04           mull   0x4(%esp)
>      8: c3                    ret    
> 
> x86_64:
>   0000000000000000 <mul3264>:
>      0: 89 f8                 mov    %edi,%eax
>      2: 89 f7                 mov    %esi,%edi
>      4: 48 0f af c7           imul   %rdi,%rax
>      8: c3                    retq   
> 
> Or maybe you had something else in mind ?

Last time I tried it, the thing refused :/ which is how we ended up with
mul_u32_u32() in asm.
