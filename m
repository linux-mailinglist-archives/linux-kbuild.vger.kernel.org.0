Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14CB52F59C7
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 05:10:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbhANEID (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 23:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbhANEIC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 23:08:02 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD2A6C061786
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 20:07:22 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id c79so2608477pfc.2
        for <linux-kbuild@vger.kernel.org>; Wed, 13 Jan 2021 20:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X2Xl39y4Q4WYR391MlcCTCVyfvuGNcf13HwTIUJuHYU=;
        b=Qb6XObXve5bZJco/bp7C8Mjv/jUKToZR7oH0hrrN2m1NNs2nsHtpYaKPU8fp/cA+20
         bLvRGonHREkJib6ytNaAoIqyHFr2XurADR8NF0iNI1VXLBEVJYw76gRnsD/grgJgr9G2
         gbNuEJF/9cLexUS9ligs4J8FqBnWPDLG7wp8txFacdnwuQ2/wWk6l3Se5UC95be8hoX7
         Rc9cO7J4SFemacU7exfa8XDg2ruPhqFS4Di1vdhES6ue6g8kZWPhKPB+drMoQHXIAfDf
         yHUCExT3lAW9QXVZXLtx9LHQUsoOkFjL75qrSa2KSvzeKIo9ow4Aeik9xn6qrm887Zta
         iB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X2Xl39y4Q4WYR391MlcCTCVyfvuGNcf13HwTIUJuHYU=;
        b=XitrDL2jRj3bHEz+R6xJX4DkQ/9ixqpXGWUVXn74ymZdbOUScTKsNiO99c8g6VKaEN
         z6HLnOJS/8G1+G2g+JmbRuwl5JixN/2y3L7glrvpz2xFdN85Xku5XSnD/char5YbSZJ5
         fnvG5enVcEuL9zyLswY/MG5zEdK4/icQnTGsFGRqxiFSiLx+93unJsUdCQuZl61fmOmR
         Q1+b/CNXXBquIhIicHqa7E79x83v1dkDbrq2ydlHSMeUAi+lYzMMrN0uWnHzKSmXvQqi
         3rxdEc8xh9wRLBZO9L1pt2l90GTMCmE0L7Tp5vqyRy4vJ7mkGFOGSpGib5JIXxYAZ4FP
         Qx4w==
X-Gm-Message-State: AOAM531KUIgsocoASIfP2gEgdtiqpqOPi7OXEgj4AruEKTk9OHEcqNKv
        bvw9mxUOP8rgIO7UC5jaJWgAIVWoI3sxuV3lCc1Vaw==
X-Google-Smtp-Source: ABdhPJweqXyNdG41CizOvJ+7nIJrbD+fB/8boMpyXoL1a0C896awy91uQFO6JUsSaWfp+KbH5/IpEmP/QY+ntvhF6/0=
X-Received: by 2002:a63:5701:: with SMTP id l1mr5424394pgb.381.1610597242082;
 Wed, 13 Jan 2021 20:07:22 -0800 (PST)
MIME-Version: 1.0
References: <20210112053113.4180271-1-morbo@google.com> <20210113061958.886723-1-morbo@google.com>
 <20210113205547.GA21653@Ryzen-9-3900X.localdomain>
In-Reply-To: <20210113205547.GA21653@Ryzen-9-3900X.localdomain>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 13 Jan 2021 20:07:10 -0800
Message-ID: <CAKwvOd=0wWz4o652EoZNvfu1L+fuhuGZusqpxiJ+561DtCh7Eg@mail.gmail.com>
Subject: Re: [PATCH v4] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 13, 2021 at 12:55 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> However, I see an issue with actually using the data:
>
> $ sudo -s
> # mount -t debugfs none /sys/kernel/debug
> # cp -a /sys/kernel/debug/pgo/profraw vmlinux.profraw
> # chown nathan:nathan vmlinux.profraw
> # exit
> $ tc-build/build/llvm/stage1/bin/llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> warning: vmlinux.profraw: Invalid instrumentation profile data (bad magic)
> error: No profiles could be merged.
>
> Am I holding it wrong? :) Note, this is virtualized, I do not have any
> "real" x86 hardware that I can afford to test on right now.

Same.

I think the magic calculation in this patch may differ from upstream
llvm: https://github.com/llvm/llvm-project/blob/49142991a685bd427d7e877c29c77371dfb7634c/llvm/include/llvm/ProfileData/SampleProf.h#L96-L101

vs this patch:

+ * Note: These internal LLVM definitions must match the compiler version.
+ * See llvm/include/llvm/ProfileData/InstrProfData.inc in LLVM's source code.
+ */
+
+#ifdef CONFIG_64BIT
+ #define LLVM_PRF_MAGIC \
+ ((u64)255 << 56 | \
+ (u64)'l' << 48 | \
+ (u64)'p' << 40 | \
+ (u64)'r' << 32 | \
+ (u64)'o' << 24 | \
+ (u64)'f' << 16 | \
+ (u64)'r' << 8  | \
+ (u64)129)
+#else
+ #define LLVM_PRF_MAGIC \
+ ((u64)255 << 56 | \
+ (u64)'l' << 48 | \
+ (u64)'p' << 40 | \
+ (u64)'r' << 32 | \
+ (u64)'o' << 24 | \
+ (u64)'f' << 16 | \
+ (u64)'R' << 8  | \
+ (u64)129)
+#endif

-- 
Thanks,
~Nick Desaulniers
