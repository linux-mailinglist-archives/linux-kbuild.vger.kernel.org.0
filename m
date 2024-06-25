Return-Path: <linux-kbuild+bounces-2248-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFA4916EB3
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 19:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 558D11F218F9
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Jun 2024 17:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D83CE1459E2;
	Tue, 25 Jun 2024 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lCUAn4R0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEC12F56;
	Tue, 25 Jun 2024 17:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719334850; cv=none; b=L3A78jgqrml1hoZF4zwOshbL/UHaNNk4ftHkjUiQxm+APpJhVml+HdUlRAkjjMkT6TVOZAaNxsgEfkmNCK8YMwy1J8tg58e7TRGDh0pzuoHLnUnq6k9/4wminDF5pOBS8mAKIlZ4fiHM/3+Fx0z0FK/CDrfE5WG0Dx0NH1s14x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719334850; c=relaxed/simple;
	bh=jReVo7cPZTHRyUkIyfpym6pSDuf/auj8AgpkL5o2CB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RgteNO0VjTGUvt5dtxmzknM2M4id220tsXZ0+6LDOl9FWdZSKcd7xb7kuQfPVO85i8bNwpMHY/q3xAVV+RpIYY+In62bZoK6rf+NZNm9Ecp0ggmPOJdPi/ZykaYXnk7Ll6lK4JrxtYLBFY/DYukNSph0hzu2W0oGQML4Lsw8Vxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lCUAn4R0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4356C32781;
	Tue, 25 Jun 2024 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719334850;
	bh=jReVo7cPZTHRyUkIyfpym6pSDuf/auj8AgpkL5o2CB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lCUAn4R0OjjxVaZ0BjsGnpfYkLZbXggT1fE/1jSLHqFDlU0p66q7LfWE9In34TCRF
	 ady2ml0BMXSmYDB4fblFjdAa7hKMTazENuOssVgFfMDmK1E6ab0xE6V+WdGzkx9LqK
	 lhoMTMr419fToBuIelmXY0cWbUeRnHErQGb/RmRKTc/ovHWoCPjiSJXkmyEJlu80Hd
	 tSNnk9SShWKSOY8ibyxcu7WeHgZL32w3oszDEnO6nvMOUPGLEQ3Clgc/VjnQOYKo2S
	 t9dHhzppU/ejOah4G6CTzfp+x+StCFDsgfwQZYAS9EIXQxrJZTWj7cnaisAcd/u5lC
	 ZvyHKJfj1JB0A==
Date: Tue, 25 Jun 2024 10:00:48 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <n.schier@avm.de>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-dpkg: Check optional env variables before use
Message-ID: <20240625170048.GA3877857@thelio-3990X>
References: <20240625-mkdebian-check-if-optional-vars-are-defined-v1-1-53f196b9f83a@avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625-mkdebian-check-if-optional-vars-are-defined-v1-1-53f196b9f83a@avm.de>

On Tue, Jun 25, 2024 at 02:45:56PM +0200, Nicolas Schier wrote:
> Add checks to mkdebian for undefined optional environment variables
> before evaluating them.
> 
> Some variables used by scripts/package/mkdebian are fully optional and
> not set by kbuild.  In order to allow enabling 'set -u' (shell script
> exits on dereference of undefined variables), introduce the explicit
> checking.
> 
> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> Signed-off-by: Nicolas Schier <n.schier@avm.de>

Looks good to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> This allows application of the original patch
>    [PATCH 1/2] kconfig: add -e and -u options to *conf-cfg.sh scripts
>    [PATCH 2/2] kbuild: package: add -e and -u options to shell scripts
> as sent https://lore.kernel.org/linux-kbuild/20240611160938.3511096-1-masahiroy@kernel.org/
> ---
>  scripts/package/mkdebian | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index b9a5b789c655..2a7bb05c7f60 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -19,7 +19,7 @@ if_enabled_echo() {
>  }
>  
>  set_debarch() {
> -	if [ -n "$KBUILD_DEBARCH" ] ; then
> +	if [ "${KBUILD_DEBARCH:+set}" ] ; then
>  		debarch="$KBUILD_DEBARCH"
>  		return
>  	fi
> @@ -147,7 +147,7 @@ fi
>  
>  # Some variables and settings used throughout the script
>  version=$KERNELRELEASE
> -if [ -n "$KDEB_PKGVERSION" ]; then
> +if [ "${KDEB_PKGVERSION:+set}" ]; then
>  	packageversion=$KDEB_PKGVERSION
>  else
>  	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/scripts/build-version)
> @@ -164,7 +164,7 @@ debarch=
>  set_debarch
>  
>  # Try to determine distribution
> -if [ -n "$KDEB_CHANGELOG_DIST" ]; then
> +if [ "${KDEB_CHANGELOG_DIST:+set}" ]; then
>          distribution=$KDEB_CHANGELOG_DIST
>  # In some cases lsb_release returns the codename as n/a, which breaks dpkg-parsechangelog
>  elif distribution=$(lsb_release -cs 2>/dev/null) && [ -n "$distribution" ] && [ "$distribution" != "n/a" ]; then
> 
> ---
> base-commit: 3893a22a160edd1c15b483deb3dee36b36ee4226
> change-id: 20240625-mkdebian-check-if-optional-vars-are-defined-a46cf0524e4e
> 
> Best regards,
> -- 
> Nicolas Schier
> 

