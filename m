Return-Path: <linux-kbuild+bounces-11604-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEULLeLeqWllGwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11604-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 20:52:02 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD46217CD3
	for <lists+linux-kbuild@lfdr.de>; Thu, 05 Mar 2026 20:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7ACC300B8DB
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Mar 2026 19:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A853DBD64;
	Thu,  5 Mar 2026 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iJ8gEbUO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06513093C3;
	Thu,  5 Mar 2026 19:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772740315; cv=none; b=tzefMbiI1XSAj83HgH/iKq3ktEYv32sVhW7o7P+sf8h2WYjf/K/4skDFlkAMHxFCXGSNsblld59Ps/QmQ02NBxciOCPXWl+uG1cOZU8PWIJJBh3QBEdoMRg5/S6dxkt6YKvQOi6WTqibN10HM/oEhmT5Ev4XNO+qf4v7SP7Rb0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772740315; c=relaxed/simple;
	bh=7W09A+ohX07cJSy8Hxn30U/LKuVZsBYUGMA9yHmoe5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HGajz1BGSln/u/WokcF27vj/PiQTF/TLdxSEteHnjeS2+1Lhwl0rLoOTgNOGkEZta4MQz+TLLvySmbdj3CyGNyNtcrf/7K6fBvdJrOKJKzo3Proh+uMmbyCdrkTiptSOz4ue+L8jrHJqVHFv6TJgMoE1C2GxzilXJOKNAcvAiqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iJ8gEbUO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12EA4C116C6;
	Thu,  5 Mar 2026 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772740315;
	bh=7W09A+ohX07cJSy8Hxn30U/LKuVZsBYUGMA9yHmoe5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ8gEbUOOu+VGriHoX/OEDw7th6JCggqYjIykwaznuUbLlAMGu8s3XzKPhNR/ET4B
	 WOI/6m1+93pzcetDZEgEB0biNrOjn7zQgtBioUipY/UW0f2ERdam3srDtImN6qFF41
	 usgT7AlFtgdhYQIwH/0B/qXkb7+oLXUwsS/jDkF6NYnetTcAAHnD7bl3RbW6kVTEfV
	 kGJOi1qxZT/BYGmyqP5FCELvXSJyznRuyI9yuazoHYTkQvhyWHvRd9S1CR8aM4m5gT
	 mC5GaiWn367L73PpWyDPDqTKdPo6rGxez2vt7sG0tW501ucobwmY3W1V49TDSx+ACR
	 YQeP5oCYQGKzg==
Date: Thu, 5 Mar 2026 12:51:51 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: nsc@kernel.org, rdunlap@infradead.org, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kconfig: fix potential NULL pointer dereference in
 conf_askvalue()
Message-ID: <20260305195151.GA1854004@ax162>
References: <20260301053035.1950087-1-micro6947@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301053035.1950087-1-micro6947@gmail.com>
X-Rspamd-Queue-Id: ABD46217CD3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11604-lists,linux-kbuild=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.997];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 01, 2026 at 05:30:35AM +0000, Xingjing Deng wrote:
> In conf_askvalue(), the 'def' argument (retrieved via sym_get_string_value)
> can be NULL. While current call sites ensure that 'def' is valid,
> calling printf("%s\n", def) is technically undefined behavior and could
> lead to a segmentation fault on certain libc implementations if the
> function were called with a NULL pointer in the future.
> 
> Improve the robustness of conf_askvalue() by providing an empty string
> as a fallback.
> 
> Additionally, remove the redundant re-initialization of the 'line'
> buffer inside the !sym_is_changeable(sym) block, as it is already
> properly initialized at the function entry.
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Xingjing Deng <micro6947@gmail.com>
> ---
> 
> v2:
> - Change commit message and use fewer characters in modify.
> - Link to v1: https://lore.kernel.org/all/20260225072246.3475275-1-micro6947@gmail.com/
> 
>  scripts/kconfig/conf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index a7b44cd8a..0d32183c5 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -297,9 +297,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>  	line[1] = 0;
>  
>  	if (!sym_is_changeable(sym)) {
> -		printf("%s\n", def);
> -		line[0] = '\n';
> -		line[1] = 0;
> +		printf("%s\n", def :? "");

As the kernel test robot pointed out, this should be ?:, not :?. Please
ensure you always test build your changes before sending them out,
especially scripts/kconfig since it runs so early in the build.

When sending a corrected v3, you can include:

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

>  		return 0;
>  	}
>  
> @@ -307,7 +305,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>  	case oldconfig:
>  	case syncconfig:
>  		if (sym_has_value(sym)) {
> -			printf("%s\n", def);
> +			printf("%s\n", def :? "");
>  			return 0;
>  		}
>  		/* fall through */
> -- 
> 2.25.1
> 

