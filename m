Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 763D63A6A8C
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Jun 2021 17:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233136AbhFNPiR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Jun 2021 11:38:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbhFNPiH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Jun 2021 11:38:07 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6ADC061767;
        Mon, 14 Jun 2021 08:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=Cu6SKmr0wogKDzs7Tpjs0nvU/JJlCGecw+D1VcYnf9I=; b=du5rKjaENbHV+QZYklpfbh5bw4
        kZPSNbYAV1oF2yh+I9Jg5CzYIlILZUtv5+mriQMwXr8lrFYHpoa2CWgOVvfOHiXyon8oVuD+7BMAo
        roFIbVlT83QzpVdObfLuT9YwxbsJh/UJzevnRa5wyt0FvwX/pcokLkCyKlmQ2LiFwp1GzrQMso3DE
        LsJVcWn8mLMze5Ih1tyLvJDX7tVr8fLZ8kDSdLwQjuRAZwOs/a7MYEJHjWrVBDtCQ2Vcx+FzwddZP
        gzcdxf4gkgdXFG0Aeg85ZNU+9cmHHMmBlteWEfOPzs/h0IlgyhIz8Xkv1SlXoVe/w2PgBF1UEiHhJ
        TCyJlQkQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1lsocl-0074f0-UI; Mon, 14 Jun 2021 15:35:47 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id E7C989831CA; Mon, 14 Jun 2021 17:35:45 +0200 (CEST)
Date:   Mon, 14 Jun 2021 17:35:45 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Kees Cook <keescook@chromium.org>
Cc:     Marco Elver <elver@google.com>, Bill Wendling <morbo@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Andrey Konovalov <andreyknvl@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>, johannes.berg@intel.com,
        oberpar@linux.vnet.ibm.com, linux-toolchains@vger.kernel.org
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210614153545.GA68749@worktop.programming.kicks-ass.net>
References: <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
 <CAGG=3QVHkkJ236mCJ8Jt_6JtgYtWHV9b4aVXnoj6ypc7GOnc0A@mail.gmail.com>
 <20210612202505.GG68208@worktop.programming.kicks-ass.net>
 <CAGG=3QUZ9tXGNLhbOr+AFDTJABDujZuaG1mYaLKdTcJZguEDWw@mail.gmail.com>
 <YMca2aa+t+3VrpN9@hirez.programming.kicks-ass.net>
 <CAGG=3QVPCuAx9UMTOzQp+8MJk8KVyOfaYeV0yehpVwbCaYMVpg@mail.gmail.com>
 <YMczJGPsxSWNgJMG@hirez.programming.kicks-ass.net>
 <CANpmjNNnZv7DHYaJBL7knn9P+50F+SOCvis==Utaf-avENnVsw@mail.gmail.com>
 <202106140817.F584D2F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202106140817.F584D2F@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 14, 2021 at 08:26:01AM -0700, Kees Cook wrote:
> So, AFAICT, the original blocking issue ("PGO does not respect noinstr")
> is not actually an issue (noinstr contains notrace, which IS respected
> by PGO[2]), I think this is fine to move forward.

It is *NOT*: https://godbolt.org/z/9c7xdvGd9

Look at how both compilers generate instrumentation in the no_instr()
function.
