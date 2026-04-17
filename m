Return-Path: <linux-kbuild+bounces-12814-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKu8K/QN4mkg1AAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12814-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 12:39:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 356E941A4F8
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 12:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 573EE300D313
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 10:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4143B7763;
	Fri, 17 Apr 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MAoNy6xF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97113B7757;
	Fri, 17 Apr 2026 10:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776422185; cv=none; b=cLz65NTMMsNwESn52ge/wtccxaqH8BKRaTFzYc2kRQRX33srOTLqG3akJlT4hkKp2iMFOwllBkZP+XKQ0XQJgRI2LxEaoslOqIY2BLsewPPVDEXdUi2mZ28jy+TgDvWF+eYv8Bx+jympO6rdQlXRRJ22Mh7ItovykiCAQwerxEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776422185; c=relaxed/simple;
	bh=rvVNHidjO5cV52QcqTOC4HaikastdbVk16UEczL3Lgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oONPw4kN045yOCilZVLWfvX20WAdCQBbnTMamQBFO+44h0QLutAw4ZHhZ7lm9f9fhWQ0KL4mfhebSR8NDeHL1rsa9BOxq3A1YLcuV/jEnYXk79+rbI1+wmh8ms4di2TNP1fyqVnCxvVb4hl48iz5f8HT+r3uHBzHd6HDqAB12Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MAoNy6xF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06BD2C19425;
	Fri, 17 Apr 2026 10:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776422185;
	bh=rvVNHidjO5cV52QcqTOC4HaikastdbVk16UEczL3Lgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAoNy6xFnyPluWovR96Cg/vY/bpyuQRY7vncy2LEZSmHbqmth+oKGcyidRdoTvVCe
	 d429QUVavxOEqjPZRy5IInUCAn5Ovrsl6dqQZDkkkvCiFekmRZqUU49IY8fn4mUICa
	 1PkAqfSl0DT/H/RV/kZYAtRS2L6idKtD3+jOZUNFnRacjfp5v7KEeAA21FVcXnmI/L
	 3x1lemQcwLTrvjQTqoktelmYLFGtDlhwss7IXst6v7pqnq9wxMru5/3HIEQ8DIyAeC
	 YSghaaLSC/Vnz9PSqX3JzWiwVup5gYnkmRYdAUgdjKzbs7nBGZtaI3Xb2CnGYybibF
	 g3+qYsfgox39g==
Date: Fri, 17 Apr 2026 11:36:20 +0100
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
Message-ID: <798e6edb-1c56-4c68-ae3a-a9c4e1b022a5@sirena.org.uk>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
 <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
 <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
 <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
 <9c9f9851-5962-4281-9f34-a1f2e012b13e@linuxfoundation.org>
 <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KmZdBgDaIn46m5wC"
Content-Disposition: inline
In-Reply-To: <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12814-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 356E941A4F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--KmZdBgDaIn46m5wC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 03:15:30PM -0600, Shuah Khan wrote:
> On 4/16/26 09:21, Shuah Khan wrote:

> > Yes 2964f6b816c2 is my first suspect with ktap_helpers.sh no such file.
> > Thank you for fixing this. That way we can patch it and not revert it.

> Just a quick note to say I applied all 3 patches and will send pr tomorrow.

Thanks Shuah!  I'll try to confirm everything looks good when they're
all merged together after today's -next.

--KmZdBgDaIn46m5wC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniDSMACgkQJNaLcl1U
h9As/Af/ciLF9Rtpujhy/dj0AC1stnb685JP5uhLDAEVJcb61RROlSFgVDwz4i/N
EYRB59qPD/kFrI9y/8xv4ySJ+VNGDIa/dS+bnlGvMz6uuhVTy86a9oC3Gqc3MHdn
Q8qyBckdfoBA47JaronYtuUxE/If7kiebzJQYRoRtZJ7A6eRqP2kdJBA9Ggzty4t
W9SEAR32lSxI+BPPiZ4nKgrS3sDLE/Kyz283Pa/A9d5cZCT1J+L/Jb5GvwuMEVf6
fLFAHQT3cUo4hTbP1xEMn/yxpFUCPxWCXy5nOaAIPt5eCHlPvsmfdMlkMVc/zv0s
q0Tbf1oqtJ7A7MAiGRIWXu2X/o12Bg==
=Xd1p
-----END PGP SIGNATURE-----

--KmZdBgDaIn46m5wC--

