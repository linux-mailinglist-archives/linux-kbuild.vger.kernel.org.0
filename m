Return-Path: <linux-kbuild+bounces-11013-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANrbDResgmnYXwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11013-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 03:16:55 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F985E0C09
	for <lists+linux-kbuild@lfdr.de>; Wed, 04 Feb 2026 03:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F0393101D9B
	for <lists+linux-kbuild@lfdr.de>; Wed,  4 Feb 2026 02:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58339258CD0;
	Wed,  4 Feb 2026 02:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TdifOlrW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35086255F28;
	Wed,  4 Feb 2026 02:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171370; cv=none; b=VTT6Ye+mNVAM96HmmcRh1qXyRY+NSytbIBbkaG5OEDzrvWgAgRn05FGfrlJBbP/r4VKgcYuyYVaUAN04mjI9mIxZPbG2TVZV6m4vsZXuyErAfzuVl3CJAHJbd3C3GBedLKXqcaDAtYBY4XAW9RK8OY8Mh3yijs3KSDQtvh8urTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171370; c=relaxed/simple;
	bh=k05it80A5QQtU7WiSTvezYPHumnS066xeliAPSbMls0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4uzuPqUG5mcE+8oPsrXSL3ShuiNm1rB/VJc5+qmW4yErsI58lXq5LTrAOivqJ+skgVVtp22Uct13p2nAtprc+4aX2N30TjZpP95KKyOmLxzENa97cVKvBv3QinQYopIBiQDyndX84QAlaUwJvMR+IhCSiaTEonX4DqPqO85FbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TdifOlrW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EFB0C19425;
	Wed,  4 Feb 2026 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770171369;
	bh=k05it80A5QQtU7WiSTvezYPHumnS066xeliAPSbMls0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TdifOlrWcMimhvAbKblfc1buFYuNDf0ElelYKGPVxMeuCCf1DUtkCxeXNOnS6Wf/a
	 8QX9ycJjk6sXw2X+iwYlj4mYQ0EaOm8HMTlh1mR+vIZXHWBUDdYITZ6nvneIbnk8jq
	 ev90fGgL66ISO0Et405YmCSspxjATktIm8XYE8U08ERobxTYr6jtxDf9MINn/Y3mcG
	 dUrO+pV/Zd2RXfi2UJIIatK4eJ0nwsqfSIV80uMt9mlEDvtnh7aVBVXEEsz74MxnUM
	 n69UGKgi3pdnJMuvbvHNciQhLcteOSGX60SUSEmp5oeTvBux75+jJnab6HfnbT1Wpr
	 NnTC41zIZO91Q==
Date: Tue, 3 Feb 2026 19:16:03 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Nicolas Schier <nsc@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
	WangYuli <wangyuli@uniontech.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	James Le Cuirot <chewi@gentoo.org>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>,
	Rong Zhang <i@rong.moe>, Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] kbuild: install-extmod-build: do not exclude
 scripts/dtc/libfdt/
Message-ID: <20260204021603.GA2646832@ax162>
References: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201130259.2906768-1-zhengxingda@iscas.ac.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11013-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,aosc.io,uniontech.com,gmail.com,gentoo.org,vger.kernel.org,icenowy.me,rong.moe];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 8F985E0C09
X-Rspamd-Action: no action

+ Rob, Saravana, and devicetree@ since this concerns files they own.

On Sun, Feb 01, 2026 at 09:02:59PM +0800, Icenowy Zheng wrote:
> There exists a header file in include/linux/ called libfdt.h that is
> just a wrapper for libfdt header file in scripts/dtc/libfdt/. This makes
> the headers inside libfdt copy at scripts/dtc/libfdt/ part of the kernel
> headers for building external modules.
> 
> Do not exclude them, otherwise modules that include <linux/libfdt.h>
> will fail to build externally.
> 
> Fixes: aaed5c7739be ("kbuild: slim down package for building external modules")
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>

This does indeed bring back scripts/dtc/libfdt back into the headers
package that I examined. However, how does including libfdt.h in an
external module actually work, even with this change? libfdt appears to
be built into vmlinux IIUC and I do not see any EXPORT_SYMBOLs in the
list, so how can you actually use any of the functions from libfdt
within the module? Would you just build and link the pieces that your
module needs using the other source files?

> ---
>  scripts/package/install-extmod-build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/package/install-extmod-build b/scripts/package/install-extmod-build
> index 2576cf7902dbb..d1e448d7f59f6 100755
> --- a/scripts/package/install-extmod-build
> +++ b/scripts/package/install-extmod-build
> @@ -11,7 +11,8 @@ is_enabled() {
>  
>  find_in_scripts() {
>  	find scripts \
> -		\( -name atomic -o -name dtc -o -name kconfig -o -name package \) -prune -o \
> +		\( -name atomic -o -name kconfig -o -name package -o \
> +		   \( -path '*/dtc/*' -a ! -path '*/libfdt*' \) \) -prune -o \
>  		! -name unifdef -a ! -name mk_elfconfig -a \( -type f -o -type l \) -print
>  }
>  
> -- 
> 2.52.0
> 

