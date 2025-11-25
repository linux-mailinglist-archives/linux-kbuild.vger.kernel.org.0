Return-Path: <linux-kbuild+bounces-9853-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D7197C87886
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 Nov 2025 00:56:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6C24E34E4B6
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 Nov 2025 23:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E07052D9EEC;
	Tue, 25 Nov 2025 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QtK2nZj+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FFF25CC63;
	Tue, 25 Nov 2025 23:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764114981; cv=none; b=KQrehGy2t4wWdp1wdX1qBVaooEm2D2mrofnF5vgh9Xod7lSXKHz8uak9Vpo0VlFSxSJOrek1fOeJ481h7JmF+LBjc3DEZvWhLbAA/9X/6drcTZJ1fEik5Cq2sqz/m2ROH5zwRoGGZEgi3HDIvmuKxo55akuMSPV/Seo0CkRqRd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764114981; c=relaxed/simple;
	bh=n4ovKI+j1SBC61LeJRek5jeuTY7+RgicMwj2/Pt4gGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJeWhMVE+2fbwfBCAD5wBO7yCX096LPLdCKjkKiyPKocTAbn6sWoHvoKoQzFVENhcQUK8xTOBtx38tqxs3Fkab46deZqynY9d4ywO3NdPz1vh8NSlylREcJxhAnVn58Oq6FoRBdPEA6Q/fqtyje0CdQx1Vve0XXItOTIMgG7dTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QtK2nZj+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9ADC4CEF1;
	Tue, 25 Nov 2025 23:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764114981;
	bh=n4ovKI+j1SBC61LeJRek5jeuTY7+RgicMwj2/Pt4gGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QtK2nZj+aoUCgi9y0MgEsWSa2WcHDrQFKeCmllIw32k2EarogV2nWdYIVyBkOX37O
	 UTsP8rhOdUBbIkNv1Oa3gVxmGZ2E5rBAw0y+OHBC6JdahWnaHJM2Nc18iWM3lGiS2k
	 V5+d6cOcnvUfhcssgW8m1xSbB/dRDh/yjQnfEQgucNmyTijLVwJ4+Bnd75EhLA0IR4
	 SHqse/aokHYyBBDpsttrrbw0R0vwvL7dUIjaohfp6HJNoa15bXMPQViaNAyCzMkLjk
	 rupKSLq3cLrE2gL+Rgxw52i9Ivch9RrNGXnm79Mk94FXtrY8j6H5jsN9NMT1rKUqd0
	 5LkB9/qHpwjJQ==
Date: Tue, 25 Nov 2025 16:56:17 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Nicolas Schier <nicolas.schier@linux.dev>,
	Simon Glass <sjg@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH v2 0/2] kbuild: add target to build a cpio containing
 modules
Message-ID: <20251125235617.GA296211@ax162>
References: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125-cpio-modules-pkg-v2-0-aa8277d89682@pengutronix.de>

On Tue, Nov 25, 2025 at 02:18:18PM +0100, Ahmad Fatoum wrote:
> 
> ---
> Changes in v2:
> - Add Simon's Tested-by and Reviewed-by
> - rename to modules-cpio-pkg (Nathan)
> - add separator/doc comment heading (Thomas)
> - Make temp directory ignoring and cleanup automatic (Thomas)
> - Use CONFIG_SHELL instead of shebang (Thomas)
> - Use -o instead of redirecting stdout when creating cpio (Thomas)
> - Drop superfluous -f as $(build)= overrides it (Thomas)
> - Add extra preparatory patch that makes hostprogs := gen_init_cpio
>   unconditional
> - Link to v1: https://lore.kernel.org/r/20251115-cpio-modules-pkg-v1-1-01d5a0748442@pengutronix.de
> 
> ---
> Ahmad Fatoum (1):
>       initramfs: add gen_init_cpio to hostprogs unconditionally
> 
> Sascha Hauer (1):
>       kbuild: add target to build a cpio containing modules
> 
>  scripts/Makefile.package | 20 ++++++++++++++++++++
>  usr/Makefile             |  4 ++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
> ---
> base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
> change-id: 20251115-cpio-modules-pkg-70d85a69892b
> 
> Best regards,
> -- 
> Ahmad Fatoum <a.fatoum@pengutronix.de>
> 

Thanks a lot for implementing all of Thomas's suggestions (and thanks to
him for providing them). This series looks good to me and I can imagine
this being quite useful for testing.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

Cheers,
Nathan

