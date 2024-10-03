Return-Path: <linux-kbuild+bounces-3899-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A9E98F72B
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 21:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B2821C221BD
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Oct 2024 19:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F4CA1ABEAD;
	Thu,  3 Oct 2024 19:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="sS4RVpN8"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF9117BA3;
	Thu,  3 Oct 2024 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727984869; cv=none; b=RlQXo4dEtfKP5rnDfGcj/RELz0+XFSFlVs2AnIATTUgF6dN2eInM55VyRiY04uRr5rpNbg3ddXOCNpq2jbzRJfLCHXCbG8OhTCzgUIrp7G9SBKTY5I2uWSpN96W0lv5jl3PsnofGyVtbunShlEa3+00Br926IsTTtv++yLtVaKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727984869; c=relaxed/simple;
	bh=ECX2osAucF1DI41a6MvGMyLMTaGY29CgaDloDAvU74o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqlGK/MoB48RPIlduvawSdsXJlBWVCq9XEMV4uMADwz8vm/iDQnsS8wYucm/CWmV9nqXIWXdliu+SC21cjz3/YrY/jNTKGGNIPTw5eD+Xg10I6qvhuJ1u8aEA0GYOtIuAWXftNgrlO4gEW+7BO/pau0wVXCG8XI+/aWj0OY4syQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=sS4RVpN8; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+4njKVjUvi14Ni/PwnTui2B7LerRN8Vt08crTKoltGI=; b=sS4RVpN8BpXjUZmmmqCM80sauj
	JCugc5ILuauFWQHaPRwnEk2TdD7W+O2cNRejjezw7clNLBy68O6AKNcYlnDhJTrPUp1PiTLwNjMhs
	VWQ+iIu2Pnc0GPT0QOGaY08N5ApwvYfzNMxwX1etC9Ir/ePEa4TJsN2LgIsZ1NjrsvPvx/iC8+HMh
	JxyWL0YISDvmNaCu3zinzab9zMhkE5ruKEBLa5aeOuNjykUfkZKG4NRDo/011GBFphqPydRpTxbQV
	Hpb7RzJyDgxGZHn+yR6pgK+by/e3RWdshNKFiTTItxf62hEGxlEm6DjGDOUkfFUztfzwffyUe08tM
	4VpbpcCA==;
Received: from [2001:9e8:9d1:b101:3235:adff:fed0:37e6] (port=39730 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swRnV-006Rdl-N1;
	Thu, 03 Oct 2024 21:47:37 +0200
Date: Thu, 3 Oct 2024 21:47:35 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 19/23] kbuild: support building external modules in a
 separate build directory
Message-ID: <20241003-mustard-marmot-of-storm-af36a2@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-20-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-20-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:47PM +0900, Masahiro Yamada wrote:
> There has been a long-standing request to support building external
> modules in a separate build directory.
> 
> This commit introduces a new environment variable, KBUILD_EXTMOD_OUTPUT,
> and its shorthand Make variable, MO.
> 
> A simple usage:
> 
>  $ make -C <kernel-dir> M=<module-src-dir> MO=<module-build-dir>
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Documentation/kbuild/kbuild.rst  |  8 +++++-
>  Documentation/kbuild/modules.rst |  5 +++-
>  Makefile                         | 44 +++++++++++++++++++++++---------
>  3 files changed, 43 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 716f6fb70829..66a9dc44ea28 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -132,12 +132,18 @@ Specify the output directory when building the kernel.
>  This variable can also be used to point to the kernel output directory when
>  building external modules using kernel build artifacts in a separate build
>  directory. Please note that this does NOT specify the output directory for the
> -external modules themselves.
> +external modules themselves. (Use KBUILD_EXTMOD_OUTPUT for that purpose.)
>  
>  The output directory can also be specified using "O=...".
>  
>  Setting "O=..." takes precedence over KBUILD_OUTPUT.
>  
> +KBUILD_EXTMOD_OUTPUT
> +--------------------
> +Specify the output directory for external modules.
> +
> +Setting "MO=..." takes precedence over KBUILD_EXTMOD_OUTPUT.
> +
>  KBUILD_EXTRA_WARN
>  -----------------
>  Specify the extra build checks. The same value can be assigned by passing
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index 3a6e7bdc0889..03347e13eeb5 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -95,7 +95,7 @@ executed to make module versioning work.
>  	of the kernel output directory if the kernel was built in a separate
>  	build directory.)
>  
> -	make -C $KDIR M=$PWD
> +	make -C $KDIR M=$PWD [MO=$BUILD_DIR]
>  
>  	-C $KDIR
>  		The directory that contains the kernel and relevant build
> @@ -109,6 +109,9 @@ executed to make module versioning work.
>  		directory where the external module (kbuild file) is
>  		located.
>  
> +	MO=$BUILD_DIR
> +		Speficies a separate output directory for the external module.

