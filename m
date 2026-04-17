Return-Path: <linux-kbuild+bounces-12815-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LkFLW824mm13QAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12815-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 15:32:31 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 167DD41BAD3
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 15:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3149830F3505
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Apr 2026 13:30:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3373A5E7C;
	Fri, 17 Apr 2026 13:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXrrSmk6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2063A3E7F;
	Fri, 17 Apr 2026 13:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432646; cv=none; b=eam8/0JIepWg6oZC22gt2ulbTnCsB7Ht7T84VXh5EAWJB8waKL34RYkgDpbTbrrTVVu6n3QrwvjiRx6IlbXp6t6LAamJFufmGTY5h081hVCnpfE+roYIWkiALv37w8rXm7yeQp/7CyAy2CDIzRCOfRMQWLRVESukvc9/L6XeN1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432646; c=relaxed/simple;
	bh=gODLVDoNdIu0aRnnS7D3RFNfqDLdhGeFRtSzDpXq3AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBdQsQXJJTt9Eh+YUquMMIKLT2kj8G+YSbJMQWfKLyznRSRcrGmnqjRQZTVBOwHV2AKqzEIsx7/dH2eX/ef5boWIwCbzdfl0PuGpO9qAR/iJLFNnM0pReHh8zeCbeb0dpz10B0eJCTnDO0FNyg1eimP8PevoRSn29xI0cRwwRMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXrrSmk6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 601A3C19425;
	Fri, 17 Apr 2026 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776432645;
	bh=gODLVDoNdIu0aRnnS7D3RFNfqDLdhGeFRtSzDpXq3AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QXrrSmk6IogDUOp9fs8s8OUg5tJy9+6BnwjdpMi4ZRyj7b3jNfjzuvDG4QFcOdCJs
	 oPZTgF8IjVVdGqUrp7l0zwd6BGBU66SI+puqxJHprL+kUK1xM10sWokd+T3lE1g3ar
	 jhzzmWIlCmH3QVh7cew8lYksVQcLu+oZMR79k49H9y/ktUDUKU2UNCLHAYmxnAjHoQ
	 zDumMODlRxyhO2OuqOBigWn1ygvSWzKuvY1wrNjRok9oiwUg55U7JTM82cY2Y83EzL
	 8Woe7/xUgKebHpp2HuoaJWRe/imI/1UOS2e8PrKmGcMxgaegsY629P1WFJg8TtmYfD
	 ElxC2PiLBcRxQ==
Date: Fri, 17 Apr 2026 14:30:40 +0100
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
Message-ID: <e54a02b1-dd0b-4dd4-93aa-0484bb2cd8fe@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="l8K65XbEJBIqZvnB"
Content-Disposition: inline
In-Reply-To: <0420ebf1-2598-4f4f-bd09-95774156b48b@linuxfoundation.org>
X-Cookie: Uh-oh!!  I'm having TOO MUCH FUN!!
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12815-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 167DD41BAD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--l8K65XbEJBIqZvnB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 03:15:30PM -0600, Shuah Khan wrote:

> Just a quick note to say I applied all 3 patches and will send pr tomorrow.

Confirmed that everything seems to be running fine in -next for me.  I
am seeing the test number duplicated in the log messages from the
wrapper:

  ok 59 59 selftests: arm64: syscall-abi

which is confusing my parser a little but is less of an emergency, I'll
take a look.

--l8K65XbEJBIqZvnB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmniNf8ACgkQJNaLcl1U
h9B8Swf/VUIDQqa12mNHNUCII3JGnRQSTgbsZLNisQ4kkDdBzzF7Cxh3tfPruNlE
KIxnW0HpJeegirn1Dd9rGLjCPDztCa1jOL+20r/mYRLNiedIT7r5ConwbhBnfo5a
0IHAcxDt9bMR7eJGdWw84XaP3gysVHcsP1qsTEmTgvmmXR23O2MH4mKAvhtT6Am6
FZNx3QtkoLzIVaTkZL75I2OHfBmye/bXvRt7adGq3d/0rVaI50SqgO2c3QGI1p+a
H/Jwa0LWgbu5o5zCIhwgpJpFdg9k7A8681CCK1PYASibFiCf9NJUXRGPA6Xw9lWb
REBlk10xyoRSDoBL/kDjxg7J5d1UyA==
=Enxp
-----END PGP SIGNATURE-----

--l8K65XbEJBIqZvnB--

