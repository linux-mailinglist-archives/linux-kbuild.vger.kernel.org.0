Return-Path: <linux-kbuild+bounces-12804-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKg3HmPh4GkEnAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12804-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:17:23 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7A440EA04
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 301E3302DB5E
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 13:16:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7B01199FAB;
	Thu, 16 Apr 2026 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a9Jmi+GD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948D1169AD2;
	Thu, 16 Apr 2026 13:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776345392; cv=none; b=fgm3TdhaUAwquHrToc0NSbcNnWpJACAtCG/d3PUs1bhtPiOEVgjb2C99rCXgMDb+8aDaP5k4lplyW0r0rE8IP1jkYQweuSEotsxkVTxcE9LlSKl4OE64yneqclnDS/PXGGDyhLM/cg42cZ+LP5lqyGjLqMxRYOW2ruyacHomm38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776345392; c=relaxed/simple;
	bh=+BTDd40OOchvvN4pp/+11pvcQXCskUMiP4Psb/ddjAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvVdnX27byKfjMreSFytnn3tR6uE7TPnuQ7OV2Uq21WCiD3MGIN73VBRXLzJJx63AXJ3OT1nx3axZgPGBvkybG4yru4R4+Twwpvnlf+7AHpweikLw32RA08r6608wW7GpEgs3VYGOx/JPUMLE/zUg30xypFsR2xZImNPC48DhSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a9Jmi+GD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02C3C2BCAF;
	Thu, 16 Apr 2026 13:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776345392;
	bh=+BTDd40OOchvvN4pp/+11pvcQXCskUMiP4Psb/ddjAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a9Jmi+GDbjMHTgXe9pseHek7vFMqhTLTcHUz3teqgNxI4WjnsGXwkmzo7HhhOQDtb
	 cmEpLOinjY0HPAZJEt53VjgakLh1BkoNTA9UXLGqF8ahb9XvyK2UM5d5JtrTsdHW4d
	 4XbynzsiyA5eB24hOVIQ4sbbMRpnsGGN0W+LC5yGD2SMlcKd/W0W3hpwEsf+1suVRl
	 5K3pD15iy/XjjffWaMmy9YLSL4AduvdeOeMBj4/YksT+CRt/IN6RFNZj77QCbMH1fN
	 J1I2LPK7aJLuLIEXt7fXKtnJrOyhBGVWo6h45QfKjfDugIx6ZgREmMMuNFYpQS8eFM
	 GQ+FwWDLnG1lQ==
Date: Thu, 16 Apr 2026 14:16:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Aishwarya.TCV@arm.com, ben.copeland@linaro.org,
	kernelci@lists.linux.dev
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
Message-ID: <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S9dS9cTpUlvggvJ6"
Content-Disposition: inline
In-Reply-To: <ad-8BIkw_ijCLqcF@sirena.co.uk>
X-Cookie: Process promptly.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12804-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sirena.org.uk:mid]
X-Rspamd-Queue-Id: CF7A440EA04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--S9dS9cTpUlvggvJ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 15, 2026 at 05:25:40PM +0100, Mark Brown wrote:
> On Wed, Apr 15, 2026 at 09:40:37AM -0600, Shuah Khan wrote:

> > Mark, would you like to a revert for this?

> Yes, I'll massage the text from my report into a changelog send
> something - it'll probably be tomorrow now.

Sending shortly, FWIW I'm also seeing a buch of issues with:

./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file

--S9dS9cTpUlvggvJ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmng4SoACgkQJNaLcl1U
h9B7Xwf/TP9yGAHaygXVSs77bl1fyf28ySLfd6wbN90nQroBxpwRgPAPkA3BuuhX
TyHygPmgU/1GlbDdm1PG/uCSEDhk+eyI/1L1eaYFaZUPEcxODUOwSSE7G4B3pU9o
yBKPwFXuSM1H8p+iiQg7hQqDEnJz/CFZruSmNCr5/xVcdTPFGkuiPWyniuqkyDG7
5DIHeGnywYMr/rbb2ej57fv8rVnf4C5jBDC75hqIi1Zbbxno+XiLSXKK6KoM0M2v
SrLhQJ4vSxsYR05AleYCdeJe/cya5oxqAblSNPQ6itZtHdX9aaQW5jaXkJY9Lx87
2hZMnWzCK3RfyZsQrE05fkFmbs+wCQ==
=bQJi
-----END PGP SIGNATURE-----

--S9dS9cTpUlvggvJ6--

