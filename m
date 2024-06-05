Return-Path: <linux-kbuild+bounces-1992-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A68FC35E
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 08:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E14F28315A
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Jun 2024 06:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D3FF13AA4D;
	Wed,  5 Jun 2024 06:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LuiuKYoV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31382BD0D;
	Wed,  5 Jun 2024 06:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717568558; cv=none; b=RxRnC80TZWtbxsqm1HNLAjWYtBBQLRbipviitObd/WfjpOxExbUGLzWuk/wJoc8e6Ky76HPN7bh8k67RY4k1RZrbXzOmcoi/cWTzQjGGILsuq+mD0LxYY0rXoQMrctxUrd6gJo0FmafVRlwPu4g29+u9gctVJfE/5TsJjx8Snno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717568558; c=relaxed/simple;
	bh=22vGbdo3lcoqgtt6iTgodLgKpeC1H2mmwljTBZUWyNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMuN1kz4ll1SetiPdPh6FX5r5p+PyJBiAVafdw+187Wp2vWeUYuGoczpGapmohek+KfsJZXAiyVUOR4oHejZNo60Dz6FJfaruGgrOKWP9rg7Zink3hqC6Q4f5Y80ZsXObz7YCHQFYJBdFQLpJ588Lwadw9uM9yt6QsZpN14xfPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LuiuKYoV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA3CC3277B;
	Wed,  5 Jun 2024 06:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717568557;
	bh=22vGbdo3lcoqgtt6iTgodLgKpeC1H2mmwljTBZUWyNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LuiuKYoVXSbCm1Dbvh0V60xcmtNnwomS1+agdGXYtSH5RlrxJbcdXsIy1lqp5wItG
	 JJyN5q3EzSLIvKCXaYZzkbTVItVxMxvBWyqXCcRFhXNDfq7MFeCHslkWNW9Sao3nLj
	 jNn/BbgErH5YpRHQIJ3pAF94KPw8WHbwel+G3StODSKyFX38S4hfpQC6O5crO6uFn8
	 b6xfpTP1idOJvxSjt5esKEXWgS7Hk6s2UujbwBliTpEhdDIoHyLKAaQWyJYJKAFx9E
	 mbEcmRhEGOU/o4xFSZxyQp1k1cqmH7XBpuHaF8vuA25/uRVG0SkaSJOftyk7bgCnxI
	 XFYJoiZO2IcMQ==
Date: Tue, 4 Jun 2024 23:22:34 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: David Gow <davidgow@google.com>
Cc: Brendan Higgins <brendan.higgins@linux.dev>,
	Rae Moar <rmoar@google.com>, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org, rust-for-linux@vger.kernel.org,
	x86@kernel.org, Wedson Almeida Filho <wedsonaf@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] arch: um: rust: Add i386 support for Rust
Message-ID: <20240605062234.GE279426@thelio-3990X>
References: <20240604224052.3138504-1-davidgow@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604224052.3138504-1-davidgow@google.com>

Hi David,

Just a fly by comment on style, I don't have much to say content :)

On Wed, Jun 05, 2024 at 06:40:50AM +0800, David Gow wrote:
> At present, Rust in the kernel only supports 64-bit x86, so UML has
> followed suit. However, it's significantly easier to support 32-bit i386
> on UML than on bare metal, as UML does not use the -mregparm option
> (which alters the ABI), which is not yet supported by rustc[1].
> 
> Add support for CONFIG_RUST on um/i386, by adding a new target config to
> generate_rust_target, and replacing various checks on CONFIG_X86_64 to
> also probably like  support CONFIG_X86_32.
> 
> We still use generate_rust_target, rather than a built-in rustc target,
> in oPrder to match x86_64, provide a future place for -mregparm, and more
> easily disable floating point instructions.
> 
> With these changes, the KUnit tests pass with:
> kunit.py run --make_options LLVM=1 --kconfig_add CONFIG_RUST=y
> --kconfig_add CONFIG_64BIT=n --kconfig_add CONFIG_FORTIFY_SOURCE=n
> 
> An earlier version of these changes was proposed on the Rust-for-Linux
> github[2].
> 
> [1]: https://github.com/rust-lang/rust/issues/116972
> [2]: https://github.com/Rust-for-Linux/linux/pull/966
> 
> Signed-off-by: David Gow <davidgow@google.com>
...
> -ifdef CONFIG_X86_64
> +ifneq ($(or $(CONFIG_X86_64),$(CONFIG_X86_32)),)

These configurations are mutually exclusive, so would it look more
readable to have it be:


ifeq ($(CONFIG_X86_32)$(CONFIG_X86_64),y)

?

Cheers.
Nathan

