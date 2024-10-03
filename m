Return-Path: <linux-kbuild+bounces-3897-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B665498F659
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 20:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D704A1C20DC4
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 18:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CD461A7AF7;
	Thu,  3 Oct 2024 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="QsLMFyDQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7519F134;
	Thu,  3 Oct 2024 18:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727980912; cv=none; b=uZGoIeRIZZQwM/YyflUoEJ9eQnsfgywJxlKbvkwglrmQBs+/UgWHj1zwqpuuqklSMk5SiayS6ssp5798xu8IitHZl5OQW246lCbBlT3HdBQoTebgIqCNzsQEmo5rdhmlhFrkeR90zhXtj9qWrb6wHBoQIrPtMVmFqDLMOFsm3Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727980912; c=relaxed/simple;
	bh=wTgNM06RbmTuSe1vk73CLMKZwqSjGjo1Lahr17D1ilk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZRYPuAGgEha7xrubQ/WPDn5Ph1w2ELR+onijlZ21Oa278cpGmKE8iIN/S+h8X8o59CeTYEG2/di6/71oQrIiosf/+4Xxuk4s2q52GM6Am8apDl5wYeAnwigG4utUNnAjlknN89exUqPIvWv2MQCFbPPq0PXZWj6edV4Gkh+1d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=QsLMFyDQ; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=P7zwmdrkiHaLrmgYV+BJvjxojpHU/ouZnB9HE3vhhog=; b=QsLMFyDQkyKJu8wulgL2JTVJ1H
	5COe66dzvUgnTCRfJGYf9MMiG0Zlu1GWFzbgYwhaFW5CnEYop7WbVwl9mBJ1ye1tVQzE5ouadqDHU
	iZMrqs58s/c5foO4HCwjc1eQRrWue5lYpB4WvO0Y9t+1NjPu83jT0gw3FYkCwvZ0aBerwM9HEjIof
	6qZkwladnuKmghVmRjRNjNw1U+xtuVIO0VuqDx8e+sVfVOPAZEh2k2uNVmYmwqNWuFF4eQS+/Y4wo
	eSBrTBWaBPMv0hDkggyDb/x3EBegWMqKetY/tSt7+AK9C0HVg7U4UwzqgxIgznYMA3Ap3WWAu78Kf
	S+KjIamw==;
Received: from [2001:9e8:9d1:b101:3235:adff:fed0:37e6] (port=47996 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swQlb-006Aih-Qs;
	Thu, 03 Oct 2024 20:41:35 +0200
Date: Thu, 3 Oct 2024 20:41:33 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 17/23] kbuild: build external modules in their directory
Message-ID: <20241003-amazing-mandrill-of-mastery-865a3a@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-18-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-18-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:45PM +0900, Masahiro Yamada wrote:
> Currently, Kbuild always operates in the output directory of the kernel,
> even when building external modules. This increases the risk of external
> module Makefiles attempting to write to the kernel directory.
> 
> This commit switches the working directory to the external module
> directory, allowing the removal of the $(KBUILD_EXTMOD)/ prefix from
> some build artifacts.
> 
> The command for building external modules maintains backward
> compatibility, but Makefiles that rely on working in the kernel
> directory may break. In such cases, $(objtree) and $(srctree) should
> be used to refer to the output and source directories of the kernel.
> 
> The appearance of the build log will change as follows:
> 
> [Before]
> 
>   $ make -C /path/to/my/linux M=/path/to/my/externel/module
>   make: Entering directory '/path/to/my/linux'
>     CC [M]  /path/to/my/externel/module/helloworld.o
>     MODPOST /path/to/my/externel/module/Module.symvers
>     CC [M]  /path/to/my/externel/module/helloworld.mod.o
>     CC [M]  /path/to/my/externel/module/.module-common.o
>     LD [M]  /path/to/my/externel/module/helloworld.ko
>   make: Leaving directory '/path/to/my/linux'
> 
> [After]
> 
>   $ make -C /path/to/my/linux M=/path/to/my/externel/module
>   make: Entering directory '/path/to/my/linux'
>   make[1]: Entering directory '/path/to/my/externel/module'
>     CC [M]  helloworld.o
>     MODPOST Module.symvers
>     CC [M]  helloworld.mod.o
>     CC [M]  .module-common.o
>     LD [M]  helloworld.ko
>   make[1]: Leaving directory '/path/to/my/externel/module'
>   make: Leaving directory '/path/to/my/linux'
> 
> Printing "Entering directory" twice is cumbersome. This will be
> addressed later.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/dev-tools/coccinelle.rst | 19 +++++-------
>  Makefile                               | 40 +++++++++++++++++---------
>  rust/Makefile                          |  4 +--
>  scripts/Makefile.compiler              |  2 +-
>  scripts/Makefile.modpost               |  6 ++--
>  scripts/coccicheck                     |  6 ++--
>  scripts/package/install-extmod-build   |  7 +++++
>  7 files changed, 49 insertions(+), 35 deletions(-)
> 
> diff --git a/Documentation/dev-tools/coccinelle.rst b/Documentation/dev-tools/coccinelle.rst
> index 535ce126fb4f..80c83ce0babc 100644
> --- a/Documentation/dev-tools/coccinelle.rst
> +++ b/Documentation/dev-tools/coccinelle.rst
> @@ -250,25 +250,20 @@ variables for .cocciconfig is as follows:
>  - Your directory from which spatch is called is processed next
>  - The directory provided with the ``--dir`` option is processed last, if used
>  
> -Since coccicheck runs through make, it naturally runs from the kernel
> -proper dir; as such the second rule above would be implied for picking up a
> -.cocciconfig when using ``make coccicheck``.
> -
>  ``make coccicheck`` also supports using M= targets. If you do not supply
>  any M= target, it is assumed you want to target the entire kernel.
>  The kernel coccicheck script has::
>  
> -    if [ "$KBUILD_EXTMOD" = "" ] ; then
> -        OPTIONS="--dir $srctree $COCCIINCLUDE"
> +    if [ "$VPATH" ] ; then
> +        OPTIONS="--dir $VPATH $COCCIINCLUDE"
>      else
> -        OPTIONS="--dir $KBUILD_EXTMOD $COCCIINCLUDE"
> +        OPTIONS="--dir . $COCCIINCLUDE"
>      fi
>  
> -KBUILD_EXTMOD is set when an explicit target with M= is used. For both cases
> -the spatch ``--dir`` argument is used, as such third rule applies when whether
> -M= is used or not, and when M= is used the target directory can have its own
> -.cocciconfig file. When M= is not passed as an argument to coccicheck the
> -target directory is the same as the directory from where spatch was called.
> +When an explicit target is executed with a separate output directory, VPATH is
> +set to the target source directory. The third rule ensures the spatch reads the

