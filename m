Return-Path: <linux-kbuild+bounces-9967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 379FECA1AD1
	for <lists+linux-kbuild@lfdr.de>; Wed, 03 Dec 2025 22:26:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 250DC300E78F
	for <lists+linux-kbuild@lfdr.de>; Wed,  3 Dec 2025 21:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7CB2D6E59;
	Wed,  3 Dec 2025 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zd86bIpv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898AD2C21FC;
	Wed,  3 Dec 2025 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764797166; cv=none; b=pjbMyGJQbfWRdw+lJ6aJp0kbNP+ORPwl0z/x0UcyE53kgA1WGWPhxas53oLyOHsmhy+CdJnBL7NfyPeUmcxVl6CyDMsWvRxt1ec7bkn4+cL13UeAbsxSCIzMHYIjs+MBDS0TIDybSPaPVlY5iezEOZ5KjBT1jLdH5WZDZra+Blw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764797166; c=relaxed/simple;
	bh=GFgAqj8UfGyBUyXfv+53BPOejR4vlRFgXnL4TObOzNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGv986fpVSDxpa04Y6xJYLnJQ0x38qDs/pJOsI3YHoag85No44t/UG4/VGHL6amVujyMffZrDcbiD8D/jCqrQAE/q0IjIAm3vXeL2Pspm7SZmuQ2e10FEu1H3kQg/S6cqgc48z3ShNENqyAaBub7zf0hUlXkmOZIDhx7mhDrjVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zd86bIpv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5D0C4CEF5;
	Wed,  3 Dec 2025 21:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764797166;
	bh=GFgAqj8UfGyBUyXfv+53BPOejR4vlRFgXnL4TObOzNM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zd86bIpvg86iAEPANnDmH3QLfW8yzPG0kdsDWe9N2/EYvP4E4L9o550SSI8Yv4LVZ
	 URMQb7wPkrwy3laoLMkOWv9kZRBo6Y6BMGYa1zv/UOiYIVd1BsnWue8Z1t9ELX7Jve
	 6i57FY+s0dGa6aljNBsNu9O6zTwIzP+xAhmeuUtOYebVtJKIiCI5TmZbU3HciuuTbq
	 3UT5mzV9hDBwXBm5TipT1YTZHmVTV25YbGoONGYQG43tNFbqqBdZ7TDqbUQlxvv7+L
	 O2McGBanr21d+vpA/GHY1azbF8OM4IyeLD71qJhNjGEEKRMZVCNJVT0wfcoaUBZnmc
	 sCIvRJ6Q37TLw==
Date: Wed, 3 Dec 2025 14:25:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	linux-kbuild@vger.kernel.org, linux-mm@kvack.org,
	nouveau@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 4/4] build: rust: provide an option to inline C helpers
 into Rust
Message-ID: <20251203212558.GB3060476@ax162>
References: <20251202-inline-helpers-v1-0-879dae33a66a@google.com>
 <20251202-inline-helpers-v1-4-879dae33a66a@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-inline-helpers-v1-4-879dae33a66a@google.com>

Hi Alice,

On Tue, Dec 02, 2025 at 08:27:59PM +0000, Alice Ryhl wrote:
...
> diff --git a/Makefile b/Makefile
> index 96ddbaae7e12de71bcfabef4639de3a13a6e4815..5834bfd568548d1bee34b328dccce5d60f85526f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -517,6 +517,8 @@ OBJCOPY		= $(LLVM_PREFIX)llvm-objcopy$(LLVM_SUFFIX)
>  OBJDUMP		= $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF		= $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP		= $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +LLVM_LINK	= $(LLVM_PREFIX)llvm-link$(LLVM_SUFFIX)
> +LLVM_AS		= $(LLVM_PREFIX)llvm-as$(LLVM_SUFFIX)

Please keep the binutils alphabetized (i.e, put LLVM_LINK between AR and
NM).

Other than that, this seems fine from a Kbuild perspective (but I did
not look too hard).

>  else
>  CC		= $(CROSS_COMPILE)gcc
>  LD		= $(CROSS_COMPILE)ld
> @@ -625,7 +627,7 @@ export RUSTC_BOOTSTRAP := 1
>  export CLIPPY_CONF_DIR := $(srctree)
>  
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC HOSTPKG_CONFIG
> -export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN
> +export RUSTC RUSTDOC RUSTFMT RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN LLVM_LINK LLVM_AS
>  export HOSTRUSTC KBUILD_HOSTRUSTFLAGS
>  export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 3034e294d50df55c4003c5fa5df442f59e711bd8..e63c5eb57b049aff988419ccd12dfd99d59f5080 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -3427,6 +3427,21 @@ config RUST_KERNEL_DOCTESTS
>  
>  	  If unsure, say N.
>  
> +config RUST_INLINE_HELPERS
> +    bool "Inline C helpers into Rust crates (EXPERIMENTAL)"
> +    depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
> +    depends on EXPERT
> +    help
> +        Links C helpers into Rust crates through LLVM IR.
> +
> +        If this option is enabled, instead of generating object files directly,
> +        rustc is asked to produce LLVM IR, which is then linked together with
> +        the LLVM IR of C helpers, before object file is generated.
> +
> +        This requires a matching LLVM version for Clang and rustc.
> +
> +        If unsure, say N.
> +

I am just curious, why would someone want (or not) to do this? This help
text does not really indicate the point of the option, just what it
does. Is it just the standard tradeoffs with inlining (potential
improvements in performance due to better optimization opportunities
versus text size increase and icache pressure) or something else?

Cheers,
Nathan

