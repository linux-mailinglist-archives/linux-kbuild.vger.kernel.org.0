Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE502F9704
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 Jan 2021 02:00:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729755AbhARA77 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Jan 2021 19:59:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730494AbhARA6e (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Jan 2021 19:58:34 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27337C061575;
        Sun, 17 Jan 2021 16:57:44 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id h11so785965ioh.11;
        Sun, 17 Jan 2021 16:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=KjZrDhBfyFEIBIpjwZNPtMmzhzpBnEvekoHmrifO6qE=;
        b=VJm48GYzVt9Ws/DKUfWjTO0fkoNCocjfXJKF6MJGQ/TYES+3wNGeUkD9o8+tsSoWjb
         EG11AzBA2ETNK8rUA5gUF5MHKLWeoYySDCry5cgUopNcTgLSCUrrbt30yrExYiRCzjkp
         0YGWiYHzTqFOBN7sUbAer8zZyQt43Pa/tgV4IOxN+q6cy3zU+8vXJ7z3hmwjQt5uGmCf
         Xqb/2swlOT2szNVlBF7fdUgARuOt75sGj7EslPc1VWOwxRW2wr0/OSlPJ2dTImv7GlTQ
         ukXF2gzUPa4BKmEl9hnGoR1DgbXTnsHpBUToccljmBxIE1pXxbmz2bH/rlh/ST9l1QRn
         aJ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=KjZrDhBfyFEIBIpjwZNPtMmzhzpBnEvekoHmrifO6qE=;
        b=bFC54as4EsT4YhP62bt+fri5GOV5aYg5y9+k7qNqhBFDQ3oN7tc4kcGLi9nfRFQnRE
         GBYFV46QO+AjnZlD1allXUKDX28kTBOPgTeLvdj81n9CE8MH7+cpuAW2pq6NQT+mOsm1
         kJMeyaZ6hYf0erd+a4i6zAgh8gXXU+RZUP5vxqzSmAgvKD40wM8qAcG+P2eEA7tLo77D
         /l9Fs4gvKzHGFmnX9m/YjnIvwFt9UFLmxRxQ/3BSrH0qqnRQ7p6uMfvxJ0GR1gzibFXP
         G8PulyY2f5MYToGfpZOm8L83O+hKIhubiPCR0HbPOHwkHX2zYa4cL2KvUDiIKI/hZHd7
         TY3A==
X-Gm-Message-State: AOAM5324vxq/HkHGWeMqYoFUAFn01GE1ZPrXcYX+8uDNSIt9KoYPHZ9Q
        2rMPZJEafr1cbLkZaNYMJ2ZDvKL1xuUm/gP/3/A=
X-Google-Smtp-Source: ABdhPJwriuRMJWYfBFCubf7I+V0eUrhZWwyvHPF0HVzBOgk1W6SJfgqPQ/PS7hfD8yUcEvX+uTMgmnKJrPNHiqEoBlA=
X-Received: by 2002:a6b:6a0e:: with SMTP id x14mr11619321iog.57.1610931463509;
 Sun, 17 Jan 2021 16:57:43 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOd=rEngs-8DR6pagynYc5-=a06brTOOx5TT1TC+v7-3m2Q@mail.gmail.com>
 <20210116001324.2865-1-nick.desaulniers@gmail.com>
In-Reply-To: <20210116001324.2865-1-nick.desaulniers@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Mon, 18 Jan 2021 01:57:32 +0100
Message-ID: <CA+icZUXsK8nfRQGatBoMAsjxhA=VEgZDsPsEg8o7i7yP+ko2Lg@mail.gmail.com>
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

On each rebuild I need to pass to make ...?

   LLVM=1 -fprofile-use=vmlinux.profdata

Did you try together with passing LLVM_IAS=1 to make?

- Sedat -


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
