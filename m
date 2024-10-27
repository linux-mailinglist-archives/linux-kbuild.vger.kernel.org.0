Return-Path: <linux-kbuild+bounces-4347-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 350209B210A
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 23:25:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D01E51F21290
	for <lists+linux-kbuild@lfdr.de>; Sun, 27 Oct 2024 22:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DD614BF86;
	Sun, 27 Oct 2024 22:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdvPjBRS"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3818EBF;
	Sun, 27 Oct 2024 22:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730067908; cv=none; b=KJeZZoBwJ3LN32yiIAu23CEXSVfO+4RRdKoe3cTuaCnOl2zV/v+pLjFOdxccrLV2Wsz3uN4jthZYK3SXLr4kUy81my5mcO3ZlybxvtjoW6g73cZ4eRPwu+T7LeawdvYUfptDC9QkeIMhfrO0XLt1X1O2IhqR1M6YaQn0+JWeuXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730067908; c=relaxed/simple;
	bh=Oaq3n6Gzx6um57cBqNlIEN/f+doqASBTkxLUrEN1T90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F4WXNdXqqPS2dli2gemOHIBFnVcdnNolLkp6c1KpDKlMslElbIXz54x2ByqySTqUTs5QzdRan/TW2qsucc0N+FC7RAg7cY57Olxj+xaRGOqMWOJxbHwwopnr0pqYMZ5g9r4NOAIW47pYL6DG5EWYVU1y1P+K3Lr26DR6L8A6tbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdvPjBRS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A1EC4CEC3;
	Sun, 27 Oct 2024 22:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730067908;
	bh=Oaq3n6Gzx6um57cBqNlIEN/f+doqASBTkxLUrEN1T90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WdvPjBRS3Voup2Ze5EOavrRAWlWmhsZY9g5H8HHU0PrM1CdP0UhQtmK6NXjKpwBfN
	 lvkiuHbM9d9BRbmdIoAib83X03jK3xgjpcgaYfPUNukYqd10MyqBj7FqGrc8Vgo2o+
	 cyhhTqHMpNIX4UCW2umr0LhR3UEIfshiCTXO5dqjcDDYcCaDLWzs7zR8hSumstSYvk
	 wzQGSH1js2OrHI+oLS8s8LXAYjl3cVjgwmoCoOTq51+10+R8umMx0krPbRfQcfZnE4
	 a2nVTXoLlqLC81XtNgEMLJOnVYGZjBHcm9vdgKz9KNiUN73GPrHhE+jZjzddRLD0w/
	 oqzzL+2GUMZJA==
Date: Sun, 27 Oct 2024 15:25:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Cameron MacPherson <cameron.macpherson@gmail.com>
Subject: Re: [PATCH] kbuild: rust: avoid errors with old `rustc`s without
 LLVM patch version
Message-ID: <20241027222505.GA2882707@thelio-3990X>
References: <20241027145636.416030-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027145636.416030-1-ojeda@kernel.org>

On Sun, Oct 27, 2024 at 03:56:36PM +0100, Miguel Ojeda wrote:
> Some old versions of `rustc` did not report the LLVM version without
> the patch version, e.g.:
> 
>     $ rustc --version --verbose
>     rustc 1.48.0 (7eac88abb 2020-11-16)
>     binary: rustc
>     commit-hash: 7eac88abb2e57e752f3302f02be5f3ce3d7adfb4
>     commit-date: 2020-11-16
>     host: x86_64-unknown-linux-gnu
>     release: 1.48.0
>     LLVM version: 11.0
> 
> Which would make the new `scripts/rustc-llvm-version.sh` fail and,
> in turn, the build:
> 
>     $ make LLVM=1
>       SYNC    include/config/auto.conf.cmd
>     ./scripts/rustc-llvm-version.sh: 13: arithmetic expression: expecting primary: "10000 * 10 + 100 * 0 + "
>     init/Kconfig:83: syntax error
>     init/Kconfig:83: invalid statement
>     make[3]: *** [scripts/kconfig/Makefile:85: syncconfig] Error 1
>     make[2]: *** [Makefile:679: syncconfig] Error 2
>     make[1]: *** [/home/cam/linux/Makefile:780: include/config/auto.conf.cmd] Error 2
>     make: *** [Makefile:224: __sub-make] Error 2
> 
> Since we do not need to support such binaries, we can avoid adding logic
> for computing `rustc`'s LLVM version for those old binaries.
> 
> Thus, instead, just make the match stricter.
> 
> Other `rustc` binaries (even newer) did not report the LLVM version at
> all, but that was fine, since it would not match "LLVM", e.g.:
> 
>     $ rustc --version --verbose
>     rustc 1.49.0 (e1884a8e3 2020-12-29)
>     binary: rustc
>     commit-hash: e1884a8e3c3e813aada8254edfa120e85bf5ffca
>     commit-date: 2020-12-29
>     host: x86_64-unknown-linux-gnu
>     release: 1.49.0
> 
> Cc: Thorsten Leemhuis <regressions@leemhuis.info>
> Cc: Gary Guo <gary@garyguo.net>
> Reported-by: Cameron MacPherson <cameron.macpherson@gmail.com>
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219423
> Fixes: af0121c2d303 ("kbuild: rust: add `CONFIG_RUSTC_LLVM_VERSION`")
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

and it still works for me with rustc 1.82.0:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/rustc-llvm-version.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/rustc-llvm-version.sh b/scripts/rustc-llvm-version.sh
> index b6063cbe5bdc..a500d1ae3101 100755
> --- a/scripts/rustc-llvm-version.sh
> +++ b/scripts/rustc-llvm-version.sh
> @@ -13,7 +13,7 @@ get_canonical_version()
>  	echo $((10000 * $1 + 100 * $2 + $3))
>  }
>  
> -if output=$("$@" --version --verbose 2>/dev/null | grep LLVM); then
> +if output=$("$@" --version --verbose 2>/dev/null | grep -E 'LLVM.*[0-9]+\.[0-9]+\.[0-9]+'); then
>  	set -- $output
>  	get_canonical_version $3
>  else
> -- 
> 2.47.0
> 

