Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E206141DA25
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Sep 2021 14:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351057AbhI3Msl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 08:48:41 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:50937 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349794AbhI3Msk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 08:48:40 -0400
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 18UCkUsI031268;
        Thu, 30 Sep 2021 21:46:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 18UCkUsI031268
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1633005991;
        bh=QTVmnlg4EXLgMNWGaqhRXsGICBaozUUHczJ1G+1ORRY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D33rLXJOw70Lqc/bx5R09SiHYnqukGKFFrxXGSdRtJ/9+Fn+kNo9ScxJrpyQcCVOM
         rH9wOhmGwe79sWJbRI4qX+A0RADYSsAviBlDz9UbOh+7K3qfJyeAHcSOMyaMwf1Cnz
         XQqevDoRbnKkP+7ts1DBHIuRyOuoUOYbCotYCoZ//3ZbxOSgQq20OjX5x4q2erkFgA
         Tpc2VhxBIyIBTCUNJ1nTkj4l/F4doW+KwGAy8wZZnkiWnR8NjstETbhLRXipCEEsVu
         XiMwiTNvn6DbseeelapnulpgJ1OPymLeCo4plhiaSSWVD4Gap0E36ddLW2Tpp7R9Ze
         IjXCYATtosEVg==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id t4so3947641plo.0;
        Thu, 30 Sep 2021 05:46:31 -0700 (PDT)
X-Gm-Message-State: AOAM533vg4etZygjbmuEvvhftMnrXu/ehjB5nVnBn0BO02GxtLN5mscc
        5yq8EKopRd/KkAiFH+GkX2dYpSHms6scsHweuyY=
X-Google-Smtp-Source: ABdhPJzpyqDL9Jf0nePfabDpHndqVil4Vjv6FnbbrifNx1wHyynn37xAtjzHeX5fXEI0C52sV3wFfJicViO3UHPhR5s=
X-Received: by 2002:a17:90a:4414:: with SMTP id s20mr6243842pjg.144.1633005990304;
 Thu, 30 Sep 2021 05:46:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com> <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
In-Reply-To: <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 30 Sep 2021 21:45:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT+N2tyesqcooB91wtUD81S+M7wgd+kVW6iF3v83CYgaw@mail.gmail.com>
Message-ID: <CAK7LNAT+N2tyesqcooB91wtUD81S+M7wgd+kVW6iF3v83CYgaw@mail.gmail.com>
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 30, 2021 at 9:19 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Sep 29, 2021 at 4:28 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > On Wed, Sep 29, 2021 at 3:59 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > +static const struct secref_exception secref_allowlist[] = {
> > > +       { .fromsym = "__first_node", .tosym = "numa_nodes_parsed" },
> > > +       { .fromsym = "__next_node", .tosym = "numa_nodes_parsed" },
> > > +       { .fromsym = "__nodes_weight", .tosym = "numa_nodes_parsed" },
> > > +       { .fromsym = "early_get_smp_config", .tosym = "x86_init" },
> > > +       { .fromsym = "test_bit", .tosym = "numa_nodes_parsed" },
> > > +};
>
> Thanks for your feedback.  This has been a long-standing issue with no
> clear path forward; I was looking forward to your input.
>
> >
> > This list is basically made-up and random.
>
> Definitely brittle.  And it contains checks that are specific to
> basically one set of configs for one arch. It sucks to pay that cost
> for unaffected architectures.
>
> > Why did those functions not get inlined?
>
> $ make LLVM=1 -j72 allmodconfig
> $ make LLVM=1 -j72 arch/x86/mm/amdtopology.o KCFLAGS=-Rpass-missed=inline.
> ...
> arch/x86/mm/amdtopology.c:110:7: remark: 'test_bit' not inlined into
> 'amd_numa_init' because too costly to inline (cost=115, threshold=45)
> [-Rpass-missed=inline]
>                 if (node_isset(nodeid, numa_nodes_parsed)) {
>                     ^
> arch/x86/mm/amdtopology.c:157:7: remark: '__nodes_weight' not inlined
> into 'amd_numa_init' because too costly to inline (cost=60,
> threshold=45) [-Rpass-missed=inline]
>         if (!nodes_weight(numa_nodes_parsed))
>              ^
> arch/x86/mm/amdtopology.c:171:2: remark: 'early_get_smp_config' not
> inlined into 'amd_numa_init' because too costly to inline (cost=85,
> threshold=45) [-Rpass-missed=inline]
>         early_get_smp_config();
>         ^
> arch/x86/mm/amdtopology.c:178:2: remark: '__first_node' not inlined
> into 'amd_numa_init' because too costly to inline (cost=70,
> threshold=45) [-Rpass-missed=inline]
>         for_each_node_mask(i, numa_nodes_parsed)
>         ^
> arch/x86/mm/amdtopology.c:178:2: remark: '__next_node' not inlined
> into 'amd_numa_init' because too costly to inline (cost=95,
> threshold=45) [-Rpass-missed=inline]
>
>
> ie. for allmodconfig, the sanitizers add too much instrumentation to
> the callees that they become too large to be considered profitable to
> inline by the cost model.  Note that LLVM's inliner works bottom up,
> not top down.
>
> Though for the defconfig case...somehow the cost is more than with the
> sanitizers...
>
> arch/x86/mm/amdtopology.c:157:7: remark: '__nodes_weight' not inlined
> into 'amd_numa_init' because too costly to inline (cost=930,
> threshold=45) [-Rpass-missed=inline]
>         if (!nodes_weight(numa_nodes_parsed))
>              ^
>
> Looking at the output of `make LLVM=1 -j72
> arch/x86/mm/amdtopology.ll`, @__nodes_weight is just some inline asm
> (.altinstructions). I wonder if I need to teach the cost model about
> `asm inline`...
>
> For the allmodconfig build it looks like `__nodes_weight` calls
> `__bitmap_weight` and the code coverage runtime hooks.
>
> > Wouldn't it be better to make
> > them always-inline?
>
> Perhaps, see what that might look like:
> https://github.com/ClangBuiltLinux/linux/issues/1302#issuecomment-807260475
> Does that look better?
>
> > Or, like in at least the early_get_smp_config() case, just make it be
> > marked __init, so that if it doesn't get inlined it gets the right
> > section?
>
> In the case of early_get_smp_config(), that's what Boris suggested:
> https://lore.kernel.org/lkml/20210225114533.GA380@zn.tnic/


__init works particularly for early_get_smp_config().

For static line helpers that are called from __init and non-__init functions,
maybe __ref will work.

In my understanding, the .ref.text section is not free'd,
but modpost bypasses the section mismatch checks.

I am not sure what is a better approach for generic cases,
__always_inline, __ref, or what else?


I am not a big fan of this patch, at least...
(The reason was already stated by Linus)


-- 
Best Regards
Masahiro Yamada
