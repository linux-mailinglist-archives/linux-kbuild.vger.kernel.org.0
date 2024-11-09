Return-Path: <linux-kbuild+bounces-4593-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4589C2998
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 03:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2567B1F22990
	for <lists+linux-kbuild@lfdr.de>; Sat,  9 Nov 2024 02:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C684131BAF;
	Sat,  9 Nov 2024 02:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEywfmuJ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00BB512FB2E;
	Sat,  9 Nov 2024 02:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731121010; cv=none; b=ZNFdvNHGnzNwyTUP+VI5nD0vJ2cbivkPzF37zOYapmBcKWmK/sOR1wYQnB22mDeoGHbPIzEk93ONVCAbBCjSA2RnzDEJTHrkHmcVClMNZjdywI/kFcx2y4vQe66ekY4qazORtiq7f6K2D+kH5lfa5ah6yxYIF9T2v/5Xw1LBUkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731121010; c=relaxed/simple;
	bh=VxMsrcVrxPI9pDjShIlfDOSgcJivK/TFRMcbvDVFT80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gV6kXTg7b3GiFGOs62ZuPrsSjW/jQYyVyDQYh1YHCXm8c4zKR8yfXowg/03f6fTxNfqhUUEOqbS6O3yXlj2L1MSYa3fGhnWu7xORrZOJQu6t4mvfeg1KTP0n8h2cof4WmaZI4VuKoKss24WlARbSNIsyMhmfFjSby0Go0mwPbfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEywfmuJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43407C4CECD;
	Sat,  9 Nov 2024 02:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731121009;
	bh=VxMsrcVrxPI9pDjShIlfDOSgcJivK/TFRMcbvDVFT80=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEywfmuJT3uj5MC1sVwPeSgXqv3W6yYrFH6CDuhwebGX3yaYcHnNh2wH69RaltFvZ
	 Hli3b2c+ujAWGHx8cHjhDK42JkVGS2SszMfqkr8f0wdV3Tp+8grdJ9GOjQ7Hl1CKk6
	 hYApX3AKdjr04XiSiqOHv0t/wsZteHJhBNyeOAkf4uLTt4hMeLfmBKLxpM532tQ9mK
	 mt5csNWnI4x4aNDu/RIFN/qteuX9Sr2hK6L9s+OH96jncxu0H1yI7yAAxSZDQo3eSQ
	 UGu96jkgucQTVPsFDLjcGtFgGhFaZoa3NYRwkEDFeQxRshp63t2WCi48xPmcUdedH8
	 J6+jT0Cq5NJFg==
Date: Fri, 8 Nov 2024 19:56:47 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Han Shen <shenhan@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2] kbuild: Fix Propeller build option
Message-ID: <20241109025647.GA1182230@thelio-3990X>
References: <20241108214953.1160765-1-xur@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108214953.1160765-1-xur@google.com>

On Fri, Nov 08, 2024 at 01:49:53PM -0800, Rong Xu wrote:
> The '-fbasic-block-sections=labels' option has been deprecated in tip
> of tree clang (20.0.0) [1]. While the option still works, a warning is
> emitted:
> 
>   clang: warning: argument '-fbasic-block-sections=labels' is deprecated, use '-fbasic-block-address-map' instead [-Wdeprecated]
> 
> Add a version check to set the proper option.
> 
> Link: https://github.com/llvm/llvm-project/pull/110039 [1]
> 
> Signed-off-by: Rong Xu <xur@google.com>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> ChangeLog in V2
> Integrated suggestions from Nathan Chancellor.
> (1) improved commit message
> (2) added links to the comments
> (3) used ld.lld version in the version check for lld
> ---
> 
> Signed-off-by: Rong Xu <xur@google.com>
> ---
>  scripts/Makefile.propeller | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/Makefile.propeller b/scripts/Makefile.propeller
> index 344190717e47..48a660128e25 100644
> --- a/scripts/Makefile.propeller
> +++ b/scripts/Makefile.propeller
> @@ -5,7 +5,14 @@ ifdef CLANG_PROPELLER_PROFILE_PREFIX
>    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=list=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt -ffunction-sections
>    KBUILD_LDFLAGS += --symbol-ordering-file=$(CLANG_PROPELLER_PROFILE_PREFIX)_ld_profile.txt --no-warn-symbol-ordering
>  else
> -  CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
> +  # Starting with Clang v20, the '-fbasic-block-sections=labels' option is
> +  # deprecated. Use the recommended '-fbasic-block-address-map' option.
> +  # Link: https://github.com/llvm/llvm-project/pull/110039
> +  ifeq ($(call clang-min-version, 200000),y)
> +    CFLAGS_PROPELLER_CLANG := -fbasic-block-address-map
> +  else
> +    CFLAGS_PROPELLER_CLANG := -fbasic-block-sections=labels
> +  endif
>  endif
>  
>  # Propeller requires debug information to embed module names in the profiles.
> @@ -21,7 +28,11 @@ ifdef CONFIG_LTO_CLANG_THIN
>    ifdef CLANG_PROPELLER_PROFILE_PREFIX
>      KBUILD_LDFLAGS += --lto-basic-block-sections=$(CLANG_PROPELLER_PROFILE_PREFIX)_cc_profile.txt
>    else
> -    KBUILD_LDFLAGS += --lto-basic-block-sections=labels
> +    ifeq ($(call test-ge, $(CONFIG_LLD_VERSION), 200000),y)
> +       KBUILD_LDFLAGS += --lto-basic-block-address-map
> +    else
> +       KBUILD_LDFLAGS += --lto-basic-block-sections=labels
> +    endif
>    endif
>  endif
>  
> 
> base-commit: 0dcc2d1066150787017a71f035145c566597dec7
> -- 
> 2.47.0.277.g8800431eea-goog
> 

