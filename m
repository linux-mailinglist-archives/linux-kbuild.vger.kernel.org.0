Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98DCC44D568
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Nov 2021 11:57:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbhKKK74 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Nov 2021 05:59:56 -0500
Received: from foss.arm.com ([217.140.110.172]:37058 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229668AbhKKK74 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Nov 2021 05:59:56 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41DEDD6E;
        Thu, 11 Nov 2021 02:57:07 -0800 (PST)
Received: from e113632-lin (e113632-lin.cambridge.arm.com [10.1.196.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 292E93F70D;
        Thu, 11 Nov 2021 02:57:05 -0800 (PST)
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
Subject: Re: [PATCH v2 4/5] kscan: Use preemption model accessors
In-Reply-To: <YYzeOQNFmuieCk3T@elver.google.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com> <20211110202448.4054153-5-valentin.schneider@arm.com> <YYzeOQNFmuieCk3T@elver.google.com>
Date:   Thu, 11 Nov 2021 10:57:02 +0000
Message-ID: <871r3nrmdd.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 11/11/21 10:11, Marco Elver wrote:
> Subject s/kscan/kcsan/
>

Woops...

> On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
>> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
>> preemption model of the live kernel. Use the newly-introduced accessors
>> instead.
>>
>> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
>
> Reviewed-by: Marco Elver <elver@google.com>
>
> Though it currently doesn't compile as a module due to missing
> EXPORT_SYMBOL of is_preempt*().
>
>> ---
>>  kernel/kcsan/kcsan_test.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
>> index dc55fd5a36fc..14d811eb9a21 100644
>> --- a/kernel/kcsan/kcsan_test.c
>> +++ b/kernel/kcsan/kcsan_test.c
>> @@ -1005,13 +1005,13 @@ static const void *nthreads_gen_params(const void *prev, char *desc)
>>      else
>>              nthreads *= 2;
>>
>> -	if (!IS_ENABLED(CONFIG_PREEMPT) || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
>> +	if (!is_preempt_full() || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
>>              /*
>>               * Without any preemption, keep 2 CPUs free for other tasks, one
>>               * of which is the main test case function checking for
>>               * completion or failure.
>>               */
>> -		const long min_unused_cpus = IS_ENABLED(CONFIG_PREEMPT_NONE) ? 2 : 0;
>> +		const long min_unused_cpus = is_preempt_none() ? 2 : 0;
>>              const long min_required_cpus = 2 + min_unused_cpus;
>>
>>              if (num_online_cpus() < min_required_cpus) {
>> --
>> 2.25.1
