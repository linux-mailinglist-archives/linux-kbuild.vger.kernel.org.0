Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B74F93A5FDA
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 12:18:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232767AbhFNKU4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 06:20:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbhFNKUz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 06:20:55 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71204C061574;
        Mon, 14 Jun 2021 03:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=NhIEo9sT28glTkM4CxprF+qgzCzmmeIS6U+43P+3xf0=; b=CaSvsj9J4I01ytahIOFo+aG8Jv
        Wii8P4OUN18F3+xTqrL6LYLIBdU+beXTS3ohY9cnjAOBHka16OM/VG9QAPWYHhbeI6Ygh/+93xFaI
        EJTw2DzHMYNenFtpJ4mrZ/UmrucjMOYCY9SKLITq5+7XO+v/YeSvY6EbYyAVAvKFNOLKvBJXY8SwN
        DJaxaq+MJEtg4yREyAJieFeQ2XcUX3WcCvumbVVjuaIK5bTApqvelqF4tLPTkH5k7077lmFUHF8pa
        gz3AHaspUYnzmM/Y/1cbGrpi9Cih5nAvdo1pO7z4r3ZnPsMDdc4DcQzZFCSmbCFIoiRqApZ8Kxeui
        0BmHtICg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lsjfs-00706g-Mx; Mon, 14 Jun 2021 10:18:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 5A7C73001E3;
        Mon, 14 Jun 2021 12:18:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 43BBA2C5DAE9B; Mon, 14 Jun 2021 12:18:38 +0200 (CEST)
Date:   Mon, 14 Jun 2021 12:18:38 +0200
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
        johannes.berg@intel.com, oberpar@linux.vnet.ibm.com, mliska@suse.cz
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <YMcs/kOcylwvaSr3@hirez.programming.kicks-ass.net>
References: <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <CAGG=3QUFRM85bpyjdokO93=Nem_w7-784-_qihP1P_CJMOsdqg@mail.gmail.com>
 <CAGG=3QUrhVi37sYtybTUAZMpCDjB_pw+1OdkbZKvL6+UQrbMbQ@mail.gmail.com>
 <YMcksKbnVGyi6jHy@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMcksKbnVGyi6jHy@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 14, 2021 at 11:43:12AM +0200, Peter Zijlstra wrote:
> On Sun, Jun 13, 2021 at 11:07:26AM -0700, Bill Wendling wrote:
> 
> > > > Now, for the "nointr" issue. I'll see if we need an additional change for that.
> > > >
> > > The GCOV implementation disables profiling in those directories where
> > > instrumentation would fail. We do the same. Both clang and gcc seem to
> > > treat the no_instrument_function attribute similarly.
> 
> Both seem to emit instrumentation, so they're both, simliarly, *broken*.
> 
> noinstr *MUST* disable all compiler generated instrumentation. Also see:
> 
>   https://lkml.kernel.org/r/20210527194448.3470080-1-elver@google.com
> 
> I'll go mark GCOV support as BROKEN for x86.

https://lkml.kernel.org/r/YMcssV/n5IBGv4f0@hirez.programming.kicks-ass.net
