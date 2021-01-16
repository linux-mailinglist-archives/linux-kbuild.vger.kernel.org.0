Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2998D2F8B66
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 06:14:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbhAPFIr (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Jan 2021 00:08:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbhAPFIr (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jan 2021 00:08:47 -0500
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com [IPv6:2607:f8b0:4864:20::d2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3DD2C061757;
        Fri, 15 Jan 2021 21:08:06 -0800 (PST)
Received: by mail-io1-xd2f.google.com with SMTP id q2so20741665iow.13;
        Fri, 15 Jan 2021 21:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=nIQUS/B/jxToiqnwVuNwCI5mEHFlIKg/uOPqX0C2Wtw=;
        b=BCEzZ30PpAdSDzvGeBNvIxjLUhqvauhhAl08F+tQoLc59jXBr1FvyFXf2eo3W/BYiE
         3cIW6Dgr2xcqCjktlH3uGVpPq2sEsqEpa1SCF6vUCgqGGS/j3jhvtI7PqWTAiW7NqSzU
         QtUg/wD0ASrA38VhyTUxa5gcEZnFmV9V8DAIKwvvZplU5kNlL7UGB9NWQ6RKC7dRUEu8
         naxvkB1mwnLk/0AMJDMjQzDCGWq3ykhc+lTDyooONYwI/rvpHtXYgm7FlNsCuwL1hdPQ
         DoM/OJHebKbfCYW3oQLXMLuB0SQOxJB5yb07dSWJPAOnSZlRlqquIJLLSTGAFamOaBV8
         n8Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=nIQUS/B/jxToiqnwVuNwCI5mEHFlIKg/uOPqX0C2Wtw=;
        b=tzrG70KG5s8FIDIm7ejwLPhyLRLXNzjc0yNybFj1B/2zlbBtcsNctXqOai7dwo7X/v
         ILUS/MYjlDzWhy/mY+NkRlsOhCNn6qAg8MCy+f+WOs2eXtyL/2/YBc3aK0ZJiPhzDBBl
         ZolcRPZDnYvM9MAwIHrQH12tcvSPzmSRqGVjH7TWqOvNGyvSAYgDv/mW+LBncC21k0Hx
         q6qtTtQZ2ElR3khQQ0Xhmq0vC3Smkl1GyDZ8En8+E15/4A0oqDeL1kkbckq8+zFaB4qF
         tUgTH2QmQos2NTNsA50759nr+1HquFfb8lXMuhP4XZBZUdGM0OLhZwcPuhIRC9Yaa3HN
         GKTg==
X-Gm-Message-State: AOAM531npuaIRTBohxD3W/gpAWTcoejWOroBq3x7Apjwh6e/tODpC0Dz
        XG9pRBddJdT7+1oEiKbruv+cI6Ggf/EebYmSgZ4=
X-Google-Smtp-Source: ABdhPJyPjV1sBVYh8T4dGG+mSL9ZbpSIEQVKTLnhQsLRDQrWB9TFmTVeAnntknYImejmwyotyR0/9/qNPDrdm+x1Pis=
X-Received: by 2002:a92:8593:: with SMTP id f141mr9063480ilh.112.1610773685903;
 Fri, 15 Jan 2021 21:08:05 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOd=rEngs-8DR6pagynYc5-=a06brTOOx5TT1TC+v7-3m2Q@mail.gmail.com>
 <20210116001324.2865-1-nick.desaulniers@gmail.com>
In-Reply-To: <20210116001324.2865-1-nick.desaulniers@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 16 Jan 2021 06:07:54 +0100
Message-ID: <CA+icZUW-H4LjVhJHSr2W3UJotvB6Eq1bFO_bQWT8=GQqcB4A1A@mail.gmail.com>
Subject: Re: [PATCH v4] pgo: add clang's Profile Guided Optimization infrastructure
To:     Nick Desaulniers <nick.desaulniers@gmail.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        akpm@linux-foundation.org,
        Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, Bill Wendling <morbo@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 16, 2021 at 1:13 AM Nick Desaulniers
<nick.desaulniers@gmail.com> wrote:
>
> > On Wed, Jan 13, 2021 at 8:07 PM Nick Desaulniers
> > <ndesaulniers@google.com> wrote:
> > >
> > > On Wed, Jan 13, 2021 at 12:55 PM Nathan Chancellor
> > > <natechancellor@gmail.com> wrote:
> > > >
> > > > However, I see an issue with actually using the data:
> > > >
> > > > $ sudo -s
> > > > # mount -t debugfs none /sys/kernel/debug
> > > > # cp -a /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > > > # chown nathan:nathan vmlinux.profraw
> > > > # exit
> > > > $ tc-build/build/llvm/stage1/bin/llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > > > warning: vmlinux.profraw: Invalid instrumentation profile data (bad magic)
> > > > error: No profiles could be merged.
> > > >
> > > > Am I holding it wrong? :) Note, this is virtualized, I do not have any
> > > > "real" x86 hardware that I can afford to test on right now.
> > >
> > > Same.
> > >
> > > I think the magic calculation in this patch may differ from upstream
> > > llvm: https://github.com/llvm/llvm-project/blob/49142991a685bd427d7e877c29c77371dfb7634c/llvm/include/llvm/ProfileData/SampleProf.h#L96-L101
> >
> > Err...it looks like it was the padding calculation.  With that fixed
> > up, we can query the profile data to get insights on the most heavily
> > called functions.  Here's what my top 20 are (reset, then watch 10
> > minutes worth of cat videos on youtube while running `find /` and
> > sleeping at my desk).  Anything curious stand out to anyone?
>
> Hello world from my personal laptop whose kernel was rebuilt with
> profiling data!  Wow, I can run `find /` and watch cat videos on youtube
> so fast!  Users will love this! /s
>
> Checking the sections sizes of .text.hot. and .text.unlikely. looks
> good!
>

Is that the latest status of Bill's patch?

Or do you have me a lore link?

- Sedat -

[1] https://github.com/gwelymernans/linux/commits/gwelymernans/linux


> >
> > $ llvm-profdata show -topn=20 /tmp/vmlinux.profraw
> > Instrumentation level: IR  entry_first = 0
> > Total functions: 48970
> > Maximum function count: 62070879
> > Maximum internal block count: 83221158
> > Top 20 functions with the largest internal block counts:
> >   drivers/tty/n_tty.c:n_tty_write, max count = 83221158
> >   rcu_read_unlock_strict, max count = 62070879
> >   _cond_resched, max count = 25486882
> >   rcu_all_qs, max count = 25451477
> >   drivers/cpuidle/poll_state.c:poll_idle, max count = 23618576
> >   _raw_spin_unlock_irqrestore, max count = 18874121
> >   drivers/cpuidle/governors/menu.c:menu_select, max count = 18721624
> >   _raw_spin_lock_irqsave, max count = 18509161
> >   memchr, max count = 15525452
> >   _raw_spin_lock, max count = 15484254
> >   __mod_memcg_state, max count = 14604619
> >   __mod_memcg_lruvec_state, max count = 14602783
> >   fs/ext4/hash.c:str2hashbuf_signed, max count = 14098424
> >   __mod_lruvec_state, max count = 12527154
> >   __mod_node_page_state, max count = 12525172
> >   native_sched_clock, max count = 8904692
> >   sched_clock_cpu, max count = 8895832
> >   sched_clock, max count = 8894627
> >   kernel/entry/common.c:exit_to_user_mode_prepare, max count = 8289031
> >   fpregs_assert_state_consistent, max count = 8287198
> >
> > --
> > Thanks,
> > ~Nick Desaulniers
> >
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210116001324.2865-1-nick.desaulniers%40gmail.com.
