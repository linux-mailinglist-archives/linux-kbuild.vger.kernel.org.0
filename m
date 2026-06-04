Return-Path: <linux-kbuild+bounces-13570-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z3g6FuQ/IWrDBwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13570-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 11:05:40 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1B863E524
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 11:05:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=eWf5vZkN;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13570-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13570-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 39D33317064F
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 08:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47CF23E5ECB;
	Thu,  4 Jun 2026 08:48:45 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FFA3E5A15;
	Thu,  4 Jun 2026 08:48:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562925; cv=none; b=TFx9Gd/13sttmij+K3qXs2rNw24yOdS1ZnAM+zKcAW+EAYnKC5vh5D0Sihtsn6MxDVVeVv3uXD8DLmcQdbDks8TIy7PslVKyU2dIYS4MKn3jE82U+dyvQTT11SFPkpeQ+2/lNZpVWL5Dyk6TKBabH2AcNTYRUfgK7b9yeZafWQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562925; c=relaxed/simple;
	bh=NUlw7eaZP20p7zMoTw7IKgOJQgvSYL+Su9P2Q+5sGUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CfLuui85XyLmq7t7BLsoa83LB36Y6uZ8DOr0opRQTFIs2RNcZ9a8Maqb6biWf5Zc91f0un1PI0dLcDnVeS4I0PPwnWbCmIi5SVuIIczCgkmmsIwH7WGv4gKtWTDnSVvkMl1LWX2R0hfT8efkupmu2NcNxTQ4j7I8oqoreCLPHcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eWf5vZkN; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=V3szt4C2gXUkQem9dC12cuLFjiU648iY6P8OSIZrPVM=; b=eWf5vZkN1e1NoCeaakt2kYZzU9
	figkJSwQiEgbdaqezeSwbltNjKBHMx9GZsCw/zMZeq3YYf0zzZ+6gcYojp+QeHQJdr9efCeN5So16
	P6kMZNTH+yS8TEnGCWaUk6qQFLxrVn+8E60mT5HTO7ahmYKpZgw85wsBtjDF38gkiTbfA/yHYtuxX
	zDu/dzZ+XNYNH5Ja092sHCPjlb5bNUgXuSAoM43sLnF+oOPthHY1vZIx0lyWRJ4fp9gNpMyaNvJHo
	wJESx+BKfemL5P+L+oMG88mqNpxFVX3bHe5FMHFLcxHuPwgXfTixipV8Nf8qf9yYFT443Y59DxQjK
	0hSdZE6g==;
Received: from 2001-1c00-8d85-4b00-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:4b00:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV3kf-0000000E5f5-0jy9;
	Thu, 04 Jun 2026 08:48:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 065083001FD; Thu, 04 Jun 2026 10:48:31 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:48:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
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
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
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
Subject: Re: [RFC PATCH v2 5/6] kcov: add interrupt context guard to
 kcov_df_write()
Message-ID: <20260604084830.GC3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-5-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-5-fee0939de2c4@est.tech>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13570-lists,linux-kbuild=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yunseong.kim@est.tech,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peterz@infradead.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[infradead.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,noisy.programming.kicks-ass.net:mid,infradead.org:from_mime,infradead.org:dkim,est.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9F1B863E524

On Wed, Jun 03, 2026 at 07:43:32PM +0200, Yunseong Kim wrote:
> The KCOV-Dataflow write path (kcov_df_write) only checks
> t->kcov_df_enabled before writing to the shared ring buffer. Unlike
> the standard KCOV check_kcov_mode() which rejects interrupt context,
> kcov_df_write() has no such protection. This means instrumented code
> running in hardirq, softirq, or NMI context that interrupts a task
> mid-write can re-enter kcov_df_write(), causing:
> 
>  - Data corruption in the ring buffer (interleaved records)
>  - Out-of-order sequence counter increments
>  - Potential faults from nested pointer dereferences
> 
> Add an in_task() check to reject calls from non-task context, matching
> the safety model of the standard KCOV tracing path.
> 
> Also suppress -Wmissing-prototypes in the eight_args_c test module
> Makefile, as the exported test functions intentionally lack a shared
> header.
> 
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov.c                             | 4 ++++
>  tools/kcov-dataflow/eight_args_c/Makefile | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index d3c9c0efe961..373b8034ca5c 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -409,6 +409,10 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>  	if (!t->kcov_df_enabled)
>  		return;
>  
> +	/* Reject calls from hardirq/softirq/NMI to prevent reentrant corruption. */
> +	if (!in_task())
> +		return;
> +
>  	area = (u64 *)t->kcov_df_area;
>  	if (!area)
>  		return;
> diff --git a/tools/kcov-dataflow/eight_args_c/Makefile b/tools/kcov-dataflow/eight_args_c/Makefile
> index de35bb541f07..038775b49435 100644
> --- a/tools/kcov-dataflow/eight_args_c/Makefile
> +++ b/tools/kcov-dataflow/eight_args_c/Makefile
> @@ -1,2 +1,3 @@
>  obj-m := eight_args_mod.o
>  KCOV_DATAFLOW_eight_args_mod.o := y
> +ccflags-y += -Wno-missing-prototypes

This is a weird commit and probably should not exist. You introduce
kcov_df_write() a few patches ago, why doesn't it add these few lines
there?

Similarly, you introduce this tools thing a few patches ago, fix the
Makefile there?

