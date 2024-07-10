Return-Path: <linux-kbuild+bounces-2466-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C69BC92D465
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 16:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D0C41F2360B
	for <lists+linux-kbuild@lfdr.de>; Wed, 10 Jul 2024 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB35193459;
	Wed, 10 Jul 2024 14:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="VFXQuADA";
	dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="RnS8smPW";
	dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="L/N4FYyz"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from e2i411.smtp2go.com (e2i411.smtp2go.com [103.2.141.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499C193455
	for <linux-kbuild@vger.kernel.org>; Wed, 10 Jul 2024 14:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720622443; cv=none; b=bl+63mxKiSHP6uqrECM+6jwali7W29aIbV0udEihDZ6ECIOcYLLv04T759K0rfA18MZluE0pFM9EsDNgUJnSqajcEA7YIIENKw+M9YSAlSpfg+2ocuxIQ2E4eo73O67Xc1pcXFkma9sZri9S30wggFJcjo0Y2uZDHSIn3MzZj8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720622443; c=relaxed/simple;
	bh=cj4lxGGMEAnw4XEUD3CY1TRsj+/DeeAZQQsYN+clMFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khgC27zp2bMvsjXy0KxG1YNAwWk8w1IVxpJQR4cuv0Xjn6KFqDOk9oS8R7uLUWAkquOH+jlSz+QzcWlg51BHWZ/FBEhJZ0jZrIQ53HXmoB4nFvL2XD5eiZcL29LB3Z3jb/vVKdfG8hcNSBkDUEPrDV6gxAB1QhMHCmUqS5N8coU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=em1174286.fjasle.eu; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=VFXQuADA reason="unknown key version"; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=RnS8smPW; dkim=pass (1024-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=L/N4FYyz; arc=none smtp.client-ip=103.2.141.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1174286.fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=mp6320.a1-4.dyn; x=1720623331; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=ymPENd0Hkx89Fqve76Y+gFUwa1asNPWiYfEhrftdTnY=; b=VFXQuADAzO9SQWSzyO7gjq5+5w
	9y2jLBpDbnaWpcryQ9uQsqZ9YoqmAlyOvVpSBds4mUtzKUYPN/Hq+aXbEaShSsqtoa7HNQg029CsY
	cS0vJRsUQeurJldMB/dp7oslkohot77LAPZGWrmESsRWQqRXmrKffDKG/mA6uEQVx2fpaqkEBrhgS
	rUrEBRIcw0efyGvtls6sbNd9qdq+FbYMByjDuxKxjZVBSyn1X7QzKyMy3A6Lb8hWufrq44FICBYls
	JQzS9Wp478Y0qSNnOuJH1UjZVvsZXXnE6oZ02ruT0/OJFu5JIquD28eZlW5Fed9PG/uDyRAB+KLDo
	3lWuMEyA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fjasle.eu;
 i=@fjasle.eu; q=dns/txt; s=s1174286; t=1720622431; h=from : subject :
 to : message-id : date;
 bh=ymPENd0Hkx89Fqve76Y+gFUwa1asNPWiYfEhrftdTnY=;
 b=RnS8smPWYpAJTmwXkswpMxEULn31flvcbnIpyZuKc2dDd2P8xHz6Pz1h3JU7OJ8bMy6ZM
 3/qMgAWFKAVbQudRPu7pBV336aFYkkIUoHATWr78BBbkWrHHoU/Oz8dWbliGCD3nzp/jG5c
 LicUw6TVo+ewg6sm99HsfvmZ9P5n2v5HsEuqrAtUn30YqXJnhgHLuBAjbWLA2uvSvQ3sb9K
 NTeRPy03hjaRKvbwXB4ysd8VvVCLxjagQNOx3phzbIiC+E8Whbn1LgwUhV0FceHlET+4s3l
 IWMNNNC+NeBWs6PbX7K7IflBPXA9vS6Kz/j9/FOwuItRJnHqMEteVfWmvXFw==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sRYUG-TRjwo6-8I; Wed, 10 Jul 2024 14:40:05 +0000
Received: from [10.85.249.164] (helo=leknes.fjasle.eu)
 by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <nicolas@fjasle.eu>)
 id 1sRYUE-4o5NDgrg3Tu-o6qn; Wed, 10 Jul 2024 14:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fjasle.eu; s=mail;
 t=1720622401; bh=cj4lxGGMEAnw4XEUD3CY1TRsj+/DeeAZQQsYN+clMFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L/N4FYyzCJnJi8w0aXxS+6lz68yGte6dm4b5VRdK6JJ5vDmA860LWK1WPm2qfs4hb
 UJK4Bq2TJFRNbLwdzNtzlLnGv2qKyfAKf4KjPbviquzcQxJftkwtu2KijcyAdViA1r
 IxNRABPh1XMoGrM+1jKufvD5qTTlbA13sdGYaSU8=
Received: by leknes.fjasle.eu (Postfix, from userid 1000)
 id 394163E8DB; Wed, 10 Jul 2024 16:40:01 +0200 (CEST)
Date: Wed, 10 Jul 2024 16:40:01 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 "Jan Alexander Steffens (heftig)" <heftig@archlinux.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: add script and target to generate pacman
 package
Message-ID: <Zo6dQQIJmkauRmFM@fjasle.eu>
References: <20240708-kbuild-pacman-pkg-v3-1-885df3cbc740@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708-kbuild-pacman-pkg-v3-1-885df3cbc740@weissschuh.net>
X-Smtpcorp-Track: 2x0zpmipZCRk.InvFxueUqqf1.6o1XpwUY91d
Feedback-ID: 1174286m:1174286a9YXZ7r:1174286saasBVQzwC
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Mon, Jul 08, 2024 at 10:11:51PM +0200 Thomas Weiﬂschuh wrote:
> pacman is the package manager used by Arch Linux and its derivates.
> Creating native packages from the kernel tree has multiple advantages:
> 
> * The package triggers the correct hooks for initramfs generation and
>   bootloader configuration
> * Uninstallation is complete and also invokes the relevant hooks
> * New UAPI headers can be installed without any manual bookkeeping
> 
> The PKGBUILD file is a simplified version of the one used for the
> downstream Arch Linux "linux" package.
> Extra steps that should not be necessary for a development kernel have
> been removed and an UAPI header package has been added.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> ---
> Changes in v3:
> - Enforce matching architectures for installation
> - Add Reviewed-by and Tested-by from Nathan
> - Link to v2: https://lore.kernel.org/r/20240706-kbuild-pacman-pkg-v2-1-613422a03a7a@weissschuh.net
> 
> Changes in v2:
> - Replace ${MAKE} with $MAKE for consistency with other variables
> - Use $MAKE for "-s image_name"
> - Avoid permission warnings from build directory
> - Clarify reason for /build symlink removal
> - Install System.map and config
> - Install dtbs where available
> - Allow cross-build through arch=any
> - Sort Contributor/Maintainer chronologically
> - Disable some unneeded makepkg options
> - Use DEPMOD=true for consistency with rpm-package
> - Link to v1: https://lore.kernel.org/r/20240704-kbuild-pacman-pkg-v1-1-ac2f63f5fa7b@weissschuh.net
> ---
>  .gitignore               |  6 ++++
>  scripts/Makefile.package | 16 ++++++++++
>  scripts/package/PKGBUILD | 83 ++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 105 insertions(+)
> 
> diff --git a/.gitignore b/.gitignore
> index c59dc60ba62e..7902adf4f7f1 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -92,6 +92,12 @@ modules.order
>  #
>  /tar-install/
>  
> +#
> +# pacman files (make pacman-pkg)
> +#
> +/PKGBUILD
> +/pacman/
> +
>  #
>  # We don't want to ignore the following even if they are dot-files
>  #
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index bf016af8bf8a..a5b5b899d90c 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -141,6 +141,21 @@ snap-pkg:
>  	cd $(objtree)/snap && \
>  	snapcraft --target-arch=$(UTS_MACHINE)
>  
> +# pacman-pkg
> +# ---------------------------------------------------------------------------
> +
> +PHONY += pacman-pkg
> +pacman-pkg:
> +	@ln -srf $(srctree)/scripts/package/PKGBUILD $(objtree)/PKGBUILD

Can you please also add PKGBUILD to MRPROPER_FILES in top-level Makefile?

Kind regards,
Nicolas

