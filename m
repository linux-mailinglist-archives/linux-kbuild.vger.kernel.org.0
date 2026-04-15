Return-Path: <linux-kbuild+bounces-12792-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ6GEY6Z32nXWQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12792-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:58:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F1405143
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 15:58:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 011013016294
	for <lists+linux-kbuild@lfdr.de>; Wed, 15 Apr 2026 13:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD963CF049;
	Wed, 15 Apr 2026 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kV6vjY/R"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A0E3BD237;
	Wed, 15 Apr 2026 13:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261500; cv=none; b=YgNGShk6lszoL5I+v8A4zcw8/Mou0EHuJjv6uQJgoQ3kzYnIus4pLea7jSjmQy+3zcWdwkCbSDkNa3kZ3TTcfusqDbiVQfN0ewpAUNrOSd5zA392FS7GE1Qq2uz4z0M395/awfRdACiguXP9IThBZEt3GAzJzdZwMEMvIdwy6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261500; c=relaxed/simple;
	bh=UXY9ERp6NRhi1/tb6upj2ujVl6Aw9w6faxCGb2DC5DM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSuGivBqdI6wfZ08WiDrfPVj56E3WCHQJpaLk6vJs0JxAbxWi8HZcCr6Eb9sxYw7sgdxyx8xbE4soYMQfGfI4djRKvMO+W2Ci+T/WlWzofoJjOGuyHsHJALlYvpC5uGd1Q8aIlP6i6J1BzJBGL6l95v+sHyzgA1CgUwULSwA7VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kV6vjY/R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6439C19424;
	Wed, 15 Apr 2026 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776261500;
	bh=UXY9ERp6NRhi1/tb6upj2ujVl6Aw9w6faxCGb2DC5DM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kV6vjY/Rjtcp7Rgh0FDsCp80JHgxM2T7/iq85pBGnQ2ugeZolQvgq7tfRjslM/YlW
	 hA4029zQAVdv/fhX3SxCMk6JNEx++XFjwR2qY2YnmxN4rK6YXxWAi6fwMfOeori3Y2
	 7zzE4b2gSn6Cx6583qEUCImxE/ihMwOqCvvWycvWuXq26ZGSbkIJ7YdSqYH2gSHOBf
	 683xWEMKuv2ALD+bh8GKdkDW3vqgHsPSX0TIxJ6Wik8bSYESxq3v3viFx5Ar8HmP0w
	 9Ha4VrBCzlchqd5Xg38J7hiViyOmCN9MSFl50oOwu7N8eI9sFaCRrJCkeiUS5osRrU
	 ingdbAX7kRkxw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B889D1AC57F4; Wed, 15 Apr 2026 14:58:14 +0100 (BST)
Date: Wed, 15 Apr 2026 14:58:14 +0100
From: Mark Brown <broonie@kernel.org>
To: Ricardo =?iso-8859-1?Q?B=2E_Marli=E8re?= <rbm@suse.com>,
	torvalds@linux-foundation.org, Shuah Khan <shuah@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, Aishwarya.TCV@arm.com,
	ben.copeland@linaro.org, kernelci@lists.linux.dev
Subject: Re: [PATCH 5/6] selftests: Preserve subtarget failures in all/install
Message-ID: <ad-ZdjzQZXNgkpwv@sirena.co.uk>
References: <20260320-selftests-fixes-v1-0-79144f76be01@suse.com>
 <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R0pF+WDKtWvscPso"
Content-Disposition: inline
In-Reply-To: <20260320-selftests-fixes-v1-5-79144f76be01@suse.com>
X-Cookie: Allow 6 to 8 weeks for delivery.
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_FROM(0.00)[bounces-12792-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE1F1405143
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--R0pF+WDKtWvscPso
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 03:29:20PM -0300, Ricardo B. Marli=E8re wrote:
> Track failures explicitly in the top-level selftests all/install loops.
>=20
> The current code multiplies `ret` by each sub-make exit status. For
> example, with `TARGETS=3Dnet`, the implicit `net/lib` dependency runs aft=
er
> `net`, so a failed `net` build can be followed by a successful `net/lib`
> build and reset the final result to success.
>=20
> Set `ret` to 1 on any non-zero sub-make exit code and keep it sticky, so
> the top-level make returns failure when any selected selftest target
> fails.

This patch, which is now in mainline as 7e47389142b8, is breaking a
bunch of CI systems - at least KernelCI, our Arm internal CI and my
personal stuff.  It causes the equivalent of FORCE_TARGETS behaviour in
the top level Makefile, the prior behaviour where the exit status of the
top level Makefile ignores failures from individual directories is
desirable since by default we try to build almost all the selftests but
between quality issues and build time dependencies it's very common for
at least one of them to fail.  With this commit unless the user has
configured a more restricted set of selftests it would be surprising if
we manage to get a successful build and install.

As well as being a poor default due to the very high likelyhood of build
failures this also has the undesirable effect of causing a build failure
in one selftest to cause the whole install target to fail, meaning that
the build failure is escallated to a complete lost of coverge for all
selftests in common CI usage.

This wasn't showing up in my -next build tests since I set FORCE_TARGETS
and explicitly choose a restricted set of kselftests which actually
build with my system and configuration.  It was less obvious than it
should have been with the other systems since they did not expect there
to be a complete failure to generate a kselftest tarball and variously
masked the error or reported it in a manner that looked like an
infrastructure issue.

It would be really nice to get to the point where we can reasonably do
this but we're simply not there at the current time.  At the moment if
people want to see build failures reported at the top level that really
needs to be opt in, we have FORCE_TARGETS for that.

--R0pF+WDKtWvscPso
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnfmXEACgkQJNaLcl1U
h9Bz6wf8C/yq5aL8RQNgyvkNdVsgvLfYNWtlturQ3ejxHG1pNVBCpEWrnrHE8XOs
owgKYvOIg5tPgnMFGqWZ9WJnJIUtYA/ngJYoXJQQS8UYVHsaYTu6tkidAvt5KDAR
lTunKj1KeQJX1jH9JouJin3eIF6BU0FcHmEfRYchbUq2vme2Co3v+qGspCJcZLpa
beLwZ2vx8wmlpw5Xr+iTx/QSAPUox3jIGCs5VqAMKk+QrAZK3TSyeLf/BBhqasP5
a2gb4rXrz38NqZUBa8ID4oq8/91EDnqjL3BfmqX6+ljvUcMEBd0Y2b+V7v1pHx0q
IFqr1TZuBStd+waVFDn1Jp2rxhA7Kg==
=lRPp
-----END PGP SIGNATURE-----

--R0pF+WDKtWvscPso--

