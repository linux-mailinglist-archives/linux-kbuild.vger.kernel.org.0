Return-Path: <linux-kbuild+bounces-5069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F469EBA04
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 20:21:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 68011188611E
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Dec 2024 19:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18924214231;
	Tue, 10 Dec 2024 19:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h54apc8N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3777214227;
	Tue, 10 Dec 2024 19:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733858497; cv=none; b=TA9oRff2bpax309dLGpcmXzsG5oa9Y5MxcI5X7YJ2Ka3YbCbVZ+Ki4/gEF3qQg3O7CQ4HK+kUcBqhnlqgBF54met3QJp8Uaq3WN24+Ck+GuXEpWZUO2tLxwPz/VZpEOh7wf7TQ0bba320dgNOMiMIMiFEGzX6HgnNuXt56xVDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733858497; c=relaxed/simple;
	bh=e36iDQhgxoWGtD/jRPRwGZzqymLMA+CTcq3Gts4Rd+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4V8/huSVanuAEh+ttrwVih325fFVP8/vtlnlnNz6NW7373R747GCb4XxCWUqRHNyDi4EALxjD1sA4VPntQp2UxJG383LkaiUeqQia+0c4xkWm1cX9m+tAEe3mah+hjL6UNxjZWRHyiKXYVdTFNbo6fb/XLbqilHVSn0Nc2Cgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h54apc8N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F34FC4CED6;
	Tue, 10 Dec 2024 19:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733858496;
	bh=e36iDQhgxoWGtD/jRPRwGZzqymLMA+CTcq3Gts4Rd+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h54apc8NzeTTa+3Ei5dLVQcUi2NaqCa9FWH/KiRT+InKA8l0bkjZFUIdjs2un+F2e
	 XCt6YJS9DqNMCus+/gtF4Bekbxo/qYfrYcohSdNXpFOrjdyvH1IN9nr2J+W42S+6e1
	 9ZnMonYfzO10BTWFpCJm8luABQqgbozjoAbQn84/eTxOCjP1rI2etKoGFdkTur2M5O
	 4iIi7UsaWOiplPq/SnBKPBAROaZDdQUpK8wsd4KdJ0SQEUf7n3lydaKlYmI3l1mjtU
	 aqC9ZSdYQQ+JdKrU9y9o6/OAVkM3G5yM74j3TcRP8a8KxJCCSAdjeP0rb1lXREHbmr
	 XvTFwleMLMAGQ==
Date: Tue, 10 Dec 2024 12:21:33 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Leon Romanovsky <leon@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH v2] kbuild: suppress stdout from merge_config for silent
 builds
Message-ID: <20241210192133.GA923495@ax162>
References: <20241210102442.3390267-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210102442.3390267-1-masahiroy@kernel.org>

On Tue, Dec 10, 2024 at 07:24:41PM +0900, Masahiro Yamada wrote:
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
> Tested-by: Leon Romanovsky <leon@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
> Changes in v2:
>   - Remove CONFIG_SHELL from Makefile.defconf
> 
>  scripts/Makefile.defconf | 13 +++++++------
>  scripts/kconfig/Makefile |  4 +++-
>  2 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/scripts/Makefile.defconf b/scripts/Makefile.defconf
> index 226ea3df3b4b..a44307f08e9d 100644
> --- a/scripts/Makefile.defconf
> +++ b/scripts/Makefile.defconf
> @@ -1,6 +1,11 @@
>  # SPDX-License-Identifier: GPL-2.0
>  # Configuration heplers
>  
> +cmd_merge_fragments = \
> +	$(srctree)/scripts/kconfig/merge_config.sh \
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

