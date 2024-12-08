Return-Path: <linux-kbuild+bounces-5038-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D79E8713
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 18:31:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4342163D89
	for <lists+linux-kbuild@lfdr.de>; Sun,  8 Dec 2024 17:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEDE114A0A4;
	Sun,  8 Dec 2024 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqGSYWHM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B463F22EE4;
	Sun,  8 Dec 2024 17:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733679083; cv=none; b=Bh+XCE6Gnb+kQRRB0P6sRrMoMH87Ba3puoyWH0zrsEyD8Kdo7L8edu19mRVLXj4SynLjrqlgbNWM2b9i5ZOwU52UUPWWZI3BeSkKAuvBmktiiAFt1vzpSsjN0mt4fXER/ecnrqDUJaq1/629ZGBUg7+hJjeLXuuMR6TvOI8+X0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733679083; c=relaxed/simple;
	bh=q/TyKpoVPIP7p6c7NZd6xrYMUu6HCwMO/LrR/oJt/Ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K8Pzu7yXQUyrOiR3r+h6waCX92xmu/9exFjPkGjtm0dgrP1+y9XYXDp1EfHfVmhGQja0wePnNSoPyE6x0FqqRYXkxyd8Z1a02ZPBEzdOBKgVfHTe9bPsQMIsG2zMiYEf/bflgw3T7R9GK98i87ClRNTY0WZSSbTZZ7iuRM3NJ+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqGSYWHM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070E8C4CED2;
	Sun,  8 Dec 2024 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733679083;
	bh=q/TyKpoVPIP7p6c7NZd6xrYMUu6HCwMO/LrR/oJt/Ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fqGSYWHMV40sjHasWSQJM+UIhWMIg0oymxZU8Mfq9yOrpjI4lhJsH+/+fDQ7Myl8m
	 cJ6NyegCCtVi1KHfDSVIBRY0B4kN/N4vyDp3xNCvWdo/f8KEk+JTfL63qtF4SQHB7b
	 SPq1x+9RiKuiupvISlAdfoSRaAmJsBx88pdNYwcegUvCRBcEfzSDtsn1CLad4gseQP
	 1ouNwf2ARgUF5RMZPwTdWTzzHWrxlBaLRqqr/t2wlqxlm3+/pRDzcAQS9CgDQKbT58
	 /HeKQTe3eZHGNfCK6lW9Kyfqzlu15wOzz7gTurXAlCIIpkTbSwZ4gd8BroS64cab34
	 72XQ+OPLTLgsg==
Date: Sun, 8 Dec 2024 10:31:19 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: suppress stdout from merge_config for silent
 builds
Message-ID: <20241208173119.GA3365428@ax162>
References: <20241208144622.605523-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208144622.605523-1-masahiroy@kernel.org>

On Sun, Dec 08, 2024 at 11:46:14PM +0900, Masahiro Yamada wrote:
> merge_config does not respect the Make's -s (--silent) option.
> 
> Let's sink the stdout from merge_config for silent builds.
> 
> This commit does not cater to the direct invocation of merge_config.sh
> (e.g. arch/mips/Makefile).
> 
> Reported-by: Leon Romanovsky <leon@kernel.org>
> Closes: https://lore.kernel.org/all/e534ce33b0e1060eb85ece8429810f087b034c88.1733234008.git.leonro@nvidia.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  scripts/Makefile.defconf | 13 +++++++------
>  scripts/kconfig/Makefile |  4 +++-
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
> index 226ea3df3b4b..97bc5161d6bf 100644
> --- a/scripts/Makefile.defconf
> +++ b/scripts/Makefile.defconf
> @@ -1,6 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Configuration heplers
>  
> +cmd_merge_fragments = \
> +	$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> +	$4 -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$2 \
> +	$(foreach config,$3,$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
> +
>  # Creates 'merged defconfigs'
>  # ---------------------------------------------------------------------------
>  # Usage:
> @@ -8,9 +13,7 @@
>  #
>  # Input config fragments without '.config' suffix
>  define merge_into_defconfig
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> -		-m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) \
> -		$(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
> +	$(call cmd,merge_fragments,$1,$2)
>  	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>  endef
>  
> @@ -22,8 +25,6 @@ endef
>  #
>  # Input config fragments without '.config' suffix
>  define merge_into_defconfig_override
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh \
> -		-Q -m -O $(objtree) $(srctree)/arch/$(SRCARCH)/configs/$(1) \
> -		$(foreach config,$(2),$(srctree)/arch/$(SRCARCH)/configs/$(config).config)
> +	$(call cmd,merge_fragments,$1,$2,-Q)
>  	+$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>  endef
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index a0a0be38cbdc..fb50bd4f4103 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -105,9 +105,11 @@ configfiles = $(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARC
>  all-config-fragments = $(call configfiles,*.config)
>  config-fragments = $(call configfiles,$@)
>  
> +cmd_merge_fragments = $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)

Did you mean to drop $(CONFIG_SHELL) here? I noticed you kept it in the
other command.

> +
>  %.config: $(obj)/conf
>  	$(if $(config-fragments),, $(error $@ fragment does not exists on this architecture))
> -	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m $(KCONFIG_CONFIG) $(config-fragments)
> +	$(call cmd,merge_fragments)
>  	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
>  
>  PHONY += tinyconfig
> -- 
> 2.43.0
> 

