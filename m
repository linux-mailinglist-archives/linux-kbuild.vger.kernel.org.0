Return-Path: <linux-kbuild+bounces-12808-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAtZBiH94GlloAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12808-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 17:15:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FE941068F
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 17:15:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99223307100C
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Apr 2026 15:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D255283C93;
	Thu, 16 Apr 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BOj3nvVF"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2605B27AC31;
	Thu, 16 Apr 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776352531; cv=none; b=HeE+LRL1H5tTAzLZ1hsrUSMam7QN9nSIP5OypukKqc5G/v3YTis28jK2SiFCXySBLmuerUSBVteUx246hO303NUg1h9QIq2Id5rn5Ylt2TLghfSPECHLRgW4r2SgUz5FlJ5B8WlHxseGMoulb2ii983dSztmUB3FBMRq2YrPx7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776352531; c=relaxed/simple;
	bh=LisHuWk5CtOhPpzcFcnZw02s1JFOO2YiaB8bzlLqXOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GTQOgFp/QTpVKmXyEFE4MPy1lZJa5G9hdmWhiPhj1r3dDbLc75WouUNtTF3LE8fdKtyshD60BHPOgmMO25n48krLrBtgAbB5kq8Y9CcRyiZzwLYqJk/pO/IrPeWAohb/FMR8Cl6g9a+6uot6RuFm352q/VlH0hC4t6zH4Swwpd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BOj3nvVF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00F7C2BCAF;
	Thu, 16 Apr 2026 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776352530;
	bh=LisHuWk5CtOhPpzcFcnZw02s1JFOO2YiaB8bzlLqXOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOj3nvVFu16d45AU6qWxvWAEti+37JdQLCSWW0GBlRPOfn6f7/Mq8b1YvjdXqb0Hd
	 xA4jrpbCzA3p4UqQAG8SQWMcbvYo04sOEFgltNjDu66D+o4cWGOP3SJc3E8hhDa/vt
	 P3cPpC3zj+xUqwlIjqHrJ6sSCnbIxoRK/TcYwnt4usVNEbG7urRwWE+c82tDceMOCB
	 JadLUanQeQexuSL+Z7xddUxIg1QbE77omKPBRzVDA6/H6XElc1vW2U4qQ4z3WLOC7R
	 pgEHK2sbPzZjGgmM9Guqnq4d3Ue0HS7WNJBc4Xx32B5xeg2ttRns7tC8wW/XgZpt9n
	 RkLOlSd4SDYOw==
Date: Thu, 16 Apr 2026 16:15:25 +0100
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
Message-ID: <a73aa838-d194-4867-86fb-42bc8d057fd9@sirena.org.uk>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
 <ad-ZdjzQZXNgkpwv@sirena.co.uk>
 <3cdf8e79-7c59-4831-9b38-e9c2cef97fe1@linuxfoundation.org>
 <ad-8BIkw_ijCLqcF@sirena.co.uk>
 <e4b82973-7d9e-454d-8f69-6d2a1a8ec7dc@sirena.org.uk>
 <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zUdTV4mK0SqpDqKj"
Content-Disposition: inline
In-Reply-To: <c834846c-96d5-405c-97d9-f182b8fe1569@linuxfoundation.org>
X-Cookie: Process promptly.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12808-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: B9FE941068F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--zUdTV4mK0SqpDqKj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 16, 2026 at 09:08:17AM -0600, Shuah Khan wrote:
> On 4/16/26 07:16, Mark Brown wrote:

> > Sending shortly, FWIW I'm also seeing a buch of issues with:

> > ./run_kselftest.sh: 5: ./kselftest/runner.sh: Bad substitution
> > ./run_kselftest.sh: 5: .: cannot open ./ktap_helpers.sh: No such file

> I will take a look and isolate the two commits that changes
> run_kselftest.sh - sorry for the trouble with CI this time
> around.

Pretty sure it's 2964f6b816c2 (selftests: Use ktap helpers for
runner.sh) - I've just put together a fix for that one, will throw it at
my testing and send it later today all being well.  It uses readlink -e
which isn't implemented by busybox.

--zUdTV4mK0SqpDqKj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmng/Q0ACgkQJNaLcl1U
h9AhWQf5AdREEXqZ00cYXkNeSKBQIqLFg0vU5Uim2n//lDZr5ny7O0kREdylBk7G
eQqB8AV2PifiISv6srvtJSNGPVeRgBSvI/bjpwqSjgTM52IHgEjyAyI27YtoSoj/
ileyhrmpjei95AHSiGvqRGOrMyfET6JkB0Zw058X9RANhcBj95ef2UKEGjo7Z7q0
WpvgXoyJfXGo3ZagjtKP8knwLO7OKrEqFOioXNCVRn6BsOqtuFVZ8eQtEI0c3C3R
T0RJYhJLeBeSiIF23wWOFUNZE8k6QjAcf6YPJJ0REFBkttV97lscWCmc8b/rluE4
cUYDhDq2e/ABG/7HGH5IOEgMVEVkDQ==
=9mqL
-----END PGP SIGNATURE-----

--zUdTV4mK0SqpDqKj--

