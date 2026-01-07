Return-Path: <linux-kbuild+bounces-10437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E244CCFE0A3
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 14:45:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 965133001806
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 13:45:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71AD34105B;
	Wed,  7 Jan 2026 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="diRQGJsv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B25A340D9E;
	Wed,  7 Jan 2026 13:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793216; cv=none; b=Qpns04F/TBvcklA9ghme+ZZizmFmT0z1ZUK6gIIC9WMHfeY/qumXzCVtRGD+5u7EsYsXdKJWIzB4WQWAyOroFBFp1O9xqIUusA8ptVi9BaDoPUwAR6Aq4dKYoSeqZvx/CpP+4GSEU1ySRCMrBP6Fu48jfKR0ghD3SPxQjTTo08M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793216; c=relaxed/simple;
	bh=bkmcM2Tj+34ZMJvuxts6z25Z9OzVU2xOhSRLpeYYIkQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X2BPV9xaaG98xniMWfN8Kt6eQYH13PzumoO6RcCG+5coNqB/1+8MKM2K/OXvTZPBcom1cLT6iXDFOM6jA6JEpLZcxkfFOk7/g47mnQZVUQCid8eBwT0RfxGkHXh+t/22iiG/1ItSbgKKkRYDGGimk0nMQ8/7wjDDOUk0RIN623U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=diRQGJsv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16811C19422;
	Wed,  7 Jan 2026 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767793216;
	bh=bkmcM2Tj+34ZMJvuxts6z25Z9OzVU2xOhSRLpeYYIkQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=diRQGJsvp5HsGoG+0YkZ3zhXz9oXYZYA7RFEYuNAaEdA/crlPfbp6TrLhzw8YKTJ2
	 uADNq5sebRFRHGYRsahgEcf8hT9x5a+SXEcivckPucM6V6qqbSe2dhj8WWaztyl4p0
	 5Qxcfq8kISRzJDpCftu37FcGy17tYlvNTVPcDXio6IiAgs/4jD9KgjJyI5n0GnIVch
	 ujhL55zrpwLqhWi7ElfVQcdp3YJ/AzPFIgAN4rbtaYZAga/U0jvvjQEfcJYV9e19l7
	 m5C449W7qboRqkSOZKetJDjzNQg5c3cvcNCVlivDUw/uEURByXNrgsblI4cw/vRAw4
	 0tnDNdL2tAQlw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Alexandre
 Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, Nicolas Schier
 <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
In-Reply-To: <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
 <QViERQV7XT0BjTfSSyP6vzQc4AYxosyF5TEZ5kRu8AVWjmGCP_5n5V2AV2hjqVza8-jvzyquH3JLJA1zvbRD9w==@protonmail.internalid>
 <20260107123528.GF2393663@noisy.programming.kicks-ass.net>
 <87sechh8id.fsf@t14s.mail-host-address-is-not-set>
 <un386uEr3TEFzLpGCdZg_Tzm63zO7Ze6IZN16Cz79EfWmEI_hZXbBvhG2enZmUXJ6DUnCMNm7QIz-agEYIDr9A==@protonmail.internalid>
 <20260107131822.GD3707837@noisy.programming.kicks-ass.net>
Date: Wed, 07 Jan 2026 14:40:04 +0100
Message-ID: <87pl7lh77v.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Peter Zijlstra" <peterz@infradead.org> writes:

> On Wed, Jan 07, 2026 at 02:12:10PM +0100, Andreas Hindborg wrote:
>> "Peter Zijlstra" <peterz@infradead.org> writes:
>>
>> > On Wed, Jan 07, 2026 at 01:23:38PM +0100, Andreas Hindborg wrote:
>> >> Hi Alice,
>> >>
>> >> Alice Ryhl <aliceryhl@google.com> writes:
>> >>
>> >> > Currently the only way for Rust code to call a static inline function is
>> >> > to go through a helper in rust/helpers/. This introduces performance
>> >> > costs due to additional function calls and also clutters backtraces and
>> >> > flame graphs with helper symbols.
>> >> >
>> >> > To get rid of these helper symbols, provide functionality to inline
>> >> > helpers into Rust using llvm-link. This option complements full LTO, by
>> >> > being much cheaper and avoiding incompatibility with BTF.
>> >> >
>> >> > I ran a microbenchmark showing the benefit of this. All the benchmark
>> >> > does is call refcount_inc() in a loop. This was chosen since refcounting
>> >> > is quite hot in Binder. The results are that Rust spends 6.35 ns per
>> >> > call vs 5.73 ns per call in C. When enabling this option, the two
>> >> > languages become equally fast, and disassembly confirms the exact same
>> >> > machine code is used (in particular there is no call to
>> >> > rust_helper_refcount_inc). Benchmarking Binder also results in an
>> >> > improvement from this change.
>> >> >
>> >> > This patch is complementary to:
>> >> > https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
>> >> >
>> >> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>> >>
>> >> I get the following modpost errors when building with this applied on top
>> >> of v6.19-rc4:
>> >>
>> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
>> >> ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!
>> >
>> > Looks like it used the wrong static_call_mod() version, was MODULE
>> > defined?
>>
>> CONFIG_MODULES=y, yes
>>
>> I built without the patch first, then applied the series, enabled the
>> option via menuconfig and ran the build. I thought maybe some dependency
>> check is messed up so I retried the build from a clean state. Same
>> result.
>
> No, I mean -DMODULE. Note how the quiet_cmd_bindgen target has -DMODULE,
> but the new quiet_cmd_rust_helper target does not.

Ah, that did the trick, thanks!

  diff --git a/rust/Makefile b/rust/Makefile
  index 5365d53b6cf96..08d3dc1038cf5 100644
  --- a/rust/Makefile
  +++ b/rust/Makefile
  @@ -483,7 +483,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers/helpers.c FORCE

  quiet_cmd_rust_helper = HELPER  $@
        cmd_rust_helper = \
  -	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) -c -g0 $< -emit-llvm -o $@
  +	$(CC) $(filter-out $(CFLAGS_REMOVE_helpers/helpers.o), $(c_flags)) -DMODULE -c -g0 $< -emit-llvm -o $@

  $(obj)/helpers/helpers.bc: $(obj)/helpers/helpers.c FORCE
    +$(call if_changed_dep,rust_helper)

Is -DMOUDLE always appropriate to pass to the helpers? The helpers are
also inlined into non module code.

Best regards,
Andreas Hindborg



