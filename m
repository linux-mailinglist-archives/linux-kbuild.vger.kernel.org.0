Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703E3422783
	for <lists+linux-kbuild@lfdr.de>; Tue,  5 Oct 2021 15:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234388AbhJENP2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 5 Oct 2021 09:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234103AbhJENP1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Oct 2021 09:15:27 -0400
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com [IPv6:2607:f8b0:4864:20::c2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DD1C061753
        for <linux-kbuild@vger.kernel.org>; Tue,  5 Oct 2021 06:13:37 -0700 (PDT)
Received: by mail-oo1-xc2f.google.com with SMTP id j11-20020a4a92cb000000b002902ae8cb10so6375431ooh.7
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Oct 2021 06:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6G7malU1QffNFlLHyGnF0GE1rVke+5aiG8YVR53mxq8=;
        b=Uo5Dxx/8CK3cBObyCN+G6zjFAZKGtDxuUZOCiZhE8emJWurCVGfpeQbXCqRz/ifw8h
         5hJG4lOZ1j+wsv17NwZ2izgQ7JLzW/ft2ZZ3ui7naNTAy9MMSaSzlMSgOCEBE0K7Qs0t
         PGSRYvlOSlUpoORJazPfM8UN/kLb9qnhtdMtq0XuKNTETS4ZCdnWTuLhsuCks3oPF//n
         wf8xGuAxUqWcWqkBx+CDmE/gNFN5HOJjTlwmMXm8VSDfCjJt1mgSLS0RjAeKs7jE1lCa
         uTfhMSHLyVhB2mkQfBO+UMdTDtPE/eSnpRBBglK2HfZhOmKx3KBZqBW59LtAzXHqvVZb
         JaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6G7malU1QffNFlLHyGnF0GE1rVke+5aiG8YVR53mxq8=;
        b=nMPf2G5XLRwLfIIw0viZaIMuLT7k7j0zfRXG+j1qeP0UaSX/XsQrkcE+MYbsVk85q5
         otge+ejB+TYsu/ZsQLjSZ4h1b2NrLiT46PhoniVtFS+9bmL5xVKnEDdZJ/pxDPqvg+oX
         6ka+oU2HCX17jgya4D3fMc0+0ovWTjKJLsSjPmnsmmL/U65ow/Iyej2qOL1r2zvVJhvP
         ZbRQlSd4NouURRIpAG2k3ReIsn0kz4okWDQaibs1jWUhgrh5zdEuG0GEp17n1iKsoChI
         QeTYB8cfhl/TH0wrNR12VjiIcSQx7MHfe0wrEBPbeh6G8vI91kte/AN0ZIQwa0JZSGCj
         /PHw==
X-Gm-Message-State: AOAM533uV3/SCtHMNaeO1qDL9roBgD3I1hYvRFjUGdiUfg5f4BWYZM4e
        jQ8kwdKjNrjqISCOMxpl2H1YtX/sbNjs+XmRQDDUMA==
X-Google-Smtp-Source: ABdhPJxqMq8cjDTc9QTKdqIRvlnQBOs1H6JCXbF5h1q6usAXXwdA/S40EKnb/uwBvgOd/CGMKkYqHGw1riXb4Giu+98=
X-Received: by 2002:a4a:de57:: with SMTP id z23mr13364623oot.70.1633439616620;
 Tue, 05 Oct 2021 06:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20211005105905.1994700-1-elver@google.com> <20211005105905.1994700-5-elver@google.com>
 <YVxKplLAMJJUlg/w@hirez.programming.kicks-ass.net>
In-Reply-To: <YVxKplLAMJJUlg/w@hirez.programming.kicks-ass.net>
From:   Marco Elver <elver@google.com>
Date:   Tue, 5 Oct 2021 15:13:25 +0200
Message-ID: <CANpmjNMk0ubjYEVjdx=gg-S=zy7h=PSjZDXZRVfj_BsNzd6zkg@mail.gmail.com>
Subject: Re: [PATCH -rcu/kcsan 04/23] kcsan: Add core support for a subset of
 weak memory modeling
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     "Paul E . McKenney" <paulmck@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Ingo Molnar <mingo@kernel.org>,
        Josh Poimboeuf <jpoimboe@redhat.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Waiman Long <longman@redhat.com>,
        Will Deacon <will@kernel.org>, kasan-dev@googlegroups.com,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 5 Oct 2021 at 14:53, Peter Zijlstra <peterz@infradead.org> wrote:
> On Tue, Oct 05, 2021 at 12:58:46PM +0200, Marco Elver wrote:
> > +#if !defined(CONFIG_ARCH_WANTS_NO_INSTR) || defined(CONFIG_STACK_VALIDATION)
> > +/*
> > + * Arch does not rely on noinstr, or objtool will remove memory barrier
> > + * instrumentation, and no instrumentation of noinstr code is expected.
> > + */
> > +#define kcsan_noinstr
>
> I think this still wants to be at the very least:
>
> #define kcsan_noinstr noinline notrace
>
> without noinline it is possible LTO (or similarly daft things) will end
> up inlining the calls, and since we rely on objtool to NOP out CALLs
> this must not happen.

Good point about noinline, will add.

> And since you want to mark these functions as uaccess_safe, there must
> not be any tracing on, hence notrace.

In the Makefile we've relied on:

  CFLAGS_REMOVE_core.o = $(CC_FLAGS_FTRACE)

just to disable it for all code here. That should be enough, right?
