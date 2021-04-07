Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EC83576B7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Apr 2021 23:22:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232523AbhDGVW7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 7 Apr 2021 17:22:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbhDGVW7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Apr 2021 17:22:59 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CA34C061761
        for <linux-kbuild@vger.kernel.org>; Wed,  7 Apr 2021 14:22:49 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id d124so231238pfa.13
        for <linux-kbuild@vger.kernel.org>; Wed, 07 Apr 2021 14:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Zupj7uPahNplY1UQVoMGkmaTQjWt4OgWRC3KsLSujrc=;
        b=M9YSVBjfkZmUSxtRGAEOxpmgFxdTViW/Siw3rNeLMFHDSM6e3hN8ysP/2240zDxxDi
         T39zUKyY0vtGxkZkCB4+bVGjB1JAVYTKNRcUTK6MJPCXyrOzKqsAcJlHnP7Y1ova1y0O
         st/zEdrQliXXXomA7KmkLKClIcIhYnk+UrSJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Zupj7uPahNplY1UQVoMGkmaTQjWt4OgWRC3KsLSujrc=;
        b=i5IYy+/rDGOPr6KD36PwCj95m/4dOHUgM45tHu8A7DJkZj9AhKR+URWEszGMdJ2E/O
         JQFJuXDnX/ZpNJjAMMUVS05gw/bH0e0PCpxipOWmS8mdXdYGNLMnwwV5oBE2ybJeEmYA
         2wBsYu2VBlEppICeTE/waAg9LLHTnHyBfkxSzAw03F73ESDJ5s9FICUoKwXNphS/Ni0d
         t6kh+sZ29u9e4XblsyM/YM0zmW2SN9Ks5eaJ2KHJtiudu115HlC0Zs4uRLRyMl3mv0LU
         G2zNVXHz+OWCY083+mwY9vdo3lk+WuzGpblLBM0n7SLyY/93i7i5dtzWFPqZN/Vzni6y
         zShA==
X-Gm-Message-State: AOAM532Q7ximhuf+voZ6t2HAPKh5L7R2Ql6MykRmxNMUdLnOPqoGuWvm
        i0Di+ndQBwEALzxasyQkf7G3hw==
X-Google-Smtp-Source: ABdhPJxmQh7Kdjw0Jc6nIS2cPCnS5zmtBW3pIu0KoBmLegBViWu9iAOndw2MizR2wLYNxurOsLzrcw==
X-Received: by 2002:a63:df56:: with SMTP id h22mr5123694pgj.84.1617830568995;
        Wed, 07 Apr 2021 14:22:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id l191sm6209304pfd.36.2021.04.07.14.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 14:22:48 -0700 (PDT)
Date:   Wed, 7 Apr 2021 14:22:47 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Bill Wendling <morbo@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>
Subject: Re: [PATCH v9] pgo: add clang's Profile Guided Optimization
 infrastructure
Message-ID: <202104071419.AA35EEAF@keescook>
References: <20210111081821.3041587-1-morbo@google.com>
 <20210407211704.367039-1-morbo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407211704.367039-1-morbo@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Apr 07, 2021 at 02:17:04PM -0700, 'Bill Wendling' via Clang Built Linux wrote:
> From: Sami Tolvanen <samitolvanen@google.com>
> 
> Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> profile, the kernel is instrumented with PGO counters, a representative
> workload is run, and the raw profile data is collected from
> /sys/kernel/debug/pgo/profraw.
> 
> The raw profile data must be processed by clang's "llvm-profdata" tool
> before it can be used during recompilation:
> 
>   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
>   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> 
> Multiple raw profiles may be merged during this step.
> 
> The data can now be used by the compiler:
> 
>   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> 
> This initial submission is restricted to x86, as that's the platform we
> know works. This restriction can be lifted once other platforms have
> been verified to work with PGO.
> 
> Note that this method of profiling the kernel is clang-native, unlike
> the clang support in kernel/gcov.
> 
> [1] https://clang.llvm.org/docs/UsersManual.html#profile-guided-optimization
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> Co-developed-by: Bill Wendling <morbo@google.com>
> Signed-off-by: Bill Wendling <morbo@google.com>
> Tested-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
> Reviewed-by: Fangrui Song <maskray@google.com>

Thanks for sending this again! I'm looking forward to using it.

Masahiro and Andrew, unless one of you would prefer to take this in your
tree, I figure I can snag it to send to Linus.

Anyone else have feedback?

Thanks!

-Kees

-- 
Kees Cook
