Return-Path: <linux-kbuild+bounces-12723-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBh7FhrT1mn8IwgAu9opvQ
	(envelope-from <linux-kbuild+bounces-12723-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 00:13:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CC21B3C44CA
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Apr 2026 00:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 732D730414BD
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Apr 2026 22:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A7738E5CE;
	Wed,  8 Apr 2026 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dQhgE2Uj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D19388385
	for <linux-kbuild@vger.kernel.org>; Wed,  8 Apr 2026 22:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686385; cv=none; b=rOBAqdk5hRYibF6+FhCzZofgpGm0G5pEY16M2S4L7KYqNJ+IsshJOI2zR7FDkwc3ZxQmD9kHqTp36zTADArlcJHzminY/IuzAjg6yuGLWSdXvwJa9wL7sborjADGlFRXa+u7o1Meb+O4+XeVwsP0+excKzKgYt456NQefJpvYEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686385; c=relaxed/simple;
	bh=wt3d4Bh1PVHLxneK+AbY6vYBMXYKMDwSXyHRytWdXlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjVlL6WWZMdrqQnK9IK3L1aJ0BQlh3HNahBw4xhhebhjVvFn5c2KGuBDezoSQ7xUhnwPdXJxd9S9V7u5TQUGUO8Ijnim4+srguIjxbg2qWeYr0D6rFPar1/c0uygQ7HsawZY9eOOwRnbk142fGTlu/XQp59V2EtHfwxjdoiqnlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dQhgE2Uj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3601BC19421;
	Wed,  8 Apr 2026 22:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686385;
	bh=wt3d4Bh1PVHLxneK+AbY6vYBMXYKMDwSXyHRytWdXlw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dQhgE2Ujo/KCh1/oeS6eTVWMmD/o98rhcCjHQFNpGLOx0ZdjxYtddfkpsp1vbkpe9
	 FbZ+S6nRr5d8Zo6PoM5P6JeX48MfnvatQyIfNUenNBbQE89irJz0enGNi6qNwXYvpS
	 Jqm2nM6tStW1I6RuTX0AmOQf2/UCHigz+xEuH2RjsCuEFqjul4drsfp03pKqKyOeMw
	 0Hg17xPG8epV5en/zMN3zb3EHE7LAMnV+lp3GpphNchYsLaEGMmUDPLiDM+sH7a6eq
	 bGP3FqkHSf6KzisQObCF/WkrQgn8uXvhGMpOSmYLBE6ogTDsfC8/or4BLK8xpI4/er
	 tmu0YSgKX18Gg==
Date: Wed, 8 Apr 2026 15:13:01 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mathias Krause <minipli@grsecurity.net>
Cc: Nicolas Schier <nsc@kernel.org>, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: builddeb - avoid recompiles for
 non-cross-compiles
Message-ID: <20260408221301.GB3963285@ax162>
References: <20260402145116.1010901-1-minipli@grsecurity.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402145116.1010901-1-minipli@grsecurity.net>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12723-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,grsecurity.net:email]
X-Rspamd-Queue-Id: CC21B3C44CA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 02, 2026 at 04:51:16PM +0200, Mathias Krause wrote:
> Commit e2c318225ac1 ("kbuild: deb-pkg: add
> pkg.linux-upstream.nokernelheaders build profile") changed how
> install-extmod-build gets called, making it always rebuild the host
> programs below scripts/ if HOSTCC wasn't specified with its full triplet
> on the make command line. That is, apparently, needed to fix up commit
> f1d87664b82a ("kbuild: cross-compile linux-headers package when
> possible") for cross-compiles. However, in the much more common case of
> non-cross-compile builds this will lead to unnecessary rebuilding of
> host tools including gcc plugins. This, in turn, will lead to a full
> kernel rebuild on the next 'make bindeb-pkg' which is unfortunate.
> 
> Avoid that by only triggering the rebuild of host tools for actual
> cross-compile builds.
> 
> Signed-off-by: Mathias Krause <minipli@grsecurity.net>
> Fixes: e2c318225ac1 ("kbuild: deb-pkg: add pkg.linux-upstream.nokernelheaders build profile")
> Cc: Masahiro Yamada <masahiroy@kernel.org>

Yeah, this seems like a reasonable workaround. I think this also helps
avoid some weirdness I have noticed when building Debian packages with
LLVM (as CC becomes gcc, always triggering the same logic since HOSTCC
will be clang).

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  scripts/package/builddeb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 3627ca227e5a..ba1defc61652 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -139,7 +139,13 @@ install_kernel_headers () {
>  	pdir=debian/$1
>  	version=${1#linux-headers-}
>  
> -	CC="${DEB_HOST_GNU_TYPE}-gcc" "${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
> +	# Override $CC only for cross-compiles, to not unnecessarily rebuild
> +	# scripts/ including plugins, which may lead to a full kernel rebuild.
> +	if [ -n "${CROSS_COMPILE}" ]; then
> +		CC="${DEB_HOST_GNU_TYPE}-gcc" "${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
> +	else
> +		"${srctree}/scripts/package/install-extmod-build" "${pdir}/usr/src/linux-headers-${version}"
> +	fi
>  
>  	mkdir -p $pdir/lib/modules/$version/
>  	ln -s /usr/src/linux-headers-$version $pdir/lib/modules/$version/build
> -- 
> 2.47.3
> 

