Return-Path: <linux-kbuild+bounces-3809-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D70986E48
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 09:55:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D4E6282940
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Sep 2024 07:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8232B18A6CC;
	Thu, 26 Sep 2024 07:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="ED6FaPZv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4EF132122;
	Thu, 26 Sep 2024 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337313; cv=none; b=f7eIpbxoel8uyMDU3/GTQ2IY+/fKheCGbLpQJMT1CNAdMazNfGDrwiMfG+fEN4ZzTID4A5HnhKxqeEhvn1+mE4uMeIyIfU8X7gQ2c/U1098xH9vNPgii+FNeTda4/vzM0/jzhI+pvwx0EnEm0fqSNMCXTRdeJGjMMRUfThzSRPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337313; c=relaxed/simple;
	bh=dDDO+9FcJoaWZnWZU8ssuMYEAffE0gkvbCqTqkr/JK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PfuzBnNQhWxn1zAnKoH8A7NdQFq52UXxyQaM8yI/3PWHgaywLIbkNGfR7ro3lMMTXPONdu2+lmegvOdnKXdrjgdXgwSQnpcj/uiUs6LI4JAOige6z8okacdRJS8cg4g3MPo4RDZz5lGwXFlACnRP6nSydrB0zKhVqZtbBmf2lvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=ED6FaPZv; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YnZWndC4TJVax9zRQhw+Fwrt94doDYGAYVhJSYEqCoQ=; b=ED6FaPZvUygRGesZyGP0fc68G1
	BlD0DZntuUy9FMoj4UktY0zmiSzVZl4HUScfG6/PnRLg4KeqAL/ZnZL272yOATeEzcZ1E5C9TNfdU
	XgAwtljNnfY2pewwPuHRzDwjb5xybiTUjmM6E+aqTihy++DR9d/TAtOp48ogLwxwoE6Ytrc6pmvBc
	d3SnsydCH/uCt+p2aMYY440IJOPhpj9XrqP5m8eR0kRWSuKxj3CBGTqOLIAiMDJhfEqDvQ1AuOtzt
	SmU2GvO0h/fuGovbyuUxN/fFMbiR96/sZjYRKd5pFn9YgB0Xqwdz4Tdrh1NNHWBsXf8lOuIMYztPJ
	Th7G1Exw==;
Received: from [2001:9e8:9d8:901:3235:adff:fed0:37e6] (port=59934 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1stjL2-0096Cn-2Y;
	Thu, 26 Sep 2024 09:55:01 +0200
Date: Thu, 26 Sep 2024 09:54:57 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 16/23] kbuild: use 'output' variable to create the output
 directory
Message-ID: <20240926-bold-tuscan-marmoset-cfa610@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-17-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-17-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:44PM +0900, Masahiro Yamada wrote:
> $(KBUILD_OUTPUT) specifies the output directory of kernel builds.
> 
> Use a more generic name, 'output', to better reflect this code hunk in
> the context of external module builds.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 254f05a1cc0f..7a76452049ea 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -176,18 +176,20 @@ export KBUILD_EXTRA_WARN
>  # The O= assignment takes precedence over the KBUILD_OUTPUT environment
>  # variable.
>  
> -# Do we want to change the working directory?
>  ifeq ("$(origin O)", "command line")
>    KBUILD_OUTPUT := $(O)
>  endif
>  
> -ifneq ($(KBUILD_OUTPUT),)
> +output := $(KBUILD_OUTPUT)
> +
> +# Do we want to change the working directory?
> +ifneq ($(output),)
>  # $(realpath ...) gets empty if the path does not exist. Run 'mkdir -p' first.
> -$(shell mkdir -p "$(KBUILD_OUTPUT)")
> +$(shell mkdir -p "$(output)")
>  # $(realpath ...) resolves symlinks
> -abs_output := $(realpath $(KBUILD_OUTPUT))
> -$(if $(abs_output),,$(error failed to create output directory "$(KBUILD_OUTPUT)"))
> -endif # ifneq ($(KBUILD_OUTPUT),)
> +abs_output := $(realpath $(output))
> +$(if $(abs_output),,$(error failed to create output directory "$(output)"))
> +endif
>  
>  ifneq ($(words $(subst :, ,$(abs_srctree))), 1)
>  $(error source directory cannot contain spaces or colons)
> -- 
> 2.43.0
> 
> 

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

