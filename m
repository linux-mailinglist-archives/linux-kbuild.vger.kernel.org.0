Return-Path: <linux-kbuild+bounces-13574-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id STaeJ87yIWpMQwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-13574-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 23:49:02 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC2643AF4
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 23:49:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=oOJtH3Ws;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13574-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13574-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D86873035854
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 21:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EEF73783AD;
	Thu,  4 Jun 2026 21:48:52 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E483A329E6C;
	Thu,  4 Jun 2026 21:48:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780609731; cv=none; b=Stzr4rNzyKtVbicycBzadsGwUY9h+Bj3dHsVR75V7lmSXuGySIVGhLcnXHG6x1fTIepaD9umtxUZtZ7hEbI6pCDoVw2P8lYXnpRwoFTDtTABOOdaJsncihePKcvLtD8Ea9/GaxSTjAU4v5As77OZh7rwGKyNM4sqlKDYoq4LzXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780609731; c=relaxed/simple;
	bh=iK7nDkaVl+kbc7PjAEoaEgaDEKAIkheFFI1yWCxh/uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLvbVHmrIlsDwkcItFk/QJBBJkwwBsFhSMXbBuLWAKGbxZ53qY67wfHTlehJu480XBjC80idK6siy3tEDgF/lWkrLkuwMk/VA9MvJ5eUd9ELhulo9WXw1VkVApyd6N0Wo9XXm+vtYqX+0B/dBCZipmcXzhJC2LtLgDv1OpPimSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOJtH3Ws; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45EC31F00893;
	Thu,  4 Jun 2026 21:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780609730;
	bh=hccU/NDSuAvcNj2qshs5G5T8N2B5+zR4AKzNjS5QKDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oOJtH3WswuxaSXCBwtdBZdGgqvPxMl2AxmgsBn1Q7sv9bv+2fIQpUu8P6psX9SraE
	 lSBE1kDOlOcCkxwq1Te5aY2Bf5gUb74/snkw1zcC7CzFdqpd4Avhfe2fsm750odqgS
	 O59dMX2g/aDU3jKvEKl8txbOdj8B+U3/SsyEk2xAP8EUrnd4KHHvI+btOw06/4rK2Q
	 taz///r7YoJ8dRaGduBLFDxVhYonPuOrFN7EFKzndPcRwg/FSeYlsjY8zFKlhD4Wob
	 HX+achzSxwGdodU9S7+z5XB058pkm5Q/iau8rvefFGQqQMoYtL2OOWHLyI0pZM4xE6
	 OCPIVEZUZh7Aw==
Date: Thu, 4 Jun 2026 14:48:40 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Yunseong Kim <yunseong.kim@est.tech>, Ingo Molnar <mingo@redhat.com>,
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
Message-ID: <20260604214840.GA3915915@ax162>
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
 <20260603-kcov-dataflow-next-20260603-v2-2-fee0939de2c4@est.tech>
 <20260604084519.GA3126523@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604084519.GA3126523@noisy.programming.kicks-ass.net>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13574-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:peterz@infradead.org,m:yunseong.kim@est.tech,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:dvyukov@google.com,m:andreyknvl@gmail.com,m:akpm@linux-foundation.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:nsc@kernel.org,m:ojeda@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-kernel@vger.kernel.org,m:kasan-dev@googlegroups.com,m:llvm@lists.linux.dev,m:linux-kbuild@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:workflows@vger.kernel.org,m:linux-doc@vger.kernel.org,m:ysk@kzalloc.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[est.tech,redhat.com,linaro.org,arm.com,goodmis.org,google.com,suse.de,amd.com,gmail.com,linux-foundation.org,kernel.org,garyguo.net,protonmail.com,umich.edu,lwn.net,linuxfoundation.org,vger.kernel.org,googlegroups.com,lists.linux.dev,kzalloc.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CBC2643AF4

On Thu, Jun 04, 2026 at 10:45:19AM +0200, Peter Zijlstra wrote:
> On Wed, Jun 03, 2026 at 07:43:29PM +0200, Yunseong Kim wrote:
> > Add CFLAGS_KCOV_DATAFLOW and RUSTFLAGS_KCOV_DATAFLOW exports to
> > scripts/Makefile.kcov, containing:
> >   -fsanitize-coverage=dataflow-args,dataflow-ret -g
> >   (with optional -fno-inline via CONFIG_KCOV_DATAFLOW_NO_INLINE)
> > 
> > scripts/Makefile.lib applies these flags when a module's Makefile sets:
> >   KCOV_DATAFLOW_file.o := y   (per-file)
> >   KCOV_DATAFLOW := y          (per-directory)
> > 
> > Also supports CONFIG_KCOV_DATAFLOW_INSTRUMENT_ALL for global enablement.
> > The flags are only applied to kernel objects (same guard as basic KCOV).
> > 
> > Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> > ---
> >  scripts/Makefile.kcov | 6 ++++++
> >  scripts/Makefile.lib  | 7 +++++++
> >  2 files changed, 13 insertions(+)
> > 
> > diff --git a/scripts/Makefile.kcov b/scripts/Makefile.kcov
> > index 78305a84ba9d..101173fe194b 100644
> > --- a/scripts/Makefile.kcov
> > +++ b/scripts/Makefile.kcov
> > @@ -2,10 +2,16 @@
> >  kcov-flags-y					+= -fsanitize-coverage=trace-pc
> >  kcov-flags-$(CONFIG_KCOV_ENABLE_COMPARISONS)	+= -fsanitize-coverage=trace-cmp
> >  
> > +# KCOV dataflow: trace function args and return values
> > +kcov-dataflow-flags-y := -fsanitize-coverage=dataflow-args,dataflow-ret -g
> > +kcov-dataflow-flags-$(CONFIG_KCOV_DATAFLOW_NO_INLINE) += -fno-inline
> 
> https://clang.llvm.org/docs/ClangCommandLineReference.html
> 
> Has no mention of -fno-inline, furthermore, what are the exact
> semantics? Does it inhibit __always_inline?
> 

Based on clang/test/CodeGen/always-inline.c [1], I believe the semantics
are the same as GCC's '-fno-inline' [2], which avoids inlining except
for always_inline functions.

[1]: https://github.com/llvm/llvm-project/blob/1d13b74cf086629d5cdae5f44ef4a62cebcaf3ff/clang/test/CodeGen/always-inline.c
[2]: https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html#index-fno-inline

-- 
Cheers,
Nathan

