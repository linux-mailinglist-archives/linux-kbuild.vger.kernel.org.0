Return-Path: <linux-kbuild+bounces-13561-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PBSHCDvXIGqN8QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13561-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 03:39:07 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE6C63C3ED
	for <lists+linux-kbuild@lfdr.de>; Thu, 04 Jun 2026 03:39:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="MOmr+S/Y";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13561-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13561-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 678F43032393
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2026 01:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15AD231A41;
	Thu,  4 Jun 2026 01:39:03 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5291A23A4;
	Thu,  4 Jun 2026 01:39:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780537143; cv=none; b=nkTTAfJj8LY0TMUx863TAeDOiYQ2o7HAJknVqsEf+40kjJbemCq0DwjqUt76fQdlPP5wbkTSiSztqC9jr0n7X3WDIHnTBuFfv8vWlTt7fFjv1nERzk7hfJbomCf/snVEudJ62ZhI1KPBVVIGILm4k36U+JaAXJtAmZwq9vldDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780537143; c=relaxed/simple;
	bh=yV/JJdpa6qXppT2A/ug+4tuKEXgsr2xLch+NYLJ+oSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFBYnLGOHxDmRoWfdveHi6fKU2/hbh8lO2mh1Pv25tv+a/1MqPMR9UsfOewoSdYYREMixH6y/SXwdJEAnhpv0YHYNxvqKqTfzGCCEasn1N+tm0MFjeGLap+BuxiMA96MU4zFJt8SZGD5ssVPlb6rl+EVSMUsepOLtJe9Kb/mQMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOmr+S/Y; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5FC1F00893;
	Thu,  4 Jun 2026 01:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780537142;
	bh=IZw0K0bHm5ejuSHeQOXxvgGqny5jZkqa+3fe/JwHvw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MOmr+S/Y0d5A67ggQk31HxrPMIg/S6cWKyunWylF6vu1N1VqgwXuuTWY/zE/+v66E
	 s3Tmp1fcYhDCT0jSFkbutK60FxL2wHOUeF0ZvxkONSt0kAuWaSHUn3rj9nurOyRTnb
	 ojSfVAvCx7RD8NjKDIzmwuULzmoiB5D3rJytp6LjEqD8oEyiQb5E7GsU7UnWpzXUYi
	 uhMnuZi3Gon7gbPsACTaRYSMSjjZk2rlUT3YBu0ihP2b9cggRI+GVXHGGt5QDESy6B
	 7RxMerEnvwL+2pYX9fesAwcINNzMUGG63ygM4spgs6fy6o7PABCvnyczNXXuOQoV4c
	 XHV3g2fhvHJ4w==
Date: Wed, 3 Jun 2026 18:38:58 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Wentao Guan <guanwentao@uniontech.com>
Cc: nsc@kernel.org, tamird@kernel.org, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, petr.pavlu@suse.com
Subject: Re: [PATCH] kbuild: try readelf first in gen_symversions
Message-ID: <20260604013858.GB1329739@ax162>
References: <20260603161732.52477-1-guanwentao@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603161732.52477-1-guanwentao@uniontech.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:guanwentao@uniontech.com,m:nsc@kernel.org,m:tamird@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:petr.pavlu@suse.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13561-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7CE6C63C3ED

On Thu, Jun 04, 2026 at 12:17:32AM +0800, Wentao Guan wrote:
> Use readelf to dig out if <file>.o contain a __export_symbol_*.
> 
> Instead of nm, readelf is more faster, and significantly improve speed
> when enable CONFIG_MODVERSIONS.
> 
> Build x86_64_defconfigs in 2C4T cloud server with CONFIG_MODVERSIONS=y:
> With patch:
> real    17m21.019s
> user    61m48.388s
> sys     4m27.709s
> Without patch:
> real    17m39.435s
> user    62m24.686s
> sys     5m3.200s
> 
> Link: https://lore.kernel.org/all/tencent_2FA16E0A18D6D0C0703F5D49@qq.com/
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---
>  scripts/Makefile.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3498d25b15e85..54a91bc144cce 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -233,7 +233,7 @@ ifdef CONFIG_MODVERSIONS
>  #   be compiled and linked to the kernel and/or modules.
>  
>  gen_symversions =								\
> -	if $(NM) $@ 2>/dev/null | grep -q ' __export_symbol_'; then		\
> +	if $(READELF) -sW $@ 2>/dev/null | grep -q ' __export_symbol_'; then		\

This breaks modversioning for Clang LTO builds, as llvm-nm can read LLVM
bitcode but llvm-readelf cannot, it expects strictly ELF.

Is there any performance gain with adding '-m1' to the grep command so
that it stops looking for a match after the first export symbol is
found?

>  		$(cmd_gensymtypes_$1) >> $(dot-target).cmd;			\
>  	fi
>  
> -- 
> 2.30.2
> 

-- 
Cheers,
Nathan

