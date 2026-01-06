Return-Path: <linux-kbuild+bounces-10428-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DD8CFA269
	for <lists+linux-kbuild@lfdr.de>; Tue, 06 Jan 2026 19:29:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2E2E31705BC
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 Jan 2026 17:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D8442FD68D;
	Tue,  6 Jan 2026 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ljs0vtvS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2046F2FC011
	for <linux-kbuild@vger.kernel.org>; Tue,  6 Jan 2026 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720893; cv=none; b=OPm0MWXPlTdSwjLGsw8kNa3v0HG+nQLiGHauf7hZ9xFI/wIzOEFNIu+FX5JLWHNlrdDKM1AzYTchnMkHLWH67TAaaFTcxspEiGrEpyubBG5YkGtsLUYKYzry6/VeB19JyR4Vt99UyC1FosV2p2oakCr96XIQdJcHcRksUgF+Keo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720893; c=relaxed/simple;
	bh=vbg/4Kuy8+wEtCaTdI808rOQJV/eEI0U33FeZ9sxcno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BU9gt5+tORRZ4DqjZVukGxVy+0RCLg5ThKF4LUx1YU4R/RbuolD3gCUlLc0zPeNVM6yMjfWXuV5pt5EiJTJGEll2wFmFCYwzeG0u/3W8ZoxLIK1Oezn29ujzaqIJGxV8J0VX8BfPttppodRUOyy6+69Jo9KMSTrNSW8y7Ang8/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ljs0vtvS; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-477770019e4so10424935e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Jan 2026 09:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767720888; x=1768325688; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXcHtzljW/LEwcnvhUw7B+CYy+kN5WC/pk6M+qEtNI0=;
        b=Ljs0vtvSNgpYJhknDhx9bELQGkkGVBktvrRTynlExmpLIGaAKcKfy3q+Vzhc0CBdzt
         hBu8YqcaTsruwaGPpR28ZieFzq6vpX9ppPbtMDq1YX7oLCc1WBHU2/khCZGPgcPiCJQo
         /SdqgjVvcX4o8hT7DcaJnMaMrndMqG0BlSQCVNuO18iucidmTBu/KWco362PprZTfFO/
         XbxStM5Ax6eKh7Rzmwb+jd7wTMCelndFhBbeJ2nvVNQfn/FL+xadO2yxh5ZLwyELgTkw
         edYtcRWUeQEl3fZGMU433z7W5zEQdjxichBC/sKkiUvsD8eW0UgBMhLx19RKhPBoMKrS
         pmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720888; x=1768325688;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RXcHtzljW/LEwcnvhUw7B+CYy+kN5WC/pk6M+qEtNI0=;
        b=GM3sHe2dbMKKlwZeiLiZObxHzsusdFr+k3JurcOpzwkg/E10GkE0fu6v4zp3HzcCFZ
         H+lsE8mQKz8Q93dsqBwaVETXhFZKSFh3DEgkUeXwwYEOFpIVNzsUymL73NNwij0kATJA
         Ie1KOtOLrA+i6zejwV+A26gnYSNAhqzMR8zhfBzPIBuHUTMzJz1rCB0DWJNy1xAjqt63
         mUQZnaSyQbom6pI3EpLEt/d5kND5E29UQ95M3aYtoV7b3jQ4Jsp9wQXRbW5Ojpf5h0VL
         1aEZzbDkEMnV4Hmf7BRkvEv9+wK/D7tDQMvCkelw1s4ciwpICXgnyhy3M4XriKJanFJU
         kwUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGXlK3In3zAO4x0yBmqJwhz0V+sRw8I2Y4+yFkrEMgzpz+F1ahYLMVPioNh3YB3voeOeVpA+m3hiRfXcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgJNE5Grn6fLvmoylewfSuwV8AwabPesRAF3DZy58hHT7So/2Q
	gcuXEPSTTPw429b+EfJleIDaMN62ZccF6zT6Cqm6fj6yrA6Twvzwb2wJvYIhEWa+xg==
X-Gm-Gg: AY/fxX5BXdYoEAszzqOSPLLWFeQB8Jk35cdUmZ+4V/8+dVveiKIBMmheGWQXIisYAt4
	OSlyT5iOuFf3ALU4UwEUZLfYRxtGzRUnLslvvbB8rZ6VQ29HK37DJJGic7XJS5Ues10YGeuYAJE
	l+0jvPvqa//hAcFoVMxU2mJkOocBZ9s74XqkfBvUL2BK/bT/Qu/qu8DjUiWEAycTro7SykuDpLD
	tLK4BHsD/M2wVmvLb+aRdBMRLriD6qi2fOq+ivor7giGci/gcjWfPHUgejpfK+gMBc/rYWV1nkA
	yYeDqg6yH6hxlseeRnUyrkTMXksky2cKdJyLVJKZpwWGOAzGUbPSKLrCmz5Qq2iWT3BHfHeyuFj
	hXXhAQ4Ju9u7CXICUY1XTkQBvffyRcUfDFfCS6LXFQWdYWdlFQT93oLJAY+KH4cuZuRZU6fvVd7
	N+Evp3RpaLhPS2enery8/cJDTY2M9zgQbVk3cOD/BqMOq/cpny
