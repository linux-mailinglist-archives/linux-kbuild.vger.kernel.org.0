Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E596545085C
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Nov 2021 16:30:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhKOPdq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Nov 2021 10:33:46 -0500
Received: from foss.arm.com ([217.140.110.172]:56642 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236522AbhKOPc7 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Nov 2021 10:32:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EF1C6D;
        Mon, 15 Nov 2021 07:30:02 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 557F03F766;
        Mon, 15 Nov 2021 07:30:00 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Michael Ellerman <mpe@ellerman.id.au>,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>, Marco Elver <elver@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 3/5] powerpc: Use preemption model accessors
In-Reply-To: <87o86rmgu8.fsf@mpe.ellerman.id.au>
References: <20211110202448.4054153-1-valentin.schneider@arm.com> <20211110202448.4054153-4-valentin.schneider@arm.com> <87o86rmgu8.fsf@mpe.ellerman.id.au>
Date:   Mon, 15 Nov 2021 15:29:53 +0000
Message-ID: <87lf1pqvwu.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Doh, thought I had sent this one out already...

On 11/11/21 15:55, Michael Ellerman wrote:
> Valentin Schneider <valentin.schneider@arm.com> writes:
>> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
>> preemption model of the live kernel. Use the newly-introduced accessors
>> instead.
>>
>> sched_init() -> preempt_dynamic_init() happens way before IRQs are set up,
>> so this should be fine.
>
> Despite the name interrupt_exit_kernel_prepare() is called before IRQs
> are setup, traps and page faults are "interrupts" here.
>
> So I'm not sure about adding that call there, because it will trigger a
> WARN if called early in boot, which will trigger a trap and depending on
> the context we may not survive.
>
> I'd be happier if we can make it a build-time check.
>

This can't be done at build-time for PREEMPT_DYNAMIC, but that can be
punted off to whoever will implement ppc support for that :-) AFAICT if
this can't use preempt_dynamic_mode (due to how "late" it is setup), the
preempt_schedule_irq() needs to go and ppc needs to use irqentry_exit() /
irqentry_exit_cond_resched().

I dropped that for v2.

> cheers
>
