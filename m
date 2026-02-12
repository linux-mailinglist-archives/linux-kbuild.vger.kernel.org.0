Return-Path: <linux-kbuild+bounces-11289-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ELn4H5zgjWnE8AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11289-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 15:15:56 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E964A12E316
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 15:15:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C491F3025F74
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 14:15:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C65C35C1B5;
	Thu, 12 Feb 2026 14:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kV2FfyLF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="SNTfS508"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E9135C195;
	Thu, 12 Feb 2026 14:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770905751; cv=none; b=had/W5Yz0W2FCPxefUuZGtpIrkrFVaDvUELTCa2jyxw32h9R23b55KMxAwLsW+WxRHmdTOQzxhKDGleqgmwTbpcBSm4pTJ5SR4NrKNJmLTrdiepThdbQmmoAnuAv7CIKjszVtQ4vDPhyNh+K+fhguRCTfFxutKb3aqR3vEdNPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770905751; c=relaxed/simple;
	bh=gnLi+fuwVc80Hws1ypjaoVAMN8fcMyt+Z9AHpTiifaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NOeyNvYXg1L99JQTsf+zJJECwaB0E+KCOocG0pAz10gj5iyJL4iot49zW2YxRWO90WWWPlGYem3LQEz4ZSm/vq3GFGejlWsm5NCzcqadeKzGhMH362axOIZlZzP1Az/qBdOK2HuKeFwHxij3rXFHkLuPQaJ7ZIFZ7x5Lqh1rQGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kV2FfyLF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=SNTfS508; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Date: Thu, 12 Feb 2026 15:15:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1770905748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGnSLeUOBXf3YTe9/pZ2XFDqnrXb22gN1IA8GUBKIF0=;
	b=kV2FfyLFvxzUiLxZIDc1rXhMa/q1NAgQ2IV2kRi4pyT5fik+nON9jQdF1uktTYjK8Ms5KV
	PTJiOobL1ocNJtgBHbvcnksAMgbs0rWAUIFIfoFzTqgWflDTtsiPEQKIuN9Syw8QeTOAo5
	gXkbt6VPh5n2Gwio4bavb2UyxIYvJJUokdf3ByllYPNBjUdaAhIjHqD+s3lVkTS9P6RTjU
	9IaSNdWuZ7FUBov43Ov4uALRLkgZLxXNm6AT5dcewZ+X9Jkdv8m7ToRrn6NZHNd0hTuKI9
	fshvIprrTjO4WOZNQMEsMS1+yVzfdr6pINkBi7ZTk0JiM9oSOlA/IPm+wD4lgA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1770905748;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGnSLeUOBXf3YTe9/pZ2XFDqnrXb22gN1IA8GUBKIF0=;
	b=SNTfS508eo039k6DAqLb+es3qExnFdWG1e+59if/uJ3H/cw+an400Lay/oIaGQxEiYHZEC
	3Q/txxZLR1t5gRAw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Fix CC_CAN_LINK detection
Message-ID: <20260212151347-6f19b408-f22b-4ecb-9ce5-bd4e01e06743@linutronix.de>
References: <20260212133544.1331437-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212133544.1331437-1-mic@digikod.net>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11289-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cc-can-link.sh:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,digikod.net:email,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: E964A12E316
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 02:35:43PM +0100, Mickaël Salaün wrote:
> Most samples cannot be build on some environments because they depend
> on CC_CAN_LINK, which is set according to the result of
> scripts/cc-can-link.sh called by cc_can_link_user.
> 
> Because cc-can-link.sh must now build without warning, it may fail
> because it is calling printf() with an empty string:
> 
>   + cat
>   + gcc -m32 -Werror -Wl,--fatal-warnings -x c - -o /dev/null
>   <stdin>: In function ‘main’:
>   <stdin>:4:9: error: zero-length gnu_printf format string [-Werror=format-zero-length]
>   cc1: all warnings being treated as errors
> 
> Fix this warning and the samples build by actually printing something.
> 
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Nicolas Schier <nsc@kernel.org>
> Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> Cc: stable@vger.kernel.org
> Fixes: d81d9d389b9b ("kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings")

Thanks!

Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

In my GCC 15.2 this warning is not enabled by default.

> Signed-off-by: Mickaël Salaün <mic@digikod.net>
> ---
>  scripts/cc-can-link.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
> index e67fd8d7b684..58dc7dd6d556 100755
> --- a/scripts/cc-can-link.sh
> +++ b/scripts/cc-can-link.sh
> @@ -5,7 +5,7 @@ cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>
>  #include <stdio.h>
>  int main(void)
>  {
> -	printf("");
> +	printf("\n");
>  	return 0;
>  }
>  END
> -- 
> 2.53.0
> 

