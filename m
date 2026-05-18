Return-Path: <linux-kbuild+bounces-13260-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG4TLCFmC2qnHAUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13260-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 21:18:57 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F05B1572CB1
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 21:18:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6547B302352D
	for <lists+linux-kbuild@lfdr.de>; Mon, 18 May 2026 19:13:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB53438F65F;
	Mon, 18 May 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f4jOtMtc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8856238F25C;
	Mon, 18 May 2026 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131622; cv=none; b=E19PNhi4Ug/mZhisaUhm/+5a+eYXT5835YEX142WjdAEcVGUfm5TRzoHZ6WkDANZCtRfzRrVZOwgYI1mWneZwlHBHwZNxLPqPlAQWrAPRqI/G9DsLGLBMBBPQ2gAKyKnZ6uwkK3g06jTQYPnVBYSfN72/6XE4rld2736GR1cZ2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131622; c=relaxed/simple;
	bh=DqukRIWajridLI8KaBWIdOB9+M417/PmOzMeKFeeDdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOYZSUCyz8mBFYpBe2t4O/DUZ0yGN6yJAE2S2eyMI7481JA8at0e/iyUvuJXhC/HrMfolnU4gPkSyKd3QiDsfTxBFGFTbmRlKpVScHK/FR6ovduRGtXH6zY1hhDSZ25PpDuayYIgnsnMDvLwGrjY9C2yTVI7T3oMU6yxrbbojW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f4jOtMtc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77E26C2BCB7;
	Mon, 18 May 2026 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779131622;
	bh=DqukRIWajridLI8KaBWIdOB9+M417/PmOzMeKFeeDdQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f4jOtMtc3gxkFdp2PAoAQethc/Axsqdmscd8ngFZC4uCbUziKjvYIIhQgcaSVV8oN
	 MS7u/EWQNABr4D9tMMoaU4T0AyBYBZRRPfKP81jz1D8crdAYDYpZYHsP7U1CeoAKTc
	 BMDkBZD5nI+ns0ldxtcExCf89ElE+q6uKouIjFGoiKsVlUdAtE7V8NRVfboMAzbtfn
	 HM9Gj/4mfytETw/J1jm652lFdqG7KbEzRYewgPB+CLQ9/Doqak36k6IqtflD1rEI7A
	 HoZFXv/mbGCPDEmgfPeIU0Qol1Kx8xJ/gwfXmyiBosRJH8ElCxN+pmT9iBHAjieOQc
	 TCLZMDNa/v+mg==
Date: Mon, 18 May 2026 12:13:37 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>, Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with the origin tree
Message-ID: <20260518191337.GB2318678@ax162>
References: <ags6FtowWAeGPoEN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ags6FtowWAeGPoEN@sirena.org.uk>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13260-lists,linux-kbuild=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: F05B1572CB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Mark,

On Mon, May 18, 2026 at 05:11:02PM +0100, Mark Brown wrote:
> Today's linux-next merge of the kbuild tree got a conflict in:
> 
>   scripts/Makefile.modfinal
> 
> between commit:
> 
>   dc1f85a9637cc ("kallsyms: extend lineinfo to loadable modules")
> 
> from the origin tree and commit:
> 
>   7abef41afad05 ("kbuild/btf: Remove broken module relinking exclusion")
> 
> from the kbuild tree.

Thanks for the heads up! The resolution looks correct to me but
dc1f85a9637cc does not appear to be in Linus's tree? I would have
expected the Kbuild tree to have it if so since it is based on 7.1-rc1.

  $ git describe --contains dc1f85a9637ccd3d171fb5262fd38919dfe632bb
  Could not get object for dc1f85a9637ccd3d171fb5262fd38919dfe632bb. Skipping.

It looks like it is in one of Andrew's trees? I just want to make sure
for my notes to Linus.

-- 
Cheers,
Nathan

