Return-Path: <linux-kbuild+bounces-8967-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB2BA684B
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 07:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D7383BE80F
	for <lists+linux-kbuild@lfdr.de>; Sun, 28 Sep 2025 05:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A13920C01C;
	Sun, 28 Sep 2025 05:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V//9x7o/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F4F1A9FBE;
	Sun, 28 Sep 2025 05:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759037073; cv=none; b=CCQ6IPAT1s4LqjR3uO3AQ3pMoUy0ngdBOaHgBtx5mBGfnPSUWb0IPchr5Qs02YC/J/TNr+FqDEM/7/C3Di7rTAHuynOxTmoSRY9l17Ldz9NQnKTdksk5dSi2nXPAc6wGaftIMJrlSWjLtbV+ABtaq0fzFbqkKXX9K5BGzZlKIAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759037073; c=relaxed/simple;
	bh=L+EkAKSmc3OTz36a3wD0ZqaH7YXUNCh7rEnXSOrQhcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8Wcq4sg5Gl/4ev+OZhwPzYQ9bmL35ugvHylEdL4Xsppzf67rrR3L3Wr7D1HD561jJkto5AFZxjNAeN5Qeun7+aXDqvGtGmPDHPWp/7IzCXFGwdDtDCo05AP5IjUiQKi3Goa7N1HwLCggwjaQ37bvNsYx06TMkFE7UtONtK5o2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V//9x7o/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1856C4CEF0;
	Sun, 28 Sep 2025 05:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759037073;
	bh=L+EkAKSmc3OTz36a3wD0ZqaH7YXUNCh7rEnXSOrQhcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V//9x7o/J9oZqkmeKIwSySCF19pNgZhCLfXztsQEL6wKCsqagB9YL7A25fXIweQsu
	 AYQaEoOqHH4SDDWLwgI0xZYxnlsfnvhQJ37whCo+xRnY1TUYRnpoeG6xYzl+TnZ5Ae
	 nXxyr0346bzMx+LJ73v2k4zgNnkf+a31UyrhEco3QntPoZxyuFtnyoPOsgFMkb0A2o
	 chHMgdlMHscUtwKzy7Q4o1Y1hjRTzz1NrXCPzqCNJMB7/BGpYIw/o9n1kZPIwgyhL+
	 7huv7cfQl4zprLtomc3BX86amhXbZj+wyr5CdCEZgWZcY9RxH/fAoEuCSSbazpyomL
	 i9dCfp9XopLBg==
Date: Sat, 27 Sep 2025 22:35:00 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Akira Yokosawa <akiyks@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 19/24] docs: add support to build manpages from
 kerneldoc output
Message-ID: <aNhKdCrSM29uwvpn@levanger>
References: <cover.1758196090.git.mchehab+huawei@kernel.org>
 <3d248d724e7f3154f6e3a227e5923d7360201de9.1758196090.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3d248d724e7f3154f6e3a227e5923d7360201de9.1758196090.git.mchehab+huawei@kernel.org>

Please note that @kernel.org receipients are still not addressed
correctly:

> Date: Thu, 18 Sep 2025 13:54:53 +0200
> From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> To: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
>     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>,
>     Alice Ryhl <aliceryhl@google.com>, Masahiro Yamada <mchehab+huawei@kernel.org>,
>     Miguel Ojeda <mchehab+huawei@kernel.org>, Nathan Chancellor <mchehab+huawei@kernel.org>,
>     Nicolas Schier <nicolas.schier@linux.dev>, Randy Dunlap <rdunlap@infradead.org>,
>     Tamir Duberstein <tamird@gmail.com>, linux-kbuild@vger.kernel.org,
>     linux-kernel@vger.kernel.org


On Thu, Sep 18, 2025 at 01:54:53PM +0200, Mauro Carvalho Chehab wrote:
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
> index 05397b9d844d..aa42b2cb7030 100644
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
>  		--sphinxdirs="$(SPHINXDIRS)" --conf="$(SPHINX_CONF)" \
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

For this very patch, there is no 'scripts-build-wrapper' but
'sphinx-build-wrapper'.  Or am I missing something?

>  
> -  $ scripts/kernel-doc -man \
> -    $(git grep -l '/\*\*' -- . ':!Documentation' ':!tools') \
> -    | scripts/split-man.pl /tmp/man
> +  $ ./tools/docs/sphinx-build-wrapper mandocs
>  
> -  $ scripts/kernel-doc -man \
> -    $(git grep -l '/\*\*' -- . ":(exclude)Documentation" ":(exclude)tools") \
> -    | scripts/split-man.pl /tmp/man
> +The output will be at ``/man`` directory inside the output directory
> +(by default: ``Documentation/output``).
> +
> +Optionally, it is possible to generate a partial set of man pages by
> +using SPHINXDIRS:
> +
> +  $ make SPHINXDIRS=driver-api/media mandocs
> +
> +.. note::
> +
> +   When SPHINXDIRS={subdir} is used, it will only generate man pages for
> +   the files explicitly inside a ``Documentation/{subdir}/.../*.rst`` file.
> diff --git a/Makefile b/Makefile
> index 6bfe776bf3c5..9bd44afeda26 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1800,7 +1800,7 @@ $(help-board-dirs): help-%:
>  # Documentation targets
>  # ---------------------------------------------------------------------------
>  DOC_TARGETS := xmldocs latexdocs pdfdocs htmldocs epubdocs cleandocs \
> -	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs
> +	       linkcheckdocs dochelp refcheckdocs texinfodocs infodocs mandocs
>  PHONY += $(DOC_TARGETS)
>  $(DOC_TARGETS):
>  	$(Q)$(MAKE) $(build)=Documentation $@

Acked-by: Nicolas Schier <nsc@kernel.org>