My limited English with German background likes to have "the target's
source directory" here, but I am not sure if this is more correct.

> +.cocciconfig from the target directory. When M= is used, the external module
> +directory can have its own.cocciconfig file.

A space is missing after 'own'.

>  
>  If not using the kernel's coccicheck target, keep the above precedence
>  order logic of .cocciconfig reading. If using the kernel's coccicheck target,
> diff --git a/Makefile b/Makefile
> index 7a76452049ea..4db22c3a8555 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -180,7 +180,20 @@ ifeq ("$(origin O)", "command line")
>    KBUILD_OUTPUT := $(O)
>  endif
>  
> -output := $(KBUILD_OUTPUT)
> +ifdef KBUILD_EXTMOD
> +    ifdef KBUILD_OUTPUT
> +        objtree := $(realpath $(KBUILD_OUTPUT))
> +        $(if $(objtree),,$(error specified kernel directory "$(KBUILD_OUTPUT)" does not exist))
> +    else
> +        objtree := $(CURDIR)
> +    endif
> +    output := $(KBUILD_EXTMOD)
> +else
> +    objtree := .
> +    output := $(KBUILD_OUTPUT)
> +endif
> +
> +export objtree
>  
>  # Do we want to change the working directory?
>  ifneq ($(output),)
> @@ -248,8 +261,6 @@ ifneq ($(KBUILD_ABS_SRCTREE),)
>  srctree := $(abs_srctree)
>  endif
>  
> -objtree		:= .
> -
>  VPATH		:=
>  
>  ifeq ($(KBUILD_EXTMOD),)
> @@ -258,7 +269,7 @@ VPATH		:= $(srctree)
>  endif
>  endif
>  
> -export building_out_of_srctree srctree objtree VPATH
> +export building_out_of_srctree srctree VPATH
>  
>  # To make sure we do not include .config for any of the *config targets
>  # catch them early, and hand them over to scripts/kconfig/Makefile
> @@ -708,7 +719,7 @@ endif
>  # in addition to whatever we do anyway.
>  # Just "make" or "make all" shall build modules as well
>  
> -ifneq ($(filter all modules nsdeps %compile_commands.json clang-%,$(MAKECMDGOALS)),)
> +ifneq ($(filter all modules nsdeps compile_commands.json clang-%,$(MAKECMDGOALS)),)

Nit: I think this would better match to patch "kbuild: remove
extmod_prefix, MODORDER, MODULES_NSDEPS variables", but probably nobody
else will care.

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

