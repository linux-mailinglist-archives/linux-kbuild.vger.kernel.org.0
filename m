Return-Path: <linux-kbuild+bounces-4980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3269E2F86
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 00:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5A86B29081
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Dec 2024 22:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E25A1DFDB7;
	Tue,  3 Dec 2024 22:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ftUS/Wpf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F051D79A0;
	Tue,  3 Dec 2024 22:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733263569; cv=none; b=hqUMxlkW9GSVLrlCTvl1RFuyqxLmK4jztjiS+hBw7YGwI/QE26xJypN6wehV3x5ptoxUZEcU0r3gV+GZpjYeKV+wq3SvNN5QC1cLDYXw759AfrncPvPjo+7ZWc4at74Pn1DnbrnDprUkZz+baqnvyEKQviG4H9Hw44a15fFa05Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733263569; c=relaxed/simple;
	bh=IehJ4AIWWz0772NCAQO8hzMuGVgotMd1OEvMqgvLjO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bR+b2NDAf/tHNsUn4uOGKHTHFuQWke6UrSkQPU5T78/tm93PfuASE7HnUbzK/lE6rt35hM6oohjt+73kMCue7X/WK5xeL/p+/PSRCEv34Aq2IWefX/uylzbwF7nDMA45cN6HqFz5tp7SCUhOR0bo51dm1zB7lqNluKk5ymiuVoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ftUS/Wpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326F6C4CEDC;
	Tue,  3 Dec 2024 22:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733263568;
	bh=IehJ4AIWWz0772NCAQO8hzMuGVgotMd1OEvMqgvLjO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ftUS/Wpfzl6rAV6W1Fv9Nj0Z6nP375x3sX3S0EgpAXN8jeJSSHevR7r9/J59WGnn6
	 dnKlO1CeZ6WUoZPPy5V8p4VlDsak2GM3J8JYiF6GRNs339aHB5OOj7OYFVEsCMKCes
	 KcDTggAMPlAndWscRzMlHDRP7g3d8Iff+lHx5SR1Qfft59Ao7bw8ipN+xGGDGjWNzG
	 MDrxHBUGoA5kZzYBC8GnzU6AfcV+nh9AA8/2bpludCpwJQ4vKC9unAx9PYysaWnHRg
	 UwZao6PW+eaQl3Ng39j7t1kBtsjKdifmmJyi2iL3HB3hx9vax/GzF3HQPIbap/3bdy
	 2AqNY9CNhRKCA==
Date: Tue, 3 Dec 2024 22:06:01 +0000
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
Message-ID: <93a900b2-7740-4bfa-bfac-1ec2e5bfa383@sirena.org.uk>
References: <20241202145946.108093528@infradead.org>
 <20241202150810.048548103@infradead.org>
 <20241202151533.GF8562@noisy.programming.kicks-ass.net>
 <CAHk-=wh7KugYO+R-1DMmkLz4fD_-A9BMyrWTVsH_K0a86Ojn4A@mail.gmail.com>
 <d707cb3b-1569-45d9-bdc3-dcc98eb88bc4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DLVYcvakTOgKySND"
Content-Disposition: inline
In-Reply-To: <d707cb3b-1569-45d9-bdc3-dcc98eb88bc4@sirena.org.uk>
X-Cookie: Alimony is the high cost of leaving.


--DLVYcvakTOgKySND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2024 at 07:20:05PM +0000, Mark Brown wrote:
> On Mon, Dec 02, 2024 at 11:33:58AM -0800, Linus Torvalds wrote:

> > If we have these kinds of big scripted things, right after the merge
> > window tends to be the best time to do them. The conflict potential of
> > leaving it hanging in linux-next can be somewhat annoying. They may be
> > fairly unlikely, and easy to resolve individually, but it's one of
> > those "one is trivial to deal with, but even just a handful is
> > annoying".

> > So I'll run your script and take your commit message, and we'll have
> > this part over and done with.

> I *think* this is interacting in a fun way with at least the IIO
> subsystem in -next (Linus' tree is fine, I didn't do too much
> investigation as I'd quite like the -next build to finish some time
> today):

Yes, this is breaking ASoC and possibly other things as well.  I guess
any tree adding a new use of these macros needs to merge mainline to
avoid a mess here.

--DLVYcvakTOgKySND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdPgMgACgkQJNaLcl1U
h9BV/gf9HfmQ/2rTxmyGvtTJh/xuiW79W2pQGjCcU3r7niEke5B2mPtIAyGIpqSI
ID4mHsuGkFAxk3XAL636XS3ccDCUIAXpGAVnTr4mqX8EeknHK932vfg0fAua3AUU
/qANxVOhvIE+NNoat2sDq9WH3EBDdLtG02Wa0EhYr5e5QOO7H4yZSpkAhVTyAbxd
BXcYq50biFFnQ9z1srulbSUzYJ7ldpKKX3j40noJ9GfRGifKAOIbXjY10uYG1Au7
1KxhGqxZ/RssMsfrMov1wgd08F73IautuDwJTbVicPCm6Nbucoz85wASWZtkboss
hLEkq7WkGbChUldcW7TsNbTRrjSquQ==
=Qf1I
-----END PGP SIGNATURE-----

--DLVYcvakTOgKySND--

