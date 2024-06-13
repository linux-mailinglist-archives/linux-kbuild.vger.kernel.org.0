Return-Path: <linux-kbuild+bounces-2105-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 157E2905F7C
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 02:01:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A175C285C6B
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Jun 2024 00:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BBE2913;
	Thu, 13 Jun 2024 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNW8Efq4"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFC5ECC;
	Thu, 13 Jun 2024 00:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718236859; cv=none; b=fL7UfNoUq2yqScvIARluB0ovMSE04JeMhr7Nn8/gvb9F2oL+U0rudiTGaaisai7FikoVvNkQo9x6T4yaKRDC22i9Jl1b7ZhXZN/NrXV8OuHhj4eaFKR8zgUW/0ZWkV1nVeZaeL/Wt5Vqzk5+35Ia1Q7zUMentMOrPYM/18ZuAeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718236859; c=relaxed/simple;
	bh=THiXsAgeS1weLL4STfIx2Vj7agXhVKgVFw1koBWnVjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9klczN8RvNNM0xZ4dWylCY1EE3Rij7o2bnJpMjitngUw6v9lyQbqK1hHgKLQ+4SyxPjNCHE2lGM7SJFbLQXTMfdYinv0SM+8571Zz/Xp0mAUnJn6lx28ir5wHLzXWeKvTfunVD7Z47M/vbeV+Y0SVS/hLQMhMTg5+wer4mDwVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNW8Efq4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FA79C116B1;
	Thu, 13 Jun 2024 00:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718236858;
	bh=THiXsAgeS1weLL4STfIx2Vj7agXhVKgVFw1koBWnVjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNW8Efq4nsxJaxjYDV3HvRYCgJwocXmGNo2sreM/SkqXdyy9i1jDvt3QGHlTn20qn
	 XrlCEPr910wfp1VzlcIRY7sdQfjQWqR1c+wluIOJcBoneac1Xo+2+UWjtWesYM+Hh5
	 DduFz+Ey0owbGwevyqv+w7AzjXTrIGWZDKZNx7YuYLh5qAvN7y5PZZ2oTlRneQg5k7
	 wsBpxDkLROBih7fTxTnhJzKYwf2Y+n73w3vpdHf5kTRjwF+RXK+mSjTz/rNj2IfimM
	 gwjxcnGBxX9nzOOlqjnASLtzdwotHURDnat2sYnrewiK+0XKb8ZCj7bJnlqB2lc/Ym
	 4O9Y/u1kzygBg==
Date: Wed, 12 Jun 2024 17:00:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: move init/build-version to scripts/
Message-ID: <20240613000056.GA1596562@thelio-3990X>
References: <20240611182502.3600062-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240611182502.3600062-1-masahiroy@kernel.org>

On Wed, Jun 12, 2024 at 03:24:47AM +0900, Masahiro Yamada wrote:
> At first, I thought this script would be used only in init/Makefile.
> 
> However, commit 5db8face97f8 ("kbuild: Restore .version auto-increment
> behaviour for Debian packages") and commit 1789fc912541 ("kbuild:
> rpm-pkg: invoke the kernel build from rpmbuild for binrpm-pkg")
> revealed that it was actually needed for scripts/package/mk* as well.
> 
> After all, scripts/ is a better place for it.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  init/Makefile                   | 2 +-
>  {init => scripts}/build-version | 0
>  scripts/package/mkdebian        | 2 +-
>  scripts/package/mkspec          | 2 +-
>  4 files changed, 3 insertions(+), 3 deletions(-)
>  rename {init => scripts}/build-version (100%)
> 
> diff --git a/init/Makefile b/init/Makefile
> index ab71cedc5fd6..10b652d33e87 100644
> --- a/init/Makefile
> +++ b/init/Makefile
> @@ -52,7 +52,7 @@ CFLAGS_version.o := -include $(obj)/utsversion-tmp.h
>  # Build version-timestamp.c with final UTS_VERSION
>  #
>  
> -include/generated/utsversion.h: build-version-auto = $(shell $(src)/build-version)
> +include/generated/utsversion.h: build-version-auto = $(shell $(srctree)/scripts/build-version)
>  include/generated/utsversion.h: build-timestamp-auto = $(shell LC_ALL=C date)
>  include/generated/utsversion.h: FORCE
>  	$(call filechk,uts_version)
> diff --git a/init/build-version b/scripts/build-version
> similarity index 100%
> rename from init/build-version
> rename to scripts/build-version
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 070149c985fe..b9a5b789c655 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -150,7 +150,7 @@ version=$KERNELRELEASE
>  if [ -n "$KDEB_PKGVERSION" ]; then
>  	packageversion=$KDEB_PKGVERSION
>  else
> -	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/init/build-version)
> +	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/scripts/build-version)
>  fi
>  sourcename=${KDEB_SOURCENAME:-linux-upstream}
>  
> diff --git a/scripts/package/mkspec b/scripts/package/mkspec
> index ce201bfa8377..cffc2567bef2 100755
> --- a/scripts/package/mkspec
> +++ b/scripts/package/mkspec
> @@ -24,7 +24,7 @@ fi
>  cat<<EOF
>  %define ARCH ${ARCH}
>  %define KERNELRELEASE ${KERNELRELEASE}
> -%define pkg_release $("${srctree}/init/build-version")
> +%define pkg_release $("${srctree}/scripts/build-version")
>  EOF
>  
>  cat "${srctree}/scripts/package/kernel.spec"
> -- 
> 2.43.0
> 

