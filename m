Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7305C459348
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Nov 2021 17:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239151AbhKVQrr convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-kbuild@lfdr.de>); Mon, 22 Nov 2021 11:47:47 -0500
Received: from foss.arm.com ([217.140.110.172]:43300 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231383AbhKVQrr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Nov 2021 11:47:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8491EED1;
        Mon, 22 Nov 2021 08:44:40 -0800 (PST)
Received: from e113632-lin (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85E503F66F;
        Mon, 22 Nov 2021 08:44:38 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Cc:     Marco Elver <elver@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Peter Zijlstra <peterz@infradead.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Paul Mackerras <paulus@samba.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Dmitry Vyukov <dvyukov@google.com>
Subject: Re: [PATCH v2 3/5] powerpc: Use preemption model accessors
In-Reply-To: <431fb6da-fe21-c5a6-bfb3-4e26bdc153b4@csgroup.eu>
References: <20211110202448.4054153-1-valentin.schneider@arm.com> <20211110202448.4054153-4-valentin.schneider@arm.com> <431fb6da-fe21-c5a6-bfb3-4e26bdc153b4@csgroup.eu>
Date:   Mon, 22 Nov 2021 16:44:36 +0000
Message-ID: <87v90kcf7v.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16/11/21 14:41, Christophe Leroy wrote:
> Le 10/11/2021 à 21:24, Valentin Schneider a écrit :
>> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
>> preemption model of the live kernel. Use the newly-introduced accessors
>> instead.
>
> Is that change worth it for now ? As far as I can see powerpc doesn't
> have DYNAMIC PREEMPT, a lot of work needs to be done before being able
> to use it:
> - Implement GENERIC_ENTRY
> - Implement STATIC_CALLS (already done on PPC32, to be done on PPC64)
>

You're right, I ditched this patch for v3 - AFAICT the change wasn't even
valid as the preempt_schedule_irq() call needs to be replaced with
irqentry_exit_cond_resched() (IOW this needs to make use of the generic
entry code).

>>
>> sched_init() -> preempt_dynamic_init() happens way before IRQs are set up,
>> so this should be fine.
>
> It looks like you are mixing up interrupts and IRQs (also known as
> "external interrupts").
>
> ISI (Instruction Storage Interrupt) and DSI (Data Storage Interrupt) for
> instance are also interrupts. They happen everytime there is a page
> fault so may happen pretty early.
>
> Traps generated by WARN_ON() are also interrupts that may happen at any
> time.
>

Michael pointed this out and indeed triggering a WARN_ON() there is not
super smart. Thanks for teaching me a bit of what I'm putting my grubby
hands in :)
