Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92D993A5EBD
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 11:01:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232621AbhFNJDz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 05:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbhFNJDy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 05:03:54 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A32EC061574;
        Mon, 14 Jun 2021 02:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=gvQrFSkw5++aiUZW2ki8ogkV2fD43cfF9pJvBzEa8wU=; b=XoM1gHYxIjqvMxVJMY4CKuk4Ox
        IwVhisqSDwezb2nX2yE8GfR1RZCrHUTemjXuVSCL02rc/oOZ6x7E0HeCyP7ivy6gDGPuZZNN5J+A9
        K3GaK/Zas0BRbCWZUODpk+TPSTEUNxxq4fstiigTygn8OVkx5deC4qJ/z5cFUWo9uPUf3fxaMRePP
        jw4aKCtoHGcRswYTAGupqN2waJ5Eh25rWDRCA6qg/jTpEptLp4ksg7m5DCO7Zd9TdE34RWD0MOgup
        ZVYkkagevDV4dSRT4rQz0awKixNEq7/Ay6xGqiV3qvIODL5Indo/l+ZcFn/6+8PVKy4MoEqFoKxve
        62eEj5Ew==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lsiT5-005BXk-BI; Mon, 14 Jun 2021 09:01:17 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 08C5A300252;
        Mon, 14 Jun 2021 11:01:14 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id E0E572026A646; Mon, 14 Jun 2021 11:01:13 +0200 (CEST)
Date:   Mon, 14 Jun 2021 11:01:13 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Bill Wendling <morbo@google.com>
Cc:     Kees Cook <keescook@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        andreyknvl@gmail.com, dvyukov@google.com, elver@google.com,
        johannes.berg@intel.com, oberpar@linux.vnet.ibm.com
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jun 12, 2021 at 01:56:41PM -0700, Bill Wendling wrote:
> On Sat, Jun 12, 2021 at 1:25 PM Peter Zijlstra <peterz@infradead.org> wrote:
> > On Sat, Jun 12, 2021 at 12:10:03PM -0700, Bill Wendling wrote:
> > Yes it is, but is that sufficient in this case? It very much isn't for
> > KASAN, UBSAN, and a whole host of other instrumentation crud. They all
> > needed their own 'bugger-off' attributes.
> >
> > > > We've got KCOV and GCOV support already. Coverage is also not an
> > > > argument mentioned anywhere else. Coverage can go pound sand, we really
> > > > don't need a third means of getting that.
> > > >
> > > Those aren't useful for clang-based implementations. And I like to
> > > look forward to potential improvements.
> >
> > I look forward to less things doing the same over and over. The obvious
> > solution if of course to make clang use what we have, not the other way
> > around.
> >
> That is not the obvious "solution".

Because having GCOV, KCOV and PGO all do essentially the same thing
differently, makes heaps of sense?

I understand that the compilers actually generates radically different
instrumentation for the various cases, but essentially they're all
collecting (function/branch) arcs.

I'm thinking it might be about time to build _one_ infrastructure for
that and define a kernel arc format and call it a day.

Note that if your compiler does arcs with functions (like gcc, unlike
clang) we can also trivially augment the arcs with PMU counter data. I
once did that for userspace.