s/Speficies/Specifies/

> +
>  2.3 Targets
>  ===========
>  
> diff --git a/Makefile b/Makefile
> index 9fbf7ef6e394..b654baa0763a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -134,6 +134,10 @@ ifeq ("$(origin M)", "command line")
>    KBUILD_EXTMOD := $(M)
>  endif
>  
> +ifeq ("$(origin MO)", "command line")
> +  KBUILD_EXTMOD_OUTPUT := $(MO)
> +endif
> +
>  $(if $(word 2, $(KBUILD_EXTMOD)), \
>  	$(error building multiple external modules is not supported))

Should we also check against multiple output directories?

>  
> @@ -187,7 +191,11 @@ ifdef KBUILD_EXTMOD
>      else
>          objtree := $(CURDIR)
>      endif
> -    output := $(KBUILD_EXTMOD)
> +    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(KBUILD_EXTMOD))
> +    # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
> +    # Make changes the working directory.
> +    export abs_extmodtree := $(realpath $(KBUILD_EXTMOD))
> +    $(if $(abs_extmodtree),,$(error specified external module directory "$(KBUILD_EXTMOD)" does not exist))
>  else
>      objtree := .
>      output := $(KBUILD_OUTPUT)
> @@ -246,7 +254,6 @@ else # need-sub-make
>  ifeq ($(abs_srctree),$(CURDIR))
>          # building in the source tree
>          srctree := .
> -	building_out_of_srctree :=
>  else
>          ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
>                  # building in a subdirectory of the source tree
> @@ -254,22 +261,23 @@ else
>          else
>                  srctree := $(abs_srctree)
>          endif
> -	building_out_of_srctree := 1
>  endif
>  
>  ifneq ($(KBUILD_ABS_SRCTREE),)
>  srctree := $(abs_srctree)
>  endif
>  
> -VPATH		:=
> +export srctree
>  
> -ifeq ($(KBUILD_EXTMOD),)
> -ifdef building_out_of_srctree
> -VPATH		:= $(srctree)
> -endif
> -endif
> +_vpath = $(or $(abs_extmodtree),$(srctree))
>  
> -export building_out_of_srctree srctree VPATH
> +ifeq ($(realpath $(_vpath)),$(CURDIR))

Just a style consistency question: 'ifeq (,)' with a space after ',' (as a few
lines above) or without as used here?

> +building_out_of_srctree :=
> +VPATH :=
> +else
> +export building_out_of_srctree := 1
> +export VPATH := $(_vpath)
> +endif
>  
>  # To make sure we do not include .config for any of the *config targets
>  # catch them early, and hand them over to scripts/kconfig/Makefile
> @@ -550,7 +558,7 @@ USERINCLUDE    := \
>  LINUXINCLUDE    := \
>  		-I$(srctree)/arch/$(SRCARCH)/include \
>  		-I$(objtree)/arch/$(SRCARCH)/include/generated \
> -		$(if $(building_out_of_srctree),-I$(srctree)/include) \
> +		-I$(srctree)/include \
>  		-I$(objtree)/include \
>  		$(USERINCLUDE)
>  
> @@ -640,6 +648,7 @@ quiet_cmd_makefile = GEN     Makefile
>  	} > Makefile
>  
>  outputmakefile:
> +ifeq ($(KBUILD_EXTMOD),)
>  	@if [ -f $(srctree)/.config -o \
>  		 -d $(srctree)/include/config -o \
>  		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> @@ -649,7 +658,16 @@ outputmakefile:
>  		echo >&2 "***"; \
>  		false; \
>  	fi
> -	$(Q)ln -fsn $(srctree) source
> +else
> +	@if [ -f $(KBUILD_EXTMOD)/modules.order ]; then \
> +		echo >&2 "***"; \
> +		echo >&2 "*** The external module source tree is not clean."; \
> +		echo >&2 "*** Please run 'make -C $(abs_srctree) M=$(realpath $(KBUILD_EXTMOD)) clean'"; \
> +		echo >&2 "***"; \
> +		false; \
> +	fi
> +endif
> +	$(Q)ln -fsn $(_vpath) source
>  	$(call cmd,makefile)
>  	$(Q)test -e .gitignore || \
>  	{ echo "# this is build directory, ignore it"; echo "*"; } > .gitignore
> @@ -1926,6 +1944,8 @@ KBUILD_MODULES := 1
>  
>  endif
>  
> +prepare: outputmakefile
> +
>  # Preset locale variables to speed up the build process. Limit locale
>  # tweaks to this spot to avoid wrong language settings when running
>  # make menuconfig etc.
> -- 
> 2.43.0
> 

Thanks, this feature is really appreciated by a lot of my colleagues, and I think you found quite a nice solution!
I'm a bit surprised, that there are not some more testers ...

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

