Return-Path: <linux-kbuild+bounces-8811-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31742B53361
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Sep 2025 15:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6E103B632F
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Sep 2025 13:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F57D322DBD;
	Thu, 11 Sep 2025 13:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BMNY8ka5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F078A2E8E17;
	Thu, 11 Sep 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596481; cv=none; b=iXSoCuNQ+BLQ2uiGYft7FEpe/hzs3Ktl59+RkfEfvj1nc7YCr7rTz7MZMl031ciWi9pOkzKlAzJ6odNFsTk2k8eLETGj0i1rA2SufEocK6S2JpLhxQ8H/VKjMhbjp6s0RvuJeSzpp/rPuTJGLgJTrptSflkjrxHPAe0CSFax6r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596481; c=relaxed/simple;
	bh=KX7xrHa+olS2oROnPjX8J2BFoTeFIgxJ4Lv3gDXpUMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GX3V14Xn2ZpYGQK/bY2awgq4BF4HuKsM1SYB2PVvk65zddQ69iJAbVeha+CrqB+Abz6pVbK9xaOczzuiKp3sZ/dm6+X6ATv5hpDOzMbrh4LCs6V6qV7DewqCcimcUZEv+NRugqJcL7HmgfpOz8hvF1LyEfKt0XV4tgTCA1bToZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BMNY8ka5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8EDC4CEF8;
	Thu, 11 Sep 2025 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757596480;
	bh=KX7xrHa+olS2oROnPjX8J2BFoTeFIgxJ4Lv3gDXpUMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BMNY8ka5NU+VI1MvoMs8tdN9twEhfEOt6uHnMuw/zG9gVEyVe/5lVgCJ02DWkmQLq
	 Fdl3RoRxTueqgHTHfbVxagk8VtPvmwoEyZEau6cD7wse+rO2nbfwmJmmiS553+DP2B
	 yZ2WsSAMYwSJGbjThMmq184i//iYfBog+QuW84FpNFuhkUyC2+JoPzcfaD9Ztl8I78
	 1gPLPfUZkieEE52ZtrlTwyr5e027kXiXhtJhWQuAYcNDC9WqmWB1PVx6ZfIC6jcIQd
	 XfPzPxjtqx1fJ5gagtreHl0mLS/Bz0TnTtqOcTBQYcwz+rQz/XSLpRvbtAo6AeJly1
	 9KlPyFS3bVuoQ==
Date: Thu, 11 Sep 2025 14:14:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Han Gao <rabenda.cn@gmail.com>, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v2] RISC-V: re-enable gcc + rust builds
Message-ID: <20250911-reprogram-conductor-f02af5f6d03e@spud>
References: <20250909-gcc-rust-v2-v2-1-35e086b1b255@gmail.com>
 <20250910-harmless-bamboo-ebc94758fdad@spud>
 <6bceca9d-44cd-4373-a456-7c2129b418e3@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pv6XXkkXxcuB8WU5"
Content-Disposition: inline
In-Reply-To: <6bceca9d-44cd-4373-a456-7c2129b418e3@gmail.com>


--Pv6XXkkXxcuB8WU5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 11, 2025 at 12:46:01PM +0800, Asuna wrote:
> On 9/10/25 10:27 PM, Conor Dooley wrote:
> > FWIW, this --- breaks git, and anything after this line (including your
> > signoff) is lost when the patch is applied.
>=20
> I used b4 command to prepare and send the cover letter and patch for v2, =
not
> sure what happened.

Dunno. Maybe while editing your commit message you omitted the signoff
somehow? I don't use b4-submit, so I don't know how it formats stuff. If
it inserted the --- and what was below it was your intended cover
letter, your patch itself might be missing the signoff?
>=20
> I see that other people's patches have a [PATCH 0/n] email as a start that
> describes their patch series, this is called a cover-letter in b4 and
> git-send-email right?

Yes it is. Not really needed if you only have one patch though.

> > The riscv patchwork CI stuff is really unhappy with this change:
> > init/Kconfig:87: syntax error
> > init/Kconfig:87: invalid statement
> > init/Kconfig:88: invalid statement
> > init/Kconfig:89:warning: ignoring unsupported character '`'
> > init/Kconfig:89:warning: ignoring unsupported character '`'
> > init/Kconfig:89:warning: ignoring unsupported character '.'
> > init/Kconfig:89: unknown statement "This"
> >=20
> > Is this bogus, or can rustc-bindgen-libclang-version return nothing
> > under some conditions where rust is not available?
> > Should this have 2 default lines like some other options in the file?
>=20
> This is because rustc-bindgen-libclang-version can't find the bindgen and
> returns nothing. Sorry I forgot to mention this, it's another reason why I
> wanted to separate the script, in a separate script we can easily fallback
> to return 0 when an error is encountered.
>=20
> Adding a second line `default 0` doesn't work, I'll try to fix it. BTW, w=
hen
> I fix it, if the diff isn't too large, do I need to open a v3 patch, or
> simply replying to the thread just fine?

Feel free to reply with the diff if you're looking to discuss the
implantation, but for the sake of the various bits of automation
(patchwork, ci bots etc) please submit a v3 when you're happy with what
you've produced.

--Pv6XXkkXxcuB8WU5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMLLNgAKCRB4tDGHoIJi
0sTWAQDdTuuMdgIe7i+D0GfClKSNwZiGeo6RL2W+QEs7l4LftQD7BqPNj+VBOnFy
pCrKuAA/4HOvXEmHWCYJdIAAEL+4bA0=
=CuGR
-----END PGP SIGNATURE-----

--Pv6XXkkXxcuB8WU5--

