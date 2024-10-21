Return-Path: <linux-kbuild+bounces-4217-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1C49A729B
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 20:48:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DF631F21F5E
	for <lists+linux-kbuild@lfdr.de>; Mon, 21 Oct 2024 18:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4F61D07A1;
	Mon, 21 Oct 2024 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcaZQG81"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8714F173;
	Mon, 21 Oct 2024 18:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729536529; cv=none; b=FmEOk9navM3DSLS0jzSIxOEI4EkSQILL/1VNUjXMYocVS10DwhL24NnH+1vdVZ7pXCQj9YgNQstgeOrFT2obfykNew5x7A0RqA0sHFiK6mGdSHvioV5yxk2yJvg2Ct6cwOsxIgQxka/4jOiDXzr25V806I1tdCXGgUVanthNzL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729536529; c=relaxed/simple;
	bh=/dQR1/Vl9Eq1F/3PH7RC+QLlhtH+Quersd2wxRrZLcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kj/v7abVcLz4rxA3V0m8nx2BDTJqveqjRn4Rom+TPDmVtNQJj2k3QrdnxSfUwPMRTtYtzfWKwfA6YR82fNTfkyMh9ZQdYcQjLPLN6EiVp8usvUkN9aM2kYOHRkgyetRsnXkL6Bu1VOnJfrLmniBycPVUujJm80ONd1ulldtjKYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcaZQG81; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE69C4CEC3;
	Mon, 21 Oct 2024 18:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729536529;
	bh=/dQR1/Vl9Eq1F/3PH7RC+QLlhtH+Quersd2wxRrZLcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EcaZQG81VyIZEtsr2LScLkXO+0OJPSE5if7aGEwyRfmfokEZnwdXzOM6/TYVdtOde
	 pSfgN0gsS7F++Q5imp+x5FJz7iHLrEkFAG23l1bRc3tn4Q50xal6wSqzJUGHtCDn80
	 2uSPOyU55ca4k6vsWY0FjUqFcK34W/HgMiFdk1okhPBl6DRDQNma/hwA1ckhLbnBnM
	 Rg6dCZi7gOvdb3MExtYf63fqDBLK0Z4u7vmPajdOz5PAEqtFd2bfPcKUJukNZ4Ks4+
	 lNiWSFFfmrrJ00LsPbGs3RzEKbz5/tyY+IjWhq/bT/ILY+CPMNpIG9ZL1ilvSuTrrt
	 TTKFASG/FVEfw==
Date: Mon, 21 Oct 2024 11:48:46 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Matthew Maurer <mmaurer@google.com>
Cc: masahiroy@kernel.org, ndesaulniers@google.com, ojeda@kernel.org,
	gary@garyguo.net, Alex Gaynor <alex.gaynor@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, neal@gompa.dev, marcan@marcan.st,
	j@jannau.net, asahi@lists.linux.dev, linux-modules@vger.kernel.org,
	samitolvanen@google.com, Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Boqun Feng <boqun.feng@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH v6 4/5] modpost: Produce extended MODVERSIONS information
Message-ID: <ZxaiDk0md4hURL9E@bombadil.infradead.org>
References: <20241015231925.3854230-1-mmaurer@google.com>
 <20241015231925.3854230-5-mmaurer@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015231925.3854230-5-mmaurer@google.com>

On Tue, Oct 15, 2024 at 11:18:59PM +0000, Matthew Maurer wrote:
> Generate both the existing modversions format and the new extended one
> when running modpost. Presence of this metadata in the final .ko is
> guarded by CONFIG_EXTENDED_MODVERSIONS.
> 
> We no longer generate an error on long symbols in modpost if
> CONFIG_EXTENDED_MODVERSIONS is set, as they can now be appropriately
> encoded in the extended section. These symbols will be skipped in the
> previous encoding. An error will still be generated if
> CONFIG_EXTENDED_MODVERSIONS is not set.
> 
> Signed-off-by: Matthew Maurer <mmaurer@google.com>
> ---
>  kernel/module/Kconfig |  8 ++++++++
>  scripts/mod/modpost.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 49 insertions(+)
> 
> diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
> index 7c6588148d42..a5de2b7f2758 100644
> --- a/kernel/module/Kconfig
> +++ b/kernel/module/Kconfig
> @@ -177,6 +177,14 @@ config ASM_MODVERSIONS
>  	  assembly. This can be enabled only when the target architecture
>  	  supports it.
>  
> +config EXTENDED_MODVERSIONS
> +	bool "Extended Module Versioning Support"
> +	depends on MODVERSIONS
> +	help
> +	  This enables extended MODVERSIONs support, allowing long symbol
> +	  names to be versioned. The most likely reasons you would enable
> +	  this are for Rust usage or aggressive LTO configurations.

What is "aggressive LTO configurations" please elaborate. Can we infer
on that through configuration?

> +
>  config MODULE_SRCVERSION_ALL
>  	bool "Source checksum for all modules"
>  	help
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 107393a8c48a..d18ff8a1109a 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1840,15 +1840,56 @@ static void add_versions(struct buffer *b, struct module *mod)
>  			continue;
>  		}
>  		if (strlen(s->name) >= MODULE_NAME_LEN) {
> +#ifdef CONFIG_EXTENDED_MODVERSIONS
> +			/* this symbol will only be in the extended info */
> +			continue;
> +#else
>  			error("too long symbol \"%s\" [%s.ko]\n",
>  			      s->name, mod->name);
>  			break;
> +#endif
>  		}

Using #ifdefs on a loop like this seems fragile, even if its more code
make the code clearer and use separate routines for both worlds. Make
the code easy to review and maintain.

>  		buf_printf(b, "\t{ %#8x, \"%s\" },\n",
>  			   s->crc, s->name);
>  	}
>  
>  	buf_printf(b, "};\n");
> +
> +	buf_printf(b, "#ifdef CONFIG_EXTENDED_MODVERSIONS\n");

Why not *in-code* rather than the output? And if possible why not
two routines as above.

  Luis 

