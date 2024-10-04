Return-Path: <linux-kbuild+bounces-3917-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22C991000
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 22:15:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C0C3284866
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 20:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FD371E0DAC;
	Fri,  4 Oct 2024 19:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="SA8abkDJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1651D8E0C;
	Fri,  4 Oct 2024 19:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728071158; cv=none; b=LAbHlid1Pjhzjvbiia9h5kgMf0PbDbVGSKRwYoJt3m8jI8vR9UkQWcZgPlHTrq4sUWOLPBfXALdxm/0jGnZlbGF5ypMvfnQaUj3WuM9OY4e42nb1W4N7CU91QXDpLVA0wKZTmulRLs6Jox3JuF5D2h8GCR87MVKmqfrCW+Hc/6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728071158; c=relaxed/simple;
	bh=2yOu04m+J/lxs2YGcJSUcC4yV/95rmPjEHqBXtjLpuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mR3JBNBXu9Re8O6XbTUZROM8xgBXQaBKt2tjj4VAEuer3lXzmHu2q2z4SDFr2R76nhovIXpAGwwuOuN2K9cBLk9TH0TsrOW3+Yi0CuzUcftwQ7LlHAAt+FOVzh05rWoYc8ofARN2whAG6RgAtaj/Os/OdaGiXJJavLpSoHSNvc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=SA8abkDJ; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lxcyd3kP1f2Zt5+bCSqVIXJ3VaHKzTZaUtpasKgkkxE=; b=SA8abkDJtBYC8Qlk4vTPp+fZ3G
	cxl8W/XF4yRH/0e+/zMK5Wf115EzEfrAMt6oDtFVLCnrRxDGP7QP8v5OVgWecQbU3ARd9Ec2Jg3cN
	YV8PswG9gVtRDS+bpg7yPIsVJXH3q3DahNQgVqGx1/wBx/iDJ6lWWl3BspDffL2bk5ii/epVGKrKn
	P0YTZAuw6AJVPaDkkxDByggSb/69Ec4NafvfYudDt8KVhGQtn4XwChik4eYyH72Vdlk8lkYSuwUql
	dKXISScNjtNDsdaFNklj3QNst+sd9Zl7dbgWruA75A5e7q4ga4PitEb3TqlZdyy9k4OdYBxatcoss
	Dh9IjUyg==;
Received: from [2001:9e8:9c9:1501:3235:adff:fed0:37e6] (port=39614 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swoFI-00Cy9y-Ni;
	Fri, 04 Oct 2024 21:45:48 +0200
Date: Fri, 4 Oct 2024 21:45:45 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 19/23] kbuild: support building external modules in a
 separate build directory
Message-ID: <20241004-precious-nightingale-of-pluck-b78ac3@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-20-masahiroy@kernel.org>
 <20241003-mustard-marmot-of-storm-af36a2@lindesnes>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-mustard-marmot-of-storm-af36a2@lindesnes>

