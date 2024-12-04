Return-Path: <linux-kbuild+bounces-4989-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5C69E35E0
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 09:49:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3987E163FFA
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Dec 2024 08:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593E4196455;
	Wed,  4 Dec 2024 08:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AF9kkgoe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316D278C75;
	Wed,  4 Dec 2024 08:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733302191; cv=none; b=Is7U/+sMgCIeCzPRgXsDqbJ6Ut9QxyIYqIKaRQv+yMssfLgAWUssTufN+9TBhDhEx5RMRNVDNudlo/5NhxZhu+pR4lUsuFmncKlzHOWYX6SRyj4rqNetvMuxjiruGxTcwoWiZHvP1YNmjj2abhf4/OaOLEKMPcPnzolwp1uvoxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733302191; c=relaxed/simple;
	bh=dIsX+0/kZRIHZfYEnlGWPLKM1SWnsUZc75kDIo0pYUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nR4jGctQwwj9j3V+rI7G9WTUBPYkiff/Rvr38mO2czcNqLs6J93gAfjPB+VO1XDB4BJXpHENpPtbt9knqZQcv2DrLptkvPEjw4c/942RZ6xMCbcTjHLtTP36B4RCeeoFprxw6RWok88QC1Jt43LVEGO6U8RgKEExonqMhXUir1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AF9kkgoe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8FDC4CED1;
	Wed,  4 Dec 2024 08:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733302190;
	bh=dIsX+0/kZRIHZfYEnlGWPLKM1SWnsUZc75kDIo0pYUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AF9kkgoeII8U5lLqLajlG+GQnkqQb3tPOQ5zQjzH8EhspunROWpY3rVqOtsFwrOil
	 iMZoQr1+1J8+Fx1y7NYJK3+wLU0XB6kh1rv90nDZucA4fMYCH39OjATCen9rC58FQP
	 WC/sjCcjpw3JdNeaBLaKa9DiYkbeRJOtHf/oWEyFzLINwLvSGWwPdFOHAV22tOZl2K
	 Qqp/QP5tszEdU36ItzvV8uaJLRFJJa7PwCRNQ/Bn+ldOw6zMteUALp1kTA5Omafdhl
	 r/3K3Rf30PEbxZGeei/RAwXHYxtIx+D2/TzZX4cy/V2bBjuKb7NHqOfM+uugx2AA3M
	 XsprhxTmBkgzg==
Date: Wed, 4 Dec 2024 10:49:43 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rdma-next] kbuild: Respect request to silent output when
 merging configs
Message-ID: <20241204084943.GM1245331@unreal>
References: <e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com>
 <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNATU2OKEWh6p9QuUXtYmYmqTkN5nspBq9DbCh9yUjqW5xA@mail.gmail.com>

On Wed, Dec 04, 2024 at 05:25:50PM +0900, Masahiro Yamada wrote:
> On Tue, Dec 3, 2024 at 10:55 PM Leon Romanovsky <leon@kernel.org> wrote:
> >
> > From: Leon Romanovsky <leonro@nvidia.com>
> >
> > Builds with -s option (silent) are supposed to silence all output
> > which is not an error. It is the case for target builds but not
> > for configs. These builds generate prints like this:
> >
> > ➜  kernel git:(rdma-next) make -s defconfig debug.config
> >  Using .config as base
> >  Merging ./kernel/configs/debug.config
> >  #
> >  # merged configuration written to .config (needs make)
> >  #
> >  ...
> >  Value of CONFIG_FUNCTION_TRACER is redefined by fragment ./kernel/configs/debug.config:
> >  Previous value: # CONFIG_FUNCTION_TRACER is not set
> >  New value: CONFIG_FUNCTION_TRACER=y
> >  ----
> >
> > Let's honor -s option and hide all non-error output.
> 
> 
> Is it necessary to add the --quiet option to every script?
> 
> Kbuild already provides a generic way to suppress the stdout
> with 'make -s'.
> 
> The following code works for me.
> 'make defconfig debug.config' is as verbose as before.
> 'make -s defconfig debug.config' is really silent.

This is exactly what I'm doing. I'm using -s option and added -q to very
specific merge_config script, because "-s" is already in use in that
script.

Before my change on 40384c840ea1 ("Linux 6.13-rc1"):
[leonro@e534d5fa4327 kernel]$ make -s defconfig debug.config
Using .config as base
Merging ./kernel/configs/debug.config
Value of CONFIG_DYNAMIC_DEBUG is redefined by fragment ./kernel/configs/debug.config:
Previous value: # CONFIG_DYNAMIC_DEBUG is not set
New value: CONFIG_DYNAMIC_DEBUG=y

Value of CONFIG_PRINTK_CALLER is redefined by fragment ./kernel/configs/debug.config:
Previous value: # CONFIG_PRINTK_CALLER is not set
New value: CONFIG_PRINTK_CALLER=y
...

After my change:
[leonro@4dd2c2078dff kernel]$ make -s defconfig debug.config <--- silent

Thanks

> 
> 
> 
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index a0a0be38cbdc..fb50bd4f4103 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -105,9 +105,11 @@ configfiles = $(wildcard
> $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARC
>  all-config-fragments = $(call configfiles,*.config)
>  config-fragments = $(call configfiles,$@)
> 
> +cmd_merge_fragments = $(srctree)/scripts/kconfig/merge_config.sh -m
> $(KCONFIG_CONFIG) $(config-fragments)
> +
>  %.config: $(obj)/conf
>         $(if $(config-fragments),, $(error $@ fragment does not exists
> on this architecture))
> -       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh
> -m $(KCONFIG_CONFIG) $(config-fragments)
> +       $(call cmd,merge_fragments)
>         $(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
> 
>  PHONY += tinyconfig
> 
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada

