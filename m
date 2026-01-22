Return-Path: <linux-kbuild+bounces-10820-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGqaK1JxcmlpkwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10820-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:49:54 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 241F16CB38
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 19:49:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 506FB300EC97
	for <lists+linux-kbuild@lfdr.de>; Thu, 22 Jan 2026 18:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9B6135504F;
	Thu, 22 Jan 2026 18:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gfu3gG1D"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6DFC3783B9;
	Thu, 22 Jan 2026 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769107785; cv=none; b=GAGot56hq0SMAGyvTP/rCwmOuC8JKycJMhIkhto5l5lPmuVAKDHJpjWw+1t7EKpM4ipoYh6SeE9mxQ6tjj1oxvJic8mU+Y9wc8MIdIKEPhVhtKGzclCxpIDc8nrEO1MRxPD+12gdHxf9emFG5ip3924HgZ7f2WJTVpwf4TtxDWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769107785; c=relaxed/simple;
	bh=H7QuZCrn4tR5FwT0/DlczGRo9ozAv1VxSVh46kzlChY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YicKBD0VEC1f6zkWFcgvsrEZB3TrJdKmr8WFTAQUPrv5FNMdNoV6RcNd0YKHHNY/1pcS9I0rOugNOZRqrf/umOIXVEpN0T2GjNfQWgrn1DIJ4swRZ3s8SlZ20Y2RnsT0Opct5sQykiFEot3v+jrdwXMFlkOO3mz6erCuhwdHJVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gfu3gG1D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 366CEC116C6;
	Thu, 22 Jan 2026 18:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769107784;
	bh=H7QuZCrn4tR5FwT0/DlczGRo9ozAv1VxSVh46kzlChY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gfu3gG1D6o2ZkaRj9rckKa6BzWKqC4xIeGu3+KLb82xGwffskzjQ36pbVHKBNfS2q
	 kHBKUueVCJBFcbRXXt36AAg0ERwqqgBEL9MEr87IHlz3iMTD10He+lBHg3vON0AAZh
	 +3Rq+1i9IVBEgUH9eitk8DtbivmS8QguhfMQkedyTMbfyxhzQIAuWjkRl7Jb6ilyMB
	 O+0qQ9VUXvFjdYGNn7cxNqhCJi7NQHuiqnxZVkfski+Arher0DOAb/pOy1kFqn8ot7
	 SnK6xhouJdlVBCLY+9Dd8Ufzsmc/xRvG5P8Fk0ffdkc42CW9TCGjVB2eJEI0e6+CbZ
	 +pD5uYq+ncdyg==
Date: Thu, 22 Jan 2026 11:49:39 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Guillaume Tucker <gtucker@gtucker.io>
Cc: Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	David Gow <davidgow@google.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	automated-testing@lists.yoctoproject.org, workflows@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH v4 1/2] scripts: add tool to run containerized builds
Message-ID: <20260122184939.GA3461196@ax162>
References: <cover.1769090419.git.gtucker@gtucker.io>
 <9b8da20157e409e8fa3134d2101678779e157256.1769090419.git.gtucker@gtucker.io>
 <20260122172928.1d922490@nimda>
 <611ce02f-2b48-4338-b37f-1df39e02da03@gtucker.io>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <611ce02f-2b48-4338-b37f-1df39e02da03@gtucker.io>
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-10820-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 241F16CB38
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 03:59:54PM +0100, Guillaume Tucker wrote:
> --- a/scripts/container
> +++ b/scripts/container
> @@ -120,7 +120,7 @@ class Runtimes:
>                  if not runtime.is_present():
>                      raise ValueError(f"runtime not found: {name}")
>                  return runtime
> -        raise ValueError(f"unknown runtime: {runtime}")
> +        raise ValueError(f"unknown runtime: {name}")
>  
>      @classmethod
>      def find(cls):
> 
> 
> Nathan, would you be OK with folding this in or should I send a v5?

I can fold that in, thanks.

I will carry forward Nicolas's ack and testing tags from v3, as this
revision is not substantially different from what he looked at and
tested.

Cheers,
Nathan

