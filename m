Return-Path: <linux-kbuild+bounces-9643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7CC61BDB
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Nov 2025 20:38:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78DC63ADF71
	for <lists+linux-kbuild@lfdr.de>; Sun, 16 Nov 2025 19:38:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2F8248F75;
	Sun, 16 Nov 2025 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sqe+lrK5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801B335CBA9;
	Sun, 16 Nov 2025 19:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763321896; cv=none; b=k0wY5ufEFaIqERNisFbOLsJvMXZ+H79IYKyFZCdRTfkLin4xnFTOX2mkxDPUouZpCfnWb6xHrFkHjqzBwGs/HjEFhfBzTfRJ7jEdOl841C3RIusOtd6+pVz9EBsVjQvgKy2wzBEp82IpYa4QrU88n2gpze9X1MOj2MdCBBdd/ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763321896; c=relaxed/simple;
	bh=aDnvoRXp5jbZbWUaysTMKr6pXeOZrBDJ3a6yyM30XtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbzjUbL70PytMCqgBne2lTOCPA16+QUOiHy5oSZlmk6X5O7zTvjUw/MactfLtJz5VJerJuHDuCm5DpgqjF1jTDzAHMxk8RrLTR0rgIsqtDseVfaHkGo9sgZGyhEWVZvO7Kq7jdunPUZ59buLTEZ6N8sluyjzppxOaioD3PuxEg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sqe+lrK5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75899C4CEF1;
	Sun, 16 Nov 2025 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763321896;
	bh=aDnvoRXp5jbZbWUaysTMKr6pXeOZrBDJ3a6yyM30XtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqe+lrK5Q9WvEDBSLJsJtqJeSCpe3kjuCAAp5J9RFxBhzL+oMhNzWTVGFVdnc42im
	 Mn5SR6lLOmZTuuSsmJ3EHWXz33qrELFXMAeKI6U3BRoi7sVU6Tk88PrxiGK3/G6IHM
	 1EPwZoO7VymlR1AMupWuiCoTccvgqZhup/2ez6+xxKAM4eqJbOwEJhE2YqBgRgnVE6
	 RYcrfAKRSHt/kxFKHQDDAZj5McYpD1ztzmUPulj8VEIePCrbldlGI0T2IXQMQor01c
	 pF7raNtTeapjVgRytFTEivajQU5+SKKWTR+s4Ws1vEtitpTPbyoEgyu5ayubPwKGeH
	 0rCZeEFUJqXJA==
Date: Sun, 16 Nov 2025 19:38:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
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
Message-ID: <20251116-axis-pouch-419f794cb1cb@spud>
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
 <0bc61e6e-8a27-4711-8ce0-60b1e300ac31@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cRVUOKC/OyDnbFeQ"
Content-Disposition: inline
In-Reply-To: <0bc61e6e-8a27-4711-8ce0-60b1e300ac31@gmail.com>


--cRVUOKC/OyDnbFeQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 10:36:16PM +0800, Asuna wrote:
> Hi everyone. Sorry I was inactive on this patch for a while. I'm getting
> back into this work.
>=20
> On 9/19/25 1:20 PM, Vivian Wang wrote:
> > I think instead of testing libclang version, it would make more sense to
> > feature test if bindgen the binary supports these flags, like what we
> > already do with $(cc-option,...).
> >=20
> > Same for all the other version tests.
>=20
> Conor, since you've reviewed the v3 patch, do you think Vivian's suggesti=
on
> is a better solution? If so, I can start trying to make a v4 patch towards
> that path in the next few days.
>=20

I'm okay with either approach, just drop my tag if you decide to use her
suggestion, and I will re-review.

--cRVUOKC/OyDnbFeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRooHAAKCRB4tDGHoIJi
0gg8AP0bFl/forsWFyM7j0VCxtaiprWS+FBSVkAkEe6urE/eZgEAjsKFyclbZ6NS
7a6Sk1T0L3FCy8UZIMOgsZfdiKOuvQY=
=/6Vf
-----END PGP SIGNATURE-----

--cRVUOKC/OyDnbFeQ--