On Thu, Oct 03, 2024 at 09:47:35PM +0200, Nicolas Schier wrote:
> On Tue, Sep 17, 2024 at 11:16:47PM +0900, Masahiro Yamada wrote:
> > There has been a long-standing request to support building external
> > modules in a separate build directory.
> > 
> > This commit introduces a new environment variable, KBUILD_EXTMOD_OUTPUT,
> > and its shorthand Make variable, MO.
> > 
> > A simple usage:
> > 
> >  $ make -C <kernel-dir> M=<module-src-dir> MO=<module-build-dir>
> > 
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> > 
> >  Documentation/kbuild/kbuild.rst  |  8 +++++-
> >  Documentation/kbuild/modules.rst |  5 +++-
> >  Makefile                         | 44 +++++++++++++++++++++++---------
> >  3 files changed, 43 insertions(+), 14 deletions(-)
> > 
> > diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> > index 716f6fb70829..66a9dc44ea28 100644
> > --- a/Documentation/kbuild/kbuild.rst
> > +++ b/Documentation/kbuild/kbuild.rst
> > @@ -132,12 +132,18 @@ Specify the output directory when building the kernel.
> >  This variable can also be used to point to the kernel output directory when
> >  building external modules using kernel build artifacts in a separate build
> >  directory. Please note that this does NOT specify the output directory for the
> > -external modules themselves.
> > +external modules themselves. (Use KBUILD_EXTMOD_OUTPUT for that purpose.)
> >  
> >  The output directory can also be specified using "O=...".
> >  
> >  Setting "O=..." takes precedence over KBUILD_OUTPUT.
> >  
> > +KBUILD_EXTMOD_OUTPUT
> > +--------------------
> > +Specify the output directory for external modules.
> > +
> > +Setting "MO=..." takes precedence over KBUILD_EXTMOD_OUTPUT.
> > +
> >  KBUILD_EXTRA_WARN
> >  -----------------
> >  Specify the extra build checks. The same value can be assigned by passing
> > diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> > index 3a6e7bdc0889..03347e13eeb5 100644
> > --- a/Documentation/kbuild/modules.rst
> > +++ b/Documentation/kbuild/modules.rst
> > @@ -95,7 +95,7 @@ executed to make module versioning work.
> >  	of the kernel output directory if the kernel was built in a separate
> >  	build directory.)
> >  
> > -	make -C $KDIR M=$PWD
> > +	make -C $KDIR M=$PWD [MO=$BUILD_DIR]
> >  
> >  	-C $KDIR
> >  		The directory that contains the kernel and relevant build
> > @@ -109,6 +109,9 @@ executed to make module versioning work.
> >  		directory where the external module (kbuild file) is
> >  		located.
> >  
> > +	MO=$BUILD_DIR
> > +		Speficies a separate output directory for the external module.
> 
> s/Speficies/Specifies/
> 
> > +
> >  2.3 Targets
> >  ===========
> >  
> > diff --git a/Makefile b/Makefile
> > index 9fbf7ef6e394..b654baa0763a 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -134,6 +134,10 @@ ifeq ("$(origin M)", "command line")
> >    KBUILD_EXTMOD := $(M)
> >  endif
> >  
> > +ifeq ("$(origin MO)", "command line")
> > +  KBUILD_EXTMOD_OUTPUT := $(MO)
> > +endif
> > +
> >  $(if $(word 2, $(KBUILD_EXTMOD)), \
> >  	$(error building multiple external modules is not supported))
> 
> Should we also check against multiple output directories?
> 
> >  
> > @@ -187,7 +191,11 @@ ifdef KBUILD_EXTMOD
> >      else
> >          objtree := $(CURDIR)
> >      endif
> > -    output := $(KBUILD_EXTMOD)
> > +    output := $(or $(KBUILD_EXTMOD_OUTPUT),$(KBUILD_EXTMOD))
> > +    # KBUILD_EXTMOD might be a relative path. Remember its absolute path before
> > +    # Make changes the working directory.
> > +    export abs_extmodtree := $(realpath $(KBUILD_EXTMOD))
> > +    $(if $(abs_extmodtree),,$(error specified external module directory "$(KBUILD_EXTMOD)" does not exist))
> >  else
> >      objtree := .
> >      output := $(KBUILD_OUTPUT)
> > @@ -246,7 +254,6 @@ else # need-sub-make
> >  ifeq ($(abs_srctree),$(CURDIR))
> >          # building in the source tree
> >          srctree := .
> > -	building_out_of_srctree :=
> >  else
> >          ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
> >                  # building in a subdirectory of the source tree
> > @@ -254,22 +261,23 @@ else
> >          else
> >                  srctree := $(abs_srctree)
> >          endif
> > -	building_out_of_srctree := 1
> >  endif
> >  
> >  ifneq ($(KBUILD_ABS_SRCTREE),)
> >  srctree := $(abs_srctree)
> >  endif
> >  
> > -VPATH		:=
> > +export srctree
> >  
> > -ifeq ($(KBUILD_EXTMOD),)
> > -ifdef building_out_of_srctree
> > -VPATH		:= $(srctree)
> > -endif
> > -endif
> > +_vpath = $(or $(abs_extmodtree),$(srctree))
> >  
> > -export building_out_of_srctree srctree VPATH
> > +ifeq ($(realpath $(_vpath)),$(CURDIR))
> 
> Just a style consistency question: 'ifeq (,)' with a space after ',' (as a few
> lines above) or without as used here?
> 
> > +building_out_of_srctree :=
> > +VPATH :=
> > +else
> > +export building_out_of_srctree := 1
> > +export VPATH := $(_vpath)
> > +endif
> >  
> >  # To make sure we do not include .config for any of the *config targets
> >  # catch them early, and hand them over to scripts/kconfig/Makefile
> > @@ -550,7 +558,7 @@ USERINCLUDE    := \
> >  LINUXINCLUDE    := \
> >  		-I$(srctree)/arch/$(SRCARCH)/include \
> >  		-I$(objtree)/arch/$(SRCARCH)/include/generated \
> > -		$(if $(building_out_of_srctree),-I$(srctree)/include) \
> > +		-I$(srctree)/include \
> >  		-I$(objtree)/include \
> >  		$(USERINCLUDE)
> >  
> > @@ -640,6 +648,7 @@ quiet_cmd_makefile = GEN     Makefile
> >  	} > Makefile
> >  
> >  outputmakefile:
> > +ifeq ($(KBUILD_EXTMOD),)
> >  	@if [ -f $(srctree)/.config -o \
> >  		 -d $(srctree)/include/config -o \
> >  		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> > @@ -649,7 +658,16 @@ outputmakefile:
> >  		echo >&2 "***"; \
> >  		false; \
> >  	fi
> > -	$(Q)ln -fsn $(srctree) source
> > +else
> > +	@if [ -f $(KBUILD_EXTMOD)/modules.order ]; then \

If I do

    make O=build
    touch fs/btrfs/modules.order
    make O=build M=fs/btrfs/ MO=/tmp/btrfs CONFIG_BTRFS_FS=m

the 'modules.order' check does not work correctly.  But a consequtive

    make -C /tmp/btrfs CONFIG_BTRFS_FS=m

shows the 'The external module source tree is not clean.' message as
expected.

If I replace $(KBUILD_EXTMOD) by $(abs_extmodtree), it works for me also
in the first case.


Kind regards,
Nicolas

