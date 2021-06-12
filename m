Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B92B83A508A
	for <lists+linux-kbuild@lfdr.de>; Sat, 12 Jun 2021 22:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhFLUWe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 12 Jun 2021 16:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230186AbhFLUWe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 12 Jun 2021 16:22:34 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB755C061574
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jun 2021 13:20:22 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id j12so5355849pgh.7
        for <linux-kbuild@vger.kernel.org>; Sat, 12 Jun 2021 13:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=KSRBKv2aAWVPJTwPuTubBt5RbpntSvBl6+11N6OojZo=;
        b=QUEhRvwhvVtoBZtgcHgGDV+UgXwb9uoWbieX3KPLqZy5GADa8YIM7/MIIZCZeCgW2/
         MK+4kS/JplsEQHmuIlrisQDPV7VeIYF7DuU4aTIe0VrnOwj0PAvi4ZH9NwbVvhrG8GQM
         QW+ZqlExPyyrWLrFqEYPwWdbre0fBQ8Fkp9Yei6eaLusnx54zL3Ehcc8Ei16gcJ+AqD4
         X82oEBMPd41mlAGzbfz2Ju9ioTsRGP175MAL5dod7OSg646AW6nXaxpBxLVziBC+yl4C
         obJQlbCoMlcvGlpc/60q6vnU0QTrL/tnwYlfn+B08jI5x+dWj3CSy7VRAXok4zWSWwGi
         4oZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=KSRBKv2aAWVPJTwPuTubBt5RbpntSvBl6+11N6OojZo=;
        b=B64JZijDENriGXph+tOF9aPLwgTdM9+GiSWLO885dbu3gYJvZ5Jfu5yGb4LQx9wkyF
         QBBoQyVQ070+XPNQ1wLym6KZEaxctmGJoPP9lruXGrv2imBf8arJNuzdunB7CX8uryZG
         4l96ovGj9pT1TLI7+RzuSC42xcpfFFQJ4jrf8uufn5ermtgLXvkl2b2VPw8UkK/rq9Vj
         mO3CUj5rrpLy9Pw59riz7F+peMNVImg/ApobpNjCS3qwyWKD5lWM/i4bhxyrLMXa2HvL
         6y2Ws/5MVj7wPwB4MYnQcRGkLaQDA1kEwVn7Ln5RiPeHOpqZoTTc3WT8K39Fgh6ws/Ah
         TqTQ==
X-Gm-Message-State: AOAM5324xXPRBVsF7YxXnvp3eQOwfbxF22usgFcykV3NSqcCZiGe0X4O
        +ACLnUFik3K0LmJJ/MZvBeWnZA==
X-Google-Smtp-Source: ABdhPJysGKYhgvGAvdEDH7zzoFJJfcSIP9bR/mVs7u8jxxuyhlyrJS9H95cthtKfRYCkOUlvlZgoNQ==
X-Received: by 2002:a63:205b:: with SMTP id r27mr9947707pgm.95.1623529220871;
        Sat, 12 Jun 2021 13:20:20 -0700 (PDT)
Received: from google.com ([2620:15c:2ce:200:425c:5da8:ed33:260e])
        by smtp.gmail.com with ESMTPSA id i10sm8523806pfk.74.2021.06.12.13.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jun 2021 13:20:20 -0700 (PDT)
Date:   Sat, 12 Jun 2021 13:20:15 -0700
From:   Fangrui Song <maskray@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Bill Wendling <morbo@google.com>, Kees Cook <keescook@google.com>,
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
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <20210612202015.s4743sr6d3lv3lgf@google.com>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
 <YMTn9yjuemKFLbws@hirez.programming.kicks-ass.net>
 <CAGG=3QXjD1DQjACu=CQQSP=whue-14Pw8FcNcXrJZfLC_E+y9w@mail.gmail.com>
 <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <YMT5xZsZMX0PpDKQ@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021-06-12, Peter Zijlstra wrote:
>On Sat, Jun 12, 2021 at 10:25:57AM -0700, Bill Wendling wrote:
>> On Sat, Jun 12, 2021 at 9:59 AM Peter Zijlstra <peterz@infradead.org> wrote:
>> > Also, and I don't see this answered *anywhere*, why are you not using
>> > perf for this? Your link even mentions Sampling Profilers (and I happen
>> > to know there's been significant effort to make perf output work as
>> > input for the PGO passes of the various compilers).
>> >
>> Instruction-based (non-sampling) profiling gives us a better
>> context-sensitive profile, making PGO more impactful. It's also useful
>> for coverage whereas sampling profiles cannot.
>
>We've got KCOV and GCOV support already. Coverage is also not an
>argument mentioned anywhere else. Coverage can go pound sand, we really
>don't need a third means of getting that.
>
>Do you have actual numbers that back up the sampling vs instrumented
>argument? Having the instrumentation will affect performance which can
>scew the profile just the same.
>
>Also, sampling tends to capture the hot spots very well.

[I don't do kernel development. My experience is user-space toolchain.]

For applications, I think instrumentation based PGO can be 1%~4% faster
than sample-based PGO (e.g. AutoFDO) on x86.

Sample-based PGO has CPU requirement (e.g. Performance Monitoring Unit).
(my gut feeling is that there may be larger gap between instrumentation
based PGO and sample-based PGO for aarch64/ppc64, even though they can
use sample-based PGO.)
Instrumentation based PGO can be ported to more architectures.

In addition, having an infrastructure for instrumentation based PGO
makes it easy to deploy newer techniques like context-sensitive PGO
(just changed compile options; it doesn't need new source level
annotation).
