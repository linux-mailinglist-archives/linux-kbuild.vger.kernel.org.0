Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 508C92FC63A
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Jan 2021 02:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727918AbhATBDc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Jan 2021 20:03:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726000AbhATBD2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Jan 2021 20:03:28 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3266C061573
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 17:02:48 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id cq1so1073395pjb.4
        for <linux-kbuild@vger.kernel.org>; Tue, 19 Jan 2021 17:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2ijWFqCFik7AEqDTngTlHLoNVrHEGUc429TyhF79LIQ=;
        b=XwWSQ6YxMKSzHmONRcdMjeTrCU3nawwN1QwjYEutC9XmpcEdEYone0ZC91cDkkDEUh
         6mKJo0SNJOXpA2FA6tBClNjguod31Xyr5E9hSOUL4mh7WF7EUsd1KdBwQqruBXNlES5w
         JD+jvf6GOtHscsAWlqUjtu3RBDgpGx7szPZKjwYLcf5y/i4G56Y+rsavpOJb0eBRhQBm
         YajWuokO+ZJ8KoCuPFfdti+7cxqyiuO+lzbsN/HNsAWzw0Cuf10FGGF464ci6xg5Ubsd
         Dv/kwEqRFCMxI2hqTyM0R/+hOsCD2mm2DHyZFjMgJmJX8zTfNiaDY+FQHhowUz2yfx83
         w8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2ijWFqCFik7AEqDTngTlHLoNVrHEGUc429TyhF79LIQ=;
        b=Cqjd+oRQeN2dbDZWNRvCLSNmogAQihfK6Q86XhuQKonDs4QwxP4t5dFvzz4TfSkM5t
         NSPGHoG+a3aYAFhjZhQTTDBqSutdAj1dHiL6oIkWz7EluSZI4JYTEq1LlrJlOWOp7pfP
         I8l99Dn9w05bPvOsMTyVF42E0Fw7ZTfwIBenKE3BIKg3u7amR9SWfQ/lE/ac9XgKXWr/
         MglOrQ1thW4Ll1Fa+23HndZirhnvkJfva33P8CLbOdeaqBVe73Pi8Wgbr/Y0T4JyJ5Tn
         kJpNwmGKzr3A1AoQt3rxGtZCNpUT9ga0VGa2gStJDNj7GnIMxkZZbsdw+2AEzEfCRBx3
         K2QA==
X-Gm-Message-State: AOAM531CDVX2iMfe99XEcKUIH+AUPrTa/IFN6QHeihbFigxSco0jX9Ps
        ZMXGB2gupWhxWbRBcfG4bUxtfXjf37BZoAQoHf7CCg==
X-Google-Smtp-Source: ABdhPJwUEGB+8j+EbGLZGj8TsoAObAOLaQeuUzuHU6YAuefhtq4+JTm19EV7M2ciNJFgJUR9Vj9uPACzF6vbP9HPoFE=
X-Received: by 2002:a17:90a:6ba4:: with SMTP id w33mr2729981pjj.32.1611104568023;
 Tue, 19 Jan 2021 17:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20210113061958.886723-1-morbo@google.com> <20210116094357.3620352-1-morbo@google.com>
In-Reply-To: <20210116094357.3620352-1-morbo@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 19 Jan 2021 17:02:36 -0800
Message-ID: <CAKwvOd=BK3DBm0H9GiiicY2NWP9KLq7_Qtx5VY-iezW3o5zuTg@mail.gmail.com>
Subject: Re: [PATCH v5] pgo: add clang's Profile Guided Optimization infrastructure
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

On Sat, Jan 16, 2021 at 1:44 AM Bill Wendling <morbo@google.com> wrote:
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
> ---
> v2: - Added "__llvm_profile_instrument_memop" based on Nathan Chancellor's
>       testing.
>     - Corrected documentation, re PGO flags when using LTO, based on Fangrui
>       Song's comments.
> v3: - Added change log section based on Sedat Dilek's comments.
> v4: - Remove non-x86 Makfile changes and se "hweight64" instead of using our
>       own popcount implementation, based on Nick Desaulniers's comment.
> v5: - Correct padding calculation, discovered by Nathan Chancellor.

Specifically for v5:
Tested-by: Nick Desaulniers <ndesaulniers@google.com>

If anything changes drastically, please drop that and I'll retest it;
otherwise for changes to the commit message or docs, feel free to
carry it forward.

I'll try to provide code review by EOW, assuming we can stop
regressing LLVM so I can focus. (Ha!)
-- 
Thanks,
~Nick Desaulniers
