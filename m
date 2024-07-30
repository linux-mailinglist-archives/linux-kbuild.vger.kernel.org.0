Return-Path: <linux-kbuild+bounces-2744-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBA7940FE0
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 12:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 94070B298FC
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2024 10:37:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A241A08B9;
	Tue, 30 Jul 2024 10:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ma5iCXvb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A819FA62;
	Tue, 30 Jul 2024 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722335565; cv=none; b=l6BM7oMrdRgsXHUhmFangMZddUf2Uwj8XDaRK3Jfqfb+yx8E3x32nIl64PnTk6kp/DVJRPdicf5Mvm7flsex5bA7ebqbaRF9aAQWdXOhSecEcm5elyH2WebZ9BB/tgJUxW2tQWzWxmAjWlCdB5vbN1Q2AYSk4n73SFjNukoZnYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722335565; c=relaxed/simple;
	bh=vaFA6ejx/mQhpvEGpodwUK70mDX8ML/uSgigSqL5z4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EfAVYUpNOSOgLY76iQuEQOnW3eHAk269La1r8E8st49pkQFUWnfeR4nOMdkJS7jXu0iHeXiyqy1AqY6dpP6MRJW+5BLWqqZHjBvsZ1vVwKoeNyo8wmoDgJ7/GliXHWo0qpEyIWlfyRuKOcZwI0BAK1q+K5uoRK2hoRuvUDV2qsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ma5iCXvb; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GKJ0BOdI4p7S6+rKK3aA2Nwz9hN0PGkAVyY4twLfyNw=; b=ma5iCXvbFu/Oy/A3nr1+b61zc3
	5XE5Z94zAXg+sbeqjjlPEXFIIRpkCXJYPoU3ztA08PEqx/vwDjApSi2o1lftwjFx56hGEd2yd0NHB
	dINMstJbAELjZp3lKWHrca3cPimaYv8fphL/MJhtWe1NtGDyl9OJGvhkcKaKyuMbiXB8WOkqzIEon
	bTP3HkKMrmVWUT4h+Tcn0BW2U7CH9dmkGuY9MVPZ6JK5HDEl02Yj8aLhyuDaoEliANbe0JYa3rOMH
	JBivuBU2vROBDPRPysqv/n6QteZ+W/CeTc9FDn8aeOXy12p0ykFY7wr+dZurnwUWO7bkuScYFM2vh
	jwGStDcg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYk9k-00000004yjV-3oOh;
	Tue, 30 Jul 2024 10:32:37 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 898053003EA; Tue, 30 Jul 2024 12:32:36 +0200 (CEST)
Date: Tue, 30 Jul 2024 12:32:36 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Kees Cook <kees@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Matthew Maurer <mmaurer@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] rust: cfi: add support for CFI_CLANG with Rust
Message-ID: <20240730103236.GK33588@noisy.programming.kicks-ass.net>
References: <20240730-kcfi-v1-0-bbb948752a30@google.com>
 <20240730-kcfi-v1-2-bbb948752a30@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730-kcfi-v1-2-bbb948752a30@google.com>

On Tue, Jul 30, 2024 at 09:40:12AM +0000, Alice Ryhl wrote:
> From: Matthew Maurer <mmaurer@google.com>
> 
> Make it possible to use the Control Flow Integrity (CFI) sanitizer when
> Rust is enabled. Enabling CFI with Rust requires that CFI is configured
> to normalize integer types so that all integer types of the same size
> and signedness are compatible under CFI.

I am assuming -- because I have to, because you're not actually saying
anyting -- that this is fully compatible with the C version and all the
fun and games we play with rewriting the function prologue for FineIBT
and the like also work?

> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
>  Makefile                        | 7 +++++++
>  init/Kconfig                    | 2 +-
>  rust/Makefile                   | 2 +-
>  scripts/generate_rust_target.rs | 1 +
>  4 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 484c6900337e..8d7d52f57c63 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -955,6 +955,13 @@ CC_FLAGS_CFI	:= -fsanitize=kcfi
>  ifdef CONFIG_CFI_ICALL_NORMALIZE_INTEGERS
>  	CC_FLAGS_CFI	+= -fsanitize-cfi-icall-experimental-normalize-integers
>  endif
> +ifdef CONFIG_RUST
> +	# Always pass -Zsanitizer-cfi-normalize-integers as CONFIG_RUST depends
> +	# on CONFIG_CFI_ICALL_NORMALIZE_INTEGERS.
> +	RS_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers
> +	KBUILD_RUSTFLAGS += $(RS_FLAGS_CFI)
> +	export RS_FLAGS_CFI
> +endif
>  KBUILD_CFLAGS	+= $(CC_FLAGS_CFI)
>  export CC_FLAGS_CFI
>  endif
> diff --git a/init/Kconfig b/init/Kconfig
> index b0238c4b6e79..d0d3442d1756 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1905,11 +1905,11 @@ config RUST
>  	bool "Rust support"
>  	depends on HAVE_RUST
>  	depends on RUST_IS_AVAILABLE
> -	depends on !CFI_CLANG
>  	depends on !MODVERSIONS
>  	depends on !GCC_PLUGINS
>  	depends on !RANDSTRUCT
>  	depends on !DEBUG_INFO_BTF || PAHOLE_HAS_LANG_EXCLUDE
> +	depends on !CFI_CLANG || RUSTC_VERSION >= 107900 && CFI_ICALL_NORMALIZE_INTEGERS
>  	help
>  	  Enables Rust support in the kernel.
>  
> diff --git a/rust/Makefile b/rust/Makefile
> index f6b9bb946609..a2c9a3e03a23 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -305,7 +305,7 @@ $(obj)/bindings/bindings_helpers_generated.rs: $(src)/helpers.c FORCE
>  quiet_cmd_exports = EXPORTS $@
>        cmd_exports = \
>  	$(NM) -p --defined-only $< \
> -		| awk '/ (T|R|D) / {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
> +		| awk '$$2~/(T|R|D)/ && $$3!~/__cfi/ {printf "EXPORT_SYMBOL_RUST_GPL(%s);\n",$$3}' > $@
>  
>  $(obj)/exports_core_generated.h: $(obj)/core.o FORCE
>  	$(call if_changed,exports)
> diff --git a/scripts/generate_rust_target.rs b/scripts/generate_rust_target.rs
> index c31657380bf9..9b184099278a 100644
> --- a/scripts/generate_rust_target.rs
> +++ b/scripts/generate_rust_target.rs
> @@ -192,6 +192,7 @@ fn main() {
>          }
>          ts.push("features", features);
>          ts.push("llvm-target", "x86_64-linux-gnu");
> +        ts.push("supported-sanitizers", ["kcfi"]);
>          ts.push("target-pointer-width", "64");
>      } else if cfg.has("X86_32") {
>          // This only works on UML, as i386 otherwise needs regparm support in rustc
> 
> -- 
> 2.46.0.rc1.232.g9752f9e123-goog
> 

