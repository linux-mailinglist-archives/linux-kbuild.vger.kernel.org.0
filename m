Return-Path: <linux-kbuild+bounces-13261-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBOjGhlpC2qnHAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13261-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 21:31:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B2572E73
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 21:31:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D4FE302A2F8
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 19:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E35A38238D;
	Mon, 18 May 2026 19:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRMUN+EU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68610381AFA;
	Mon, 18 May 2026 19:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779132493; cv=none; b=P1BT6bf7v+MagVKSBmTZhmJEu+4FT2v9ORnHMncz9JtPsGfqM8Q2lXyj++jJ5OBbMJ6gZ022kNd1hWLx0DdHBjTVUINOHC2BSaUKG3PP7g5USVXT2uCYTS0INRQ6muAQu8zgQ3BURP5bE1UKOZeCVUqLXZdac9yL0n9V3RPjYlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779132493; c=relaxed/simple;
	bh=zCGjJINfh0547hwmETpMwC7ZKFdizm3/1YH2AEhEGTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afES/lIezwJ1cqhK76o7D/AjPeLjDbSAs5FjmXmTKhkYdRs5u9pRXJ7tFw2xgytRIqgbPcx1u/A/kcK5X9oqvLcTtd91HcvNbw4f/wRIzttpOTByZ9qMc0OG8CON+X0pgpqrpmg0+g+ssZADojfOY+Z0UDPJ9KnyK3gYBxhb31Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRMUN+EU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAEBC2BCC6;
	Mon, 18 May 2026 19:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779132493;
	bh=zCGjJINfh0547hwmETpMwC7ZKFdizm3/1YH2AEhEGTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRMUN+EUFIZra2nuO/60y74QEjnOK1uCJfeLjKlKpRY98qOkdqSmU2GYXl3GDswW8
	 wAqI4wEqJSLXPJpIBLOfXn6EpS51G+qSa0b6qEzWR6hiirGFXheYmEfFkyRAtzyqoi
	 QcbnuqyoTWLzEtxq1sF5UBY5Onl5i/Yz5diK2Y0b0LevN2r1oeKEYi7gGlbeKrbWWu
	 ic2Ht+FBJG4FJd3ijTxUUsL1xxyu3TWJv0dfKvXLg9JpXRoyHONJDKinP4auFum6xJ
	 GeoGOINumGN1emDSXvSsmlyAPMrOFMAD88yF2IHCOH/8Lrff411wb43F/c0OK+bde9
	 DOh3jVv1poWxA==
Date: Mon, 18 May 2026 12:28:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>, Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with the origin tree
Message-ID: <20260518192808.GA2884150@ax162>
References: <ags6FtowWAeGPoEN@sirena.org.uk>
 <20260518191337.GB2318678@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518191337.GB2318678@ax162>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-13261-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: F29B2572E73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 12:13:37PM -0700, Nathan Chancellor wrote:
> Hi Mark,
> 
> On Mon, May 18, 2026 at 05:11:02PM +0100, Mark Brown wrote:
> > Today's linux-next merge of the kbuild tree got a conflict in:
> > 
> >   scripts/Makefile.modfinal
> > 
> > between commit:
> > 
> >   dc1f85a9637cc ("kallsyms: extend lineinfo to loadable modules")
> > 
> > from the origin tree and commit:
> > 
> >   7abef41afad05 ("kbuild/btf: Remove broken module relinking exclusion")
> > 
> > from the kbuild tree.
> 
> Thanks for the heads up! The resolution looks correct to me but
> dc1f85a9637cc does not appear to be in Linus's tree? I would have
> expected the Kbuild tree to have it if so since it is based on 7.1-rc1.
> 
>   $ git describe --contains dc1f85a9637ccd3d171fb5262fd38919dfe632bb
>   Could not get object for dc1f85a9637ccd3d171fb5262fd38919dfe632bb. Skipping.
> 
> It looks like it is in one of Andrew's trees? I just want to make sure
> for my notes to Linus.

Hmmm, it looks like Andrew actually dropped this series a few weeks ago,
as Sasha sent a new version:

  https://lore.kernel.org/20260427171749.9068CC2BCB4@smtp.kernel.org/
  https://lore.kernel.org/20260504153401.2416391-3-sashal@kernel.org/

Is this because you used an old version of the mm tree?

  https://lore.kernel.org/fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk/

Not that the conflict won't come back with the new version, I just want
to make sure I have my ducks in a row.

-- 
Cheers,
Nathan

