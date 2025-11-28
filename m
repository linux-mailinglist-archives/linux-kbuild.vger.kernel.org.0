Return-Path: <linux-kbuild+bounces-9908-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBCC93023
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 20:21:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9DDFA34C251
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Nov 2025 19:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5671285CA7;
	Fri, 28 Nov 2025 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wox4VQoI"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91592080C8;
	Fri, 28 Nov 2025 19:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764357691; cv=none; b=eUjfOXJKB4AlElRANsJXfkuuh0enTM8bvGPf2AWYe+zVv/z7HDIleFzaF7S9i6cyeSQSiLY3BzA9u78CnOwEADqVXg8zym+e+OlhdEpPhMpOSOJMUKQbY5vtW2HAmiKDwhKN8M0SkgKqts7f3Mmiv7FqyLb3r9PTXPAjaF/Sm/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764357691; c=relaxed/simple;
	bh=ujNBqhHgTC2d4zMNped40gq7T94zujwsCwr9RoSwC9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=od0zdwiqIqTk7H0vaVQkjOV8FFvYzIS+6KNX8jHqApPRMfLQF1HH7ybx92zhEML+O017VdZISdaMFEB9zLh/7dlWgyuyWmg1T4Vq69xPoHvlJnpzpYIMlFZNd6CRrMbm6l5m9dvvzdq+obtP12QfmUZH2s4DWJXpbDwaXtGkzXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wox4VQoI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A30DDC4CEF1;
	Fri, 28 Nov 2025 19:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764357691;
	bh=ujNBqhHgTC2d4zMNped40gq7T94zujwsCwr9RoSwC9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wox4VQoIAb7Vi96kAKyujLSb7tgjRJ/oD+icwcobAfMCW25SyRjUTU8m2E1UIvtaA
	 AlIGzkawPfto5rRsOs3waCfa53+VG7B9dYtx7KBoH60Sg6mQ5C7KNpBu0CULoLVGJE
	 pUN+to+O+WzLvwbS63j8FsM7dXWUYBtiB/ZoP3IkS7xFUzCti+SmD4NF2TVZK5OYty
	 K3/KIEYeIqKkDzVAeL1UinjMiDOGbusuSOrriCz0iTkjjL22vJcbgVuPMNcVDEDZyt
	 qCoEQfuCDJjkbfCZJTEjCKUq+Lp3I4cs/Rgi/PI97Kx/LvfW2dSrHJPBCB61g1DCzc
	 voCLvWsZr/dZQ==
Date: Fri, 28 Nov 2025 20:21:26 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: WangYuli <wangyuli@aosc.io>, kees@kernel.org,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, WangYuli <wangyl5933@chinaunicom.cn>
Subject: Re: [PATCH] fortify: Ignore intermediate *.tmp files
Message-ID: <aSn2NjaMqoyrP1k2@derry.ads.avm.de>
References: <20251112114725.287349-1-wangyuli@aosc.io>
 <20251112223606.GA3268585@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7RPdinSB0eSATwvQ"
Content-Disposition: inline
In-Reply-To: <20251112223606.GA3268585@ax162>


--7RPdinSB0eSATwvQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 03:36:06PM -0700, Nathan Chancellor wrote:
> On Wed, Nov 12, 2025 at 07:47:25PM +0800, WangYuli wrote:
> > From: WangYuli <wangyl5933@chinaunicom.cn>
> >=20
> > The test_fortify.sh script generates logs of build-time warnings
> > for string and memory functions. To ensure the final log file is
> > updated atomically, the script first writes its output to a temporary
> > file with a .log.tmp extension. Upon successful completion, this
> > temporary file is renamed to the final .log file.

Sounds good, but does not reflect the current implementation:

The output log file may be written in several steps, and the temporary
file is not renamed but simply used to read the buffered output.

> >=20
> > If the build process is interrupted before this rename operation,
> > these *.log.tmp intermediate files will be left in the directory,
> > creating a risk of them being accidentally added to the git repository.

Instead of adding a directory specific ignore, I'd rather rename the
temporary file to match a global ignore pattern (e.g. '.*.tmp').

>=20
> Shouldn't the cleanup trap in lib/test_fortify/test_fortify.sh be enough
> to avoid leaving behind .log.tmp? Or does that only work for clean
> exits? Would adding INT to the trap avoid the problem?

Correct, the current 'EXIT' trap is only executed if test_fortify.sh
exits with 'exit' or reaches its EOF.  We could add HUP, INT, QUIT, TERM
and PIPE as well, as it is done in scripts/Kbuild.include; this may be a
bit more than usually needed, but then we can expect the cleanup to
happen, too, if the script is killed by typical signals (or due to 'set
-e').

>=20
> > To prevent this from happening, add *.tmp to the .gitignore file to
> > explicitly ignore these temporary files.
> >=20
> > Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
> > Signed-off-by: WangYuli <wangyuli@aosc.io>
>=20
> Regardless, this seems fine in the meantime.
>=20
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>

I am going to send an alternative approach.


Kind regards,
Nicolas

--7RPdinSB0eSATwvQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmkp9jYACgkQB1IKcBYm
EmlnfBAAsmANPqxVSIllT+KznQbPRycAVotxpx48HVSFEBDuwPS4oQEdwscDSXG2
/u+xiZCdNsBFOXa3a8ZYAIWiEzJEhKWhnvTOVFiqm771utIPLmJr3/lbV8AjnNz4
QD9w9E6CeRQS7AebPmUdvjd+T9xu9hFeKV/VsEgk+Rdk3CwDyLwbX8uuwteNV/dE
9OSm0/mhsNfrpTmxEjcHXwl6+ZTx53z0k+UM+jYC8VzOgtkFHNg3N/Z0jsyVPDGa
lDkRurZnbgwdGhY5V1TzLMJ72F69ZL1t+u9ELGFQqHgUXWl29lN0HOHJcwtDiN30
4gVdYiZvqOhmiXr/9Yq933zU1ti/aRElQp+F438v4zLrFPKU390ZDBcO2ANX0HPH
eUpKalkhW7JUK5d8kXonMACutlGhTQyamcarwUAbUM6n5bX5bOuKGU5+oWLk3M5B
sCeILzQKd+KmPZlC3mW6869UaMl+HCLT3irTQZvOzFgdriG2fmMiU32mNAHVCpGP
nIzJNgepTDNFVyKobA8plJn16QDW2rhyWZn7CvBr+pKnXmwc1clv8W1pCIKJwSvu
WceCuZlo67kD0srYjGN0sdszC1XdeMG1Zt6w25XoYK0I4kO8pQ6QIf4oCIzMdcf3
HVv/l7ntdpVRU8P/J5zw0LF08zsZnuAkHqf0zP9rqwRsxoyf/Ck=
=dgcP
-----END PGP SIGNATURE-----

--7RPdinSB0eSATwvQ--

