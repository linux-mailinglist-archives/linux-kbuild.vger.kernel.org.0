Return-Path: <linux-kbuild+bounces-9743-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F38C77988
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 07:43:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4EF9A35B339
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Nov 2025 06:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAFC3128CA;
	Fri, 21 Nov 2025 06:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POsEpL2A"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBD928C037;
	Fri, 21 Nov 2025 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763707383; cv=none; b=ggBqlq9XKhb16yvoaliSemHxR4TwAVIxeCEIh/KMMvXBjZd5If+xA/qwj+qPm/9/54WLOEBBibgRI5iO8s/3ZqRdUo8T4DR/DT+XtZwET2TPfIl/Q85fNjAZKakR6tB57sMPAZRsGwPB5IPBL/dER+a7PGdaNflN2TdwNKqaY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763707383; c=relaxed/simple;
	bh=VorYLfymXUb0WIcUpjhuWjueRM2ZfW3g8T9ia5ZU3l0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hy7nldm3RQXFPQfNC8H8uB4OcqD0omMgNjDhr4C1STK9uSVwr23MZzfh8Q/GfAGjQONJbzc3HcoWDitf1I6Tfyft6UtIghb+DpbnvC+i34hj6IDDPp50Q7V0QQkRNOfr+361lu+JjbyGjeWUWrtBJSDMbmAd9JIjhTIDP+Uib1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POsEpL2A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01A76C4CEF1;
	Fri, 21 Nov 2025 06:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763707380;
	bh=VorYLfymXUb0WIcUpjhuWjueRM2ZfW3g8T9ia5ZU3l0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POsEpL2AOzVAeVpd6h1kASyZth0ssPEUBXJalMz0lDqk6kDiBhQtDRdvMovHC0SBS
	 KjcREu3OIg5etrKysfJLRV9rPA+e1J8tLitJPNFgDYt2e3Icx8P7W26N8pY3nIY9Kq
	 Yia403CcPgpv1ZwrDTVbrNJTdsNz3N782X63Oj/xVzKz9mkg/13+xeo0fgLjMpfJLx
	 I5hM9RHUcsnq25ZG31lVfU6wzwpj+uiCas+omMtK24DeMrJAL+58OjqK3kmTKsWel4
	 BfySCy/D8CzJoUG5X9bB8QF+5WRd3HstZ7/pFZTMQzDZbNOLDznNloK5esiBhFwVxB
	 Z5Ecm1pm3ew3A==
Date: Thu, 20 Nov 2025 23:42:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] kbuild: fix compilation of dtb specified on command-line
 without make rule
Message-ID: <20251121064256.GB571346@ax162>
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

+ Rob, as he reviewed e7e2941300d2

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
> 
> In this scenario, both 'dtb-y' and 'dtb-' are empty, and the inclusion of
> scripts/Makefile.dtbs relies on 'targets' to contain the MAKECMDGOALS. The
> value of 'targets', however, is only final later in the code.
> 
> Move the conditional include of scripts/Makefile.dtbs down to where the
> value of 'targets' is final.
> 
> Fixes: e7e2941300d2 ("kbuild: split device tree build rules into scripts/Makefile.dtbs")
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Huh, TIL that .c and .S files can be built in the same way...

  $ touch init/foo.c init/bar.S
  $ make init/foo.o init/bar.o
  $ ls init/.foo.o.cmd init/.bar.o.cmd
  init/.bar.o.cmd
  init/.foo.o.cmd

I do not necessarily love splitting up the conditional includes from
each other but I am not sure it can be avoided... Nicolas, are you okay
with me taking this as a fix or do you want to take it via kbuild-next?
If the latter:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

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

