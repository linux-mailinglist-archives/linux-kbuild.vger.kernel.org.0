Return-Path: <linux-kbuild+bounces-6467-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C55A7D24D
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 05:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B30D716A00E
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 03:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1768D212FA5;
	Mon,  7 Apr 2025 03:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIBlcF9O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D912F212F8A;
	Mon,  7 Apr 2025 03:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995184; cv=none; b=rD6EmVgzPBchO2+JRLtsAg9H6fOVE2KBbQwlO/+HLXJyuDTv23dMCfKZtENvcdhcB2O7QVGi0znNxGV16ThYcy9s7HysljKBqUa0eOYllHU6btSVp8UJsVw/xfFOURh7f0NL7PPsl9U83+04rJdayEQxV0bJS7KTrwgSZmQvYrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995184; c=relaxed/simple;
	bh=/wb7EDPZuLlPLl9Q+LhNHF1Q9Bp6fgQ8+43O6aKa+Ag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zt6XEOfjepBCKll/AaZyzWrEHamo/GxjNhOX3AsXbKmSQIdQJN0fFsgTxH98q2JKYpyEWmNYHoP7cHE6y4X5J+LwyVmYsS0DCoLp5WyZ4E+d2/ZrrACHybSNQHrcALwLy8w1VZYK6X9H1ygGF95ASs8x2qIeCXUQaBJZOimjiAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIBlcF9O; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB61BC4CEE3;
	Mon,  7 Apr 2025 03:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743995183;
	bh=/wb7EDPZuLlPLl9Q+LhNHF1Q9Bp6fgQ8+43O6aKa+Ag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uIBlcF9OHqkecTKw7PX4U2PZa2gaQr/6pdSNQsDO8HiIM3oC3W+R6ofuDjT4XvP3e
	 KG9Y2BPUmD0AMdQNdR4b7exWNW4c1t/5zZHAe4RV7d7PRHKA52iN0dz2MomJSyc4ib
	 kih0xao8dW4cEWpqKvTywVjUq4nueAx8pTJsabrcPTZ1ESTBe1Z22SpWjfF8w1nDrh
	 hQ3pBffWFADBHw9471ifGjPSNfgu6yL8FsJJaIRsKHs42JUlT1ZH0tJ1jgzocD9xuu
	 JHl5FdzLocnEK6JXCQ2YWmElEOp7jk58p26LN143dS52ePkhdsjlnMlKbll9vg7NSH
	 YXW5qO4IbmI4A==
Date: Mon, 7 Apr 2025 11:06:13 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "=?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada
 <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas
 Schier <nicolas.schier@linux.dev>, kernel@collabora.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH RFC 0/2] Add Kconfig pages and cross-references to
 Documentation
Message-ID: <20250407110347.087497be@sal.lan>
In-Reply-To: <6b019d76-1a8f-4e8d-8b9b-05094a014689@notapiano>
References: <20250404-kconfig-docs-v1-0-4c3155d4ba44@collabora.com>
	<8734eogfqw.fsf@trenco.lwn.net>
	<6b019d76-1a8f-4e8d-8b9b-05094a014689@notapiano>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Fri, 4 Apr 2025 12:24:27 -0400
N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> escreveu:

> On Fri, Apr 04, 2025 at 08:31:35AM -0600, Jonathan Corbet wrote:
> > N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com> writes:
> >  =20
> > > This series adds Kconfig pages (patch 1) to the Documentation, and
> > > automarkups CONFIG_* text as cross-references to those pages (patch 2=
).
> > >
> > > There is a huge change in build time with this series, so we'd either
> > > have to so some optimization and/or put this behind a flag in make so=
 it
> > > is only generated when desired (for instance for the online
> > > documentation):
> > >
> > >   (On an XPS 13 9300)
> > >  =20
> > >   Before:
> > >  =20
> > >   real	6m43.576s
> > >   user	23m32.611s
> > >   sys	1m48.220s
> > >  =20
> > >   After:
> > >  =20
> > >   real	11m56.845s
> > >   user	47m40.528s
> > >   sys	2m27.382s
> > >
> > > There are also some issues that were solved in ad-hoc ways (eg the
> > > sphinx warnings due to repeated Kconfigs, by embedding the list of
> > > repeated configs in the script). Hence the RFC. =20
> >=20
> > I'm still digging out from LSFMM, so have only glanced at this ... I can
> > see the appeal of doing this, but nearly doubling the docs build time
> > really isn't going to fly.  Have you looked to see what is taking all of
> > that time?  The idea that it takes as long to process KConfig entries as
> > it does to build the entire rest of the docs seems ... a bit wrong. =20
>=20
> I have not yet. Thought I'd get some feedback before looking into the
> performance. But I agree with the sentiment.

My feeling is that the issue is using :glob" and a lot of wildcards
inside Sphinx. Instead, you should use something similar to what
I've done to get *.[ch] for the new kernel-doc.py implementation.

Placing it as an extension on a similar way to what i did with
get_abi.py would likely help as well.

> > I wonder what it would take to create a Sphinx extension that would
> > simply walk the source tree and slurp up the KConfig entries directly?
> > That would be nicer than adding a separate script in any case. =20
>=20
> That is what is currently done for the ABI, AFAIK, so definitely seems do=
able.

Yes, doing that via an extension is doable. If done right, it can also be
fast.

> The key difference between the ABI approach and this here, is that my goa=
l was
> to reflect the Kconfig file hierarchy in the Documentation. So each Kconf=
ig
> file gets its own documentation page, while the ABI approach collects the
> contents of all ABI files into just a few documentation pages (stable, te=
sting,
> etc). (So there's a non-constant number of .rst files, which means they h=
ave to
> be generated and can't be a sphinx plugin in this approach).

Actually, get-api.py (the new version, merged for 6.15) generates a dict
just once. Then, Sphinx rst files filters part of the doc, but I see your
point: for every entry, we would need a .rst file if we follow the same
approach.

That's said, it may have a way to tell Sphinx to threat Kconfig files
on a similar way it handles ".txt" and ".rst" files. Something like the
extension to handle markdown works:

	https://www.sphinx-doc.org/en/master/usage/markdown.html

Another alternative would be to use:

	https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-incl=
ude_patterns

but this would require Sphinx 5.1, which is above our current minimal
version. That's said, nothing prevents to only enable generating such
documentatation if the Sphinx version supports it.


> I went for this approach because the filesystem hierarchy seemed the most
> logical way to group the Kconfig symbols. Also Kconfig files have directi=
ves like
> 'menu' that should be present in the documentation in the same order they=
 appear
> in the file to fully describe dependencies of the symbols, and having all=
 of
> that in the same page seems like it would be confusing. But given the pot=
ential
> benefits it's worth a try for sure.
>=20
> Now that I think about it, seems quite likely that a lot of the time spen=
t comes
> from creating a subshell and running the script for every Kconfig file. So
> making a single script or sphinx extension that itself handles iterating =
over
> all the files would likely greatly reduce the run time. I'll test that.
>=20
> Thanks,
> N=C3=ADcolas
>=20
> >=20
> > I'll try to look closer, but I'll remain a bit distracted for a little
> > while yet.
> >=20
> > Thanks,
> >=20
> > jon =20

