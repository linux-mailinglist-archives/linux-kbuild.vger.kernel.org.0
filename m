Return-Path: <linux-kbuild+bounces-13269-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJFICmsUDGoZVQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13269-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 09:42:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9741D5794CD
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 09:42:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8F41301A7CB
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 07:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180B53A6B77;
	Tue, 19 May 2026 07:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNZCER2+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DB829346F;
	Tue, 19 May 2026 07:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779176252; cv=none; b=tIzLG8zEDTacstxo0MbUDTuprYc+OdZgI45F+isGrAezgXSx7wTF30zTbvHRmH6MmcfKCHipaaTKB2mlPWwZDeUKF2L063zWIWLJZg+xlQrMxE95fU4EfDxkkmNwdJ6yTudu42p2kWGGZ+uq31AZ0k6l3VuMfuIX6jBC2bFdfoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779176252; c=relaxed/simple;
	bh=UV/djjWsMsvk5NpNQMLskzlcbsxWHF5cDLlHpqWqtU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDaEVnDhkOTZi/SVJZXnvggosZZSe4fjBLNrHH2OghZlO+6bWeH2Vrl0/B8zsgPQCMm+MTulebkCNyLLnNgK0Yo1woXZVmcaie8IfB3ZKMclbi+QUk3TEms8F3K8s4Jpniv7WJw1V9Utnp9rI3znVoqctFtBVcPR7X5Op50eT6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNZCER2+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC27C2BCB3;
	Tue, 19 May 2026 07:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779176251;
	bh=UV/djjWsMsvk5NpNQMLskzlcbsxWHF5cDLlHpqWqtU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JNZCER2+Us2Gr7lkhyFFUEEqfyS4eRlqzE6jkOwEY6I/UDCaw9A8ytpHGvmV3brZn
	 mlftT0edd9k4ehir0As/tblv+GET6PxFAY/PWvhSGKGl13oUrUvZIGpMgslJ2YZ847
	 N5LccqmIiHs77ELIZFOUm8ONocWodx1GdmcnHwjWuiItEBvsHyweLQYr9ZunXlvdsC
	 B2vCQTFt58YpTlZ1iInHGkd2PpTRdIvnKm31l3Yt6PxLWMXJhTJAqfAZ64PQzJL0O9
	 uk52WCAJYj1T2OW/iY8XGevJGf+WM4fiExd4PyJ+UKcN6ej2nUrwtd2M75zkmU7ye8
	 agngixsmAuK4g==
Date: Tue, 19 May 2026 08:37:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>, Sasha Levin <sashal@kernel.org>
Subject: Re: linux-next: manual merge of the kbuild tree with the origin tree
Message-ID: <fc998fb0-20af-4a81-a942-d9bce8bc5a82@sirena.org.uk>
References: <ags6FtowWAeGPoEN@sirena.org.uk>
 <20260518191337.GB2318678@ax162>
 <20260518192808.GA2884150@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hD8xpCRQrb4ZC+hL"
Content-Disposition: inline
In-Reply-To: <20260518192808.GA2884150@ax162>
X-Cookie: Huh?
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-13269-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 9741D5794CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--hD8xpCRQrb4ZC+hL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 12:28:08PM -0700, Nathan Chancellor wrote:

> Is this because you used an old version of the mm tree?

>   https://lore.kernel.org/fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk/

> Not that the conflict won't come back with the new version, I just want
> to make sure I have my ducks in a row.

Yes, I'm holding mm-nonmm-unstable back due to a bug.

--hD8xpCRQrb4ZC+hL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMEzUACgkQJNaLcl1U
h9CMawf+IP8CQDWdxZ6STMQVppfnFP/eNxwK3/dxxsd4xGs35jYPg6KgD9tq/nup
yqRVJDCt8Ehd5zFP562DYG74s9JKlu5dNaN/3n57fXqWnMTguf0K+9pfjYiWd/v2
KX0/zSbE6tTH/uaOUVt/XaHF4lJ/vaWs/VeQEDmbg3e/DqZdf3Z/uWTX0wgX9vmQ
y7xZY6oKpyDHtrMPaQOMNs4GOJeYBJJ3Bpvi9ZO+VqqLXVcgMlpzp1JdJeWNs1l8
Ob1xZAHMnvX8E4pFQSr2UJa1lCy2fslH6dXkVj50gJuOEjeiQOg24AWCoXHtqn/K
EmO5FmDMOMQkNEdWE/DX/ZKBHh8pSA==
=N2sX
-----END PGP SIGNATURE-----

--hD8xpCRQrb4ZC+hL--

