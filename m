Return-Path: <linux-kbuild+bounces-6069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E22DA5CF2F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 20:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A2817A50A
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Mar 2025 19:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 210B12641D8;
	Tue, 11 Mar 2025 19:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJuBeLjN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E941A2641CF;
	Tue, 11 Mar 2025 19:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741720842; cv=none; b=e6vg9c1khBZKNBq/rIvU6T92/UZrN+BrWMhRhmjyM2/GqREU7thvEAnZyrnR+4ZpyhxGU/odxJEYMYltC4esNYYuJHqjPO4ZH3Bi6ZurywPux7D62znKih7VIPBfprZuFXwEf7vSxNryN63ZnrgBymMKnOWp1xQS/s4v+8ZkcTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741720842; c=relaxed/simple;
	bh=dw1pXNbdvIGlHzr6r+Tj3I/DfsC1dGH9LTUcJvxWMaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hEWBICTOovSsp5bCylGF7QUN3xPw32es+dMA4duafa9ZpQsv3XOKkajtfz2aIy/DRbFY+Tpw+kV+yQS+L47QX85jiTvAm6Saxhm18azMQmhBdTCPhMJ4NgnFn3ZJSwM9U9EpN8hJeRJZJzDo59mWANFkAADu9grOLJrSwXMwdzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJuBeLjN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44181C4CEE9;
	Tue, 11 Mar 2025 19:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741720840;
	bh=dw1pXNbdvIGlHzr6r+Tj3I/DfsC1dGH9LTUcJvxWMaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QJuBeLjNHCpkltZtT4v5FHUrLQW+2NS4YeT4c/gxYqI7EF5P0WGMMdoKlXO3IBBLw
	 rJGTUhV4TqtJg/kPV60Jn5c3MUXX4QJw7U4OQoYeITcA+co6zlcqd562S7vQhYo9HZ
	 82Y3tXHr8KFL4SWAt0ogKmMOOGgJyU8MHWOjsbhPZyBq8O6IEyEMO5gu9fpYdYN+Qg
	 A0Lzobh5lC+CZ+JdTzcwpwL8bBOmVuOnXILZxT80ME+2ztloJY+pr3qXHAUexf9Iqo
	 0Y/CvFeWiy8f7hPwI2LVmeRxqe0kfIT3zN6PA5xRGe9BxOOpd5NKzIuUgOpD7ezWSD
	 3yG/LYXVQ2fRQ==
Date: Tue, 11 Mar 2025 20:20:36 +0100
From: Nathan Chancellor <nathan@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] kbuild: deb-pkg: fix versioning for -rc releases
Message-ID: <20250311192036.GC1958594@ax162>
References: <20250311190212.634123-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311190212.634123-1-masahiroy@kernel.org>

On Wed, Mar 12, 2025 at 04:01:33AM +0900, Masahiro Yamada wrote:
> The version number with -rc should be considered older than the final
> release.
> 
> For example, 6.14-rc1 should be older than 6.14, but to handle this
> correctly (just like Debian kernel), "-rc" must be replace with "~rc".
> 
>   $ dpkg --compare-versions 6.14-rc1 lt 6.14
>   $ echo $?
>   1
>   $ dpkg --compare-versions 6.14~rc1 lt 6.14
>   $ echo $?
>   0
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
> 
>  scripts/package/mkdebian | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
> index 193e33bcb989..80ed96561993 100755
> --- a/scripts/package/mkdebian
> +++ b/scripts/package/mkdebian
> @@ -167,7 +167,9 @@ version=$KERNELRELEASE
>  if [ "${KDEB_PKGVERSION:+set}" ]; then
>  	packageversion=$KDEB_PKGVERSION
>  else
> -	packageversion=$(${srctree}/scripts/setlocalversion --no-local ${srctree})-$($srctree/scripts/build-version)
> +	upstream_version=$("${srctree}/scripts/setlocalversion" --no-local "${srctree}" | sed 's/-\(rc[1-9]\)/~\1/')

I don't think there has ever been an -rc10 but would it hurt to make it
[1-9]+?

> +	debian_revision=$("${srctree}/scripts/build-version")
> +	packageversion=${upstream_version}-${debian_revision}
>  fi
>  sourcename=${KDEB_SOURCENAME:-linux-upstream}
>  
> -- 
> 2.43.0
> 

