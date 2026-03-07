Return-Path: <linux-kbuild+bounces-11640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLhpHgHnq2lwhwEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11640-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 09:51:13 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F522AC12
	for <lists+linux-kbuild@lfdr.de>; Sat, 07 Mar 2026 09:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 15F7330241A1
	for <lists+linux-kbuild@lfdr.de>; Sat,  7 Mar 2026 08:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8DB914EC73;
	Sat,  7 Mar 2026 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="KCUrBsjL"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82542EBBA1
	for <linux-kbuild@vger.kernel.org>; Sat,  7 Mar 2026 08:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772873468; cv=none; b=opfRi6iqT/xdHtLzfL3Wm+7/uKnS7tYsNfjBY+lJmBaUsiDe4QXDvSEBzX95hZNfyUX8l+8TH+uJl49gXA+aVzxU5XPjd/ExNujQKI68J3Vp/YJJWq6gBVxV/XQGYZiXryI8EPwjwRoyY6GgyN7jSFfh6JUw2UQlhhbI1OvzZms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772873468; c=relaxed/simple;
	bh=PfXmsJx1TrIq8YGgpB/Vc2SpbsbEASvVuscAB0NZvUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVFif02CkcTkJ5GFThjPN1qcL7eykVbV0aoXHASd4slB77MVdstOJ03BibA+GUXkxEfkH/NZT0BN1/eF6IY/qmLSb0bO6H7WFt/j3a7lLtlhKCEKKExCk3oOAUB045xDt5FPObnfk3EoIqKcjF7fhSLjkVPbFuJBuLtLjLMzTFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=KCUrBsjL; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1772873466;
	bh=PfXmsJx1TrIq8YGgpB/Vc2SpbsbEASvVuscAB0NZvUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCUrBsjL7Kb8jENnVI0B77TeypyKmnserpcxxjJsl2ueAj3juYNE1BVINAQI6qi8n
	 5JEXbvD1cjNegL1E5+Lp1ck6BWKrhzhlvr9919eHUVXDabYrktgq8J6nuPz+xfuJON
	 1i+bcKt45M6ZpNDl1cW0UF5kTLLRSm+mfM47wU/g=
Date: Sat, 7 Mar 2026 09:51:05 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, 
	Dodji Seketeli <dodji@seketeli.org>, John Moon <john@jmoon.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, libabigail@sourceware.org
Subject: Re: [PATCH 3/3] check-uapi: use dummy libc includes
Message-ID: <0a2464d4-37b9-4b73-b29b-3802f096d343@t-8ch.de>
References: <20260306163309.2015837-1-arnd@kernel.org>
 <20260306163309.2015837-4-arnd@kernel.org>
 <6a93d709-2d69-4cd5-9854-18910fa69af2@t-8ch.de>
 <05fdccd7-4027-4c97-a701-a1d3019a4420@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <05fdccd7-4027-4c97-a701-a1d3019a4420@app.fastmail.com>
X-Rspamd-Queue-Id: DC4F522AC12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11640-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[weissschuh.net:dkim,t-8ch.de:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 2026-03-06 17:45:36+0100, Arnd Bergmann wrote:
> On Fri, Mar 6, 2026, at 17:39, Thomas Weißschuh wrote:
> > On 2026-03-06 17:33:09+0100, Arnd Bergmann wrote:
> >>  		  -g \
> >>  		  "-I${inc_dir}" \
> >> +		  "-Iusr/dummy-include" \
> >
> > What about also using -nostdinc?
> 
> I just removed it from my version after I found it made no difference,
> and I wanted to keep the changes shorter. I agree it's slightly cleaner.

Ack, your choice.

> > I have a similar (unfinished) patch flying around which also
> > uses usr/dummy-include from the different kernel versions
> > to avoid mismatches in case something gets removed there.
> > Not sure if it is worth it.
> 
> Agreed, I certainly don't mind having your version either if
> anyone cares enough. I suppose it would add a very small build time
> overhead for the extra copy, but if it does help catch bugs it
> would be worth the time.

It is less about catching bugs, those will already have been caught by
the header tests before. But if something is removed from the dummy
headers because it became unused, the old UAPI headers won't build
anymore against the new dummy-headers.


Thomas

