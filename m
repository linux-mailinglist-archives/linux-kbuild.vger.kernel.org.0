Return-Path: <linux-kbuild+bounces-13568-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +4YdGmw+IWpBBwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13568-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 10:59:24 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7FA63E404
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 10:59:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=infradead.org header.s=desiato.20200630 header.b=UwKPae98;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13568-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13568-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=infradead.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C989303239C
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 08:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4855C3F65EB;
	Thu,  4 Jun 2026 08:45:33 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0223F661D;
	Thu,  4 Jun 2026 08:45:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780562733; cv=none; b=RUs23UEGzY1K3zRuhP3bbkIfm+6UKHJxRDN8RCm7nHh1YygzTGgDG36cuW7HL53u1ogzFbsLyVhMXs5k9ThpCwGzjoEZ5T8+vPUs334DEaA+Ndkk60x19dRgQNU6BaEJeDaynEENToLITGKUVtb2HLHbcP2gfn2abCFmKo3g0Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780562733; c=relaxed/simple;
	bh=6ATw/jDOm2Bg8ZU6yVv+w3S4Jjlj/GH14nAKmgFd9Do=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJc7Qa60GFOuPVcOpJjUYo3DHmiLDR5TysUx6DKrPJ9Qh7HQmjKnpRXGPsVthaXol01bj/xEDLWcRvKvYcOgYo10hsrLHX3KEZH/VrjsDqssakFXdsoNOnRXP6HeGRTbuPcvnatS2cBv1xqe2ow0NCyNVdpl/dA1DBS8rao5Oc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=UwKPae98; arc=none smtp.client-ip=90.155.92.199
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=g3BMk5ohjnfbiRgd2txp59JGh/kRY4Cer6gLXXyz3jE=; b=UwKPae98yl6026quA9inkgP9rx
	Y3/B13S6KJUmcvRO6LBrcEfgjh52WtSWtP+3N5YWYJIkiX7KbBb3mJ54ZGjuSV1Om2R//ltFV3D+Q
	bZd0AextTdnj8LfaeztOm75qQWZiSYe6v4uIwWFMNT3dWZBuRmxR7nDAvsq5tD7oVy1RvZFAkr5hY
	vrTW+C44bRqD1gaMQnLOnsbYhEpZ88XjFnuXuRUt8yw6rH16VyGXdCEqtpZdpAK2YLCxbLuNgPnAF
	PtoARNHJ/v2b2SMq8IEeFPjKN7E6PwS4VdYxPmhPafVsSvfDTv3zWFMe+P51d3EeXxsAXJshk8Ylm
	CMLOT2cA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV3hZ-0000000E5QO-0fPF;
	Thu, 04 Jun 2026 08:45:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 49529301218; Thu, 04 Jun 2026 10:45:19 +0200 (CEST)
Date: Thu, 4 Jun 2026 10:45:19 +0200
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
Subject: Re: [RFC PATCH v2 2/6] kcov: add build system support for dataflow
 instrumentation
Message-ID: <20260604084519.GA3126523@noisy.programming.kicks-ass.net>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=desiato.20200630];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-13568-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[noisy.programming.kicks-ass.net:mid,llvm.org:url,vger.kernel.org:from_smtp,infradead.org:from_mime,infradead.org:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,est.tech:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD7FA63E404

On Wed, Jun 03, 2026 at 07:43:29PM +0200, Yunseong Kim wrote:
> Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> scripts/Makefile.kcov, containing:
>   -fsanitize-coverage=dataflow-args,dataflow-ret -g
>   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
> 
> scripts/Makefile.lib applies these flags when a module's Makefile sets:
>   KCOV_DATAFLOW_file.o := y   (per-file)
>   KCOV_DATAFLOW := y          (per-directory)
> 
> Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> The flags are only applied to kernel objects (same guard as basic KCOV).
> 
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  scripts/Makefile.kcov | 6 ++++++
>  scripts/Makefile.lib  | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> index 78305a84ba9d..101173fe194b 100644
> --- a/scripts/Makefile.kcov
> +++ b/scripts/Makefile.kcov
> @@ -2,10 +2,16 @@
>  kcov-flags-y					+= -fsanitize-coverage=trace-pc
>  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
>  
> +# KCOV dataflow: trace function args and return values
> +kcov-dataflow-flags-y := -fsanitize-coverage=dataflow-args,dataflow-ret -g
> +kcov-dataflow-flags-$(CONFIG_KCOV_DATAFLOW_NO_INLINE) += -fno-inline

https://clang.llvm.org/docs/ClangCommandLineReference.html

Has no mention of -fno-inline, furthermore, what are the exact
semantics? Does it inhibit __always_inline?


