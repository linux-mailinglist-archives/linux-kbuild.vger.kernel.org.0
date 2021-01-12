Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFDB92F3779
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Jan 2021 18:47:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730185AbhALRqK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jan 2021 12:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727513AbhALRqK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jan 2021 12:46:10 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA64C061786
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 09:45:30 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id c13so1802696pfi.12
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jan 2021 09:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kp8U52XQRpl24mM7G2RDldHnlK7yV2a+H4JiRS6waC0=;
        b=s1TmDllNcfHa8938jvmhvPAjJZWqwEjtTyoDnQZPsMSJznW7XTmhxVP5QdM+VgFQfg
         GX4fndU3z6c3ACC6H4qbwKDzKyqZAhxRUrFNFDQKv0jWwSJmzyAWn6zDf3S0k1PxzE+f
         zPPPtxqBgqLvQILOQcmZ1vLXO2wQOK+JHC67fhNpUOjFsdRZP+oG/CqUd407IoMSYKlO
         V6dgnHUKIDSi7JGpq8exTW/MIFI65W1O4bc/DtreEikPrmXag2mYo57+lEMg+xln9z75
         FTwQfrHHHTqAFde7sPnMaD61o3HSCMHTFC5fbqgZdzK9WUpMEmtM5iPH7CbaeMnLAjCe
         rhog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kp8U52XQRpl24mM7G2RDldHnlK7yV2a+H4JiRS6waC0=;
        b=SwvkvwZ8JF7kwWo9bO/aGwRvz1ogTis9BAValIGYFm4YoH4VluIu6Euq/chU0Zob8n
         rqRGsjg667CcoW0uL1KK7PqckcEtmPFfFFJ+UW+9kyQuqZspDAOYGggKxHQ7Ld9H+MD6
         g6Qh9ik7oNYpaGNQ/tSlb2m8Dawfr5Id+2inc+7pHGqBYHLzfh9UDod1kgJSO9GBvSs4
         G4omqwatye1Bh/5w0CYfDqXpn3uW8bGwjMoHuOTajH6gPkVQe12OiwR4JpoHhgdLGtW1
         0lb0Vjxa6naRJFgg2WL3D05Me+DwTLVxIkCSfy+fnzqo1LVBeIZdgBoV6rUsrPKDmBDc
         ojJw==
X-Gm-Message-State: AOAM53011HWYosV5MdUldU77K1M8UwIIg42XoqVyBiLhpaBCy9vU4yIL
        PcLocBhYvBGQunZBL9C8ox2IqGA9Sp29XVnZddrA/Q==
X-Google-Smtp-Source: ABdhPJyL7OrY+b1LIuAu9suY0afpSNd4lx3LHIi9FgBh9f/K/AUZnnmRSwCYB6DM54QwVU7/1JHfcI8EHgMCtk27m4w=
X-Received: by 2002:a65:48cb:: with SMTP id o11mr164747pgs.121.1610473529429;
 Tue, 12 Jan 2021 09:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20210111081821.3041587-1-morbo@google.com> <20210112051428.4175583-1-morbo@google.com>
 <CAKwvOdk+NqhzC_4wFbQMJmLMQWoDSjQiRJyCGe5dsWkqK_NJJQ@mail.gmail.com>
In-Reply-To: <CAKwvOdk+NqhzC_4wFbQMJmLMQWoDSjQiRJyCGe5dsWkqK_NJJQ@mail.gmail.com>
From:   =?UTF-8?B?RsSBbmctcnXDrCBTw7JuZw==?= <maskray@google.com>
Date:   Tue, 12 Jan 2021 09:45:17 -0800
Message-ID: <CAFP8O3J+85x2S+9T2vM+iem=t45MdJt+D1houpqKGhDRfcHu-w@mail.gmail.com>
Subject: Re: [PATCH v2] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Bill Wendling <morbo@google.com>, Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Alistair Delva <adelva@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 12, 2021 at 9:37 AM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> On Mon, Jan 11, 2021 at 9:14 PM Bill Wendling <morbo@google.com> wrote:
> >
> > From: Sami Tolvanen <samitolvanen@google.com>
> >
> > Enable the use of clang's Profile-Guided Optimization[1]. To generate a
> > profile, the kernel is instrumented with PGO counters, a representative
> > workload is run, and the raw profile data is collected from
> > /sys/kernel/debug/pgo/profraw.
> >
> > The raw profile data must be processed by clang's "llvm-profdata" tool
> > before it can be used during recompilation:
> >
> >   $ cp /sys/kernel/debug/pgo/profraw vmlinux.profraw
> >   $ llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> >
> > Multiple raw profiles may be merged during this step.
> >
> > The data can now be used by the compiler:
> >
> >   $ make LLVM=1 KCFLAGS=-fprofile-use=vmlinux.profdata ...
> >
> > This initial submission is restricted to x86, as that's the platform we
>
> Please drop all changes to arch/* that are not to arch/x86/ then; we
> can cross that bridge when we get to each arch. For example, there's
> no point disabling PGO for architectures LLVM doesn't even have a
> backend for.
>
> > know works. This restriction can be lifted once other platforms have
> > been verified to work with PGO.
> >
> > Note that this method of profiling the kernel is clang-native and isn't
> > compatible with clang's gcov support in kernel/gcov.
>
> Then the Kconfig option should depend on !GCOV so that they are
> mutually exclusive and can't be selected together accidentally; such
> as by bots doing randconfig tests.

The profile formats (Clang PGO, Clang gcov, GCC gcov/PGO) are
different but Clang PGO can be used with Clang's gcov implementation:
clang -fprofile-generate --coverage a.cc; ./a.out => default*.profraw + a.gcda

> <large snip>
>
> > +static inline int inst_prof_popcount(unsigned long long value)
> > +{
> > +       value = value - ((value >> 1) & 0x5555555555555555ULL);
> > +       value = (value & 0x3333333333333333ULL) +
> > +               ((value >> 2) & 0x3333333333333333ULL);
> > +       value = (value + (value >> 4)) & 0x0F0F0F0F0F0F0F0FULL;
> > +
> > +       return (int)((unsigned long long)(value * 0x0101010101010101ULL) >> 56);
> > +}
>
> The kernel has a portable popcnt implementation called hweight64 if
> you #include <asm-generic/bitops/hweight.h>; does that work here?
> https://en.wikipedia.org/wiki/Hamming_weight
> --
> Thanks,
> ~Nick Desaulniers
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/CAKwvOdk%2BNqhzC_4wFbQMJmLMQWoDSjQiRJyCGe5dsWkqK_NJJQ%40mail.gmail.com.
