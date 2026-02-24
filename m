Return-Path: <linux-kbuild+bounces-11391-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2CndG5w+nWlUNwQAu9opvQ
	(envelope-from <linux-kbuild+bounces-11391-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 07:01:00 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE8F182401
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 07:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BED733004DBC
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Feb 2026 06:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8791226FA77;
	Tue, 24 Feb 2026 06:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyF8fIf5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CA7A932;
	Tue, 24 Feb 2026 06:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771912853; cv=none; b=YLgAYzjEC6SyPZ7NMURUuOmPaGIXemT5coZuKRBJoxlzysWfOcpv8AfJls01fEbgNRSGK/dRN99xeHT38fUnVnxKAewL4YDw4pckdOdQ94x7eZyco/hTuLRdAzt4gDb+dYLmxUSkQfp9eVRrbmJNkE45bv/VgCrroFmX5qNDcNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771912853; c=relaxed/simple;
	bh=UJq0Klf/5cbYB+m1+lT11mzSOn2Ff4OI162uO5zQi0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DquEXbXfKtQJMKouvb6+bR9zWQzdIPOh8pMa9skztQut6GKrw9p1sVjY5zc5liNSqQoJ21k7NXAW4sF0ozbxwQv5LafbiXVUvdI1ldEmonfe7M8udeyeRlkg5CwD6B8RWZ0CCTt2F0+X4CNItm7N7RGHtKODkeDQeGPTJSt1axY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyF8fIf5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAE3EC116D0;
	Tue, 24 Feb 2026 06:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771912852;
	bh=UJq0Klf/5cbYB+m1+lT11mzSOn2Ff4OI162uO5zQi0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyF8fIf5QYlPSpbh+eeNFi7qHhlOtvJxcWan8eay0BdUifzSGINV0b08i8yAT5i+/
	 BflyefWxg6S5zas459q2TW3w2e0yd/3v7FvweP1KAt9QwBoFOHU3YJ00qYYfi14z2u
	 PjxWsNifTVXigR/bAPIUIY4E+OlLfJ9ynUNlMhWGSDdspsLop+QjXlfWt9yDfbIPW7
	 OIUW3rqjtUjvA7dYaQFVySQ3J0kETTiq3QMUZX6ZDsMjS+/pNEexZ0Hx54HTGR0nf2
	 BJYSVtvXzswAscKxkZW+inqYFYDCHMvR+rzjXdiR506c0Zqip82iCYPvj7rYCFv3+J
	 eHTNf/DOgzRng==
Date: Mon, 23 Feb 2026 23:00:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] kconfig: Error out on duplicated kconfig inclusion
Message-ID: <20260224060049.GA588195@ax162>
References: <20260220-kconfig-error-out-on-duplicated-inclusion-v1-1-be78aa241a53@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220-kconfig-error-out-on-duplicated-inclusion-v1-1-be78aa241a53@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11391-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,linux-foundation.org:email]
X-Rspamd-Queue-Id: 8BE8F182401
X-Rspamd-Action: no action

Hi Nicolas,

On Fri, Feb 20, 2026 at 07:55:19PM +0100, Nicolas Schier wrote:
> Let kconfig exit with error on duplicated Kconfig file inclusion.
> 
> Repeated inclusion of Kbuild files are considered bad-practise with
> regard to maintenance; and Kconfig language is rich enough that there
> should be no need for that.
> 
> If repeated inclusion of Kconfig files is detected, error out with
> messages like:
> 
>     Kconfig.inc1:4: error: Repeated inclusion of Kconfig.inc3
>     Kconfig.inc2:3: note: Location of first inclusion of Kconfig.inc3
> 
> While commit f094f8a1b273 ("kconfig: allow multiple inclusion of the
> same file") introduced detection of recursive inclusions of Kconfig
> files, it explicitly allowed repeated inclusions, unfortunately w/o
> reasoning.
> 
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/all/CAHk-=wj03hLzK2D=+OYmjgcmGM+XYymp8GyaEs=C0=rXG2nb7w@mail.gmail.com/
> Signed-off-by: Nicolas Schier <nsc@kernel.org>

Nice! That was quite simple in terms of actual implementation and I like
the tests :) I verified that there are errors from the drm/Kconfig state
at ca4ee40bf13d^:

  drivers/gpu/drm/Kconfig:427: error: Repeated inclusion of drivers/gpu/drm/adp/Kconfig
  drivers/gpu/drm/Kconfig:385: note: Location of first inclusion of drivers/gpu/drm/adp/Kconfig

and that testconfig passes for me locally.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
> index 5cdcee144b58126dcfab50fd709be9fc40e99423..1b69dd9e1872a0671a70e24b45a30e449dd2c75e 100644
> --- a/scripts/kconfig/util.c
> +++ b/scripts/kconfig/util.c
> @@ -18,25 +18,50 @@ static HASHTABLE_DEFINE(file_hashtable, 1U << 11);
...
> +static void die_duplicated_include(struct file *file,
> +				   const char *parent, int lineno)
> +{
> +	fprintf(stderr,
> +		"%s:%d: error: Repeated inclusion of %s\n"
> +		"%s:%d: note: Location of first inclusion of %s\n",

I think for visual consistency with compiler warnings/errors and the
rest of scripts/kconfig, Repeated and Location should be lowercased in
these prints.

> +		parent, lineno, file->name,
> +		file->parent.name, file->parent.lineno, file->name);
> +	exit(1);

Cheers,
Nathan

