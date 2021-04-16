Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4829E36207C
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 15:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235252AbhDPNIW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 09:08:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243151AbhDPNIW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 09:08:22 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F699C06175F
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 06:07:56 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id g9so10622863wrx.0
        for <linux-kbuild@vger.kernel.org>; Fri, 16 Apr 2021 06:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=psVJK99+O+tg8o2EaxMtjg4ibnxyJog9/VVbDGGEZIs=;
        b=HEsPoJ6YAVzWWqR1SCDlnvGiezGJnRRw8xMA4Xg7MXvS7rWpxv67ia56OEkyrAhzWc
         wTiJjiUv3kVWpu6g5CfXcXANH1cemqZ/2RJQeaccz+uUkdedSkn140/84Z8/TClHPMWV
         EC/yujIDYcLnK7nnQ4nrvbt14NHy2YSQN/Ev+Ohz24lvSsobDMnGKRPL12lXquxjBDGC
         +UzCtGEJKS5JhhHfOqnLFzCOTMoFtkc/R2BanM1wcjEQSbsYtlsBE/UemULWIXB0cELw
         GaYZNdqLwgJyJpiKiI+aqqoVgheSGnCYQDrIqlrTwcImg9A0Xv7xgX0QnLMt+IRjH603
         YDZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=psVJK99+O+tg8o2EaxMtjg4ibnxyJog9/VVbDGGEZIs=;
        b=nveXJHbi/4f+LrsnLHEiItDPr+BD47wUxTtgXIjfR3TpVxB09eVn+49hZMiYTHQXC4
         RicAeoIVMsPT14GjdAv0Krncq9CV2E/WmKu4v4ab1SetUuyG2idpunlwsmCxnXbt3hWn
         GF3Ka0Srb4BXJDPQinhOU9BuJmV6y4isxhz/FH1Z5AIE0AtRNxpLsGMw7Q+PUsG2t7IA
         ahjlzhXQw1Z9nTUZ/tQF4pxRQ52SSoc4SJh9IwtBDQD8Ius/Wyzn6v00bHT82EeOGP3G
         FOnjac6x+R17kxub+ezmQFdBj+mfzd1mR67TOgM/dmoB6izDFEAruCtqYWyYEkvrHVDG
         V55w==
X-Gm-Message-State: AOAM531GfDmM0gML3nTnxYpg6UdCfgZVstqXniuaDU+++MDJpeHlS/+Q
        +2kKG2/X7iFxWTE6NAgC/6Pm
X-Google-Smtp-Source: ABdhPJwWEbDQ9iMx4fqtjWEcxrGjmorPoLUaIsn12ayIH5plt/5SnLPUQOSAZAXmEXgLQmWjoZSf8A==
X-Received: by 2002:a5d:424a:: with SMTP id s10mr9468441wrr.70.1618578474684;
        Fri, 16 Apr 2021 06:07:54 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:209:51db:fb7a:d252:e3c1])
        by smtp.gmail.com with ESMTPSA id h81sm10295477wmf.41.2021.04.16.06.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 06:07:54 -0700 (PDT)
Date:   Fri, 16 Apr 2021 14:07:49 +0100
From:   Wedson Almeida Filho <wedsonaf@google.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     ojeda@kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <YHmMJWmzz2vZ3qQH@google.com>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YHlz54rd1YQHsOA/@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 16, 2021 at 01:24:23PM +0200, Peter Zijlstra wrote:
> On Wed, Apr 14, 2021 at 08:45:51PM +0200, ojeda@kernel.org wrote:
> >   - Featureful language: sum types, pattern matching, generics,
> >     RAII, lifetimes, shared & exclusive references, modules &
> >     visibility, powerful hygienic and procedural macros...
> 
> IMO RAII is over-valued, but just in case you care, the below seems to
> work just fine. No fancy new language needed, works today. Similarly you
> can create refcount_t guards, or with a little more work full blown
> smart_ptr crud.

Peter, we do care, thank you for posting this. It's a great example for us to
discuss some of the minutiae of what we think Rust brings to the table in
addition to what's already possible in C.

> 
> ---
> diff --git a/include/linux/mutex.h b/include/linux/mutex.h
> index e19323521f9c..f03a72dd8cea 100644
> --- a/include/linux/mutex.h
> +++ b/include/linux/mutex.h
> @@ -197,4 +197,22 @@ extern void mutex_unlock(struct mutex *lock);
>  
>  extern int atomic_dec_and_mutex_lock(atomic_t *cnt, struct mutex *lock);
>  
> +struct mutex_guard {
> +	struct mutex *mutex;
> +};
> +
> +static inline struct mutex_guard mutex_guard_lock(struct mutex *mutex)
> +{
> +	mutex_lock(mutex);
> +	return (struct mutex_guard){ .mutex = mutex, };
> +}
> +
> +static inline void mutex_guard_unlock(struct mutex_guard *guard)
> +{
> +	mutex_unlock(guard->mutex);
> +}
> +
> +#define DEFINE_MUTEX_GUARD(name, lock)			\
> +	struct mutex_guard __attribute__((__cleanup__(mutex_guard_unlock))) name = mutex_guard_lock(lock)
> +
>  #endif /* __LINUX_MUTEX_H */
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 8ee3249de2f0..603d197a83b8 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -5715,16 +5715,15 @@ static long perf_compat_ioctl(struct file *file, unsigned int cmd,
>  
>  int perf_event_task_enable(void)
>  {
> +	DEFINE_MUTEX_GUARD(event_mutex, &current->perf_event_mutex);

There is nothing in C forcing developers to actually use DEFINE_MUTEX_GUARD. So
someone may simply forget (or not know that they need) to lock
current->perf_event_mutex and directly access some field protected by it. This
is unlikely to happen when one first writes the code, but over time as different
people modify the code and invariants change, it is possible for this to happen.

In Rust, this isn't possible: the data protected by a lock is only accessible
when the lock is locked. So developers cannot accidentally make mistakes of this
kind. And since the enforcement happens at compile time, there is no runtime
cost.

This, we believe, is fundamental to the discussion: we agree that many of these
idioms can be implemented in C (albeit in this case with a compiler extension),
but their use is optional, people can (and do) still make mistakes that lead to
vulnerabilities; Rust disallows classes of  mistakes by construction.

Another scenario: suppose within perf_event_task_enable you need to call a
function that requires the mutex to be locked and that will unlock it for you on
error (or unconditionally, doesn't matter). How would you do that in C? In Rust,
there is a clean idiomatic way of transferring ownership of a guard (or any
other object) such that the previous owner cannot continue to use it after
ownership is transferred. Again, this is enforced at compile time. I'm happy to
provide a small example if that would help.

Again, thanks for bringing this up. And please keep your concerns and feedback
coming, we very much want to have these discussions and try to improve what we
have based on feedback from the community.

>  	struct perf_event_context *ctx;
>  	struct perf_event *event;
>  
> -	mutex_lock(&current->perf_event_mutex);
>  	list_for_each_entry(event, &current->perf_event_list, owner_entry) {
>  		ctx = perf_event_ctx_lock(event);
>  		perf_event_for_each_child(event, _perf_event_enable);
>  		perf_event_ctx_unlock(event, ctx);
>  	}
> -	mutex_unlock(&current->perf_event_mutex);
>  
>  	return 0;
>  }
