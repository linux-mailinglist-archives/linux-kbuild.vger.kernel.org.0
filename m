Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F07C2FF9FB
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 Jan 2021 02:31:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbhAVBai (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 20:30:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAVBaf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 20:30:35 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5060C06174A
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:29:52 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id n7so2603446pgg.2
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jan 2021 17:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xevnePlqkoJPc/gVx/RFwj12UYNRMR5SpPrBczxYlwU=;
        b=FAaMN6AyqXOw4wBmmhNtwxoT6KGu6JihNZn+M+CLJmuNa/lpE8D88XnxfKOLemwyHz
         TI5aKcgt1SVzfkXaJs/3nWef0FXiHqTH70dPrea3jrhHlNnnI5380+pLqgQN+d8AFjGz
         ZyIHY70PZX052b4pCrh19ltUyBOszpEr5+ocfkRMZ/mV1a6Cx2MyXMG1wDEFkfm2rLvn
         8LsP51l5ke7HdGwWcRlanQ2FPrAPNyt1E2l664oclu4QV/nAhkkJBkVav18vjoZa4jk9
         dXZNVYxEWXhgxwuZrbF7yZIlGYcqVVbkbQg0J3Ck36wlk07OaYx+GO5Ry5J0kB7ngJ5g
         XQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xevnePlqkoJPc/gVx/RFwj12UYNRMR5SpPrBczxYlwU=;
        b=O8HMqWzqrSkLauVL2PV/VvqDCmPZ0oBVTpVFBVr31Q/hYdzlSYsVoy/XloaHb+hL7m
         ArDB50yXEvPRiHeaumF5KeXDg+LMaXUhxS63cySg5+cuUuy46SW0cucupP4Pab/wWbTO
         OhhZlYRbHKOdv3MZr5An2wrxxjOXMsV1V4oNo1IxuK5rVqJBSTZngUYbCIdE7ELl7w52
         YfL4IHNRnXfbrVr2GEvoKQ3lHRiegRQOeCHrGOsDVRiU/iJThFTKZqW7/OOI7/cyHRq1
         qwKKw/CowpriCeTMUX5uEj+DX6wMrIwynXcCb56klWH9n36qrvfyfAIBC19jiYV/dUlJ
         9Kog==
X-Gm-Message-State: AOAM530EH8RyEXi0N0a0BcV9dN0cvAS6xRrH6ecCEx+2jU0IOzmWavjW
        pZUWirnXV9gH/eYcdc3/ccXYRvvD6XdqLfYq0GI6Lg==
X-Google-Smtp-Source: ABdhPJxkOo4l83vnl92ZQpYM5r+6B7BNXCAyHRCfWpPglFoyIk3UZ0hV69WA4xzR5J+LTI0hFIEBeIyGLnH/r3vR7dM=
X-Received: by 2002:a62:838d:0:b029:1ba:9b85:2eac with SMTP id
 h135-20020a62838d0000b02901ba9b852eacmr2251542pfe.36.1611278991948; Thu, 21
 Jan 2021 17:29:51 -0800 (PST)
MIME-Version: 1.0
References: <20210116094357.3620352-1-morbo@google.com> <20210121082451.2240540-1-morbo@google.com>
In-Reply-To: <20210121082451.2240540-1-morbo@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 21 Jan 2021 17:29:40 -0800
Message-ID: <CAKwvOdn+tEFcFaDPmbubigf2gqoc+NT=uwvoqNi3-enQjHqTRw@mail.gmail.com>
Subject: Re: [PATCH v6] pgo: add clang's Profile Guided Optimization infrastructure
To:     Bill Wendling <morbo@google.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 12:24 AM Bill Wendling <morbo@google.com> wrote:
>
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
> ---
> v2: - Added "__llvm_profile_instrument_memop" based on Nathan Chancellor's
>       testing.
>     - Corrected documentation, re PGO flags when using LTO, based on Fangrui
>       Song's comments.
> v3: - Added change log section based on Sedat Dilek's comments.
> v4: - Remove non-x86 Makfile changes and se "hweight64" instead of using our
>       own popcount implementation, based on Nick Desaulniers's comment.
> v5: - Correct padding calculation, discovered by Nathan Chancellor.
> v6: - Add better documentation about the locking scheme and other things.
>     - Rename macros to better match the same macros in LLVM's source code.

This is a major win for readability and comparing it against LLVM's
compiler-rt implementation! Thank you for doing that.  It looks like
it addresses most of my concerns.  I'm not against following up on
little details in subsequent patches on top.  However Sedat is right
about the small issue that v6 doesn't compile.  If you were to roll
his fixup into a v7 I'd be happy to sign off on it at this point.
-- 
Thanks,
~Nick Desaulniers
