Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 420A62AA41B
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Nov 2020 10:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728331AbgKGJFA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 7 Nov 2020 04:05:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728322AbgKGJE7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 7 Nov 2020 04:04:59 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 390FDC0613CF
        for <linux-kbuild@vger.kernel.org>; Sat,  7 Nov 2020 01:04:59 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id g11so2086572pll.13
        for <linux-kbuild@vger.kernel.org>; Sat, 07 Nov 2020 01:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YzyYN6jLumCnrlxnfcM2cNl/xFX6pvZ4pMXoDyQ+hD8=;
        b=uZ9BKTpiKDLn0lh+cWV+ISy4wKFzcOzsNcgzYdj5uoR7FvOqQ6WYqiQJHC7zU9klht
         RUnq/DaMt/ImWu8fdrje/NJ3+zsk+9YsqTIJaDcKC+/1RyQGCq/HrZXzBHK/0WWZdkXr
         VSLWWmcv9xkof/QBfhVm1E7fXXBPKmpprL99oDNVHmF4ZNLdIdon461Dee2Nzfmjr2Kr
         +73RPpeIy8HGqAVT0TExvj71YGfQST9ca2Ia5PdPjS9saCdRoulHwl0FLp/3JK5NHRRg
         hCp1OGm+r43LB2f3Hijz+1XVDyUi0B8VVAtwt8HvjmQIlEl3flH+/VZEV0zOjsmvCsQE
         yXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YzyYN6jLumCnrlxnfcM2cNl/xFX6pvZ4pMXoDyQ+hD8=;
        b=pgoFjBbbYeUAvgKgXvOSYCiiCGhqcNkhqpHPxtTLHOkPGotg1c8ygRDMYqoZZHPCHe
         UScovErd5OUPi+p3r5wcvuhoeeQhnYPG1q5R9yiivegh6/IQ8ShHyM5Wdaj16JesR5vy
         dscn6dtBBIYwY0EvL2FoFZopHDi+Bm1z9mpUR0RGlxDslhJT3YrnC86Q+k+I3SEtQCnz
         GBtj7NNxGSsAImZBYjn46VGoiKBZYkzwPFB0Fyzb3gXP6krJZh1TBjlB/I/m8PXz5oZc
         SCem1bjscVj0eno6lystalWz4d/kIIgfe4iDIxbEB9IWV3XG8ClIj8G2Z7o5FtpczlT9
         qW/g==
X-Gm-Message-State: AOAM532E01yy9Yftwy1l5dXoXHDxudhQssJkxgV0ehYLY31RCf4vf0ZI
        QjUTXrUELTia0uCbnZ9bKYU2cGbiDSMJZs6ep3jvaQ==
X-Google-Smtp-Source: ABdhPJwALIFf+RxzOAhnKhr6v435co43bMJz7bfCpmyfdbAp1VM3/dmQ1QYT11ULq8o7hmLa5T4xzWZNcyXQNFJ9wfk=
X-Received: by 2002:a17:902:760c:b029:d6:efa5:4cdd with SMTP id
 k12-20020a170902760cb02900d6efa54cddmr4919078pll.56.1604739898674; Sat, 07
 Nov 2020 01:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20201107070744.1133811-1-ndesaulniers@google.com> <20201107084525.3417278-1-ndesaulniers@google.com>
In-Reply-To: <20201107084525.3417278-1-ndesaulniers@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Sat, 7 Nov 2020 01:04:47 -0800
Message-ID: <CAKwvOdnr94Pdt5GYGf52FHpa98ZtkwLWvAPiN_Se2qq9a+h_ag@mail.gmail.com>
Subject: Re: [PATCH v2] Revert "kbuild: Do not enable -Wimplicit-fallthrough
 for clang for now"
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Joe Perches <joe@perches.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Nov 7, 2020 at 12:45 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> This reverts commit e2079e93f562c7f7a030eb7642017ee5eabaaa10.
>
> This has been fixed up over time thanks to the addition of "fallthrough"
> pseudo-keyword in
> commit 294f69e662d1 ("compiler_attributes.h: Add 'fallthrough' pseudo
> keyword for switch/case use")
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/236
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> ---
> Changes V1 -> V2:
> * We actually want a revert, not a partial revert. v1 removed
>   -Wimplicit-fallthrough outright, which we don't want. We still need
>   cc-option for GCC < 7.

Gah, I tested a ton of configs with V1...but not V2...this patch is
not ready yet. Sorry for the noise.

-- 
Thanks,
~Nick Desaulniers
