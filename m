Return-Path: <linux-kbuild+bounces-8649-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AE3B3AC82
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 23:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1E685E172E
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 21:08:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F0321A8F84;
	Thu, 28 Aug 2025 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pJT9EBg7"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A2414A0B5;
	Thu, 28 Aug 2025 21:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756415270; cv=none; b=raTSBNjB5Rosha1avW1gKw1LFj6Lw+LCFbz/zYCY18J2AkS+cCFHgfTBF/7ld1UgVY+0voaVgV5s8ocScGSGoxzhT0+ykqa+9Ko6ykted/CDyfcBgFRguo1wJk5BI3THj4behDO+aaDgc2P/dpGBQBZPLU/eRbb9PE0hvqfyfQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756415270; c=relaxed/simple;
	bh=3lJFbTf5d9SOdnXSpu0r1rqLV3G7tmqEW7dCzgaSZu8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SIq0KIwsPfkXxEBShTAsysQdaHTP1vMaiqsRlR4b83dHpyncffMrQeCwaSABNGkDFgfXD2+sEmNYRFbfJBItV3J9SZVfKdEpIvNpeOH/6HmMzz5E8DyDLpcrOJWR5RAzTl51LDje9aSDWmsgn7FDS3muQ/lAC5KX4BJ8lAsBZDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pJT9EBg7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72EAC4CEF4;
	Thu, 28 Aug 2025 21:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756415270;
	bh=3lJFbTf5d9SOdnXSpu0r1rqLV3G7tmqEW7dCzgaSZu8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pJT9EBg7iCsAv32XNzDOcWgERzWHuOQ3TDpdhvFawMsQQT+d7q2Xg8LCB4SsTep+w
	 JN4tH3yiaOmRvo+0R9rHTCyOXbxA5Qx6wJUwDKCKPvRU6GM0MaFUcBGcS4fAhTtNb7
	 yXW5m3Chx46o4pSlNScRxCglJv5k5+bfcE8WuXhVThbU7dJSg7PGdlRDbO/96vBJmt
	 F1faNQwaeKe30K1Dblrs01exG8nkgJ6pRcx7u8xMQaEkRzfXpOM/n1cBCKz8nxHn9n
	 7sFkjR7/zButFdmxdBvVF7+l3QcpFkSbL0Kgwi3a/AAnainRYij87APl1ojmP20xSO
	 RfNWpAnc1D62A==
Date: Thu, 28 Aug 2025 23:07:44 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Thomas =?UTF-8?B?V2Vpw59zY2h1aA==?=
 <thomas.weissschuh@linutronix.de>, Alice Ryhl <aliceryhl@google.com>, Randy
 Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@gmail.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: add support to build manpages from
 kerneldoc output
Message-ID: <20250828230744.1fa2f291@foz.lan>
In-Reply-To: <aK-A2DmxhGDQGVEf@levanger>
References: <cover.1756282370.git.mchehab+huawei@kernel.org>
	<d880eb9c915a08c25102b7c1b17a01a8ab7e32c3.1756282370.git.mchehab+huawei@kernel.org>
	<aK-A2DmxhGDQGVEf@levanger>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Thu, 28 Aug 2025 00:04:08 +0200
Nicolas Schier <nsc@kernel.org> escreveu:

> Please check your mail tooling: something strange happened to all
> @kernel.org adresses:
>=20
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
> >         Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
> >         Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>,
> >         Alice Ryhl <aliceryhl@google.com>,
> >         Masahiro Yamada <mchehab+huawei@kernel.org>,
> >         Miguel Ojeda <mchehab+huawei@kernel.org>,
> >         Nathan Chancellor <mchehab+huawei@kernel.org>,
> >         Nicolas Schier <nicolas.schier@linux.dev>,
> >         Randy Dunlap <rdunlap@infradead.org>,
> >         Tamir Duberstein <tamird@gmail.com>,
> >         linux-kbuild@vger.kernel.org,
> >         linux-kernel@vger.kernel.org =20

That's really weird! Thanks for letting me know. It was not supposed
to do any e-mail changes.

>=20
> On Wed, Aug 27, 2025 at 10:26:37AM +0200, Mauro Carvalho Chehab wrote:
> > Generating man files currently requires running a separate
> > script. The target also doesn't appear at the docs Makefile.
> >=20
> > Add support for mandocs at the Makefile, adding the build
> > logic inside sphinx-build-wrapper, updating documentation
> > and dropping the ancillary script.
> >=20
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > ---
> >  Documentation/Makefile                 |  3 +-
> >  Documentation/doc-guide/kernel-doc.rst | 29 ++++-----
> >  Makefile                               |  2 +-
> >  scripts/split-man.pl                   | 28 ---------
> >  tools/docs/sphinx-build-wrapper        | 81 ++++++++++++++++++++++++--
> >  5 files changed, 95 insertions(+), 48 deletions(-)
> >  delete mode 100755 scripts/split-man.pl
> >=20
> > diff --git a/Documentation/Makefile b/Documentation/Makefile
> > index 3e1cb44a5fbb..22e39e5ed07d 100644
> > --- a/Documentation/Makefile
> > +++ b/Documentation/Makefile
> > @@ -53,7 +53,7 @@ ifeq ($(HAVE_SPHINX),0)
> >  else # HAVE_SPHINX
> > =20
> >  # Common documentation targets
> > -infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
> > +mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkch=
eckdocs:
> >  	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
> >  	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
> >  		--sphinxdirs=3D"$(SPHINXDIRS)" --conf=3D$(SPHINX_CONF) \
> > @@ -104,6 +104,7 @@ dochelp:
> >  	@echo  '  htmldocs        - HTML'
> >  	@echo  '  texinfodocs     - Texinfo'
> >  	@echo  '  infodocs        - Info'
> > +	@echo  '  mandocs         - Man pages'
> >  	@echo  '  latexdocs       - LaTeX'
> >  	@echo  '  pdfdocs         - PDF'
> >  	@echo  '  epubdocs        - EPUB'
> > diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc=
-guide/kernel-doc.rst
> > index af9697e60165..4370cc8fbcf5 100644
> > --- a/Documentation/doc-guide/kernel-doc.rst
> > +++ b/Documentation/doc-guide/kernel-doc.rst
> > @@ -579,20 +579,23 @@ source.
> >  How to use kernel-doc to generate man pages
> >  -------------------------------------------
> > =20
> > -If you just want to use kernel-doc to generate man pages you can do th=
is
> > -from the kernel git tree::
> > +To generate man pages for all files that contain kernel-doc markups, r=
un::
> > =20
> > -  $ scripts/kernel-doc -man \
> > -    $(git grep -l '/\*\*' -- :^Documentation :^tools) \
> > -    | scripts/split-man.pl /tmp/man
> > +  $ make mandocs
> > =20
> > -Some older versions of git do not support some of the variants of synt=
ax for
> > -path exclusion.  One of the following commands may work for those vers=
ions::
> > +Or calling ``script-build-wrapper`` directly:: =20
>=20
>                 ^^^^^^ sphinx-build-wrapper ?

This is on a separate patch series:

https://lore.kernel.org/linux-doc/cover.1756138805.git.mchehab+huawei@kerne=
l.org/

It basically moves the complex logic around docs Makefile into a
script that can either be called via Makefile or directly.

Thanks,
Mauro

