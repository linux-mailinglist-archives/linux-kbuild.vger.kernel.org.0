Return-Path: <linux-kbuild+bounces-12227-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO/UJfDFwmmIlgQAu9opvQ
	(envelope-from <linux-kbuild+bounces-12227-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 18:12:16 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E8319C98
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 18:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 509763085300
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Mar 2026 17:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CF3639E198;
	Tue, 24 Mar 2026 17:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="F2M3w0ag"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AE8342CA2;
	Tue, 24 Mar 2026 17:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774371939; cv=none; b=s6yNZ8dLsRX8jbzzTt+DBkl5Drsl0URKZ6qOlN9Mf7m7tlbLt0QmCrU83KODQ0mY6UbZnt36hrUm+hCmOwjD3YaEHVYCM0bJPM88hxq0hK6tGYJOc8ckAe2s++uOp8CW+niL4x2/WXQuiWVxQ7IvCB2zW7aqpzD/vNwtJ2oPwbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774371939; c=relaxed/simple;
	bh=+FmG+m+F+/0Dg1Ps29Is+I+2rhF1mrGBY+bR705CsXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o8rvT4++au/oHXiMCW6AcptT6t4wiIr2p+CrMT4hc9oacV6bpxWECYCsOwkMhxfBS6fYchQgadZgXR3Ld7mZwgrx9ndYHO0SxGVvCY2lEFLoXonAbZ9JE3Pa+xRQ0ZovwrMKCN99va7wa5w8ilc5BrT8wW9qPSxCxk4+Kj+OSsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=F2M3w0ag; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1774371935;
	bh=+FmG+m+F+/0Dg1Ps29Is+I+2rhF1mrGBY+bR705CsXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F2M3w0agRT+3Jz042qU24xK8WW+V4UUFtjxIRCjn+KUaTvaOcD7X0Y2hTgiJ+M6NI
	 rnNfX8xMYntCKd28GRSLFhjoWFr7qxG3yZvhxX687Iqo5ZNEW2F9timitnO0UmXdu4
	 CNq7GndGffbsbF5BpEfVtjDvAMVE50poTZHi5FnM=
Date: Tue, 24 Mar 2026 18:05:34 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nicolas Schier <nsc@kernel.org>, 
	"Maciej W. Rozycki" <macro@orcam.me.uk>, Nick Huang <sef1548@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] scripts: headers_install.sh: Normalize __ASSEMBLY__ to
 __ASSEMBLER__
Message-ID: <3d6608fe-be15-497a-85a3-e6af2dbded0a@t-8ch.de>
References: <20260309-uapi-assembly-v1-1-a7ebfbf14309@weissschuh.net>
 <20260313235618.GA4171564@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260313235618.GA4171564@ax162>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[weissschuh.net,quarantine];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arndb.de,kernel.org,orcam.me.uk,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-12227-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux@weissschuh.net,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,t-8ch.de:mid,weissschuh.net:dkim]
X-Rspamd-Queue-Id: 1D7E8319C98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Nathan,

sorry for the late response, this seems to have fallen through the
cracks.

On 2026-03-13 16:56:18-0700, Nathan Chancellor wrote:
> On Mon, Mar 09, 2026 at 04:58:11PM +0100, Thomas Weißschuh wrote:
> > There is an ongoing effort to replace the usage of __ASSEMBLER__ with
> > __ASSEMBLY__ throughout the kernel tree, see for example
> 
> I think __ASSEMBLER__ and __ASSEMBLY__ are swapped here?

Indeed.

(Also all the other cases)

(...)

> > automatically. So this migration may brake users.
> 
> It sounds like the "< GCC 3.0" part of that might not be true based on
> Maciej's research?
> 
>   https://lore.kernel.org/alpine.DEB.2.21.2603101412520.63708@angie.orcam.me.uk/

Yes, indeed. In my opinion the consistency aspect is still sufficient
to have this change. What do you think?

(...)


Thomas

