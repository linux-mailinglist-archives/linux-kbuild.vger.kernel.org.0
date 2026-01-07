Return-Path: <linux-kbuild+bounces-10436-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C9776CFDE2B
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 14:18:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 44F593002BB9
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 13:18:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C60324B0C;
	Wed,  7 Jan 2026 13:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="b7ZiARls"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682AE31282D;
	Wed,  7 Jan 2026 13:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767791915; cv=none; b=tc6lUkIF664uB40bbMMJUK/t2tBe7F+pQbfidr89NfM4/ofubby8nTJh+jRA9Bu5eiKl6JgRSkgQrvLM4AMkIoeKxnCWOWzuIdBT9XrVzQLiSCXEF6RKykXgjRGPbiLTNfgRrhppbUSur1P99BSqJmnGW5BUxH9Gx21UKRAmY2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767791915; c=relaxed/simple;
	bh=Okfi6c5JrncNYBdkDkbWePxwTkWTziT6fzdpikOfimc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YSj8twnu6r7q+u+lMmAwkhxnlkraFq1BQ2rIoU0Y1XKR2nEociJgQpjhkfZThs+b7cndxRR3HfZuUGjQw8gHSD6xgf4VhC6r/zyEpftbpVV1U0AjCzl9yX4jMhT8s5MoZ0JF01UDZJgIPmn64nr/9gtaQ75pCxf2oIsOLRDb5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=b7ZiARls; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ejt4fl24yJGg/IPMEl6Jv4QbwGGu9SxvkwuaJgTIHGU=; b=b7ZiARlsXX25ihUCbHGLFmeHdR
	trT2w4kGJe2ey5Dqhi0wkt8c5JQ2I1n6/+6raFF0v/sfQAOTyxcPASnmVgkIm0rPmi3ha6gZU1KyO
	imUU9sU1zgY6jfWzzVZxpU7k5Spiz4HrGK9jCVUYKOKOssBPBX2i35AFt2tq27VaaCJIL9n9q9a3Y
	V7V9La4+LPVZxQxZaTolRTOJlNJ6TfahCZNm4Cw9iT3251v64mUsk8/+kVEQ8+0XGbAf42WwORi3j
	sWGFexDVmSfPMrWJl781rZ4AvY2okDsgDJwwzn+q0MVqnFCYKYZbh4oqpBuDmKVeoucNv1YqYNkkt
	eVzl8k/w==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdTQd-0000000DPqp-1SFY;
	Wed, 07 Jan 2026 13:18:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0DCA830057E; Wed, 07 Jan 2026 14:18:22 +0100 (CET)
Date: Wed, 7 Jan 2026 14:18:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
Message-ID: <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
 <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sechh8id.fsf@t14s.mail-host-address-is-not-set>

On Wed, Jan 07, 2026 at 02:12:10PM +0100, Andreas Hindborg wrote:
> "Peter Zijlstra" <peterz@infradead.org> writes:
> 
> > On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
> >> Hi Alice,
> >>
> >> Alice Ryhl <aliceryhl@google.com> writes:
> >>
> >> > Currently the only way for Rust code to call a static inline function is
> >> > to go through a helper in rust/helpers/. This introduces performance
> >> > costs due to additional function calls and also clutters backtraces and
> >> > flame graphs with helper symbols.
> >> >
> >> > To get rid of these helper symbols, provide functionality to inline
> >> > helpers into Rust using llvm-link. This option complements full LTO, by
> >> > being much cheaper and avoiding incompatibility with BTF.
> >> >
> >> > I ran a microbenchmark showing the benefit of this. All the benchmark
> >> > does is call refcount_inc() in a loop. This was chosen since refcounting
> >> > is quite hot in Binder. The results are that Rust spends 6.35 ns per
> >> > call vs 5.73 ns per call in C. When enabling this option, the two
> >> > languages become equally fast, and disassembly confirms the exact same
> >> > machine code is used (in particular there is no call to
> >> > rust_helper_refcount_inc). Benchmarking Binder also results in an
> >> > improvement from this change.
> >> >
> >> > This patch is complementary to:
> >> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
> >> >
> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> >>
> >> I get the following modpost errors when building with this applied on top
> >> of v6.19-rc4:
> >>
> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!
> >
> > Looks like it used the wrong static_call_mod() version, was MODULE
> > defined?
> 
> CONFIG_MODULES=y, yes
> 
> I built without the patch first, then applied the series, enabled the
> option via menuconfig and ran the build. I thought maybe some dependency
> check is messed up so I retried the build from a clean state. Same
> result.

No, I mean -DMODULE. Note how the quiet_cmd_bindgen target has -DMODULE,
but the new quiet_cmd_rust_helper target does not.


