Return-Path: <linux-kbuild+bounces-13600-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ervxLvgHI2pEgwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13600-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 19:31:36 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EAB64A2EC
	for <lists+linux-kbuild@lfdr.de>; Fri, 05 Jun 2026 19:31:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=VXe3tUct;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13600-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13600-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B302D302BE88
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Jun 2026 17:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4663356A37;
	Fri,  5 Jun 2026 17:23:08 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C247416D01;
	Fri,  5 Jun 2026 17:23:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780680188; cv=none; b=aifjWHEC6ejWJLrK8mhH98OjLQTqvwFeAGK8BKduJg+IvwXG/5uMj32qhxj7sdkLcs5nFxSpAof/Q8hc/NWONM1dVqZ2jF7hCKw6af6pCB6WOHktpf27zAC4HLjamBLQzL65jnx+VLzjiInHg/T37WW4hSvMS//sKtu5ReGwIa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780680188; c=relaxed/simple;
	bh=lizWom7kQpSapScdlQtqP0GPMCXLJkaPKaDj2lnf8e4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opQ8C7CD74C7YOF3pvLfigFNRrGsdOLMwyd7daMzBoPwr9X8f4cE9XKFFJ3sfYnl6333gsFQB3sxpc1ZADEs3t8FpCfCZTpI/pE9xbgcUv0V59GF5M00F1hdRvFUgfCIFGP3eB4qHIFau0yf+N6MVVChLMLGWKu5Cj9A5IFIv0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXe3tUct; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4B2F01F00893;
	Fri,  5 Jun 2026 17:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780680187;
	bh=JmeMxbXw2ZDUnGPQV9xGUwkBAbxAXeB57R4NlHLmCCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VXe3tUctdvoapIkLQpt0U552wqCeFZZczgH/BeLyYfz2UZIyHmXxIl0RYwXXrGJvL
	 gHsvtEpCDksKnSboMaNJBdo9inyJ/j94jrwLAjL8FzefmOSfASXZV7ytifDjhFXBev
	 X8PqhCwReJ9U90h1qMZ7CSVVuIc+N8iSZCqZGCNA89YlR0rtV/rBWiahOyKx/OweWe
	 /aI0xYUd2+ZDUCOs+weHiYTHRyw7Hz5FwI5g1z0vylbDC+nZmf3VJAMFkS4qwnFn3A
	 lejISQ+OvG3E0sd0UHj8lTGFWtUloqyiXmEomfXGstcueTGENDUSJ4mAe8zyIyJC2A
	 Zc+dA8Ow1wgtA==
Date: Wed, 3 Jun 2026 21:25:19 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Subject: Re: [RFC PATCH v2 1/6] kcov: add per-task dataflow tracking for
 function arguments/return values
