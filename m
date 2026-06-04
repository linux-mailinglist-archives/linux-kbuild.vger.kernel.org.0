Return-Path: <linux-kbuild+bounces-13571-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qyLADr4/IWq9BwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13571-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 11:05:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F6E63E514
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 11:05:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=casper.20170209 header.b=CL5yX7gu;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13571-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13571-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 718D9300CFC7
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 08:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041523DB33B;
	Thu,  4 Jun 2026 08:52:55 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEC63C9ED6;
	Thu,  4 Jun 2026 08:52:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563174; cv=none; b=W68K0NPByRoP9aZWfGNpSRnb+MjDgE3boCYtbp3AwjzfwqbcyreeQYiZhu/EPKvbAErAjDAtxHjO7RoTfETFRYg6xJEtqNdKr/MIgrOaJDbIUKGxDepYujsBG8XegiMQaCLsDuPwCIWKiluHFXkhoNTDDJoTmauPOQ81QI1PMJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563174; c=relaxed/simple;
	bh=Z9qW52xw2v9DBLSiydJCHgrUN8NPyZ/1G6ef/sKILWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oC0OcGviN72n8JWDG3EJp6M3k5UMUDI/MJl4H7UQD4XzByLSedC0ahOlr05kIDABodX1kyz5EtuvJSwArZTVkQ/kWU2vBdJFv4eWjwGH2A61oY7vXCDXFGBSd322hgaAbvyiEwLJUg7x+JYMbeTzqhNVE3Xtte4E3BRatRLVFTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=CL5yX7gu; arc=none smtp.client-ip=90.155.50.34
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6tI9/y+X+xZ79PrI57JmKszz1dgu7wPk4F5jzgpriT0=; b=CL5yX7guiYMkyCUe4gdSRiiXrT
	/Re/UCoWOLkXpo8Zck95jp05jDNkcBlaj5b596hvjWJdK2aAs6dz1jEmnPI46NkHIpHpogQbKdyLc
	iO3KmET4rxhPN5IFojpgT0ylSDSejS9DNvjNiUshCt5Rwe8CXwjd8mb44qWuzUfa6ZfWRRxw4ZPFD
	oB7r83j3cs7Gl26n95lfecEA7uD3gTp9XBz05C4Pana8RS1qa1EzEMGQlwksDCYGZlSUKx/wbomzy
	kmWKSjhgDe/1Vmeyufl4YauHPTn+Eo2fhSMKiZFLcLfRGk6h6YEgV6Rw5IPMccFouPJDnwrnEqBek
	JORsfEBQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV3oh-00000005TSm-1svG;
	Thu, 04 Jun 2026 08:52:44 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 55E6F3001FD; Thu, 04 Jun 2026 10:52:43 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:52:43 +0200
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
Subject: Re: [RFC PATCH v2 6/6] kcov: add recursion guard and documentation
 for kcov-dataflow
Message-ID: <20260604085243.GD3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-6-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-6-fee0939de2c4@est.tech>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=casper.20170209];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13571-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:from_mime,infradead.org:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,noisy.programming.kicks-ass.net:mid,est.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97F6E63E514

On Wed, Jun 03, 2026 at 07:43:33PM +0200, Yunseong Kim wrote:
> Add a per-task recursion guard to kcov_df_write() using the high bit of
> kcov_dataflow_seq. This prevents infinite recursion when
> CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL is enabled: functions called by the
> callback itself (copy_from_kernel_nofault, xadd helpers) are also
> instrumented and would re-enter kcov_df_write() without this guard.
> 
> The guard uses the sequence counter's bit 31 as a re-entrancy flag.
> The low 24 bits (used for TLV record sequence numbers) are unaffected.
> 
> Also:
> - Exclude kcov.o, extable.o, softirq.o from dataflow instrumentation
>   (same pattern as KCOV_INSTRUMENT exclusions)
> - Add Documentation/dev-tools/kcov-dataflow.rst with:
>   - Prerequisites and Kconfig options
>   - Per-module instrumentation instructions
>   - Complete C example for data collection
>   - Ring buffer format specification
>   - Ioctl interface reference
>   - Fork interception example for child process tracing
>   - Rust module support via post-compilation pipeline
> 
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>

Another really weird patch. Adding Documentation is okay I suppose,
although I still utterly detest this rst crap. I still fail to see
what's wrong with plain text :-(

But then you do these two other random things in the same patch. Which
make no sense.

> diff --git a/kernel/Makefile b/kernel/Makefile
> index 1e1a31673577..9c56421c5390 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -37,6 +37,7 @@ KCOV_INSTRUMENT_extable.o := n
>  KCOV_INSTRUMENT_stacktrace.o := n
>  # Don't self-instrument.
>  KCOV_INSTRUMENT_kcov.o := n
> +KCOV_DATAFLOW_kcov.o := n
>  # If sanitizers detect any issues in kcov, it may lead to recursion
>  # via printk, etc.
>  KASAN_SANITIZE_kcov.o := n
> @@ -207,3 +208,5 @@ $(obj)/kheaders.md5: $(obj)/kheaders-srclist FORCE
>  	$(call filechk,kheaders_md5sum)
>  
>  clean-files := kheaders.md5 kheaders-srclist kheaders-objlist
> +KCOV_DATAFLOW_extable.o := n
> +KCOV_DATAFLOW_softirq.o := n

Why?!?! You Changelog also does not elucidate.

> diff --git a/kernel/kcov.c b/kernel/kcov.c
> index 373b8034ca5c..8d9d5e33549f 100644
> --- a/kernel/kcov.c
> +++ b/kernel/kcov.c
> @@ -413,6 +413,16 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>  	if (!in_task())
>  		return;
>  
> +	/*
> +	 * Prevent recursion: functions called by this callback
> +	 * (copy_from_kernel_nofault, xadd helpers) may be instrumented
> +	 * with INSTRUMENT_ALL. Use a per-task guard via the sequence
> +	 * counter's high bit.
> +	 */
> +	if (t->kcov_dataflow_seq & (1U << 31))
> +		return;
> +	t->kcov_dataflow_seq |= (1U << 31);
> +
>  	area = (u64 *)t->kcov_df_area;
>  	if (!area)
>  		return;
> @@ -449,7 +459,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>  		if (KCOV_DF_IS_ERR(ptr)) {
>  			for (i = 0; i < num_fields; i++)
>  				area[pos + 3 + i] = KCOV_DF_MAGIC_BAD;
> -			return;
> +			goto out;
>  		}
>  		for (i = 0; i < num_fields; i++) {
>  			u64 off, sz, val = KCOV_DF_MAGIC_BAD;
> @@ -469,6 +479,8 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *ptr,
>  			area[pos + 3 + i] = val;
>  		}
>  	}
> +out:
> +	t->kcov_dataflow_seq &= ~(1U << 31);
>  }
>  
>  #ifdef CONFIG_KCOV_DATAFLOW_ARGS

This needs barrier()s to be functional. And should be in a separate
patch.

