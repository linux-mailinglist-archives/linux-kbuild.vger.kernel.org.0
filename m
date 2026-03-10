Return-Path: <linux-kbuild+bounces-11750-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IK4FOwVxr2m6YQIAu9opvQ
	(envelope-from <linux-kbuild+bounces-11750-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:16:53 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BA824371B
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 02:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E796D3005323
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2026 01:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89A4924679F;
	Tue, 10 Mar 2026 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Txk+agfY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66689261B80
	for <linux-kbuild@vger.kernel.org>; Tue, 10 Mar 2026 01:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105129; cv=none; b=aIWZQRumR2QwL8/mxAElRGJvP/85QwsqnGbiY+pWHsja6N7dRaTkCAD5avHJE69kOwK3nWNKorGWqckdOWffIBZHR6CLe2jc/tR8vyOmZv8XHQL4KuzoJBJJkP8rNrgiDMdACq0OuCf48iKBy2XcF/GgHdC/crhiQme+iCpNOis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105129; c=relaxed/simple;
	bh=phN9QlemIaJnNbvAIRRrvjhEKXmWsSujEYWyXFpxEbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czkdx0CVmfE0vc6xfTTr9pKdM64KMfZYGYKHtXi/35drxZsBtHI4o+oc1XMKLxtMJqzygRBppXhLUxuAsbC/LJI+ggYSxpyJdlZfhXC5LhO2bZDnGa+mMMMMz7AmPAOXxRDqPxNVPz03/aGG9lv37TBbULZW0qnezc+s5tTmnKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Txk+agfY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CAB2C4CEF7;
	Tue, 10 Mar 2026 01:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773105129;
	bh=phN9QlemIaJnNbvAIRRrvjhEKXmWsSujEYWyXFpxEbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Txk+agfYCXOzh7CCi43plECqT8vogavDJpd7B3MnqORnCZSiq3SL8cHThiAQwzbCx
	 +4vIm+etbVEmvta+kXvpUGfPv04WBUS7bZy19zI+yKavqXqJYtek/AsKiea4gnWS6p
	 WFNmgK0xnbvXdR0wbf6cULigtHkSrJFa/fQNsiogMq5aRUA8woHCJHGdpOqaRD6sLr
	 3/TAP2redAMh7XrPYav3rk+m0W8iHQoiYDtuxpzcM4nos1NjwcVFbIwR6N69xLXrvH
	 qych88VjcxlxGqBQw6KlSOWHbFeNvcikcz8jZA3n/vJjzGcrglWdIAYPAM0yHr/4aW
	 E0EPb3y9PYyqQ==
Date: Mon, 9 Mar 2026 18:12:04 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Dodji Seketeli <dodji@seketeli.org>, John Moon <john@jmoon.dev>,
	Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	libabigail@sourceware.org
Subject: Re: [PATCH 0/3] check-uapi: improve portability for testing headers
Message-ID: <20260310011204.GA2407733@ax162>
References: <20260306163309.2015837-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260306163309.2015837-1-arnd@kernel.org>
X-Rspamd-Queue-Id: E7BA824371B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11750-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Action: no action

On Fri, Mar 06, 2026 at 05:33:06PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> While working on a series to clean up some uapi headers, I needed
> to check the that the actual ABI remains unchanged. I found that
> scripts/check-uapi.sh works well enough for architectures that have a
> full toolchain installed, but not with the nolibc compilers I provide
> on kernel.org.
> 
> I ended up with a series addressing three separate issues here, but in
> the end I can now validate ABI changes across all supported architectures
> and ABIs.
> 
> The third patch depends on a series from Thomas Weißschuh that was
> just merged into the kbuild-for-next tree, the other ones could
> also apply to older kernels. I have marked the second patch for
> backports to stable kernels, this one is what caused me the most
> work in debugging.
> 
>     Arnd
> 
> Arnd Bergmann (3):
>   check-uapi: link into shared objects
>   check-uapi: honor ${CROSS_COMPILE} setting
>   check-uapi: use dummy libc includes

Acked-by: Nathan Chancellor <nathan@kernel.org>

I assume that the shared objects change does not impact catching ABI
differences?

Cheers,
Nathan