X-Google-Smtp-Source: AGHT+IHmVK6EqE14VH+HPUL16Zk51harYxsBJJheKVL1BeqXTS/M31ba8unH1eaK7+ALdSr4nMxyjw==
X-Received: by 2002:a05:600c:46ca:b0:477:7a53:f493 with SMTP id 5b1f17b1804b1-47d7f0980e2mr44046495e9.23.1767720888108;
        Tue, 06 Jan 2026 09:34:48 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:4477:8df2:f516:1bd3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7fb4b3c5sm21868415e9.15.2026.01.06.09.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 09:34:47 -0800 (PST)
Date: Tue, 6 Jan 2026 18:34:39 +0100
From: Marco Elver <elver@google.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>, Ingo Molnar <mingo@kernel.org>,
	Will Deacon <will@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
	Chris Li <sparse@chrisli.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Arnd Bergmann <arnd@arndb.de>, Bart Van Assche <bvanassche@acm.org>,
	Christoph Hellwig <hch@lst.de>, Dmitry Vyukov <dvyukov@google.com>,
	Eric Dumazet <edumazet@google.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ian Rogers <irogers@google.com>, Jann Horn <jannh@google.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Josh Triplett <josh@joshtriplett.org>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>, Thomas Graf <tgraf@suug.ch>,
	Uladzislau Rezki <urezki@gmail.com>,
	Waiman Long <longman@redhat.com>, kasan-dev@googlegroups.com,
	linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-security-module@vger.kernel.org,
	linux-sparse@vger.kernel.org, linux-wireless@vger.kernel.org,
	llvm@lists.linux.dev, rcu@vger.kernel.org
Subject: Re: [PATCH v5 06/36] cleanup: Basic compatibility with context
 analysis
Message-ID: <aV1HrwZm6xg8PnRU@elver.google.com>
References: <20251219154418.3592607-1-elver@google.com>
 <20251219154418.3592607-7-elver@google.com>
 <993d381a-c24e-41d2-a0be-c1b0b5d8cbe9@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <993d381a-c24e-41d2-a0be-c1b0b5d8cbe9@I-love.SAKURA.ne.jp>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Tue, Jan 06, 2026 at 10:21PM +0900, Tetsuo Handa wrote:
> On 2025/12/20 0:39, Marco Elver wrote:
> > Introduce basic compatibility with cleanup.h infrastructure.
> 
> Can Compiler-Based Context- and Locking-Analysis work with conditional guards
> (unlock only if lock succeeded) ?
> 
> I consider that replacing mutex_lock() with mutex_lock_killable() helps reducing
> frequency of hung tasks under heavy load where many processes are preempted waiting
> for the same mutex to become available (e.g.
> https://syzkaller.appspot.com/bug?extid=8f41dccfb6c03cc36fd6 ).
> 
> But e.g. commit f49573f2f53e ("tty: use lock guard()s in tty_io") already replaced
> plain mutex_lock()/mutex_unlock() with plain guard(mutex). If I propose a patch for
> replacing mutex_lock() with mutex_lock_killable(), can I use conditional guards?
> (Would be yes if Compiler-Based Context- and Locking-Analysis can work, would be no
>  if Compiler-Based Context- and Locking-Analysis cannot work) ?

It works for cond guards, so yes. But, only if support for
mutex_lock_killable() is added. At the moment mutex.h only has:

	...
	DEFINE_LOCK_GUARD_1(mutex, struct mutex, mutex_lock(_T->lock), mutex_unlock(_T->lock))
	DEFINE_LOCK_GUARD_1_COND(mutex, _try, mutex_trylock(_T->lock))
	DEFINE_LOCK_GUARD_1_COND(mutex, _intr, mutex_lock_interruptible(_T->lock), _RET == 0)

	DECLARE_LOCK_GUARD_1_ATTRS(mutex,	__acquires(_T), __releases(*(struct mutex **)_T))
	#define class_mutex_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex, _T)
	DECLARE_LOCK_GUARD_1_ATTRS(mutex_try,	__acquires(_T), __releases(*(struct mutex **)_T))
	#define class_mutex_try_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_try, _T)
	DECLARE_LOCK_GUARD_1_ATTRS(mutex_intr,	__acquires(_T), __releases(*(struct mutex **)_T))
	#define class_mutex_intr_constructor(_T) WITH_LOCK_GUARD_1_ATTRS(mutex_intr, _T)
	...

And we also have a test in lib/test_context-analysis.c checking it
actually works:

	...
	scoped_cond_guard(mutex_try, return, &d->mtx) {
		d->counter++;
	}
	scoped_cond_guard(mutex_intr, return, &d->mtx) {
		d->counter++;
	}
	...

What's missing is a variant for mutex_lock_killable(), but that should
be similar to the mutex_lock_interruptible() variant.

