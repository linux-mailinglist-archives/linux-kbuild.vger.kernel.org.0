Return-Path: <linux-kbuild+bounces-5642-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E83CA29B51
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 21:38:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6983A35F8
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 20:38:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D29521420E;
	Wed,  5 Feb 2025 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mULBPJQn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDCB213E6F;
	Wed,  5 Feb 2025 20:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738787902; cv=none; b=PTPK3HSMRTxHtRHIwTEbKDwogP/aPBm1L+hQ1IbHQVpxuklTUKXVBqvMw0ZYJUApvRN/RFe5VDkXUfEoEVihzM/on54UWtgYYNl5LldebTYlcGHIkVUliJj6kl4JDm+xnZ3H5jzO7YoI0X3rygQO18aLFN/k89Hj9QffRXNfcYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738787902; c=relaxed/simple;
	bh=I+hvuOT1LZ55z7wg6CRnRGy+xUBTyudcDbUtYBv3vfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RNOXR9qfijIAq+L5O00J03/b3gpVSz5cS5zeOKjrlzsvBwT7xoifhO8vip7koaOwHu1e6xsI4A8fwLKHQ3CdGt9/SGjhy/DhRy3iBb+D6DE3jCdMXxAOekeMsDLcz64eN9ofvd/ZPqloLscJXWdpWOtiayiXxFc/c/UswQj+CxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mULBPJQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227A9C4CED1;
	Wed,  5 Feb 2025 20:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738787902;
	bh=I+hvuOT1LZ55z7wg6CRnRGy+xUBTyudcDbUtYBv3vfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mULBPJQnMFDsN8xP/BYu3F59UMx7a3bKbjh2zr5ApOMvarYy1Io/lFA91/sHfmUEL
	 P670ipLHA8ftZFvPzk3KHG/iP7Z2Aw8/Ewe52fxJlEdkSZwA3CYaznJqz/bawoTv9A
	 OHidbVuUNAJ/BbUbOpH2tc7LIs0Y7uyUe4xyVtwahf75yvwNFlQvqOAEMA5dz1GmB1
	 bJ4d/BL9zEOr7mdYMDZcwfKwwBZK8vKJrhn2KZZZiZ0v5/MkNcfsMTVwWwUojzQPMg
	 k6gdvkA07VmaWLGqv4nxM8lKAhZl6lkZw2FKr/UHPdeAq//UJSHNMmF8z3rlCUV51f
	 e9eQY+qg7/DDg==
Date: Wed, 5 Feb 2025 13:38:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Whitcroft <apw@canonical.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org
Subject: Re: [PATCH] kbuild: remove EXTRA_*FLAGS support
Message-ID: <20250205203817.GA2060120@ax162>
References: <20250205163939.3464137-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205163939.3464137-1-masahiroy@kernel.org>

On Thu, Feb 06, 2025 at 01:39:38AM +0900, Masahiro Yamada wrote:
> Commit f77bf01425b1 ("kbuild: introduce ccflags-y, asflags-y and
> ldflags-y") deprecated these in 2007. The migration should have been
> completed by now.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  Documentation/dev-tools/checkpatch.rst | 18 ------------------
>  Documentation/kbuild/makefiles.rst     |  3 ---
>  scripts/Makefile.build                 |  4 ----
>  scripts/Makefile.lib                   |  5 -----
>  scripts/checkpatch.pl                  | 14 --------------
>  5 files changed, 44 deletions(-)
> 
> diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
> index abb3ff682076..76bd0ddb0041 100644
> --- a/Documentation/dev-tools/checkpatch.rst
> +++ b/Documentation/dev-tools/checkpatch.rst
> @@ -342,24 +342,6 @@ API usage
>  
>      See: https://www.kernel.org/doc/html/latest/RCU/whatisRCU.html#full-list-of-rcu-apis
>  
> -  **DEPRECATED_VARIABLE**
> -    EXTRA_{A,C,CPP,LD}FLAGS are deprecated and should be replaced by the new
> -    flags added via commit f77bf01425b1 ("kbuild: introduce ccflags-y,
> -    asflags-y and ldflags-y").
> -
> -    The following conversion scheme maybe used::
> -
> -      EXTRA_AFLAGS    ->  asflags-y
> -      EXTRA_CFLAGS    ->  ccflags-y
> -      EXTRA_CPPFLAGS  ->  cppflags-y
> -      EXTRA_LDFLAGS   ->  ldflags-y
> -
> -    See:
> -
> -      1. https://lore.kernel.org/lkml/20070930191054.GA15876@uranus.ravnborg.org/
> -      2. https://lore.kernel.org/lkml/1313384834-24433-12-git-send-email-lacombar@gmail.com/
> -      3. https://www.kernel.org/doc/html/latest/kbuild/makefiles.html#compilation-flags
> -
>    **DEVICE_ATTR_FUNCTIONS**
>      The function names used in DEVICE_ATTR is unusual.
>      Typically, the store and show functions are used with <attr>_store and
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index d36519f194dc..25e04e47faff 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -318,9 +318,6 @@ ccflags-y, asflags-y and ldflags-y
>    These three flags apply only to the kbuild makefile in which they
>    are assigned. They are used for all the normal cc, as and ld
>    invocations happening during a recursive build.
> -  Note: Flags with the same behaviour were previously named:
> -  EXTRA_CFLAGS, EXTRA_AFLAGS and EXTRA_LDFLAGS.
> -  They are still supported but their usage is deprecated.
>  
>    ccflags-y specifies options for compiling with $(CC).
>  
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 993708d11874..a59650ba140b 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -20,10 +20,6 @@ always-m :=
>  targets :=
>  subdir-y :=
>  subdir-m :=
> -EXTRA_AFLAGS   :=
> -EXTRA_CFLAGS   :=
> -EXTRA_CPPFLAGS :=
> -EXTRA_LDFLAGS  :=
>  asflags-y  :=
>  ccflags-y  :=
>  rustflags-y :=
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index ad55ef201aac..20d77bfd0d72 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -1,9 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
> -# Backward compatibility
> -asflags-y  += $(EXTRA_AFLAGS)
> -ccflags-y  += $(EXTRA_CFLAGS)
> -cppflags-y += $(EXTRA_CPPFLAGS)
> -ldflags-y  += $(EXTRA_LDFLAGS)
>  
>  # flags that take effect in current and sub directories
>  KBUILD_AFLAGS += $(subdir-asflags-y)
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 7b28ad331742..8f70bedc18be 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3689,20 +3689,6 @@ sub process {
>  			}
>  		}
>  
> -		if (($realfile =~ /Makefile.*/ || $realfile =~ /Kbuild.*/) &&
> -		    ($line =~ /\+(EXTRA_[A-Z]+FLAGS).*/)) {
> -			my $flag = $1;
> -			my $replacement = {
> -				'EXTRA_AFLAGS' =>   'asflags-y',
> -				'EXTRA_CFLAGS' =>   'ccflags-y',
> -				'EXTRA_CPPFLAGS' => 'cppflags-y',
> -				'EXTRA_LDFLAGS' =>  'ldflags-y',
> -			};
> -
> -			WARN("DEPRECATED_VARIABLE",
> -			     "Use of $flag is deprecated, please use \`$replacement->{$flag} instead.\n" . $herecurr) if ($replacement->{$flag});
> -		}
> -
>  # check for DT compatible documentation
>  		if (defined $root &&
>  			(($realfile =~ /\.dtsi?$/ && $line =~ /^\+\s*compatible\s*=\s*\"/) ||
> -- 
> 2.43.0
> 