Message-ID: <aiB_nycHL-MLN-3g@levanger>
Mail-Followup-To: Yunseong Kim <yunseong.kim@est.tech>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-1-fee0939de2c4@est.tech>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[46];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	TAGGED_FROM(0.00)[bounces-13600-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:peterz@infradead.org,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,infradead.org,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[levanger:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,est.tech:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 09EAB64A2EC

On Wed, Jun 03, 2026 at 07:43:28PM +0200, Yunseong Kim wrote:
> Add a new KCOV subsystem that captures function arguments at entry and
> return values at exit, with automatic struct field expansion using
> compiler-generated DebugInfo metadata.
> 
> Key components:
> - CONFIG_KCOV_DATAFLOW_ARGS: enables argument capture
> - CONFIG_KCOV_DATAFLOW_RET: enables return value capture
> - /sys/kernel/debug/kcov_dataflow: separate device from legacy kcov
> - Ioctl namespace 'd' (KCOV_DF_INIT_TRACE, KCOV_DF_ENABLE, KCOV_DF_DISABLE)
> - Per-task buffer: task->kcov_df_area with atomic xadd reservation
> - Fault-tolerant: all reads via copy_from_kernel_nofault()
> - Recursion-safe: notrace __no_sanitize_coverage noinline
> - ERR_PTR aware: skips struct expansion for error pointers
> 
> The callbacks (__sanitizer_cov_trace_args/ret) are inserted by the
> compiler when -fsanitize-coverage=dataflow-args,dataflow-ret is used.
> The Kconfig options depend on cc-option to verify compiler support.
> 
> Buffer format (TLV records, all u64):
>   area[0]: atomic word count
>   [pos+0]: type_and_seq (0xE=entry, 0xF=return in upper 4 bits)
>   [pos+1]: PC
>   [pos+2]: meta (arg_idx | arg_size | ptr)
>   [pos+3..N]: field values read via copy_from_kernel_nofault()
> 
> This is completely independent from legacy /sys/kernel/debug/kcov.
> Existing users (syzkaller, oss-fuzz) are unaffected.
> 
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  include/linux/sched.h |   8 ++
>  kernel/kcov.c         | 291 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/Kconfig.debug     |  22 ++++
>  3 files changed, 321 insertions(+)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index c4433c185ad8..03be4b495f70 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1533,6 +1533,14 @@ struct task_struct {
>  	/* KCOV sequence number: */
>  	int				kcov_sequence;
>  
> +	/* KCOV dataflow per-task sequence counter for TLV records: */
> +	u32				kcov_dataflow_seq;
> +
> +	/* KCOV dataflow: separate buffer for trace-args/trace-ret */
> +	unsigned int			kcov_df_size;
> +	void				*kcov_df_area;
> +	bool				kcov_df_enabled;
> +
>  	/* Collect coverage from softirq context: */
>  	unsigned int			kcov_softirq;
>  #endif
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 1df373fb562b..d3c9c0efe961 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -353,6 +353,288 @@ void notrace __sanitizer_cov_trace_switch(kcov_u64 val, void *arg)
>  EXPORT_SYMBOL(__sanitizer_cov_trace_switch);
>  #endif /* ifdef CONFIG_KCOV_ENABLE_COMPARISONS */
>  
> +#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_RET)
> +/*
> + * KCOV Dataflow: /sys/kernel/debug/kcov_dataflow
> + *
> + * Completely separate from legacy /sys/kernel/debug/kcov.
> + * Own buffer, own ioctl, own mmap. No printk — buffer only.
> + *
> + * TLV record layout (all u64):
> + *   area[0]: total u64 words written (atomic counter)
> + *   [pos+0]: type_and_seq (0xE=entry|0xF=return in upper 4 bits, seq in lower 24)
> + *   [pos+1]: PC
> + *   [pos+2]: raw pointer | (arg_idx << 56) | (arg_size << 48) for entry
> + *   [pos+3..N]: field values (or scalar value if num_fields=0)
> + */
> +#define KCOV_DF_TYPE_ENTRY	0xE0000000ULL
> +#define KCOV_DF_TYPE_RET	0xF0000000ULL
> +#define KCOV_DF_MAGIC_BAD	0xBADADD85ULL
> +#define KCOV_DF_IS_ERR(p)	((unsigned long)(p) >= (unsigned long)-4095UL)
> +
> +/* Ioctl commands for /sys/kernel/debug/kcov_dataflow */
> +#define KCOV_DF_INIT_TRACE	_IOR('d', 1, unsigned long)
> +#define KCOV_DF_ENABLE		_IO('d', 100)
> +#define KCOV_DF_DISABLE		_IO('d', 101)
> +
> +struct kcov_dataflow {
> +	refcount_t	refcount;
> +	spinlock_t	lock;
> +	unsigned int	size;	/* in u64 words */
> +	void		*area;
> +	struct task_struct *t;
> +};
> +
> +static void kcov_df_put(struct kcov_dataflow *df)
> +{
> +	if (refcount_dec_and_test(&df->refcount)) {
> +		vfree(df->area);
> +		kfree(df);
> +	}
> +}
> +
> +/*
> + * Core write function — no printk, no locks, just atomic buffer write.
> + * Called from __sanitizer_cov_trace_args/ret in instrumented code.
> + */
> +static noinline notrace __no_sanitize_coverage void
> +kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
> +	      u64 *offsets, u32 num_fields)
> +{
> +	struct task_struct *t = current;
> +	u64 *area;
> +	unsigned long pos, max_pos;
> +	u32 record_len, seq, i;
> +
> +	if (!t->kcov_df_enabled)
> +		return;
> +
> +	area = (u64 *)t->kcov_df_area;
> +	if (!area)
> +		return;
> +
> +	max_pos = t->kcov_df_size;
> +
> +	/* Record: header(1) + pc(1) + meta(1) + fields or scalar(max 1) */
> +	record_len = 3 + (num_fields > 0 ? num_fields : 1);
> +
> +	/* Atomic reservation */
> +	pos = 1 + xadd((unsigned long *)&area[0], record_len);
> +	if (unlikely(pos + record_len > max_pos)) {
> +		xadd((unsigned long *)&area[0], -(long)record_len);
> +		return;
> +	}
> +
> +	seq = ++t->kcov_dataflow_seq;
> +	area[pos] = type_marker | (seq & 0x00FFFFFFULL);
> +	area[pos + 1] = pc;
> +	area[pos + 2] = meta;
> +
> +	if (num_fields == 0) {
> +		/* Scalar: read value from ptr using size from meta */
> +		u64 val = 0;
> +		u32 sz = (meta >> 48) & 0xFF;
> +
> +		if (sz > sizeof(val))
> +			sz = sizeof(val);
> +		if (ptr && !KCOV_DF_IS_ERR(ptr))
> +			copy_from_kernel_nofault(&val, ptr, sz);
> +		area[pos + 3] = val;
> +	} else {
> +		/* Struct fields */
> +		if (KCOV_DF_IS_ERR(ptr)) {
> +			for (i = 0; i < num_fields; i++)
> +				area[pos + 3 + i] = KCOV_DF_MAGIC_BAD;
> +			return;
> +		}
> +		for (i = 0; i < num_fields; i++) {
> +			u64 off, sz, val = KCOV_DF_MAGIC_BAD;
> +			void *fa;
> +
> +			if (copy_from_kernel_nofault(&off, &offsets[i * 2], sizeof(off)) ||
> +			    copy_from_kernel_nofault(&sz, &offsets[i * 2 + 1], sizeof(sz))) {
> +				area[pos + 3 + i] = KCOV_DF_MAGIC_BAD;
> +				continue;
> +			}
> +			fa = (void *)((unsigned long)ptr + off);
> +			val = 0;
> +			if (sz <= sizeof(val))
> +				copy_from_kernel_nofault(&val, fa, sz);
> +			else
> +				copy_from_kernel_nofault(&val, fa, sizeof(val));
> +			area[pos + 3 + i] = val;
> +		}
> +	}
> +}
> +
> +#ifdef CONFIG_KCOV_DATAFLOW_ARGS
> +noinline void notrace __no_sanitize_coverage
> +__sanitizer_cov_trace_args(u64 pc, u32 arg_idx, u32 arg_size, void *arg_ptr,
> +			   u64 *offsets, u32 num_fields);
> +
> +noinline void notrace __no_sanitize_coverage
> +__sanitizer_cov_trace_args(u64 pc, u32 arg_idx, u32 arg_size, void *arg_ptr,
> +			   u64 *offsets, u32 num_fields)
> +{
> +	/* meta: [arg_idx(8) | arg_size(8) | ptr(48)] */
> +	u64 meta = ((u64)arg_idx << 56) | ((u64)arg_size << 48) |
> +		   ((u64)(unsigned long)arg_ptr & 0xFFFFFFFFFFFFULL);
> +	kcov_df_write(KCOV_DF_TYPE_ENTRY, pc, meta, arg_ptr,
> +		      offsets, num_fields);
> +}
> +EXPORT_SYMBOL(__sanitizer_cov_trace_args);
> +#endif
> +
> +#ifdef CONFIG_KCOV_DATAFLOW_RET
> +noinline void notrace __no_sanitize_coverage
> +__sanitizer_cov_trace_ret(u64 pc, u32 ret_size, void *ret_val,
> +			  u64 *offsets, u32 num_fields);
> +
> +noinline void notrace __no_sanitize_coverage
> +__sanitizer_cov_trace_ret(u64 pc, u32 ret_size, void *ret_val,
> +			  u64 *offsets, u32 num_fields)
> +{
> +	u64 meta = ((u64)ret_size << 48) |
> +		   ((u64)(unsigned long)ret_val & 0xFFFFFFFFFFFFULL);
> +	kcov_df_write(KCOV_DF_TYPE_RET, pc, meta, ret_val,
> +		      offsets, num_fields);
> +}
> +EXPORT_SYMBOL(__sanitizer_cov_trace_ret);
> +#endif
> +
> +/* --- /sys/kernel/debug/kcov_dataflow file operations --- */
> +
> +static int kcov_df_open(struct inode *inode, struct file *filep)
> +{
> +	struct kcov_dataflow *df;
> +
> +	df = kzalloc(sizeof(*df), GFP_KERNEL);
> +	if (!df)
> +		return -ENOMEM;
> +	spin_lock_init(&df->lock);
> +	refcount_set(&df->refcount, 1);
> +	filep->private_data = df;
> +	return nonseekable_open(inode, filep);
> +}
> +
> +static int kcov_df_close(struct inode *inode, struct file *filep)
> +{
> +	struct kcov_dataflow *df = filep->private_data;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&df->lock, flags);
> +	if (df->t == current) {
> +		current->kcov_df_enabled = false;
> +		current->kcov_df_area = NULL;
> +		current->kcov_df_size = 0;
> +		df->t = NULL;
> +	}
> +	spin_unlock_irqrestore(&df->lock, flags);
> +	kcov_df_put(df);
> +	return 0;
> +}
> +
> +static int kcov_df_mmap(struct file *filep, struct vm_area_struct *vma)
> +{
> +	struct kcov_dataflow *df = filep->private_data;
> +	unsigned long size, off;
> +	struct page *page;
> +	unsigned long flags;
> +	void *area;
> +	int res = 0;
> +
> +	spin_lock_irqsave(&df->lock, flags);
> +	size = df->size * sizeof(u64);
> +	if (!df->area || vma->vm_pgoff != 0 ||
> +	    vma->vm_end - vma->vm_start != size) {
> +		res = -EINVAL;
> +		goto out;
> +	}
> +	area = df->area;
> +	spin_unlock_irqrestore(&df->lock, flags);
> +
> +	vm_flags_set(vma, VM_DONTEXPAND);
> +	for (off = 0; off < size; off += PAGE_SIZE) {
> +		page = vmalloc_to_page(area + off);
> +		res = vm_insert_page(vma, vma->vm_start + off, page);
> +		if (res)
> +			return res;
> +	}
> +	return 0;
> +out:
> +	spin_unlock_irqrestore(&df->lock, flags);
> +	return res;
> +}
> +
> +static long kcov_df_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> +{
> +	struct kcov_dataflow *df = filep->private_data;
> +	unsigned long flags;
> +	unsigned long size;
> +	int res = 0;
> +
> +	spin_lock_irqsave(&df->lock, flags);
> +	switch (cmd) {
> +	case KCOV_DF_INIT_TRACE:
> +		if (df->area) {
> +			res = -EBUSY;
> +			break;
> +		}
> +		size = arg;
> +		if (size < 2 || size > (128 << 20) / sizeof(u64)) {
> +			res = -EINVAL;
> +			break;
> +		}
> +		spin_unlock_irqrestore(&df->lock, flags);
> +		df->area = vmalloc_user(size * sizeof(u64));
> +		if (!df->area)
> +			return -ENOMEM;
> +		spin_lock_irqsave(&df->lock, flags);
> +		df->size = size;
> +		break;
> +
> +	case KCOV_DF_ENABLE:
> +		if (!df->area || df->t) {
> +			res = -EINVAL;
> +			break;
> +		}
> +		df->t = current;
> +		current->kcov_df_area = df->area;
> +		current->kcov_df_size = df->size;
> +		current->kcov_dataflow_seq = 0;
> +		/* Barrier before enabling */
> +		barrier();
> +		current->kcov_df_enabled = true;
> +		break;
> +
> +	case KCOV_DF_DISABLE:
> +		if (df->t != current) {
> +			res = -EINVAL;
> +			break;
> +		}
> +		current->kcov_df_enabled = false;
> +		barrier();
> +		current->kcov_df_area = NULL;
> +		current->kcov_df_size = 0;
> +		df->t = NULL;
> +		break;
> +
> +	default:
> +		res = -ENOTTY;
> +	}
> +	spin_unlock_irqrestore(&df->lock, flags);
> +	return res;
> +}
> +
> +static const struct file_operations kcov_df_fops = {
> +	.open		= kcov_df_open,
> +	.unlocked_ioctl	= kcov_df_ioctl,
> +	.compat_ioctl	= kcov_df_ioctl,
> +	.mmap		= kcov_df_mmap,
> +	.release	= kcov_df_close,
> +};
> +#endif /* CONFIG_KCOV_DATAFLOW_ARGS || CONFIG_KCOV_DATAFLOW_RET */
> +
>  static void kcov_start(struct task_struct *t, struct kcov *kcov,
>  			unsigned int size, void *area, enum kcov_mode mode,
>  			int sequence)
> @@ -1146,6 +1428,15 @@ static int __init kcov_init(void)
>  	 */
>  	debugfs_create_file_unsafe("kcov", 0600, NULL, NULL, &kcov_fops);
>  
> +#if defined(CONFIG_KCOV_DATAFLOW_ARGS) || defined(CONFIG_KCOV_DATAFLOW_RET)
> +	/*
> +	 * Toggle verbose printk: echo 1 > /sys/kernel/debug/kcov_dataflow_verbose
> +	 * Default off — zero overhead when not debugging.
> +	 */
> +	debugfs_create_file_unsafe("kcov_dataflow", 0600, NULL, NULL,
> +				   &kcov_df_fops);
> +#endif
> +
>  #ifdef CONFIG_KCOV_SELFTEST
>  	selftest();
>  #endif
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index e2f976c3301b..abd1a94589aa 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2261,6 +2261,28 @@ config KCOV_SELFTEST
>  	  On test failure, causes the kernel to panic. Recommended to be
>  	  enabled, ensuring critical functionality works as intended.
>  
> +
> +config KCOV_DATAFLOW_ARGS
> +	bool "Enable KCOV dataflow: function argument capture"
> +	depends on KCOV
> +	depends on $(cc-option,-fsanitize-coverage=dataflow-args)
> +	help
> +	  Captures function arguments at entry via /sys/kernel/debug/kcov_dataflow.
> +	  Struct pointer arguments are auto-expanded using compiler DebugInfo
> +	  metadata, recording individual field values at runtime.
> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
> +	  Requires clang with -fsanitize-coverage=dataflow-args support.
> +
> +config KCOV_DATAFLOW_RET
> +	bool "Enable KCOV dataflow: return value capture"
> +	depends on KCOV
> +	depends on $(cc-option,-fsanitize-coverage=dataflow-ret)
> +	help
> +	  Captures function return values via /sys/kernel/debug/kcov_dataflow.
> +	  Struct pointer returns are auto-expanded using compiler DebugInfo
> +	  metadata, recording individual field values at runtime.
> +	  Enable per-module with: KCOV_DATAFLOW_file.o := y in the Makefile.
> +	  Requires clang with -fsanitize-coverage=dataflow-ret support.

You might want to add an empty line here.


-- 
Nicolas

