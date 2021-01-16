Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09D302F89D2
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jan 2021 01:14:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbhAPAOI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 15 Jan 2021 19:14:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbhAPAOI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 19:14:08 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F96C061757;
        Fri, 15 Jan 2021 16:13:28 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id g15so7033387pgu.9;
        Fri, 15 Jan 2021 16:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iezn4Ka6AfOTv8ruHoS6A2XTfT3pZMCeDfnXknJdlqg=;
        b=Bpag9PGWGqfqaSNKFOeZBe8ASwF0IeVuZVSbHQjxC/xfQEYQD7loLsAxIfNvCY/Dc2
         Mmafxnc5/SO1cEOVTfkOvoFneAiBuJFl+1wdhpk0axCzVkKwi8+eQ4AtJ62vAgc28yut
         yRSVfEzWddyHgqVctmarcZ9B95diYEQUr4Koo6zlNJ/7JguxZx8PrFZIWqGA4FeK6IDz
         edDXaXCGiTJFRc2TXgqxqP6g7A8McHt4QToRSp7LckVY9MTV/W9IaV4HGaUs9lxAhyI8
         0RT7XCRzhz9lFFVOfaBugPMzNVA4c25R2XJHqTFCMjdNvYq+WzzzzCak9w1NfagzjhX+
         4TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iezn4Ka6AfOTv8ruHoS6A2XTfT3pZMCeDfnXknJdlqg=;
        b=tn4dz+Dy/hr+XG45x8HNb/4VGftqiGNfCBf0IYOpgUyAG37Gz/4tR1yHi4SVO3xuu1
         /H1Qf81O3SIrqmvg5UuUWkGAMJjCP7vqKlMOH7WYI2SvYZ9UKX/iFx81xdN/mSI5KAES
         4pzO2p8mZEpgQY0yFlEDxD7b5NsF2IUQpAPjb+YVb0R3yNchk7HooIdin45vq0UuMoCY
         XJ0DrFv7FeggEz7YKdcx/1orvW1X76FMUVwKSGu3Wkn735wHKfpkpgJq/+Fox8dEMfQJ
         WGmCdo8WZyfZzHT/X56qMGwafHLx1LcWbIQ3bjbZEl38KM+aGEa9r2RQxEGztJt+mWy5
         80Zw==
X-Gm-Message-State: AOAM531ETxpMkqqcdNdS7//NSWJF/DcMZzB1pd7IcLmTyvlBGdZQ24Iy
        9SgHfedcwOQ2O4UzFiuKCmg=
X-Google-Smtp-Source: ABdhPJxDl0yfSLkQloAU7b/S0XVP9sX3JB5TjsOofn0lJuvcZQMMCaOFgAibmoBl+ibFh4tLREo7+Q==
X-Received: by 2002:a63:af50:: with SMTP id s16mr15370424pgo.448.1610756007827;
        Fri, 15 Jan 2021 16:13:27 -0800 (PST)
Received: from nick-Blade-Stealth.lan ([2600:1700:6d11:6f:4cf3:b4a6:3312:eae])
        by smtp.googlemail.com with ESMTPSA id u25sm9280338pfn.170.2021.01.15.16.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 16:13:27 -0800 (PST)
From:   Nick Desaulniers <nick.desaulniers@gmail.com>
To:     ndesaulniers@google.com
Cc:     akpm@linux-foundation.org, clang-built-linux@googlegroups.com,
        corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        masahiroy@kernel.org, morbo@google.com, natechancellor@gmail.com,
        samitolvanen@google.com, torvalds@linux-foundation.org
Subject: Re: [PATCH v4] pgo: add clang's Profile Guided Optimization infrastructure
Date:   Fri, 15 Jan 2021 16:13:24 -0800
Message-Id: <20210116001324.2865-1-nick.desaulniers@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAKwvOd=rEngs-8DR6pagynYc5-=a06brTOOx5TT1TC+v7-3m2Q@mail.gmail.com>
References: <CAKwvOd=rEngs-8DR6pagynYc5-=a06brTOOx5TT1TC+v7-3m2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

> On Wed, Jan 13, 2021 at 8:07 PM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Wed, Jan 13, 2021 at 12:55 PM Nathan Chancellor
> > <natechancellor@gmail.com> wrote:
> > >
> > > However, I see an issue with actually using the data:
> > >
> > > $ sudo -s
> > > # mount -t debugfs none /sys/kernel/debug
> > > # cp -a /sys/kernel/debug/pgo/profraw vmlinux.profraw
> > > # chown nathan:nathan vmlinux.profraw
> > > # exit
> > > $ tc-build/build/llvm/stage1/bin/llvm-profdata merge --output=vmlinux.profdata vmlinux.profraw
> > > warning: vmlinux.profraw: Invalid instrumentation profile data (bad magic)
> > > error: No profiles could be merged.
> > >
> > > Am I holding it wrong? :) Note, this is virtualized, I do not have any
> > > "real" x86 hardware that I can afford to test on right now.
> >
> > Same.
> >
> > I think the magic calculation in this patch may differ from upstream
> > llvm: https://github.com/llvm/llvm-project/blob/49142991a685bd427d7e877c29c77371dfb7634c/llvm/include/llvm/ProfileData/SampleProf.h#L96-L101
> 
> Err...it looks like it was the padding calculation.  With that fixed
> up, we can query the profile data to get insights on the most heavily
> called functions.  Here's what my top 20 are (reset, then watch 10
> minutes worth of cat videos on youtube while running `find /` and
> sleeping at my desk).  Anything curious stand out to anyone?

Hello world from my personal laptop whose kernel was rebuilt with
profiling data!  Wow, I can run `find /` and watch cat videos on youtube
so fast!  Users will love this! /s

Checking the sections sizes of .text.hot. and .text.unlikely. looks
good!

> 
> $ llvm-profdata show -topn=20 /tmp/vmlinux.profraw
> Instrumentation level: IR  entry_first = 0
> Total functions: 48970
> Maximum function count: 62070879
> Maximum internal block count: 83221158
> Top 20 functions with the largest internal block counts:
>   drivers/tty/n_tty.c:n_tty_write, max count = 83221158
>   rcu_read_unlock_strict, max count = 62070879
>   _cond_resched, max count = 25486882
>   rcu_all_qs, max count = 25451477
>   drivers/cpuidle/poll_state.c:poll_idle, max count = 23618576
>   _raw_spin_unlock_irqrestore, max count = 18874121
>   drivers/cpuidle/governors/menu.c:menu_select, max count = 18721624
>   _raw_spin_lock_irqsave, max count = 18509161
>   memchr, max count = 15525452
>   _raw_spin_lock, max count = 15484254
>   __mod_memcg_state, max count = 14604619
>   __mod_memcg_lruvec_state, max count = 14602783
>   fs/ext4/hash.c:str2hashbuf_signed, max count = 14098424
>   __mod_lruvec_state, max count = 12527154
>   __mod_node_page_state, max count = 12525172
>   native_sched_clock, max count = 8904692
>   sched_clock_cpu, max count = 8895832
>   sched_clock, max count = 8894627
>   kernel/entry/common.c:exit_to_user_mode_prepare, max count = 8289031
>   fpregs_assert_state_consistent, max count = 8287198
> 
> -- 
> Thanks,
> ~Nick Desaulniers
> 
