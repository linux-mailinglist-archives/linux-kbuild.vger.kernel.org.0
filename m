Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E45E44D55E
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 11:56:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232318AbhKKK7E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Nov 2021 05:59:04 -0500
Received: from foss.arm.com ([217.140.110.172]:36974 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhKKK7D (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Nov 2021 05:59:03 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54C17D6E;
        Thu, 11 Nov 2021 02:56:14 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BE0E3F70D;
        Thu, 11 Nov 2021 02:56:12 -0800 (PST)
From:   Valentin Schneider <valentin.schneider@arm.com>
To:     Marco Elver <elver@google.com>
Cc:     linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
        linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>,
        Mike Galbraith <efault@gmx.de>,
        Dmitry Vyukov <dvyukov@google.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
In-Reply-To: <YYzaLTtf1tFbqDSn@elver.google.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com> <20211110202448.4054153-3-valentin.schneider@arm.com> <YYzaLTtf1tFbqDSn@elver.google.com>
Date:   Thu, 11 Nov 2021 10:56:06 +0000
Message-ID: <874k8jrmex.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/11/21 09:54, Marco Elver wrote:
> On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
> [...]
>> +#ifdef CONFIG_PREEMPT_DYNAMIC
>> +
>> +extern bool is_preempt_none(void);
>> +extern bool is_preempt_voluntary(void);
>> +extern bool is_preempt_full(void);
>> +
>> +#else
>> +
>> +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
>> +#define is_preempt_voluntary() IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
>> +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
>> +
>> +#endif
>> +
>> +#define is_preempt_rt() IS_ENABLED(CONFIG_PREEMPT_RT)
>> +
>
> Can these callables be real functions in all configs, making the
> !DYNAMIC ones just static inline bool ones? That'd catch invalid use in
> #if etc. in all configs.
>

Ack

>>  /*
>>   * Does a critical section need to be broken due to another
>>   * task waiting?: (technically does not depend on CONFIG_PREEMPTION,
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index 97047aa7b6c2..9db7f77e53c3 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -6638,6 +6638,17 @@ static void __init preempt_dynamic_init(void)
>>      }
>>  }
>>
>> +#define PREEMPT_MODE_ACCESSOR(mode) \
>> +	bool is_preempt_##mode(void)						 \
>> +	{									 \
>> +		WARN_ON_ONCE(preempt_dynamic_mode == preempt_dynamic_undefined); \
>> +		return preempt_dynamic_mode == preempt_dynamic_##mode;		 \
>> +	}
>
> This needs an EXPORT_SYMBOL, so it's usable from modules like the
> kcsan_test module.

Ah, wasn't sure about that one, thanks!
