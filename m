Return-Path: <linux-kbuild+bounces-11971-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YYWFFy1CuGmLbAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11971-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:47:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AE929E7D8
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDD6830A5296
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 103FC3CFF77;
	Mon, 16 Mar 2026 17:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIxWbsqt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFFAE290DBB;
	Mon, 16 Mar 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773682942; cv=none; b=Z1epDQmf9WBdzxgJnI1syeSoTElU+qcZ4NmdOlhX5mk0LGbChfJU3GAUhew8WTp5+4T4ryqD9Gj2Q3AtafpQf0FBjpRTazGPujct6Cv+qPtfBhv8XF6hvksN7PIwhE5tDKBlZIEWWvLPcPtmsux7J5E5CywMSLwEjFehL+1E2Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773682942; c=relaxed/simple;
	bh=vzPznWqGUq2/rBgm9ZbfC9VBwgsH9x2ojBXvL9R5TLs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Eq39FPiEy0Ged/1du0TBEmXlmV7PAjMvMSqGsX5WZ4NH6V8BOXxKKd+l60zWFvTKBUbtnkiH4ZnrUQidvyUXedpsZerGoYB8PBPnhNVMJC1E0dnWE9Z5DkyTxfeAN44+NlSKA8CUJIcjEZXPr/UEWdIqG5AUuy6m4vg95S0Lv1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIxWbsqt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36E90C19425;
	Mon, 16 Mar 2026 17:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773682941;
	bh=vzPznWqGUq2/rBgm9ZbfC9VBwgsH9x2ojBXvL9R5TLs=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=aIxWbsqtD7ZNx/KL9u4knTgtlN8OqC1qH3rsqSMEWgYE/DCNcrQEQghcwIsoQCiwy
	 JlEzojLVTir6F1Ip8AeHHPCdnJGylz4NjAiiRcXiR6wTO4MSLagSbAxX36xzqJcpWq
	 hOpoJL/S9sGTlUPBR+v9fjYWWsc2oZdT4+R8pbiNSlktNkxL2gSL+8RtQloBG9P89Z
	 40/o4KGAfCkqwpdKKbGiUaUoozS32u80ZuezdNSY4l17G0FzNjQxXUFxNHgvesSZP6
	 1V8X3J28sESSc/yIr4yRdPnm37mCYT846SLN/5d8p57Qv1JCp5fP5GUA/4lohYTeU1
	 /Q1YxxTmY3QOg==
Date: Mon, 16 Mar 2026 17:42:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Schier <nsc@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Nathan Chancellor <nathan@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kbuild tree
Message-ID: <d9a3537a-9abc-49f0-86df-13089ff35a3a@sirena.org.uk>
References: <abgRRX3PH9IaExi8@sirena.org.uk>
 <abgph5Gk1G8UgG2E@levanger>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z/50DCvi3s3BwjON"
Content-Disposition: inline
In-Reply-To: <abgph5Gk1G8UgG2E@levanger>
X-Cookie: Not a flying toy.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11971-lists,linux-kbuild=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: C3AE929E7D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--z/50DCvi3s3BwjON
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 16, 2026 at 05:02:15PM +0100, Nicolas Schier wrote:
> On Mon, Mar 16, 2026 at 02:18:45PM +0000, Mark Brown wrote:

> > Makefile:2254: *** extraneous 'endif'.  Stop.
> > Makefile:2254: *** extraneous 'endif'.  Stop.
> >   PERF_VERSION = .gbc1f864a1976
> > 52.34user 4.91system 0:56.88elapsed 100%CPU (0avgtext+0avgdata 140840maxresident)k
> > 0inputs+0outputs (0major+1379795minor)pagefaults 0swaps
> > Building: arm64 allnoconfig
> > Makefile:2254: *** extraneous 'endif'.  Stop.

> thanks for the report.  Unfortunately, I cannot reproduce that anyhow;
> but I pushed to kbuild/kbuild-for-next at 12:36 UTC, might that have
> been a bad point in time?  Do you have your merge somewhere around where
> I can fetch it for investigation?

I tend to start late mornings UTC so something in the middle of the
night won't be noticed.  I don't have my merge to hand, sorry - you'll
be able to see where I merged things by looking at the history of -next
for the kbuild merge when I publish today's -next.  IIRC there as
nothing other than merges and the commit I flagged in there, it's
possibly a merge issue with Linus' tree?

--z/50DCvi3s3BwjON
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm4QPgACgkQJNaLcl1U
h9CW9Qf7BmThNidgXtEdXv5gYGmPvuJ5UIDpEezAod0qlUq4fRRSwgbuL7Pl+z2w
rfAq+o0NrVWMmNy3GxVJ7AFIXiSCTbnrcrIwwH1y/Ba/roXTZZWhqOR9oX9lknD3
XoAo4KL4sahnFdJoVQTnbUVeAs/QyFTQZ9rXRCCDWenSQXioIZRlUq0DWcqkd1hZ
Of0peu35pQ4dInJF6GtdJpkmSUGbljRNyr6MmIGyFg/8XwXW/dtzBXzmJeH2Zxbj
O1sbTZl5v3oetjg9Hx0gwGeGN7liRHlFMrBbW/u88YBY0sXLJzAP1LTJ+/oxIzuJ
fmcAiE+rcebi+MJfAjnmWQRB4W3xxQ==
=wmOd
-----END PGP SIGNATURE-----

--z/50DCvi3s3BwjON--

