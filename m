Return-Path: <linux-kbuild+bounces-3918-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41293991003
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 22:15:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EDB48284403
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Oct 2024 20:15:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFB71E04BA;
	Fri,  4 Oct 2024 19:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="bge5/O+K"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2BA1CACF1;
	Fri,  4 Oct 2024 19:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728071230; cv=none; b=BxyivpuHsOP5KqCTJ6X7IxezKpw0nQQdYqG8iZCIZqUPm0WQKoymmi6P3sW9kSdlbippXfqF3gHmP3oT+nuD8ZO4khOeiYogI+JAU+lm+xcB1ojYBbqBA/EaTaA0ZE/yin7GEUA4siFTE7lPE2kpHsTttxFfbCSTyPt5l74105g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728071230; c=relaxed/simple;
	bh=GRT6SHzfGk3JG0lDEoxxMW+npcdhYLDvHZJs7/L1A6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgtW5uY9BA9igyJoWvzTkWTaAgDG9aGHXY9qwWrMtINjozfZjiGvmljGtA2ptNrwZB/u81xAXcd72PQAOsf8Kjd6pV5j2eMWM/fr2NXxBQC07vgvVu1+nYyZ8vM+NUifr/fNAhNCgyMN2CL5Lt9L8kujKebk/dOQPojfyEUSL3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=bge5/O+K; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=h4jzIcXmmZIBSPpA60FuwZf01Rc7VTcdHaNGPea+87o=; b=bge5/O+KhBNPb0OTwRm54yCs+b
	yWCzLo32zZxWqPjUbgiystARhXH+KzIclrNtmxRtd2X9FrP8q6nwwcjs5AkA9UEjTFwjFiDLGaUDm
	/UywlFuQN0qUDmCziLcWEjk1OLwBj7vYrJ9eyb081EAh/KKTBM55sL8irawitJi+OLJm4/rAhbwHW
	va4vTPIiiLk3Ngf6XexNs4ywULYUK1RYvQ+W4xX620vWfkSzGh5f3pntyXtS01pmmtBLA9g0l6Is/
	Ma4Yv0SpcY3Su9OA2EY1bKRNct/UxzdLQm/R2N4g5iJg9U6TAqqS0TBeC13cSm+VOxHS5MjdwemgS
	fNuDMdbw==;
Received: from [2001:9e8:9c9:1501:3235:adff:fed0:37e6] (port=50476 helo=lindesnes.fjasle.eu)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1swoGP-00CyN0-4m;
	Fri, 04 Oct 2024 21:46:57 +0200
Date: Fri, 4 Oct 2024 21:46:54 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 22/23] kbuild: make wrapper Makefile more convenient for
 external modules
Message-ID: <20241004-melodic-vagabond-waxbill-16bd47@lindesnes>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-23-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-23-masahiroy@kernel.org>

On Tue, Sep 17, 2024 at 11:16:50PM +0900, Masahiro Yamada wrote:
> When Kbuild starts building in a separate output directory, it generates
> a wrapper Makefile, allowing you to invoke 'make' from the output
> directory.
> 
> This commit makes it more convenient, so you can invoke 'make' without
> M= or MO=.
> 
> First, you need to build external modules in a separate directory:
> 
>   $ make M=/path/to/module/source/dir MO=/path/to/module/build/dir
> 
> Once the wrapper Makefile is generated in /path/to/module/build/dir,
> you can proceed as follows:
> 
>   $ cd /path/to/module/build/dir
>   $ make
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  Makefile | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 9f0ba07e8f25..81603a50c757 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -641,10 +641,20 @@ ifdef building_out_of_srctree
>  # At the same time when output Makefile generated, generate .gitignore to
>  # ignore whole output directory
>  
> +ifdef KBUILD_EXTMOD
> +print_env_for_makefile = \
> +	echo "export KBUILD_OUTPUT = $(objtree)"; \
> +	echo "export KBUILD_EXTMOD = $(_vpath)" ; \
> +	echo "export KBUILD_EXTMOD_OUTPUT = $(CURDIR)"
> +else
> +print_env_for_makefile = \
> +	echo "export KBUILD_OUTPUT = $(CURDIR)"
> +endif
> +
>  quiet_cmd_makefile = GEN     Makefile
>        cmd_makefile = { \
>  	echo "\# Automatically generated by $(abs_srctree)/Makefile: don't edit"; \
> -	echo "export KBUILD_OUTPUT = $(CURDIR)"; \
> +	$(print_env_for_makefile); \
>  	echo "include $(abs_srctree)/Makefile"; \
>  	} > Makefile
>  
> -- 
> 2.43.0

Nice idea, thanks!

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

