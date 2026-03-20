Return-Path: <linux-kbuild+bounces-12106-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mH8tAbOuvWnIAQMAu9opvQ
	(envelope-from <linux-kbuild+bounces-12106-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:31:47 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED772E0DC5
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 21:31:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD13430734FA
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Mar 2026 20:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A8434B683;
	Fri, 20 Mar 2026 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CtyTwE9n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A243346AE5
	for <linux-kbuild@vger.kernel.org>; Fri, 20 Mar 2026 20:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774038671; cv=none; b=Ku9Era4DY5Wx2ey/1YcMiZVC/32zb4NLWMZlIeaECGNbeWQgyFEJR2lLpTuZGfvmc22gtSWpdAKGVepgXF9QnEhBisSJwmGCpbJzFKniFqM+4P5LlVq5e1bSDQhNL/cY+RMf9U7mRxMBixFOBRfJydamHIkCDUq2bPhO+KfhFfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774038671; c=relaxed/simple;
	bh=CiCIitKZfgZ78KDBXP2xAXNY5qyUloALp7HGIShp+Po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GudGEqjiuHZXbwhjFvx6ryCa/iXR6ffpnMETpUK9cNxKXB86bBK1ONzsEaQCiWY7uN1TRrw3X5+pRLEMRQ7aMcx+wVJ5/eyj/J9SzI6L88suyUlhQYZd4oKGIm29Nj8TPeCeFjHW3rinODFRh+K+nsSbvJnAQh5P/vMxPT2HB+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CtyTwE9n; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774038668;
	bh=CiCIitKZfgZ78KDBXP2xAXNY5qyUloALp7HGIShp+Po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CtyTwE9nP3rpv8ZRyQvdTpLkq0J5ND2fjR3Z6OXgn8k4TC2yV4pH3rRv2yYplgWkx
	 /oCB59hnQ6m8kSGj6wk7p2eiRF9bWqe9S8EZdgBB2gamCQB+sDYuBFZ638RCyQrocb
	 rzxGi7Nahfd1YcKGJg6muJWapJHvQglQtD3HXZsQ=
Date: Fri, 20 Mar 2026 21:31:07 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nicolas Schier <nsc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
	linux-kbuild@vger.kernel.org, Dodji Seketeli <dodji@seketeli.org>, John Moon <john@jmoon.dev>, 
	Nathan Chancellor <nathan@kernel.org>, libabigail@sourceware.org
Subject: Re: [PATCH 3/3] check-uapi: use dummy libc includes
Message-ID: <1b23f794-f724-4d56-9c4a-9a2b1ff8db7d@t-8ch.de>
References: <20260306163309.2015837-1-arnd@kernel.org>
 <20260306163309.2015837-4-arnd@kernel.org>
 <6a93d709-2d69-4cd5-9854-18910fa69af2@t-8ch.de>
 <05fdccd7-4027-4c97-a701-a1d3019a4420@app.fastmail.com>
 <0a2464d4-37b9-4b73-b29b-3802f096d343@t-8ch.de>
 <ab2qRWp2asMzQuWK@derry.ads.avm.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ab2qRWp2asMzQuWK@derry.ads.avm.de>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12106-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,t-8ch.de:mid]
X-Rspamd-Queue-Id: 5ED772E0DC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-20 21:12:53+0100, Nicolas Schier wrote:
> On Sat, Mar 07, 2026 at 09:51:05AM +0100, Thomas Weißschuh wrote:
> > On 2026-03-06 17:45:36+0100, Arnd Bergmann wrote:
> > > On Fri, Mar 6, 2026, at 17:39, Thomas Weißschuh wrote:
> > > > On 2026-03-06 17:33:09+0100, Arnd Bergmann wrote:
> > > >>  		  -g \
> > > >>  		  "-I${inc_dir}" \
> > > >> +		  "-Iusr/dummy-include" \
> > > >
> > > > What about also using -nostdinc?
> > > 
> > > I just removed it from my version after I found it made no difference,
> > > and I wanted to keep the changes shorter. I agree it's slightly cleaner.
> > 
> > Ack, your choice.
> > 
> > > > I have a similar (unfinished) patch flying around which also
> > > > uses usr/dummy-include from the different kernel versions
> > > > to avoid mismatches in case something gets removed there.
> > > > Not sure if it is worth it.
> > > 
> > > Agreed, I certainly don't mind having your version either if
> > > anyone cares enough. I suppose it would add a very small build time
> > > overhead for the extra copy, but if it does help catch bugs it
> > > would be worth the time.
> > 
> > It is less about catching bugs, those will already have been caught by
> > the header tests before. But if something is removed from the dummy
> > headers because it became unused, the old UAPI headers won't build
> > anymore against the new dummy-headers.

> Shall I wait some more days for a possible modified patch 3/3?
> Otherwise I'd like to apply the series to kbuild-next-unstable.  

It is a somewhat theoretical issue and if it arises at some point we can
still fix it up. So this shouldn't block the patches.

For the series:

Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>


Thomas

