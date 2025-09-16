Return-Path: <linux-kbuild+bounces-8835-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC9DB59F2A
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 19:21:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5FFED4E4B24
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Sep 2025 17:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DE5258CE9;
	Tue, 16 Sep 2025 17:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nK69Sf8A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DE424E00F;
	Tue, 16 Sep 2025 17:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758043303; cv=none; b=jkOe8MkuB5ed0JXOGPE0sKXD4wwQrxaTi7lpfrnomlNUz+7CRJ2f72lgMApFLEXoEI4aqTw8sd494a5XJpuImec9CPAd3QQ4iY0hEXw9lw1oRS5C2p8zY6ba5y9U8u4pgk9knGYxwRg75SDMIy9vYCKL0NiXRxy0XygEsmxWo4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758043303; c=relaxed/simple;
	bh=DJ5Z50X5vQEdBklBEnK9nMQ+7I1JuqRFkk4wtkg6jd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvm3td+Kog3wWJpqDgXtdf6jZjICDyVzURPuTRAYMwU6ifDqULzTNDwZIfNiQm1ZPpk7o4uB7bZbvC+eZsSQss6epQadn/5We39yhV6OY3r4LzZgDZEILs4Nvt++eDtWvEZ/o1cJiRLMpirjcaYVR3Zp/0CNdiEcS/VhxWtwiic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nK69Sf8A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0DFCC4CEEB;
	Tue, 16 Sep 2025 17:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758043302;
	bh=DJ5Z50X5vQEdBklBEnK9nMQ+7I1JuqRFkk4wtkg6jd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nK69Sf8A1+xQNLJPVP5BMJ34gDV+ob4401QWkOJn2E0veRXaRdI6Ugl/7gQMNL9YY
	 anIZ70kGc1KRSKOY7lYBBFLIc3oVLaEQG5u+XQsGg6UkFhzdHFZhV87Lyw1zyt7AlA
	 7gDO+7SbCDSrk37n8XlySD3fJoNGfvj4br40D3f0NLU1JzZ/omxvw+vMXLrCyaxvt3
	 ofyTDfzZnSMOzU+VJV8DuOetScgLJ4QskNO31s515siQCddQoY/EwZQGf8yc6zkwfK
	 Msnm+vTz0q53ELGYhldIzo9lkjCsWqdWScOrKmVo8727WeaPkUBZyl/ZaoMF0Qayrj
	 fODObCWXRQNHQ==
Date: Tue, 16 Sep 2025 18:21:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna Yang <spriteovo@gmail.com>
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
	Han Gao <rabenda.cn@gmail.com>,
	Jason Montleon <jmontleo@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
Message-ID: <20250916-getaway-grew-46e4fb956a78@spud>
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ovMXMPQdHm2Jci7/"
Content-Disposition: inline
In-Reply-To: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>


--ovMXMPQdHm2Jci7/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Sep 14, 2025 at 03:16:40PM +0800, Asuna Yang wrote:
> +config TOOLCHAIN_MATCHES_ZICSR_ZIFENCEI
> +	def_bool y
> +	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
> +	depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC || !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI || RUST_BINDGEN_LIBCLANG_VERSION >= 170000
> +	help
> +	  LLVM/Clang >= 17.0.0 starts recognizing Zicsr/Zifencei in -march, passing
> +	  them to -march doesn't generate an error anymore, and passing them or not
> +	  doesn't have any real difference, it still follows ISA before version
> +	  20190608 - Zicsr/Zifencei are included in base ISA.
> +
> +	  The current latest version of LLVM/Clang still does not require explicit
> +	  Zicsr/Zifencei to enable these two extensions, Clang just accepts them in
> +	  -march and then silently ignores them.

I still don't really like the name of this option, but I don't really
have any good suggestions for what to call this.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--ovMXMPQdHm2Jci7/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMmcigAKCRB4tDGHoIJi
0rfDAP9q+R3zLBj2lwiOj46Ay1jJrWFrzRnaLIF9CVcqW7Tq6gEAhYmZWcMRrz3+
1MPkLLx2PkcE4kEft2ZLozNAEw1LCww=
=UxeS
-----END PGP SIGNATURE-----

--ovMXMPQdHm2Jci7/--

