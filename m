Return-Path: <linux-kbuild+bounces-9801-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE05C80AA0
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 14:07:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50C774E4B4B
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 Nov 2025 13:07:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 347E9303C93;
	Mon, 24 Nov 2025 13:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t/r0plhm"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089D5275AFF;
	Mon, 24 Nov 2025 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763989671; cv=none; b=aBC28Y09mmYM0vXujOdRWkXVhEhdCQleR9UGsBHBF+9Z6NCyCkt+4pSdh+CBvVC4WWpnIop2VY+N+dDWOjsSqIJNhlPzj5bpkXguL+OopamVXm9fuvq0c5fBg5U6PGSlANBZJfkfQR9bhGLauWbVl8OuC5Y/2eQgWdBS+76OoDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763989671; c=relaxed/simple;
	bh=tSIB+M5duFIcUbPQf/7jlloyJVndl7TVwVM5SGHXk54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=axrEAH1f9y1rFSwqBJGdLG097jmevUFUyz5ZOf3HEVAFWhskYIvcD57Ra4MZXFrnPgNUVj2I7a30A+7Z331dWbft0pJ6WCdgDYlX3W3T5jjMpkBars6EAq07F76ztX8jIUIZdd4G3zqVwIH8G30BZWTkWDa/xTAxhnGrE0WXbiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t/r0plhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68623C4CEF1;
	Mon, 24 Nov 2025 13:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763989669;
	bh=tSIB+M5duFIcUbPQf/7jlloyJVndl7TVwVM5SGHXk54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/r0plhmKFKSmQVCM62H0576YadOSA6AZuP1wWboa+LylWXVQAhg688cGP8visSxh
	 2L/OaezE6UMNJECYtINs0p/ENQ4+JmG6vKo4GBaB8/RWJmFknNYnWT07IVFFKVYtm8
	 PQbgZIpBODGgvr76pLanK7m5pz+aUCXDYj1xdfgMYnMoGIIh3ZVYMHdhvFF1i3mtlw
	 FSnOvhwhJP0u++Dip6Ji5KonJOqIYhdbaQ3qcjg/sK43MkU8URAntXJ4XhvD/r5ec5
	 tTVijY060wTC6r3tkDODkGx0xKkp486yL3x2/oLZxCGTLnPzdBlp+TENxzMdgN5xBf
	 rrTQL7ld6Rtkw==
Date: Mon, 24 Nov 2025 07:07:47 -0600
From: Rob Herring <robh@kernel.org>
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: fix compilation of dtb specified on command-line
 without make rule
Message-ID: <20251124130747.GA3957523-robh@kernel.org>
References: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120140645.478623-1-thomas.de_schampheleire@nokia.com>

On Thu, Nov 20, 2025 at 03:06:43PM +0100, Thomas De Schampheleire wrote:
> Since commit e7e2941300d2 ("kbuild: split device tree build rules into
> scripts/Makefile.dtbs"), it is no longer possible to compile a device tree
> blob that is not specified in a make rule
> like:
>     dtb-$(CONFIG_FOO) += foo.dtb
> 
> Before the mentioned commit, one could copy a dts file to e.g.
> arch/arm64/boot/dts/ (or a new subdirectory) and then convert it to a dtb
> file using:
>     make ARCH=arm64 foo.dtb

News to me this was ever possible.

> 
> In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusion of
> scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS. The
> value of 'targets', however, is only final later in the code.
> 
> Move the conditional include of scripts/Makefile.dtbs down to where the
> value of 'targets' is final.

This breaks 'make dtbs' (and just 'make' for arm64).


> 
> Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/Makefile.dtbs")
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>  scripts/Makefile.build | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index d0ee33a487be..6e0f9e922c68 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -527,10 +527,6 @@ ifneq ($(userprogs),)
>  include $(srctree)/scripts/Makefile.userprogs
>  endif
>  
> -ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
> -include $(srctree)/scripts/Makefile.dtbs
> -endif
> -
>  # Build
>  # ---------------------------------------------------------------------------
>  
> @@ -568,6 +564,11 @@ FORCE:
>  targets += $(filter-out $(single-subdir-goals), $(MAKECMDGOALS))
>  targets := $(filter-out $(PHONY), $(targets))
>  
> +# Now that targets is fully known, include dtb rules if needed
> +ifneq ($(need-dtbslist)$(dtb-y)$(dtb-)$(filter %.dtb %.dtb.o %.dtbo.o,$(targets)),)
> +include $(srctree)/scripts/Makefile.dtbs
> +endif
> +
>  # Read all saved command lines and dependencies for the $(targets) we
>  # may be building above, using $(if_changed{,_dep}). As an
>  # optimization, we don't need to read them if the target does not
> 
> base-commit: deab487e0f9b39ae4603e22d7d00908ebfc9753c
> -- 
> 2.51.0
> 

