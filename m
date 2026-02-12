Return-Path: <linux-kbuild+bounces-11290-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNpIGbnpjWnG8gAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11290-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 15:54:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8BA12EA49
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 15:54:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12DD23007C82
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Feb 2026 14:51:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C0F35502A;
	Thu, 12 Feb 2026 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="VfpmNuzq"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D794235CB94;
	Thu, 12 Feb 2026 14:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770907876; cv=none; b=Q9s5JjvZTO5hkYfs4gTr7GHlQ50TZ1j8AgMSCVmCjb7qhNNbqLFm1foX9eaxyM9G7T8uhKaiZsXsMqhUYAZUMse+EyorQkHMyA5076sjbDy83e5+SFvjgIlesMy95lfPvGmPmhkuhTKo5Q7fQrEy0s5A9ChCz7Ah8+Gc5jgvKN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770907876; c=relaxed/simple;
	bh=yV+qGryzCv5LdVIdZObnyl+TqBvoZRBq/s7BwmvEucY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aC9TplW4pdyZI9HxgFHfTapBaXSFA5VC0jtznykjxIHw5v60dmIV6DeqX3nEF4iLYrM6QoAHYqasJujDW7Cwhem3/fUJghonwjUKwBDF57fpi/yToBHb0kfrj3p6c9DsHjbuEsFyzsSiz/PNju1tdlEzl22yGhFJ896xsLgzP/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=VfpmNuzq; arc=none smtp.client-ip=84.16.66.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fBdXR4dDGzgQh;
	Thu, 12 Feb 2026 15:51:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1770907863;
	bh=CO1ZykXZY4zJvGlWonzeMkNhR0m/da9fetsI6SBQSIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VfpmNuzqAWs6ximhaxzWPLghgTTt/0jeQoJ5VFh4I6Wqum0fpHt7KXCz9agYPU1bP
	 SKHhpuNDMKkzd36eJwjcudqnYF9xhOC+TviDKsq3NM+vHPLU8FE5TKnjNezHKtz4QS
	 +fNkjznu5n3wuLwkBU9FjHnZwonM27gCyHvN3TKE=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4fBdXR0RTCzy0n;
	Thu, 12 Feb 2026 15:51:02 +0100 (CET)
Date: Thu, 12 Feb 2026 15:50:58 +0100
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@cloudflare.com, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v1] kbuild: Fix CC_CAN_LINK detection
Message-ID: <20260212.Eich4Liesaiv@digikod.net>
References: <20260212133544.1331437-1-mic@digikod.net>
 <20260212151347-6f19b408-f22b-4ecb-9ce5-bd4e01e06743@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260212151347-6f19b408-f22b-4ecb-9ce5-bd4e01e06743@linutronix.de>
X-Infomaniak-Routing: alpha
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	R_MIXED_CHARSET(1.00)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[digikod.net:s=20191114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[digikod.net:+];
	TAGGED_FROM(0.00)[bounces-11290-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[digikod.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mic@digikod.net,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BF8BA12EA49
X-Rspamd-Action: no action

On Thu, Feb 12, 2026 at 03:15:47PM +0100, Thomas Weißschuh wrote:
> On Thu, Feb 12, 2026 at 02:35:43PM +0100, Mickaël Salaün wrote:
> > Most samples cannot be build on some environments because they depend
> > on CC_CAN_LINK, which is set according to the result of
> > scripts/cc-can-link.sh called by cc_can_link_user.
> > 
> > Because cc-can-link.sh must now build without warning, it may fail
> > because it is calling printf() with an empty string:
> > 
> >   + cat
> >   + gcc -m32 -Werror -Wl,--fatal-warnings -x c - -o /dev/null
> >   <stdin>: In function ‘main’:
> >   <stdin>:4:9: error: zero-length gnu_printf format string [-Werror=format-zero-length]
> >   cc1: all warnings being treated as errors
> > 
> > Fix this warning and the samples build by actually printing something.
> > 
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nicolas Schier <nsc@kernel.org>
> > Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> > Cc: stable@vger.kernel.org
> > Fixes: d81d9d389b9b ("kbuild: don't enable CC_CAN_LINK if the dummy program generates warnings")
> 
> Thanks!
> 
> Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 
> In my GCC 15.2 this warning is not enabled by default.

Some for me, but it is the case with GCC 13.3.0 on Ubuntu 24 LTS.

> 
> > Signed-off-by: Mickaël Salaün <mic@digikod.net>
> > ---
> >  scripts/cc-can-link.sh | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/cc-can-link.sh b/scripts/cc-can-link.sh
> > index e67fd8d7b684..58dc7dd6d556 100755
> > --- a/scripts/cc-can-link.sh
> > +++ b/scripts/cc-can-link.sh
> > @@ -5,7 +5,7 @@ cat << "END" | $@ -Werror -Wl,--fatal-warnings -x c - -o /dev/null >/dev/null 2>
> >  #include <stdio.h>
> >  int main(void)
> >  {
> > -	printf("");
> > +	printf("\n");
> >  	return 0;
> >  }
> >  END
> > -- 
> > 2.53.0
> > 

