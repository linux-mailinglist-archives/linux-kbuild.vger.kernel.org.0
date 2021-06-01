Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95B4B396EE0
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Jun 2021 10:24:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233341AbhFAI0e (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 1 Jun 2021 04:26:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbhFAI0d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Jun 2021 04:26:33 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845ADC061574
        for <linux-kbuild@vger.kernel.org>; Tue,  1 Jun 2021 01:24:52 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id o5so16276020edc.5
        for <linux-kbuild@vger.kernel.org>; Tue, 01 Jun 2021 01:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=k2z10kHvXwh0VlWb//vEH7qdG2w+rH+BOKMSkAeptuo=;
        b=JxNSuwOnVwr5zWbPShFowZKsvvro/a6F4DoBJ6KmXQHabMzL8if52GI5mSsrW34g8g
         JDB1uOq3ZUASaZX4npfzfbyaPnVHzbDftKoLMFk0dPA46BdIpSXWaeQobY4ywCSlGu4z
         Sq8Y1d3WdPf/dE1vksKs9/oIrwlGIS6H+75YAGSpJ+6KvG98yVc6GIwtgpBzQjRAlL9w
         Zrf/t9qy/TOpltWXCO5d0mWHlZPE7CGaq2M7ZHsfByvtadrOFlOJLTMCzUMGCsVAM5+9
         f0ETQXKQZtYSQ2KrDTL1V+VfKWJAwzvwSPJTrj8r5JfPyv+jUzLybLfBy3xFhsk5AKbG
         dIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=k2z10kHvXwh0VlWb//vEH7qdG2w+rH+BOKMSkAeptuo=;
        b=TlPYirWXVvapUNJbwHkh+0BgLYnNVMpmN/dnspp9zFaG06Wftp3F04bWev1DAPTTm/
         Wth/evynDm23oh6GAaFxSY4hC6dL7KdVHmLk/0OCJIx9Xn5H7i039Pmpe33ZnSDRmGqJ
         ScZNwB7bL96HXArqCrcoNznWdLQsSmxxL4xDwBO4h3IcQyFXyYLLHqH0eO8LnIDRFkgO
         HlovZZdkHifIrmthRS4hG9z/ncaG2vixSm59Ey0Vh7i9CiAPQ/bod+1qj2Ty9BXXl6m7
         5ip2vCj1vlErsrUEdU+FxptJrEuvc8xnmEWMTtKQtgRE91Y6VJm8R7ABOtQtxsS996PV
         5oKg==
X-Gm-Message-State: AOAM53206H/SZiL3MtpmKPWs3TDkBpl+vpGbhNPZijFF8w909ioXlgkR
        jYCWr0CQIscFAQMT5+RllLNtjPBUUPEAHuYdUVA8
X-Google-Smtp-Source: ABdhPJwLWEnRspCTHXQw5Y1o2N+2A0zsuxnn8yIG3KMhBPuEdZ1Ac8Z+84mEcsiLINoXwdsQfuFh4BxffxXzvAt/zxo=
X-Received: by 2002:aa7:c584:: with SMTP id g4mr11564961edq.335.1622535890905;
 Tue, 01 Jun 2021 01:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210531202044.426578-1-morbo@google.com> <e22afde4-e312-4589-cf2e-3c35219d7249@kernel.org>
In-Reply-To: <e22afde4-e312-4589-cf2e-3c35219d7249@kernel.org>
From:   Bill Wendling <morbo@google.com>
Date:   Tue, 1 Jun 2021 01:24:39 -0700
Message-ID: <CAGG=3QVdXxLf0T9+n9FidrRcfdWY36m-i=4kPRJjOojWhjiywg@mail.gmail.com>
Subject: Re: [PATCH] pgo: rename the raw profile file to vmlinux.profraw
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, May 31, 2021 at 1:29 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> On 5/31/2021 1:20 PM, Bill Wendling wrote:
> > Future PGO features may create other files in /sys/kernel/debug/pgo. So
> > rename the kernel's raw profile data file to "vmlinux.profraw" to make
> > which part of the kernel the file is for more explicit.
> >
> > Note that future files in /sys/kernel/debug/pgo should follow a similar
> > naming convention.
> >
> > Signed-off-by: Bill Wendling <morbo@google.com>
>
> Guess this clears up my confusion around the module patches :)
>
To clarify, Jarmo did those patches on his own. I just wanted to
clarify the naming convention. :-)

