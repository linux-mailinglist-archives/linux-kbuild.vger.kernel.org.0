Return-Path: <linux-kbuild+bounces-7222-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B29AC1769
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 May 2025 01:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9EF641BA54EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 May 2025 23:11:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 200FA2C2AD1;
	Thu, 22 May 2025 23:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ft/PxAdG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC182C2AD3;
	Thu, 22 May 2025 23:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747955416; cv=none; b=UYfXG+g1Muc4kt4KI/hyNel4n12YPRyFWcYdQz3Hp2wS3ZDqJqXsatep8e39cswNUTQU6PSLvP9I3IXRsSElosArIpJ8Yj7riT62fL64WSqfktQ7pHpppLDCmKvkqmdyu2zxyEEmQVuKH9PhGolEHqtuk0lIFzjj34ZvsmNRMh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747955416; c=relaxed/simple;
	bh=JC3ayl92jcrGI1xyzlS/XHQG6W6X5j49ZZTDEfPQ1V8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pwsX6sjtbpJvwIqhVfEEoTWWHGhm2u6yYdq/v10eswl0tx/0/u1KEUCW4tPZNxAf1hQHzku2dZfWEdRDRXdlWQUivjei8M/i4ZZKmPIEOCwwG58m5h7u0QxTZ7A7Daqge9RbPF4oWYRa8gpIjCD14SW6JvmDENpCPD1KPn5mg3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ft/PxAdG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03036C4CEE4;
	Thu, 22 May 2025 23:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747955415;
	bh=JC3ayl92jcrGI1xyzlS/XHQG6W6X5j49ZZTDEfPQ1V8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ft/PxAdGXmJauzHN85+IaAaa0mRgIeJzZOcYq5v3dAa7VDfefHdwLzG3EofXAmp+f
	 QDOZFyDNzXH1Xinq7O7/2+PWgG+gHCfb3ssysZQ+7vfFDsZtumejYjwg34l1XSyHSL
	 nqogV3vkJLdm6nt7z69JM+Dirc7EgZK90HrfurSkkff4MIdz55pJHLmkgxOWgJ6Y2p
	 DtFq3wENWV5pnryt01lIk7Eyw/PE/KbXLwQNMl4LhYHhbdY8t2b/6DZ810jxOVZfKi
	 M6JJmQpxEJi/Qphws8LIGAW7Ubxb4LERfC41yOBhOG2sB49BwN0ddMc4wNNfp1m0hV
	 Y9veF0Kl4IYmg==
Date: Thu, 22 May 2025 16:10:09 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Jeremy Linton <jeremy.linton@arm.com>
Cc: linux-kbuild@vger.kernel.org, masahiroy@kernel.org,
	nicolas.schier@linux.dev, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH] scripts: add zboot support to extract-vmlinux
Message-ID: <20250522231009.GA2020750@ax162>
References: <20250522172941.1669424-1-jeremy.linton@arm.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522172941.1669424-1-jeremy.linton@arm.com>

Hi Jeremy,

On Thu, May 22, 2025 at 12:29:41PM -0500, Jeremy Linton wrote:
> Zboot compressed kernel images are used for arm kernels on various
> distros.
> 
> extract-vmlinux fails with those kernels because the wrapped image is
> another PE. While this could be a bit confusing, the tools primary
> purpose of unwrapping and decompressing the contained vmlinux image
> makes it the obvious place for this functionality.
> 
> Add a 'file' check in check_vmlinux() that detects a contained PE
> image before trying readelf. Recent file implementations output
> something like:
> 
> "Linux kernel ARM64 boot executable Image, little-endian, 4K pages"
> 
> Which is also a stronger statement than readelf provides so drop that
> part of the comment. At the same time this means that kernel images
> which don't appear to contain a compressed image will be returned
> rather than reporting an error. Which matches the behavior for
> existing ELF files.
> 
> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> ---
>  scripts/extract-vmlinux | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/extract-vmlinux b/scripts/extract-vmlinux
> index 8995cd304e6e..edda1abe226c 100755
> --- a/scripts/extract-vmlinux
> +++ b/scripts/extract-vmlinux
> @@ -12,10 +12,11 @@
>  
>  check_vmlinux()
>  {
> -	# Use readelf to check if it's a valid ELF
> -	# TODO: find a better to way to check that it's really vmlinux
> -	#       and not just an elf
> -	readelf -h $1 > /dev/null 2>&1 || return 1
> +	file $1 |grep 'Linux kernel.*boot executable Image' > /dev/null
> +	if [ "$?" -ne "0" ]; then

Could these two lines be simplified to:

  if file $1 | grep 'Linux kernel.*boot executable Image' > /dev/null; then

> +		# Use readelf to check if it's a valid ELF, if 'file' fails
> +		readelf -h $1 > /dev/null 2>&1 || return 1
> +	fi
>  
>  	cat $1
>  	exit 0
> -- 
> 2.49.0
> 

