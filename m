Return-Path: <linux-kbuild+bounces-3062-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A7E9557F1
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 14:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A97301C212D4
	for <lists+linux-kbuild@lfdr.de>; Sat, 17 Aug 2024 12:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EF8914A09F;
	Sat, 17 Aug 2024 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="CJexEdST"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666E41514C8;
	Sat, 17 Aug 2024 12:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723899520; cv=none; b=k7Ea71xZ1f3wX311LoW0ilJ+hj4+c9N66YrgwW9zL65qQo3YX0TCM/Tu0Y2gmojFOFkYtQeB5T4cT7g1WaIrX0ki69e+P5Sh4L9v8+gUJRUV2SifHaM/kmBYEDnthL9qXn88YU3oZVrNvTXO7qTeeOwX49ca8cfjfB3EUfFFEso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723899520; c=relaxed/simple;
	bh=PMrst1zCfDGFccXDTIT1lDpwj0hEe09Iih9yMCpjkUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+es6uAkN6lZOjA9y7c2/1m4X1LE0mclYjwi68RabhNgSrPng2w0zYLXQTKWlX1xnjPnu8OLaBit82Ncw5XVSXzxpr8V80yapOrsR9tlJDhu8YrfJ5OTkSa9lPstMj5k3dVqor3AMZR5xXuqE/mFKWrw51/w2pDaN2d2o32a1zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=CJexEdST; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NBgNpsV3iSN5sqAH+5z8a2bc36aU5oe1kMspy42W3uw=; b=CJexEdSTpzpXyJ6WBjveloA02I
	zlVDtuq7HV3A62zw+cH6xnJRw4EamRHOU6/nmLn9A9a0GN9lmRJ8BxqIf7PcfATJjgl9O/1XjTRIj
	tZqWBocUnU5lOhBkcpnvTjBzxauUMIfuBW6KdZ3/zOxERXoUZUum7owRTu9V1RNUGt/Xpl3JCAjDG
	WJpmkPpq5YF1eR3ecrCCtii57CvMOForRHhIW1z1v2cMRp6bblFBtLwbnnuzLN9arR9xTAJiFJWaZ
	9u6RkGQ0jeI88nX7CqaoNMibb/je6QjOKPkVKaTbcONPMLb8IWb6w1F0bZ8k9no097iA4FfyZVJCo
	a43A86rg==;
Received: from [2001:9e8:9db:8201:3235:adff:fed0:37e6] (port=50764 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sfJ0l-00DV8a-2P;
	Sat, 17 Aug 2024 14:58:27 +0200
Date: Sat, 17 Aug 2024 14:58:21 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH 3/6] kbuild: rust: re-run Kconfig if the version text
 changes
Message-ID: <20240817-heavy-dancing-whale-6ae13d@lindesnes>
References: <20240808221138.873750-1-ojeda@kernel.org>
 <20240808221138.873750-4-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240808221138.873750-4-ojeda@kernel.org>

On Fri, Aug 09, 2024 at 12:11:35AM +0200, Miguel Ojeda wrote:
> Re-run Kconfig if we detect the Rust compiler has changed via the version
> text, like it is done for C.
> 
> Unlike C, and unlike `RUSTC_VERSION`, the `RUSTC_VERSION_TEXT` is kept
> under `depends on RUST`, since it should not be needed unless `RUST`
> is enabled.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
> Masahiro: I think leaving the `depends on RUST` in `RUSTC_VERSION` is
> OK, but since this is different from the C side, please let me know if
> you prefer otherwise. Thanks!
> 
>  Makefile     | 5 +++--
>  init/Kconfig | 4 +++-
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 8ad55d6e7b60..2b5f9f098b6f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -648,9 +648,10 @@ endif
> 
>  # The expansion should be delayed until arch/$(SRCARCH)/Makefile is included.
>  # Some architectures define CROSS_COMPILE in arch/$(SRCARCH)/Makefile.
> -# CC_VERSION_TEXT is referenced from Kconfig (so it needs export),
> +# CC_VERSION_TEXT and RUSTC_VERSION_TEXT are referenced from Kconfig (so they need export),
>  # and from include/config/auto.conf.cmd to detect the compiler upgrade.

If you send a v2, mind you consider reformatting so that this comment
block stays <= 80 chars?

>  CC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(CC) --version 2>/dev/null | head -n 1))
> +RUSTC_VERSION_TEXT = $(subst $(pound),,$(shell LC_ALL=C $(RUSTC) --version 2>/dev/null | head -n 1))
> 
>  ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>  include $(srctree)/scripts/Makefile.clang
> @@ -671,7 +672,7 @@ ifdef config-build
>  # KBUILD_DEFCONFIG may point out an alternative default configuration
>  # used for 'make defconfig'
>  include $(srctree)/arch/$(SRCARCH)/Makefile
> -export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT
> +export KBUILD_DEFCONFIG KBUILD_KCONFIG CC_VERSION_TEXT RUSTC_VERSION_TEXT
> 
>  config: outputmakefile scripts_basic FORCE
>  	$(Q)$(MAKE) $(build)=scripts/kconfig $@
> diff --git a/init/Kconfig b/init/Kconfig
> index 2f974f412374..b0238c4b6e79 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1926,7 +1926,9 @@ config RUST
>  config RUSTC_VERSION_TEXT
>  	string
>  	depends on RUST
> -	default "$(shell,LC_ALL=C $(RUSTC) --version 2>/dev/null | head -n 1)"
> +	default "$(RUSTC_VERSION_TEXT)"
> +	help
> +	  See `CC_VERSION_TEXT`.
> 
>  config BINDGEN_VERSION_TEXT
>  	string
> --
> 2.46.0

Do we already support rust in external kernel modules?  In top-level
Makefile's oot-kmod 'prepare' target we check that the compiler
(version) is the same as when the kernel itself was built.  If rust
modules are supported, adding a similar check might be helpful.


Nevertheless,

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

