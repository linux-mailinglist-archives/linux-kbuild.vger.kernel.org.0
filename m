Return-Path: <linux-kbuild+bounces-1273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA31885C5A
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Mar 2024 16:44:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC07F1F210B2
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Mar 2024 15:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D5998627E;
	Thu, 21 Mar 2024 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Axc3UfCI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79981A947
	for <linux-kbuild@vger.kernel.org>; Thu, 21 Mar 2024 15:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711035803; cv=none; b=WeTInXTCpOnmcIn0lPOc4Vmv7/RZ86SZZfrE0zNMw28oNdTneeEQHvEPUzw6bkl5v+mUF/v8XeUPQQORyIH/jpHyMK2Q5b+9J1X/guxKkt7LEQxSUkQ+9asVklmQ96yBiJJSukWCwTTJIxsToXNxKE4loJRX2Y9G/jiHK9rQZE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711035803; c=relaxed/simple;
	bh=hcmA9gs9RYuhDOaFn/YqNZim89/qCEQpQfnOASTguRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QAmlztO2wO1zpmIByJr5DdPGW/64JJTPENiWnspYUsPii/Hpu9fTWBUW26DxEgjQC7gpPxMpNYta9VH5ce5bhgkW1Ol1hgcHGO+kLQ221fdD6ZpU5Zgw5SqwyoZtw8a1sZyt5kJF1lGLe3uZcANFJdTdEMKU+a/UdLklIujgRqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Axc3UfCI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54983C433C7;
	Thu, 21 Mar 2024 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711035802;
	bh=hcmA9gs9RYuhDOaFn/YqNZim89/qCEQpQfnOASTguRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Axc3UfCIVerTSzM8Sea19oDrCGHiFljkZORppz0uVtVkmLjYoJjaexWPMcRKVClei
	 L91oxSGZWnupsGwInl73sIPTAU9wot+ItcyodvKGj/hR1dVdz5sCgi8cutVoF7wLfW
	 CB47sgVpikJznDVYJrzSMdGgrvsT4We85YIT+AZV3gzthqfS4L37CTQ9IP3++gnHir
	 Yb8kuUp0fW10OsFAVzeklzo3Mksuq5aOOB+2NFSTsWsRsdVPHnfVZ9haetAa9X+GOq
	 uZuPNbLSIma+bq7apYw9cILpvi46N+hm0MMcHyCxLIKneymKh+5Kb1JjKsltIwYLHl
	 BUgjLfx3KIRyw==
Date: Thu, 21 Mar 2024 08:43:20 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>,
	Karolis Mituzas <Karolis.Mituzas@imgtec.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Carlos de Paula <me@carlosedp.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH] scripts/package: buildtar: Output as vmlinuz for riscv
Message-ID: <20240321154320.GA616931@dev-arch.thelio-3990X>
References: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4edd1c5e-aacb-4513-97ae-e6b2130476fc@imgtec.com>

On Thu, Mar 21, 2024 at 11:58:51AM +0000, Matt Coster wrote:
> From: Karolis Mituzas <karolis.mituzas@imgtec.com>
> 
> This matches the behavior for arm64 [1] and prevents clobbering of
> vmlinux-${KERNELRELEASE}.
> 
> [1]: commit 0df57d90bfd6 ("kbuild: buildtar: add arm64 support")
> 
> Fixes: 7d0bc44bd0ea ("kbuild: buildtar: add riscv support")
> Signed-off-by: Karolis Mituzas <karolis.mituzas@imgtec.com>
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
>  scripts/package/buildtar | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 72c91a1b832f..a36aca2a27cc 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -96,7 +96,7 @@ case "${ARCH}" in
>  	riscv)
>  		for i in Image.bz2 Image.gz Image; do

This patch seems fine but it does introduce a slight inconsistency with
the rest of this script, as vmlinuz implies a compressed boot image but
Image is not compressed. Probably does not really matter but I feel like
it is worth mentioning.

>  			if [ -f "${objtree}/arch/riscv/boot/${i}" ] ; then
> -				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinux-${KERNELRELEASE}"
> +				cp -v -- "${objtree}/arch/riscv/boot/${i}" "${tmpdir}/boot/vmlinuz-${KERNELRELEASE}"
>  				break
>  			fi
>  		done
> -- 
> 2.44.0
> 

