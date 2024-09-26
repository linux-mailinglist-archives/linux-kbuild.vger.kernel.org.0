Return-Path: <linux-kbuild+bounces-3808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C121986E41
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 09:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EEAE286D20
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 07:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854B11A4B73;
	Thu, 26 Sep 2024 07:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="pVxzWuA0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0F91A4AA6;
	Thu, 26 Sep 2024 07:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337131; cv=none; b=P0QBsqjiSy+a7Ghm0o+0pZJT7cTJqhgu6MNLmwFIpfi9nwXpHnN9NFIq6S2M2hXc2+JGjb1PBBHvHjRMYKRSmF501HfoA/magNnJG403Hsd9SZFBZ/IPVFKFgaBr1wYCPKOLlJQ5Hl6rvnOSLLku5fP11bx6uBe/LPnl9Wkb83A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337131; c=relaxed/simple;
	bh=40Ax/btA3iU2UFz+LBytYSkMjUJO0keNhF9h9kByBTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AjWJ/zbmccOpxTPv8nOPGmTp8+SBQh2aeY6XsX4qW+2QNkrHA4Wu6d3rMh+OU3FiIbDnnRn6knCQZZg0l6sflYfBqlV1fMFxI+w5cSjg54QATq2yKEnxeDkyR3sy3f1HFvtDJWQVUXYef84vuqF/lZZkrHzu3ttr0cTOpFpX14s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=pVxzWuA0; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=p0eoIhfYmnh/rxvYWJQrE2ln7MW16UW/fs0pG1jr8s0=; b=pVxzWuA00zg2zJDA+UjAeAD6Iu
	34YH8mzIcPEJqfPIm7UbkqyaO5Ty3LPWwBAI5hOLdvilFoZhBBRw1r8BVNhsYfIb2dA225aK1b8/M
	gnWPvehIFlf9HaHfIrgjbaI9Kq4ChPwcAK3IgTFkjQ+jEaWQVmyKFKxjK7I0crxIHaNf5kMRgp2mC
	PSeSK4aBGKHTiteyd3KnFXjPC5xT46izpq4IveRuIHj0+IA45dQp7Slj1dymFZrUk49PMN0rD5eq+
	v9bvTnmBt6L2VAxeZvTQxLMGUEpTh/mg5BaK+KSG6XCn/0zaGs93hSyWTXpGi/bzTfcVvt6MjDJix
	G0yvzucg==;
Received: from [2001:9e8:9d8:901:3235:adff:fed0:37e6] (port=47324 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1stjI4-0094WC-LW;
	Thu, 26 Sep 2024 09:51:56 +0200
Date: Thu, 26 Sep 2024 09:51:49 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 15/23] kbuild: rename abs_objtree to abs_output
Message-ID: <20240926-tricky-jasper-mongrel-9aae8e@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-16-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-16-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:43PM +0900, Masahiro Yamada wrote:
> 'objtree' refers to the top of the output directory of kernel builds.
> 
> Rename abs_objtree to a more generic name, to better reflect its use in
> the context of external module builds.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index c923bea7043b..254f05a1cc0f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -40,7 +40,7 @@ __all:
>  
>  this-makefile := $(lastword $(MAKEFILE_LIST))
>  abs_srctree := $(realpath $(dir $(this-makefile)))
> -abs_objtree := $(CURDIR)
> +abs_output := $(CURDIR)
>  
>  ifneq ($(sub_make_done),1)
>  
> @@ -185,8 +185,8 @@ ifneq ($(KBUILD_OUTPUT),)
>  # $(realpath ...) gets empty if the path does not exist. Run 'mkdir -p' first.
>  $(shell mkdir -p "$(KBUILD_OUTPUT)")
>  # $(realpath ...) resolves symlinks
> -abs_objtree := $(realpath $(KBUILD_OUTPUT))
> -$(if $(abs_objtree),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
> +abs_output := $(realpath $(KBUILD_OUTPUT))
> +$(if $(abs_output),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
>  endif # ifneq ($(KBUILD_OUTPUT),)
>  
>  ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
> @@ -197,7 +197,7 @@ export sub_make_done := 1
>  
>  endif # sub_make_done
>  
> -ifeq ($(abs_objtree),$(CURDIR))
> +ifeq ($(abs_output),$(CURDIR))
>  # Suppress "Entering directory ..." if we are at the final work directory.
>  no-print-directory := --no-print-directory
>  else
> @@ -221,7 +221,7 @@ $(filter-out $(this-makefile), $(MAKECMDGOALS)) __all: __sub-make
>  
>  # Invoke a second make in the output directory, passing relevant variables
>  __sub-make:
> -	$(Q)$(MAKE) $(no-print-directory) -C $(abs_objtree) \
> +	$(Q)$(MAKE) $(no-print-directory) -C $(abs_output) \
>  	-f $(abs_srctree)/Makefile $(MAKECMDGOALS)
>  
>  else # need-sub-make
> -- 
> 2.43.0
> 
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

