Return-Path: <linux-kbuild+bounces-13172-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BhzFzN6B2pL4QIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13172-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 21:55:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0959A55727C
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 21:55:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C90C53011C67
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 19:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D180350298;
	Fri, 15 May 2026 19:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ie14WCqZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A58633FE0A
	for <linux-kbuild@vger.kernel.org>; Fri, 15 May 2026 19:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778874824; cv=none; b=fenxJa7HxbanBkztlGG7ztdlFTDD//CSrvit03N9Pww1iOw7NvhCYZDAAxyaAwnLZ3n9AOSpp3KT5SjrCKeEyKOm4GPHTt3OmKM/0cvT2uvmusXCtnZpuyHf+W4qY03Qx17Ky/BxL17dM7D/3t9CNI4OBNl0fVbK9PHbJ15UeyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778874824; c=relaxed/simple;
	bh=Odo0yKm+gdJpAQcxTdFkFl8NtkkE0Q/HFOlz98xNH/Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OsuwMqEFOA4Q97YOu6LaIlVhx6lOzWY67tpbZsaCevuQWV0wwL6+DGomMwm6WEwbetrmnjaxKlN4tucUqjFVZF1hmYXe8v23xuHW3BZuIRYRqTkfIjwHSoLd34NXHCqC7bl6JmFeOzIXRLB+ORZI8aNIcPbWewnr+0n5D0INBlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ie14WCqZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 943DDC2BCB0;
	Fri, 15 May 2026 19:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778874823;
	bh=Odo0yKm+gdJpAQcxTdFkFl8NtkkE0Q/HFOlz98xNH/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ie14WCqZccKW3GRxjHFWMGNtU9Yp2yIT74YA367uQP5wJmtAbU2kJyX7KH3S9gApO
	 ZICq6sqGOxLqJPSk5pacGL86EcnFEFjxWp6IbXGF1HbW+l0G4EBLV4086i+GgA+uNf
	 uGalQPgXG6egd1l/dQow1LBRRWEO5aIma5NMrT5+hvZqSobjhD9wvH0UtFlJNX6Xxn
	 lRmHbz34EJ9uPCXONiywqd3O2n0RK8HYvRp517d5QnOGseJ3ZPHuGNa+9O3C/7d3FS
	 uLmhqy5DRZmZS8V5KGqiAuUDeDkfuFLa5uRx5LqOiA1wWLSWBjjRp8OfCrzICRBQcP
	 IQdmG+n9iRjpQ==
Date: Sat, 16 May 2026 04:53:39 +0900
From: Nathan Chancellor <nathan@kernel.org>
To: Nicolas Schier <nsc@kernel.org>
Cc: Jill Ravaliya <jillravaliya@gmail.com>, masahiroy@kernel.org,
	linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: deb-pkg: propagate hook script failures in
 builddeb
Message-ID: <20260515195339.GA553537@ax162>
References: <CAHr0PbumU-Y4G9rmuffd3crfOpqgxvQii0cVEYFC_sdjjNEZRw@mail.gmail.com>
 <20260501012018.43278-1-jillravaliya@gmail.com>
 <agd0Ta6zFgtzXQkc@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agd0Ta6zFgtzXQkc@levanger>
X-Rspamd-Queue-Id: 0959A55727C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13172-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 09:30:21PM +0200, Nicolas Schier wrote:
> On Fri, May 01, 2026 at 06:50:18AM +0530, Jill Ravaliya wrote:
> > The 'builddeb' script generates maintainer scripts for Debian-based
> > distributions. Currently, it invokes post-installation hooks via
> > run-parts but unconditionally exits with code 0.
> 
> Are you sure?  On my Debian trixie, run-parts exits with 1 as soon as a
> single script from the given directory exists with non-zero.
...
> > This patch ensures that failures in 'run-parts' are correctly
> > propagated, allowing the package manager to abort the installation
> > upon hook failure.

Hmmm, yeah, I had missed the 'set -e' in this script, so I think this
change should be unnecessary because run-parts failures should already
be propagated up from 'set -e'. If a script in /{etc,usr/share}/kernel
does not error when it should, there is nothing we can do about that
(which appears to be the cause of the original issue). Thanks for the
review!

-- 
Cheers,
Nathan

