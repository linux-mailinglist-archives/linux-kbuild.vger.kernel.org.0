Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C13DB4532DB
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Nov 2021 14:29:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236684AbhKPNcw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Nov 2021 08:32:52 -0500
Received: from pegase2.c-s.fr ([93.17.235.10]:58253 "EHLO pegase2.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230471AbhKPNcw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Nov 2021 08:32:52 -0500
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
        by localhost (Postfix) with ESMTP id 4Htn3j6dQLz9sSJ;
        Tue, 16 Nov 2021 14:29:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
        by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id US9XL2ibzr6x; Tue, 16 Nov 2021 14:29:53 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase2.c-s.fr (Postfix) with ESMTP id 4Htn3j50jLz9sSH;
        Tue, 16 Nov 2021 14:29:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 95FD48B77A;
        Tue, 16 Nov 2021 14:29:53 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id f2Vdc5Ovhuop; Tue, 16 Nov 2021 14:29:53 +0100 (CET)
Received: from [192.168.234.8] (unknown [192.168.234.8])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id BFA358B763;
        Tue, 16 Nov 2021 14:29:52 +0100 (CET)
Message-ID: <2f22c57d-9bf0-3cc1-f0f1-61ecdf5dfa52@csgroup.eu>
Date:   Tue, 16 Nov 2021 14:29:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
Content-Language: fr-FR
To:     Valentin Schneider <valentin.schneider@arm.com>,
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
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211110202448.4054153-3-valentin.schneider@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



Le 10/11/2021 à 21:24, Valentin Schneider a écrit :
> CONFIG_PREEMPT{_NONE, _VOLUNTARY} designate either:
> o The build-time preemption model when !PREEMPT_DYNAMIC
> o The default boot-time preemption model when PREEMPT_DYNAMIC
> 
> IOW, using those on PREEMPT_DYNAMIC kernels is meaningless - the actual
> model could have been set to something else by the "preempt=foo" cmdline
> parameter.
> 
> Introduce a set of helpers to determine the actual preemption mode used by
> the live kernel.
> 
> Suggested-by: Marco Elver <elver@google.com>
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> ---
>   include/linux/sched.h | 16 ++++++++++++++++
>   kernel/sched/core.c   | 11 +++++++++++
>   2 files changed, 27 insertions(+)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 5f8db54226af..0640d5622496 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
>   #endif
>   }
>   
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +
> +extern bool is_preempt_none(void);
> +extern bool is_preempt_voluntary(void);
> +extern bool is_preempt_full(void);

Those are trivial tests supposed to be used in fast pathes. They should 
be static inlines in order to minimise the overhead.

> +
> +#else
> +
> +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> +#define is_preempt_voluntary() IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)

Would be better to use static inlines here as well instead of macros.

> +
> +#endif
> +
> +#define is_preempt_rt() IS_ENABLED(CONFIG_PREEMPT_RT)
> +
>   /*
>    * Does a critical section need to be broken due to another
>    * task waiting?: (technically does not depend on CONFIG_PREEMPTION,
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 97047aa7b6c2..9db7f77e53c3 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -6638,6 +6638,17 @@ static void __init preempt_dynamic_init(void)
>   	}
>   }
>   
> +#define PREEMPT_MODE_ACCESSOR(mode) \
> +	bool is_preempt_##mode(void)						 \
> +	{									 \
> +		WARN_ON_ONCE(preempt_dynamic_mode == preempt_dynamic_undefined); \

Not sure using WARN_ON is a good idea here, as it may be called very 
early, see comment on powerpc patch.

> +		return preempt_dynamic_mode == preempt_dynamic_##mode;		 \
> +	}

I'm not sure that's worth a macro. You only have 3 accessors, 2 lines of 
code each. Just define all 3 in plain text.

CONFIG_PREEMPT_DYNAMIC is based on using strategies like static_calls in 
order to minimise the overhead. For those accessors you should use the 
same kind of approach and use things like jump_labels in order to not 
redo the test at each time and minimise overhead as much as possible.

> +
> +PREEMPT_MODE_ACCESSOR(none)
> +PREEMPT_MODE_ACCESSOR(voluntary)
> +PREEMPT_MODE_ACCESSOR(full)
> +
>   #else /* !CONFIG_PREEMPT_DYNAMIC */
>   
>   static inline void preempt_dynamic_init(void) { }
> 
