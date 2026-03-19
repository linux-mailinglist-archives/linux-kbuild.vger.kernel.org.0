Return-Path: <linux-kbuild+bounces-12086-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Gz9LO94vGnOzAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-12086-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 23:30:07 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 317702D2F94
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 23:30:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02FAA3005E93
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Mar 2026 22:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23CFC347FD7;
	Thu, 19 Mar 2026 22:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q17PdLgf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0120B358367;
	Thu, 19 Mar 2026 22:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773959405; cv=none; b=fbY5ADrKNbsdK6BhIgtTBi5NMoCOJM365XoZngWxiflC/IsNfLUQrYa9+93aVHQX1kRqvjSPPM0BL+hD46Epobo/+ssyOU2nVlEzbdFItH/RbtBRvJD/7Ijp+fwX5F4M3HJOzTTB9tl/Pb9A42CUR0rkswyBVRHWpmcHDrKx7vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773959405; c=relaxed/simple;
	bh=7En3FNsopf8Dw8/wTigloKxjHaGL+d0VezZBbPSu6vY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KhfzOT2Z9+Nr9ZXITCImxjFQvWb3KYPrANLO22Zq5WV4hYdAnLmBqpKmU0YEDTSUjVXMAzxXGdnXhx+1NzbJ4hXp9xT2A8mhOnStjdiL3xexyKTkThYVbYecHQbIYNV/nT1A56me9jS85y9K+S+yC+DFpbsINJbRzhrldqGJghs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q17PdLgf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C09C19424;
	Thu, 19 Mar 2026 22:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773959404;
	bh=7En3FNsopf8Dw8/wTigloKxjHaGL+d0VezZBbPSu6vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q17PdLgf4MOcVMHbVc7GeV1Vbu9V1j2rASwG0YKURPQbyDwsH3/fblskz7QVRfz4L
	 QKPvO/T8HvlOhUVx6lUacKf69u5qCCRjZSzoNZW8037wcDxQ4251RtmQaY96h81kCX
	 qurrAG1k+bIMpMDJcju09w3ywd5vdw9XJxzJmMO1k8l8wg5986pSo8Ypy2dbFjpazX
	 uYFttrhBYn7p6aKr+Yl4bTvMY5BLbMGfao54j9A2j0Md3hYescYMtLvl1XMEAG1E/K
	 DBKGTW9lIioXrUhOwn+7uj9GxCldPRrkwsSPkYb0+xEjgfBHSx68MRrd938GAg5vYm
	 y/EhJ8lrF8m0Q==
Date: Thu, 19 Mar 2026 15:30:00 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Christian Heusel <christian@heusel.eu>, Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: pacman-pkg: package unstripped vDSO libraries
Message-ID: <20260319223000.GA1282459@ax162>
References: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260318-kbuild-pacman-vdso-install-v1-1-48ceb31c0e80@weissschuh.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12086-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,weissschuh.net:email]
X-Rspamd-Queue-Id: 317702D2F94
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 09:37:20PM +0100, Thomas Weiﬂschuh wrote:
> The unstripped vDSO files are useful for debugging.
> They are provided in the upstream 'linux-headers' package.
> 
> Also package them as part of 'make pacman-pkg'.
> Make them part of the '-debug' package, as they fit there best.
> This differs from the upstream package as that has no '-debug' variant.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Seems reasonable to me.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
> In my opinion the same would be useful for debian and rpm packages.
> Maybe we should have install-extmod-debug, similar to
> install-extmod-build, to centralize these.
> ---
>  scripts/package/PKGBUILD | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/package/PKGBUILD b/scripts/package/PKGBUILD
> index 452374d63c24..b1d0c8a9f030 100644
> --- a/scripts/package/PKGBUILD
> +++ b/scripts/package/PKGBUILD
> @@ -121,6 +121,9 @@ _package-debug(){
>  	install -Dt "${debugdir}" -m644 vmlinux
>  	mkdir -p "${builddir}"
>  	ln -sr "${debugdir}/vmlinux" "${builddir}/vmlinux"
> +
> +	echo "Installing unstripped vDSO(s)..."
> +	${MAKE} INSTALL_MOD_PATH="${pkgdir}/usr" vdso_install
>  }
>  
>  for _p in "${pkgname[@]}"; do
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260318-kbuild-pacman-vdso-install-1a81a947b27a
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <linux@weissschuh.net>
> 

