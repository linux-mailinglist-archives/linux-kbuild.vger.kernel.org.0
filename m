Return-Path: <linux-kbuild+bounces-2234-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C93129128A2
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jun 2024 16:57:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B22D1B296DA
	for <lists+linux-kbuild@lfdr.de>; Fri, 21 Jun 2024 14:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B428138F91;
	Fri, 21 Jun 2024 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bDENNjmV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89386383A2;
	Fri, 21 Jun 2024 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981716; cv=none; b=WggO+05o6kBb8KoDLPORJLCq1xLleX8dP+XoNug7eUJj2FfdHUEX42uN297820xKiq/J+rdnkhr9z8mFheSPhMTr3/zn7zS5230yEVCPyAOmta/I9zHuUyJ9kD0XMtdCTF7PMNQB6yg7jYxbLYzIDAf4sbcEET8Qj08Qxx+MnLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981716; c=relaxed/simple;
	bh=P1HcTPymISCakcAlIMzySFVKqxfUYdVdlS6vE0ZSccg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRNaiY6TLiMas9AqpgdPYq5nL9OwTjKyJigdgM+UryRxsSHIXPYxhddi2gf1xqcBYxMSf+qIwlDeSPMsZL8RI/GPKtdCs+B+iA9iOB1KHEcUG/B5zUXJtfIfiUDx/YVqBC2cTtedWm64Y3eUesvvRyVcupj5dX4gIRXX7nNATCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bDENNjmV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BC9C2BBFC;
	Fri, 21 Jun 2024 14:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718981716;
	bh=P1HcTPymISCakcAlIMzySFVKqxfUYdVdlS6vE0ZSccg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bDENNjmVQh/UsbbFalcgMn8pvAqb+uaGa+G7Vz3tIpnSJx1aMvTyDDxHMQEfQtS5t
	 AQwWTYeeu6D3OD5ySIGHQOZywM8JzvUzc+BtPvFIz05MilKnDYrc3FEL0yiKD+wIkr
	 boS0WxW615ti2UxXGoO6aLar7018iahMkcl3Bkr5AO5+qJ3yvAqDuZTDcvPS+qlmdw
	 a+YgTua0Mzwlr/yIxKOQDAE/Hl0WeevPcTTO+0YFb35ByddovUiWf5ETg5CHc5QCes
	 5+evjD27zLuMNpLlLShEPgweSyrBdUghTGuMlmBRnU9a263HJpNGDOwZbruuED2O+o
	 dYlIuRKSqilwQ==
Date: Fri, 21 Jun 2024 07:55:14 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [RESEND PATCH v2] kbuild: buildtar: Add explicit 32-bit arm
 support
Message-ID: <20240621145514.GA3770753@thelio-3990X>
References: <ZhmKzqxHXaSZmXee@mozart.vkv.me>
 <6bc61e82eaae9e614cbd50a322322173f593c90c.1718936424.git.calvin@wbinvd.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6bc61e82eaae9e614cbd50a322322173f593c90c.1718936424.git.calvin@wbinvd.org>

Hi Calvin,

On Thu, Jun 20, 2024 at 07:25:59PM -0700, Calvin Owens wrote:
> Implement buildtar for 32-bit arm, so the zImage (or xipimage) appears
> at boot/vmlinuz-$foo, rather than at boot/vmlinux-kbuild-$foo, matching
> the structure of the tar-pkg on arm64 and other architectures.
> 
> Link: https://lore.kernel.org/all/ZhmKzqxHXaSZmXee@mozart.vkv.me/
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/package/buildtar | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index eb67787f8673..23d7ff675396 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -104,6 +104,9 @@ case "${ARCH}" in
>  				cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}";;
>  		esac
>  		;;
> +	arm)
> +		[ -f "${KBUILD_IMAGE}" ] && cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
> +		;;
>  	*)
>  		cp -v -- "${KBUILD_IMAGE}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  		;;
> -- 
> 2.39.2
> 

Is this change necessary after commit 2b1ab1405068 ("kbuild: buildtar:
remove warning for the default case")? Without the '[ -f ... ] &&' part
of the expression, which was removed for other cases in
commit c3f7bed8fa14 ("kbuild: buildtar: add comments about inconsistent
package generation"), it appears to be the same thing.

Cheers,
Nathan

