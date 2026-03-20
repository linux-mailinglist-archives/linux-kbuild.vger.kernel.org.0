Return-Path: <linux-kbuild+bounces-12107-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0W2cMtGwvWlBAgMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12107-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:40:49 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BC27F2E0E93
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:40:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 85663300C7D8
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 20:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC7C35D5FC;
	Fri, 20 Mar 2026 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pW3O9noj"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3FC35836B
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 20:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774039242; cv=none; b=gJZGzM7MUU3ODQl4fkr/FysfjBo4ScKqpLvuzZbCwuVeppy/aD0j1dLCJS14XRV8QQug7ebvjvG0QOl4YTEi4zU8wld9IQ10W7ZjXxctUmbC5cxWcXfCoRoy265ZxN0birmtyw9G3t73FR+2XKy+IYJBzanmS0QoM+28MwQ6KHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774039242; c=relaxed/simple;
	bh=ekqs+TmTe+SyFKtIgBgFiAiG3O2Mg7k7tK/rGkg6dzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NulTH62eu7tUmv2BoSPfteZV1r/fDvH3hLQRMWrork/hqKjYMwP9yz9kGqbIkQ0TzDo7+hQvgS0rS0zqzLp5vmSo9jxyMXlyOYWRVTImY13khtDimKNMEwZR47pNj6yb/WyFStn4y9U7/hZutEtKBHnUxFq07R6aow8cW5rbnTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pW3O9noj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83933C4CEF7;
	Fri, 20 Mar 2026 20:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774039241;
	bh=ekqs+TmTe+SyFKtIgBgFiAiG3O2Mg7k7tK/rGkg6dzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pW3O9noj4marA6qS08lE5Au80lqs7r96zIq2nHT45i2f4KUGW49jRX+kXh5YCI6VW
	 urPFDYE25X4mZICQglRPKvQoGBM4/R7yVfGxpDQThBbpjyTPiuAmOK/OWx41xWmPXd
	 ekvqLwYN9xTaPkHt+p3ger5t5Wws9d+Gsy6eI+yCUH0S4KpjczZD5whsp0eicJtbmu
	 vMNLWkdo+Au6B4JbCFeuOIescm1qx4Ky+16fBLIlga6FHupR8VlvXs8oBLW8s0S05u
	 dNdSfL80nNZ6LBnOSpHCI9DreL+HK3ATCojUHsOUCO4maXZgDLYFDLqSPGr2nAvcqw
	 mK/YXfe4XNASg==
Date: Fri, 20 Mar 2026 21:39:27 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	linux-kbuild@vger.kernel.org, Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>, Nathan Chancellor <nathan@kernel.org>,
	libabigail@sourceware.org
Subject: Re: [PATCH 3/3] check-uapi: use dummy libc includes
Message-ID: <ab2wf1_j0ANjqxKY@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
	linux-kbuild@vger.kernel.org, Dodji Seketeli <dodji@seketeli.org>,
	John Moon <john@jmoon.dev>, Nathan Chancellor <nathan@kernel.org>,
	libabigail@sourceware.org
References: <20260306163309.2015837-1-arnd@kernel.org>
 <20260306163309.2015837-4-arnd@kernel.org>
 <6a93d709-2d69-4cd5-9854-18910fa69af2@t-8ch.de>
 <05fdccd7-4027-4c97-a701-a1d3019a4420@app.fastmail.com>
 <0a2464d4-37b9-4b73-b29b-3802f096d343@t-8ch.de>
 <ab2qRWp2asMzQuWK@derry.ads.avm.de>
 <1b23f794-f724-4d56-9c4a-9a2b1ff8db7d@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1b23f794-f724-4d56-9c4a-9a2b1ff8db7d@t-8ch.de>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12107-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,weissschuh.net:email]
X-Rspamd-Queue-Id: BC27F2E0E93
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 09:31:07PM +0100, Thomas Weiﬂschuh wrote:
> On 2026-03-20 21:12:53+0100, Nicolas Schier wrote:
> > On Sat, Mar 07, 2026 at 09:51:05AM +0100, Thomas Weiﬂschuh wrote:
> > > On 2026-03-06 17:45:36+0100, Arnd Bergmann wrote:
> > > > On Fri, Mar 6, 2026, at 17:39, Thomas Weiﬂschuh wrote:
> > > > > On 2026-03-06 17:33:09+0100, Arnd Bergmann wrote:
> > > > >>  		  -g \
> > > > >>  		  "-I${inc_dir}" \
> > > > >> +		  "-Iusr/dummy-include" \
> > > > >
> > > > > What about also using -nostdinc?
> > > > 
> > > > I just removed it from my version after I found it made no difference,
> > > > and I wanted to keep the changes shorter. I agree it's slightly cleaner.
> > > 
> > > Ack, your choice.
> > > 
> > > > > I have a similar (unfinished) patch flying around which also
> > > > > uses usr/dummy-include from the different kernel versions
> > > > > to avoid mismatches in case something gets removed there.
> > > > > Not sure if it is worth it.
> > > > 
> > > > Agreed, I certainly don't mind having your version either if
> > > > anyone cares enough. I suppose it would add a very small build time
> > > > overhead for the extra copy, but if it does help catch bugs it
> > > > would be worth the time.
> > > 
> > > It is less about catching bugs, those will already have been caught by
> > > the header tests before. But if something is removed from the dummy
> > > headers because it became unused, the old UAPI headers won't build
> > > anymore against the new dummy-headers.
> 
> > Shall I wait some more days for a possible modified patch 3/3?
> > Otherwise I'd like to apply the series to kbuild-next-unstable.  
> 
> It is a somewhat theoretical issue and if it arises at some point we can
> still fix it up. So this shouldn't block the patches.
> 
> For the series:
> 
> Reviewed-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> 
> Thomas

ok, thanks!

-- 
Nicolas

