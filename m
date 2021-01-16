Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EAF972F8B2E
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 05:31:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729455AbhAPEay (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 23:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbhAPEax (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 23:30:53 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FBDEC061757;
        Fri, 15 Jan 2021 20:30:13 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id n4so22247770iow.12;
        Fri, 15 Jan 2021 20:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=hQ6bkRNdpq7h6cTCMQlmiqIilS7nPd3l2RGWspGdUK4=;
        b=O3zI93s9j7MnFsfbXsKwiyQb7h1Ec3axsUEzgvww5OrOh7hXBbNzDaH6qqs0HAFlAa
         RYpaYDsTE2nZNDayk8VqRvddMbiCAUyX3CuAoxRwueQOXHNxMSxmNAsl2B0qUdhc+6C9
         ZIr/1mBUSLi2NXA5Dz26s2WipaN6LJuRS3M1HmfusAsLvlpdUGMGKXakP1u9UK05BImR
         Ekjk3iIfC3mFuoeNCYP6yzAgAaQoHqadB2NgnVLM7GqVTfJ6VZRhvMGSBTXh0EmU7RTR
         +2tM/QiSynPU1W70bl6UmNJQjbXtw8h5gX4ryJJwDpQwMUFQ039AtbaMKNij1LIb5TWv
         9YtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=hQ6bkRNdpq7h6cTCMQlmiqIilS7nPd3l2RGWspGdUK4=;
        b=VKbl58fb8o0mQlLi4W+QgGb6gZTUyf/RgMl/q0G67RKPSc05mrROVKDg45Shzeb0GL
         QTb6TSP8idnOnSAyE8D618FanyMqbmnSPekmwi2R6vev1/zNFsMmdlr4LpkQ5UKA9ROE
         JFrr8HFGig7nrCQCHs9aCKMVPvu1fXiAa9tsbC8mrT6/6At4vO7p15xPVXr8kfCnBnMK
         pHpgKpBS8Kkij4X9Densvvs1RNdid6mLp51T9OAAcEGXSDAxv4DgFiO9QgLAsRoDt2iF
         D47P7zsu8EjMQdKva1u4+8AEx+oCTXVREFWTJYt6Hdlh2nn+F57akFsiEGKz2MnAi7LK
         O/eg==
X-Gm-Message-State: AOAM531qAmgHXBxBenetH071RNuPrUOoZkKkVZOocaVnk5lQ6gHyR7nP
        qj6cKaZ4xXQdaMu5G02PJxdHI1PnWB6LodCyWBg=
X-Google-Smtp-Source: ABdhPJxEjk0ia9GS+FonXf7vJgjI8Cg/+NDOf/4PEI2M8xJLPQki5Xf5k8OR55D5jzNvYmZlu2EAEnI51YfN+eFK7+w=
X-Received: by 2002:a5e:9b06:: with SMTP id j6mr10921789iok.171.1610771412146;
 Fri, 15 Jan 2021 20:30:12 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOd=rEngs-8DR6pagynYc5-=a06brTOOx5TT1TC+v7-3m2Q@mail.gmail.com>
 <20210116001324.2865-1-nick.desaulniers@gmail.com>
In-Reply-To: <20210116001324.2865-1-nick.desaulniers@gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 16 Jan 2021 05:30:00 +0100
Message-ID: <CA+icZUVEc9Uo7TArGKBwk6rv7tPjXB94o=S_hW2y736_OQ-KkA@mail.gmail.com>
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

I love cat videos on youtube and do find parallelly...

I must try this :-)!

Might be good to write up an instruction (README) for followers?

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
