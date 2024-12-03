Return-Path: <linux-kbuild+bounces-4979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05129E2BE5
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 20:20:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A53D4284AB7
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 19:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEE331FECB8;
	Tue,  3 Dec 2024 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/a2Vsjz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7852013B2B8;
	Tue,  3 Dec 2024 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733253605; cv=none; b=XNyxYRuhn+sPpUmTStYHXuOcvkegReocty/f624e4vILV5jXJo7T8y9ms9A58WSVwXQgff1HgocQ4ufvXB/T/CB7S8hma21vUmOvNcfV285713MO5J8tex30eE3PV/nHdkqaoiU05YC6NBSWG8ohGgFC9Fig69p8EZXwGfYRgZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733253605; c=relaxed/simple;
	bh=GoVY0MacbGqeIM2tuFnUAwUqQsX3P927jIipuZadN/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlX063Pp7rxnvGaMPym5NNoBbGsQO/XQeTu83yLFAPM/7S28P+hKGhHjuzi1Nj5uFYJKJr34mdmP1/WtSLXdH9j/dqazJ8l//l7kkEsS7jM2b8crHnmbd0fTNuDtr8mSdPFhKs+HofHdWcbSEX27cbklEWN08xdXMV8XY2+I9CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/a2Vsjz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B950C4CECF;
	Tue,  3 Dec 2024 19:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733253605;
	bh=GoVY0MacbGqeIM2tuFnUAwUqQsX3P927jIipuZadN/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b/a2VsjzXpa4vq+6GX9bWpT4jfdCc9+qSk5OIXdrtio3/wiZsdTNMnGHPb5hWQ1Lu
	 hnJraYFam6cvpxnBvD22Ajp/WwFQLQOdN74OE7XwbpKKDUqcFY5A/Uz/oOrKg6ZgVa
	 bqvVY/5u91+fPguQJOGxbEsS43YeS/32dpiPHd+hKL9WUEHF3ckg+B1Gv+6jauj8U2
	 Xe9cg0rQHScQpqNzLZ5UAZqGVM4kXUCVE9lC3aSGcHJ+TgH6tMjXWTTteSgXZDPiQ1
	 pxNd5QqcXmNcUwz7HQtEhX2FJEeOT5H5e5MgklbZuSV8aATLJasgSNxnTkgXkbKDjv
	 LiV+OrnyYgqzA==
Date: Tue, 3 Dec 2024 19:19:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>, mcgrof@kernel.org,
	x86@kernel.org, hpa@zytor.com, petr.pavlu@suse.com,
	samitolvanen@google.com, da.gomez@samsung.com, masahiroy@kernel.org,
	nathan@kernel.org, nicolas@fjasle.eu, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	hch@infradead.org, gregkh@linuxfoundation.org,
	linux-next@vger.kernel.org
Subject: Re: [PATCH -v2 1/7] module: Convert symbol namespace to string
 literal
Message-ID: <d707cb3b-1569-45d9-bdc3-dcc98eb88bc4@sirena.org.uk>
References: <20241202145946.108093528@infradead.org>
 <20241202150810.048548103@infradead.org>
 <20241202151533.GF8562@noisy.programming.kicks-ass.net>
 <CAHk-=wh7KugYO+R-1DMmkLz4fD_-A9BMyrWTVsH_K0a86Ojn4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PoFmYAtqBuzya2VW"
Content-Disposition: inline
In-Reply-To: <CAHk-=wh7KugYO+R-1DMmkLz4fD_-A9BMyrWTVsH_K0a86Ojn4A@mail.gmail.com>
X-Cookie: She's genuinely bogus.


--PoFmYAtqBuzya2VW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2024 at 11:33:58AM -0800, Linus Torvalds wrote:
> On Mon, 2 Dec 2024 at 07:15, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Perhaps we can ask Linus to run this now, before -next fills up again ?
>=20
> Sure. I did an unasked-for scripted 'remove_new' removal right after
> rc1 for the same reason.
>=20
> If we have these kinds of big scripted things, right after the merge
> window tends to be the best time to do them. The conflict potential of
> leaving it hanging in linux-next can be somewhat annoying. They may be
> fairly unlikely, and easy to resolve individually, but it's one of
> those "one is trivial to deal with, but even just a handful is
> annoying".
>=20
> So I'll run your script and take your commit message, and we'll have
> this part over and done with.

I *think* this is interacting in a fun way with at least the IIO
subsystem in -next (Linus' tree is fine, I didn't do too much
investigation as I'd quite like the -next build to finish some time
today):

/tmp/next/tmp/ccjk7YJR.s: Assembler messages:
/tmp/next/tmp/ccjk7YJR.s:5: Error: junk at end of line, first unrecognized =
character is `I'
make[7]: *** [/tmp/next/build/scripts/Makefile.build:194: drivers/iio/imu/i=
nv_icm42600/inv_icm42600_core.o] Error 1

I've dropped the IIO trees from -next for now.

--PoFmYAtqBuzya2VW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPWd0ACgkQJNaLcl1U
h9DqCgf/eHt6CEyW4+3cV5neQO9p64Zdpt+vJBM+4RtNmpd3ZRufj3exRjmiqrC7
L4Yj4iHFGHk5Vdkw0PUCe6JZ7vS5hIcP1TC/xzhPqL31++/6L3/RCn1bAJZ5s+if
UVKFxbTEiFclpfcHejEYmv/mz0+sN1WOm7xwK2N5/AHwWxlMNGZAQmG0gM0sA2Ws
Z+dT6DjMIOD/RR63yeT6uetozBl2TkJTVj8tDH8QHZlgOlZrqyUl4RrcLGnDugq9
rXEBU/EgaKGTQhWgj4Uleid3Rw5VS8Hmu1Tcp+yvKS4ACzICMVKuE8WV7inO0Xt/
oYpm7fWMp9YMDq/gHcC4Dlrs6njCGQ==
=uKSV
-----END PGP SIGNATURE-----

--PoFmYAtqBuzya2VW--

