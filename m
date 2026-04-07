Return-Path: <linux-kbuild+bounces-12719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IjOOpNn1Wm05gcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12719-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 22:22:43 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9593B4835
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Apr 2026 22:22:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 95E45303719E
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Apr 2026 20:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5D14377ECE;
	Tue,  7 Apr 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EzB5+OCt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3573372B38
	for <linux-kbuild@vger.kernel.org>; Tue,  7 Apr 2026 20:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775593254; cv=none; b=AYyDLAspFZECBCI1h38D/su/lDct/k6X37nCegyszNFGb0oYOHMRruSmuu56KbL10v8ppoSIzBTDqm7HuaBnvaBAvp4anC4Vol0DfcZENAR4kYav+lClzA2MVigmYg9j0uCaLOAtZB2pVY3fmkI1jFQjZ4Bdy4emTkySV1zJRL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775593254; c=relaxed/simple;
	bh=/S7bmEQOah3HsW7h0oylmhMt2tbAb3oDYh/9HYGk7lE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQ+/PyThpcIt+DgQyHLElnYjTvr3zGwkfcXNEASmadmHXZ5DeM9u3hbAI2LMKuqpkSJpJ3CaG30X9aBNxe+8ixZUA9VeO/Euhxi5l0QUZIJUJ8hPRkwC6pMPIgyae6oNs1fMqmq7CMio8vOdh8MPbhPziVRy1Msr3QnHXZ1dQjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EzB5+OCt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDC8C116C6;
	Tue,  7 Apr 2026 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775593254;
	bh=/S7bmEQOah3HsW7h0oylmhMt2tbAb3oDYh/9HYGk7lE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EzB5+OCtr+nzUGt0j+5rFeg7vuVZ+gQRSQDXneOZZ+d8N3oz0x98S3kF+mo/oEu+p
	 A8EtLo5uoTxAv5QbKlAGc4X92hs2ZKl4enOfovr57+AnZ6Lgp4pVYCo6QQ+VBPEM+R
	 gTpC9Q2u9+MFJNxaXtB6IVHYTUE44lLQ9xdZE5oQdJMPN70E7aMGrLhRdmncBRD8p5
	 08Qq6LHXzEtcIcmj36repij1m8Nxl4nIwuKwLtwKvuxcn2+IreALcznTJe3q2u5s6y
	 lwR0GEBoyKxjAJjKTJdt79Yi0OJXzpqxzjldLMBS5SMpDQ0n92QvZKdXmhq+THyW8M
	 7Daecby8NRvZg==
Date: Tue, 7 Apr 2026 22:20:37 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Mathias Krause <minipli@grsecurity.net>
Cc: Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: builddeb - avoid recompiles for
 non-cross-compiles
Message-ID: <adVnFdusbO_2nIEP@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Mathias Krause <minipli@grsecurity.net>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12719-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,grsecurity.net:email]
X-Rspamd-Queue-Id: 0B9593B4835
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

Thanks!

Reviewed-by: Nicolas Schier <nsc@kernel.org>

-- 
Nicolas