-bw

> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>
> > ---
> >   Documentation/dev-tools/pgo.rst | 6 +++---
> >   kernel/pgo/Kconfig              | 7 ++++---
> >   kernel/pgo/fs.c                 | 2 +-
> >   3 files changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/dev-tools/pgo.rst b/Documentation/dev-tools/pgo.rst
> > index b7f11d8405b7..0200449c4843 100644
> > --- a/Documentation/dev-tools/pgo.rst
> > +++ b/Documentation/dev-tools/pgo.rst
> > @@ -76,7 +76,7 @@ The PGO kernel support creates the following files in debugfs:
> >   ``/sys/kernel/debug/pgo/reset``
> >       Global reset file: resets all coverage data to zero when written to.
> >
> > -``/sys/kernel/debug/profraw``
> > +``/sys/kernel/debug/pgo/vmlinux.profraw``
> >       The raw PGO data that must be processed with ``llvm_profdata``.
> >
> >
> > @@ -108,7 +108,7 @@ using the result to optimize the kernel:
> >
> >      .. code-block:: sh
> >
> > -      $ cp -a /sys/kernel/debug/pgo/profraw /tmp/vmlinux.profraw
> > +      $ cp -a /sys/kernel/debug/pgo/vmlinux.profraw /tmp/vmlinux.profraw
> >
> >   5) (Optional) Download the raw profile data to the HOST machine.
> >
> > @@ -120,7 +120,7 @@ using the result to optimize the kernel:
> >
> >      Note that multiple raw profile data files can be merged during this step.
> >
> > -7) Rebuild the kernel using the profile data (PGO disabled)
> > +7) Rebuild the kernel using the processed profile data (PGO disabled)
> >
> >      .. code-block:: sh
> >
> > diff --git a/kernel/pgo/Kconfig b/kernel/pgo/Kconfig
> > index 76a640b6cf6e..d2053df1111c 100644
> > --- a/kernel/pgo/Kconfig
> > +++ b/kernel/pgo/Kconfig
> > @@ -17,10 +17,11 @@ config PGO_CLANG
> >
> >         Run a representative workload for your application on a kernel
> >         compiled with this option and download the raw profile file from
> > -       /sys/kernel/debug/pgo/profraw. This file needs to be processed with
> > -       llvm-profdata. It may be merged with other collected raw profiles.
> > +       /sys/kernel/debug/pgo/vmlinux.profraw. This file needs to be
> > +       processed with llvm-profdata. It may be merged with other collected
> > +       raw profiles.
> >
> > -       Copy the resulting profile file into vmlinux.profdata, and enable
> > +       Copy the processed profile file into vmlinux.profdata, and enable
> >         KCFLAGS=-fprofile-use=vmlinux.profdata to produce an optimized
> >         kernel.
> >
> > diff --git a/kernel/pgo/fs.c b/kernel/pgo/fs.c
> > index 449f16beb2cf..ef985159dad3 100644
> > --- a/kernel/pgo/fs.c
> > +++ b/kernel/pgo/fs.c
> > @@ -365,7 +365,7 @@ static int __init pgo_init(void)
> >       if (!directory)
> >               goto err_remove;
> >
> > -     if (!debugfs_create_file("profraw", 0600, directory, NULL,
> > +     if (!debugfs_create_file("vmlinux.profraw", 0600, directory, NULL,
> >                                &prf_fops))
> >               goto err_remove;
> >
> >
