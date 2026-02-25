Return-Path: <linux-kbuild+bounces-11430-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0EFyHGlRn2k7aAQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11430-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 20:45:45 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D560319CE36
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 20:45:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F4B43102E0B
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Feb 2026 19:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE6BD3EF0B0;
	Wed, 25 Feb 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2a0jStC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2493EF0CD;
	Wed, 25 Feb 2026 19:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772048648; cv=none; b=XIYBFx8+nCjlEYtMzemmuwzKTr3fsRCVqmYEPpxOvTaMFgf+ICkCSs+6CBGQuIuCn5apUsBfL+3SQ3b0N0bIxhA0TTYYH9sQenzTwnxbLHiHJLclzmT1U1TNdJVooUFAPg+GBjoHYcvl8iCMi0DFTssNMDN8/usUuq6UBFVnM6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772048648; c=relaxed/simple;
	bh=YbjdPdPASyw/TkhJHb+Ft95l6T6T0wW83iVMryxo3qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l8KqYSQF+rZZun1FFWljg9lTwsBZveo3qBV87ILnjsBp35CAR/FrEPvnN7snsJ6+CkyFfhyhjw5aSV52s+B0jucjulAh71ooT2q9lIOSUolbVsCOf7iPT9vGPOnn/G9ivPmfI1ilE8o/qmYsZFcElzAAFOJK0p04CycIvRWZ914=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2a0jStC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D9CC19422;
	Wed, 25 Feb 2026 19:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772048648;
	bh=YbjdPdPASyw/TkhJHb+Ft95l6T6T0wW83iVMryxo3qc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2a0jStCfO6SEdegk9uhRnVBtRzQ+eTAT5EpdDHFchB0rC9hdt9qzcPZNAN3OSsb5
	 kWfy+U0tAo4HidZ7X6gD0GeSaV0wrYBM9B5Kt2rKOYc6RnXaOnpgsnWSXZ/68fikwr
	 cNJ2MTwtMuIJXCIAd2LSKjJRcRpIyIzbuW9zxz2fxTXFFxSzV6EWbw1wcNwrm2ocW9
	 cpNbVaHnJm7jchLNR2ZIYahzE8T3QbmsO6AVoBMmOz1vY2IS8n2n6AWKjyvsr30fUj
	 4qcUDyEhuaptbfcEvs8e8rp/K7h26YgTINFEL5M8NgXP2wq0x7ptMwRpDTpecnqxeD
	 zgGrLLmTPhCNg==
Date: Wed, 25 Feb 2026 12:44:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kconfig: fix potential NULL pointer dereference in
 conf_askvalue
Message-ID: <20260225194404.GD2755225@ax162>
References: <20260225072246.3475275-1-micro6947@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225072246.3475275-1-micro6947@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11430-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D560319CE36
X-Rspamd-Action: no action

On Wed, Feb 25, 2026 at 07:22:46AM +0000, Xingjing Deng wrote:
> In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_value)
> can be NULL. When the symbol is not changeable, the code calls
> printf("%s\n", def), which leads to a segmentation fault on certain
> systems/libc implementations when passing a NULL pointer to %s.

How do you reproduce this segmentation fault? Surely someone would have
hit this if it were a real problem given the Fixes tag? Or is this a
corner case?

> This patch adds a check to ensure 'def' is not NULL before printing.
> Additionally, it removes the redundant re-initialization of the 'line'
> buffer inside the !sym_is_changeable(sym) block, as it is already
> initialized at the beginning of the function.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Xingjing Deng <micro6947@gmail.com>
> ---
>  scripts/kconfig/conf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index a7b44cd8a..2771bc84e 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -297,9 +297,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>  	line[1] = 0;
>  
>  	if (!sym_is_changeable(sym)) {
> -		printf("%s\n", def);
> -		line[0] = '\n';
> -		line[1] = 0;
> +		printf("%s\n", def ? def : "");
>  		return 0;
>  	}
>  
> @@ -307,7 +305,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>  	case oldconfig:
>  	case syncconfig:
>  		if (sym_has_value(sym)) {
> -			printf("%s\n", def);
> +			printf("%s\n", def ? def : "");
>  			return 0;
>  		}
>  		/* fall through */
> -- 
> 2.25.1
> 

