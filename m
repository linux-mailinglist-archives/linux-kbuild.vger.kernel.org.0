Return-Path: <linux-kbuild+bounces-8975-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B35BA7A24
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 02:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C08783B62F5
	for <lists+linux-kbuild@lfdr.de>; Mon, 29 Sep 2025 00:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 537881A2C0B;
	Mon, 29 Sep 2025 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tr3hqD49"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EA11A239A;
	Mon, 29 Sep 2025 00:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759106695; cv=none; b=Qqq2PJPR3BIvKwP+CJ+ghUPVhrb1UNQvxl7ilWQ/hmjTSnYKr6ClULlVqVh9cCxdumyyvEJoMo5Ao1n5ek22x1WQs08Fs4dlna+/PeehF2ET8unP4KBiDB/f0+wJ87y49nsbrXaJAKnOSz+01SXcSWreZw/R6MeBypVP0xSXvSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759106695; c=relaxed/simple;
	bh=ezlBS1msfavapR0wlpEBcCZo/WqIgfbxLQ2zqXf5QCU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZFZhV8qidVSzes9kd1HSHmo8a4dLVtQSU4CQInQcIWDqH8TSro3P21KafmmIfvHKWUUbu9Ft0xdXocZ4B1FEApI4yEbgZPkYbX9PhxNG8L69+L/HASghV1ywQSX5IlSkR52vMbuPNVapA/Bd6d7PBJEqOCr+XTE6PE32VNUhbg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tr3hqD49; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72BECC4CEF0;
	Mon, 29 Sep 2025 00:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759106694;
	bh=ezlBS1msfavapR0wlpEBcCZo/WqIgfbxLQ2zqXf5QCU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Tr3hqD49p+UF/DPcCFcRo+8yJkMfQvcSWfHnzDYE19y8mEWTL7jLfGVjNWbjWOfJr
	 Xjy5YzI8Tdixx0MbjJhenA5TueG3ZinReTGa1ltomYRU3tElzmNZYoQp/kNARn/2JJ
	 Hq/61k9EZDVDlYEM0/l76BE8lko0/lnOPzly4j+431pnowKxTrDK605+2CiWpWf0pb
	 DDnOW2qEQ3HCM80953UM0SysKRJbkhRnuvKakKGZseuywfuGZozNSRnXSK3TB4/LFF
	 mvFDR87RsIzQC7JAtoXqXg8zA9r0HkzkddzC/RWeKlVW2+KTvRqhvueoogAVRL/s/+
	 hSVqC4gVJTamg==
Date: Mon, 29 Sep 2025 02:44:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>, Thomas
 =?UTF-8?B?V2Vpw59zY2h1aA==?= <thomas.weissschuh@linutronix.de>, Alice Ryhl
 <aliceryhl@google.com>, Randy Dunlap <rdunlap@infradead.org>, Tamir
 Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 19/24] docs: add support to build manpages from
 kerneldoc output
Message-ID: <20250929024449.69e6b79b@foz.lan>
In-Reply-To: <aNhKdCrSM29uwvpn@levanger>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
	<3d248d724e7f3154f6e3a227e5923d7360201de9.1758196090.git.mchehab+huawei@kernel.org>
	<aNhKdCrSM29uwvpn@levanger>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Sat, 27 Sep 2025 22:35:00 +0200
Nicolas Schier <nsc@kernel.org> escreveu:

> Please note that @kernel.org receipients are still not addressed
> correctly:
>=20
> > Date: Thu, 18 Sep 2025 13:54:53 +0200
> > From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > To: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet=
 <corbet@lwn.net>
> > Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Akira Yokosawa <=
akiyks@gmail.com>,
> >     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Thomas Wei=C3=9F=
schuh <thomas.weissschuh@linutronix.de>,
> >     Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <mchehab+huawei@=
kernel.org>,
> >     Miguel Ojeda <mchehab+huawei@kernel.org>, Nathan Chancellor <mcheha=
b+huawei@kernel.org>,
> >     Nicolas Schier <nicolas.schier@linux.dev>, Randy Dunlap <rdunlap@in=
fradead.org>,
> >     Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
> >     linux-kernel@vger.kernel.org =20

Just Found the issue: the problem were on a rewrite rule
on my emailer which I added ages ago. Dropped it. It should
be ok next time.

> On Thu, Sep 18, 2025 at 01:54:53PM +0200, Mauro Carvalho Chehab wrote:
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
> > index 05397b9d844d..aa42b2cb7030 100644
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
> >  		--sphinxdirs=3D"$(SPHINXDIRS)" --conf=3D"$(SPHINX_CONF)" \
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
> For this very patch, there is no 'scripts-build-wrapper' but
> 'sphinx-build-wrapper'.  Or am I missing something?

Sorry! yes, sphinx-build-wrapper is the right name.

>=20
> > =20
> > -  $ scripts/kernel-doc -man \
> > -    $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
> > -    | scripts/split-man.pl /tmp/man
> > +  $ ./tools/docs/sphinx-build-wrapper mandocs
> > =20
> > -  $ scripts/kernel-doc -man \
> > -    $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)to=
ols") \
> > -    | scripts/split-man.pl /tmp/man
> > +The output will be at ``/man`` directory inside the output directory
> > +(by default: ``Documentation/output``).
> > +
> > +Optionally, it is possible to generate a partial set of man pages by
> > +using SPHINXDIRS:
> > +
> > +  $ make SPHINXDIRS=3Ddriver-api/media mandocs
> > +
> > +.. note::
> > +
> > +   When SPHINXDIRS=3D{subdir} is used, it will only generate man pages=
 for
> > +   the files explicitly inside a ``Documentation/{subdir}/.../*.rst`` =
file.
> > diff --git a/Makefile b/Makefile
> > index 6bfe776bf3c5..9bd44afeda26 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1800,7 +1800,7 @@ $(help-board-dirs): help-%:
> >  # Documentation targets
> >  # --------------------------------------------------------------------=
-------
> >  DOC_TARGETS :=3D xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs=
 \
> > -	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs
> > +	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs mandocs
> >  PHONY +=3D $(DOC_TARGETS)
> >  $(DOC_TARGETS):
> >  	$(Q)$(MAKE) $(build)=3DDocumentation $@ =20
>=20
> Acked-by: Nicolas Schier <nsc@kernel.org>
Thanks!

Mauro

