Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17FA82F8B72
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 06:22:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbhAPFTn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Jan 2021 00:19:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725866AbhAPFTn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jan 2021 00:19:43 -0500
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com [IPv6:2607:f8b0:4864:20::d2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26481C0613D3;
        Fri, 15 Jan 2021 21:19:03 -0800 (PST)
Received: by mail-io1-xd2d.google.com with SMTP id d9so22426268iob.6;
        Fri, 15 Jan 2021 21:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=gChp3Ep/CrC3UnC7Pc81i2t4QTcDYgPfC0i71sk22a0=;
        b=DzlotEExKCzA5Hl+PpX0huN82hIM0gEvAucf2wZIFhO7EWMbHPefc/OGF7i367xhPD
         PZ+wuddRyMjLFkcadaPTGlUV2Xm9/2v/I7OB4jNApvHeaNzeWMIFc5uWovfcEZNuBH+i
         NixlpIK5xbIudMNjxpMLfm7lu9uDR0Is232AW5J25yN/5Y44ZG9ps3cWsttpza6JGkak
         pvfty3hZ02CAq3ch1F5fiocOlBuwXEDXJy99Kjekj2Z3M1QU9+JUPa0koybimhEVdxYr
         k2sC59VbhFja4D+vuClwx5tKukDeEmKufbGLp3mZX95A2Zxu0Qt6aRI4OsvJ7MxeQ5gF
         AYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=gChp3Ep/CrC3UnC7Pc81i2t4QTcDYgPfC0i71sk22a0=;
        b=bYdZMDO+tOIVL9R0qR7/Oye+nxGVrvVv5G1vGqyeUjOKqbeA4DlgHB7+Sr8onNnvDO
         ZxHMJezH/yeq3QtQPvug4t3EaoG+2cLo747Yswn45kjfs3HiQBvAY4FXnBYR0g2T8rpl
         F8cR2DxqeoqxPKvtofncHPHEJmgocVTENMltKRIqStmlN/r2WtdCvmTg2NVUfxRVoZF+
         BZju2UuCqRNsdnS/wC8ZpI9dBXSv26UI9+mYmiiX4/pBRy1WfUdDhKUMANRStXleOPO/
         /fJcMJwdPItKGMkv/uEmj4/obkSh0pPCzD9a04+fNc/xs1nolzIVn2xlbdkzHdYq2iBW
         0oHg==
X-Gm-Message-State: AOAM532lJHZHjmWv/EG9Mqhzl4RRqwrkI7ZmJq5BGZmaSl+t1gn3bhex
        7ukLEQ9crty/lv6/6aUBKOAtgGcRtHuLz0Af+YI=
X-Google-Smtp-Source: ABdhPJxr7TPb36mhp54MUXkg/vneWFEkAS6dH3UCsiVbPH+HEnc/vnT/kZ7PGeOv1BGhFkFq2teKDDqM9CYN4XvXqWo=
X-Received: by 2002:a6b:6a0e:: with SMTP id x14mr7112393iog.57.1610774342527;
 Fri, 15 Jan 2021 21:19:02 -0800 (PST)
MIME-Version: 1.0
References: <CAKwvOd=rEngs-8DR6pagynYc5-=a06brTOOx5TT1TC+v7-3m2Q@mail.gmail.com>
 <20210116001324.2865-1-nick.desaulniers@gmail.com> <CA+icZUW-H4LjVhJHSr2W3UJotvB6Eq1bFO_bQWT8=GQqcB4A1A@mail.gmail.com>
In-Reply-To: <CA+icZUW-H4LjVhJHSr2W3UJotvB6Eq1bFO_bQWT8=GQqcB4A1A@mail.gmail.com>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Sat, 16 Jan 2021 06:18:51 +0100
Message-ID: <CA+icZUVSmfNgFvZB5qojYu59zdGWgijeKRRqFek=8Q-a=y=--g@mail.gmail.com>
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

On Sat, Jan 16, 2021 at 6:07 AM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> On Sat, Jan 16, 2021 at 1:13 AM Nick Desaulniers
> <nick.desaulniers@gmail.com> wrote:
> >
> > > On Wed, Jan 13, 2021 at 8:07 PM Nick Desaulniers
> > > <ndesaulniers@google.com> wrote:
> > > >
> > > > On Wed, Jan 13, 2021 at 12:55 PM Nathan Chancellor
> > > > <natechancellor@gmail.com> wrote:
> > > > >
> > > > > However, I see an issue with actually using the data:
> > > > >
> > > > > $ sudo -s
> > > > > # mount -t debugfs none /sys/kernel/debug
> > > > > # cp -a /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > > > > # chown nathan:nathan vmlinux.profraw
> > > > > # exit
> > > > > $ tc-build/build/llvm/stage1/bin/llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > > > > warning: vmlinux.profraw: Invalid instrumentation profile data (bad magic)
> > > > > error: No profiles could be merged.
> > > > >
> > > > > Am I holding it wrong? :) Note, this is virtualized, I do not have any
> > > > > "real" x86 hardware that I can afford to test on right now.
> > > >
> > > > Same.
> > > >
> > > > I think the magic calculation in this patch may differ from upstream
> > > > llvm: https://github.com/llvm/llvm-project/blob/49142991a685bd427d7e877c29c77371dfb7634c/llvm/include/llvm/ProfileData/SampleProf.h#L96-L101
> > >
> > > Err...it looks like it was the padding calculation.  With that fixed
> > > up, we can query the profile data to get insights on the most heavily
> > > called functions.  Here's what my top 20 are (reset, then watch 10
> > > minutes worth of cat videos on youtube while running `find /` and
> > > sleeping at my desk).  Anything curious stand out to anyone?
> >
> > Hello world from my personal laptop whose kernel was rebuilt with
> > profiling data!  Wow, I can run `find /` and watch cat videos on youtube
> > so fast!  Users will love this! /s
> >
> > Checking the sections sizes of .text.hot. and .text.unlikely. looks
> > good!
> >
>
> Is that the latest status of Bill's patch?
>
> Or do you have me a lore link?
>

