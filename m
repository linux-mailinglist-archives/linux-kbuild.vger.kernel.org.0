Return-Path: <linux-kbuild+bounces-8643-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04061B3AA0B
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 20:29:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2DFE7C0B84
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Aug 2025 18:29:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B73272E74;
	Thu, 28 Aug 2025 18:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyZu9Q8e"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2776818E377;
	Thu, 28 Aug 2025 18:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756405761; cv=none; b=YS/Lp2YBLDMcAeBeA0GLfwJ2ds7rvCNSp+cON3SQCMcVykwi3vFosdjEm/KHnJD3xOnBgCBNRh+OW5hzlhuQTM6yUYx7Ohp3ezdM55i46PQzRZzSZw0u7YFp+ykgJTut2uwPkqrUTyzZ2LClg5AQCp7zcHW7ebmwPPCBD1g+CzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756405761; c=relaxed/simple;
	bh=lWIn7MeegvcPezZrCADC1Y2EJqB+kL6yCJU0iU5fPM0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqzQ9fTmaXxdXX0Wb0wHKa1OrqlddzirPFTVgo75h8YftODENrUBQQb4n3PsJe1h9+n1qLcj1zfbX+zJlyWOjspe+of5I+Ds75em3p12PntuD9dEcusbVMjB7P+9nCnNf8+5ozSsrBj3ocLi3IFilOuHI5Pxkyeo+bpafO2CvHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyZu9Q8e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4822AC4CEEB;
	Thu, 28 Aug 2025 18:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756405760;
	bh=lWIn7MeegvcPezZrCADC1Y2EJqB+kL6yCJU0iU5fPM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DyZu9Q8eE6Mau49LSxcffyy5WRlQQzBfQ4Fb9x6jiCHFvQ21PEhfLvh+wqeD4y5vS
	 5eZGcU7Yva2GrTP1rqGWuG69UvDFd7IwsQqjBS9ieeJEsxxkDJi9vJxVN9q96Jh7xv
	 BX+L47/WGzvYYiSN1S7qKpfklaA3fYDgFwv3XnTdVbBiSeyHe9S/YAbEJvESdDdY7M
	 gQXLnGRW9wQ6HBGFT/fk7rjRp7ZMe2srom8Qj8W2Dd9cn/aFluFUumQfZR2r8WpYhr
	 OWC9pCoxrGNX1HWyt92nwNMIfRxZolWTaNTYpcR7lXU4PHTKHY5bnXyvmkbzgI097D
	 MO077FS3lrGpQ==
Date: Thu, 28 Aug 2025 00:04:08 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] docs: add support to build manpages from
 kerneldoc output
Message-ID: <aK-A2DmxhGDQGVEf@levanger>
References: <cover.1756282370.git.mchehab+huawei@kernel.org>
 <d880eb9c915a08c25102b7c1b17a01a8ab7e32c3.1756282370.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d880eb9c915a08c25102b7c1b17a01a8ab7e32c3.1756282370.git.mchehab+huawei@kernel.org>

Please check your mail tooling: something strange happened to all
@kernel.org adresses:

> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
>         Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
>         Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>,
>         Alice Ryhl <aliceryhl@google.com>,
>         Masahiro Yamada <mchehab+huawei@kernel.org>,
>         Miguel Ojeda <mchehab+huawei@kernel.org>,
>         Nathan Chancellor <mchehab+huawei@kernel.org>,
>         Nicolas Schier <nicolas.schier@linux.dev>,
>         Randy Dunlap <rdunlap@infradead.org>,
>         Tamir Duberstein <tamird@gmail.com>,
>         linux-kbuild@vger.kernel.org,
>         linux-kernel@vger.kernel.org

On Wed, Aug 27, 2025 at 10:26:37AM +0200, Mauro Carvalho Chehab wrote:
> Generating man files currently requires running a separate
> script. The target also doesn't appear at the docs Makefile.
> 
> Add support for mandocs at the Makefile, adding the build
> logic inside sphinx-build-wrapper, updating documentation
> and dropping the ancillary script.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/Makefile                 |  3 +-
>  Documentation/doc-guide/kernel-doc.rst | 29 ++++-----
>  Makefile                               |  2 +-
>  scripts/split-man.pl                   | 28 ---------
>  tools/docs/sphinx-build-wrapper        | 81 ++++++++++++++++++++++++--
>  5 files changed, 95 insertions(+), 48 deletions(-)
>  delete mode 100755 scripts/split-man.pl
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index 3e1cb44a5fbb..22e39e5ed07d 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -53,7 +53,7 @@ ifeq ($(HAVE_SPHINX),0)
>  else # HAVE_SPHINX
>  
>  # Common documentation targets
> -infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
> +mandocs infodocs texinfodocs latexdocs epubdocs xmldocs pdfdocs linkcheckdocs:
>  	$(Q)@$(srctree)/tools/docs/sphinx-pre-install --version-check
>  	+$(Q)$(PYTHON3) $(BUILD_WRAPPER) $@ \
>  		--sphinxdirs="$(SPHINXDIRS)" --conf=$(SPHINX_CONF) \
> @@ -104,6 +104,7 @@ dochelp:
>  	@echo  '  htmldocs        - HTML'
>  	@echo  '  texinfodocs     - Texinfo'
>  	@echo  '  infodocs        - Info'
> +	@echo  '  mandocs         - Man pages'
>  	@echo  '  latexdocs       - LaTeX'
>  	@echo  '  pdfdocs         - PDF'
>  	@echo  '  epubdocs        - EPUB'
> diff --git a/Documentation/doc-guide/kernel-doc.rst b/Documentation/doc-guide/kernel-doc.rst
> index af9697e60165..4370cc8fbcf5 100644
> --- a/Documentation/doc-guide/kernel-doc.rst
> +++ b/Documentation/doc-guide/kernel-doc.rst
> @@ -579,20 +579,23 @@ source.
>  How to use kernel-doc to generate man pages
>  -------------------------------------------
>  
> -If you just want to use kernel-doc to generate man pages you can do this
> -from the kernel git tree::
> +To generate man pages for all files that contain kernel-doc markups, run::
>  
> -  $ scripts/kernel-doc -man \
> -    $(git grep -l '/\*\*' -- :^Documentation :^tools) \
> -    | scripts/split-man.pl /tmp/man
> +  $ make mandocs
>  
> -Some older versions of git do not support some of the variants of syntax for
> -path exclusion.  One of the following commands may work for those versions::
> +Or calling ``script-build-wrapper`` directly::

                ^^^^^^ sphinx-build-wrapper ?

Kind regards
Nicolas

