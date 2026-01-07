Return-Path: <linux-kbuild+bounces-10431-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE58CFDA40
	for <lists+linux-kbuild@lfdr.de>; Wed, 07 Jan 2026 13:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 43D9C3009220
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Jan 2026 12:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39FC32936E;
	Wed,  7 Jan 2026 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jsilMsD9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32337328628;
	Wed,  7 Jan 2026 12:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767788637; cv=none; b=HpH2IziFUJykzjK/UR+GW6lHgN81inP3Wl5ud9JQsTTyTvVua+b5+lbpYxYhKCq8FyP5ud6Hd733h2TOqeuiZo0EAxF6LK+5rVAYtQcP0Dbl/g9dhiIkidJrxNQIps0UmKUGIV3mPPrfr1stl4g2ff3/DCqObOiX9Yc4KcLpT+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767788637; c=relaxed/simple;
	bh=mZtM1KRXrNZPIjs0BP4nXfJn9/N+qtrTbb5tiAYIPzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oPpXQRZWQPxcr0R4JGTvH5gWsQQ2P1gEd+wtjbSt2XhfTIU8T8YscKNy7NAJ+nC9WNdmpdNOXcTPDTXUn6S+ge0esBJTL4PNQsI6unpGZYxRLtt1uKuu4khiM0zU28SUkSORV43v2gVXWsbQWwh/Le1XQwbC1VC0LvLhlR3Bpzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jsilMsD9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0535EC16AAE;
	Wed,  7 Jan 2026 12:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767788637;
	bh=mZtM1KRXrNZPIjs0BP4nXfJn9/N+qtrTbb5tiAYIPzg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jsilMsD9MU5vYOo+CLDlCD4K1PG/wWHtloGE+yTehzPOpuQxbC4VkaA5SDbLGwG+8
	 NoGTAZRmkN3B/N39tcHxDRacYTzE26znGZWG6DK9P1a24yxnyGqNw0NGTEOhL1cCDn
	 dVkYCJTcJdvV3AnC31ROUCNjK4WzEK0Rk0A3pfxYacTnTIJob6V5LNMiBdaFubd085
	 h58fmGlG/jR4aWt0H5ONm3dEZ3oYNYGVyM2DPPqpSr3sUsMbKs8GEZ9tdE6s4vMFND
	 iGZ/LYsMAQDMLzqD2kCZmCnwKYXfvcW8VkBSm798XIEDL42GwbPYWgMt8mfXEV8FTI
	 M5SK7HdQJxaaw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn?=
 Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland
 <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, Nick
 Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Nicolas Schier
 <nicolas.schier@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>, Matthew
 Maurer <mmaurer@google.com>
Subject: Re: [PATCH 0/4] Inline helpers into Rust without full LTO
In-Reply-To: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
Date: Wed, 07 Jan 2026 13:23:38 +0100
Message-ID: <87y0m9har9.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Alice,

Alice Ryhl <aliceryhl@google.com> writes:

> Currently the only way for Rust code to call a static inline function is
> to go through a helper in rust/helpers/. This introduces performance
> costs due to additional function calls and also clutters backtraces and
> flame graphs with helper symbols.
>
> To get rid of these helper symbols, provide functionality to inline
> helpers into Rust using llvm-link. This option complements full LTO, by
> being much cheaper and avoiding incompatibility with BTF.
>
> I ran a microbenchmark showing the benefit of this. All the benchmark
> does is call refcount_inc() in a loop. This was chosen since refcounting
> is quite hot in Binder. The results are that Rust spends 6.35 ns per
> call vs 5.73 ns per call in C. When enabling this option, the two
> languages become equally fast, and disassembly confirms the exact same
> machine code is used (in particular there is no call to
> rust_helper_refcount_inc). Benchmarking Binder also results in an
> improvement from this change.
>
> This patch is complementary to:
> https://lore.kernel.org/all/20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com/
>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I get the following modpost errors when building with this applied on top
of v6.19-rc4:

ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/drm/nova/nova.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [drivers/gpu/nova-core/nova_core.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [drivers/block/rnull/rnull_mod.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_minimal.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_misc_device.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_print.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_dma.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_pci.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_platform.ko] undefined!
ERROR: modpost: "__SCK__WARN_trap" [samples/rust/rust_driver_faux.ko] undefined!

I also applied the series adding the inline macro [1].


Best regards,
Andreas Hindborg


[1] https://lore.kernel.org/rust-for-linux/20260105-define-rust-helper-v2-0-51da5f454a67@google.com/