I tried with the message-id of Bill's initial email:

link="https://lore.kernel.org/r/20210111081821.3041587-1-morbo@google.com"
b4 -d am $link

This gives me:

v4_20210112_morbo_pgo_add_clang_s_profile_guided_optimization_infrastructure.mbx

- Sedat -

>
> [1] https://github.com/gwelymernans/linux/commits/gwelymernans/linux
>
>
> > >
> > > $ llvm-profdata show -topn=20 /tmp/vmlinux.profraw
> > > Instrumentation level: IR  entry_first = 0
> > > Total functions: 48970
> > > Maximum function count: 62070879
> > > Maximum internal block count: 83221158
> > > Top 20 functions with the largest internal block counts:
> > >   drivers/tty/n_tty.c:n_tty_write, max count = 83221158
> > >   rcu_read_unlock_strict, max count = 62070879
> > >   _cond_resched, max count = 25486882
> > >   rcu_all_qs, max count = 25451477
> > >   drivers/cpuidle/poll_state.c:poll_idle, max count = 23618576
> > >   _raw_spin_unlock_irqrestore, max count = 18874121
> > >   drivers/cpuidle/governors/menu.c:menu_select, max count = 18721624
> > >   _raw_spin_lock_irqsave, max count = 18509161
> > >   memchr, max count = 15525452
> > >   _raw_spin_lock, max count = 15484254
> > >   __mod_memcg_state, max count = 14604619
> > >   __mod_memcg_lruvec_state, max count = 14602783
> > >   fs/ext4/hash.c:str2hashbuf_signed, max count = 14098424
> > >   __mod_lruvec_state, max count = 12527154
> > >   __mod_node_page_state, max count = 12525172
> > >   native_sched_clock, max count = 8904692
> > >   sched_clock_cpu, max count = 8895832
> > >   sched_clock, max count = 8894627
> > >   kernel/entry/common.c:exit_to_user_mode_prepare, max count = 8289031
> > >   fpregs_assert_state_consistent, max count = 8287198
> > >
> > > --
> > > Thanks,
> > > ~Nick Desaulniers
> > >
> >
> > --
> > You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> > To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> > To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210116001324.2865-1-nick.desaulniers%40gmail.com.
