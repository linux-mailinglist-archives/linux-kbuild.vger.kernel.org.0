Return-Path: <linux-kbuild+bounces-10848-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GQBmE9zmc2nhzQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10848-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 22:23:40 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D567ADE4
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 22:23:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0D1D43010500
	for <lists+linux-kbuild@lfdr.de>; Fri, 23 Jan 2026 21:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 515721F8AC8;
	Fri, 23 Jan 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hyeWe8cC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD833EBF28;
	Fri, 23 Jan 2026 21:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769203417; cv=none; b=Nu5QDv5vyaWDnAp30CSLE2a87b/lpEC1TvVWOXIprJ8B+/IT9QRO8QjCEn3tgdVD5Y96ELdp8t7KLKUM9LjtXwss4tOA83yD3snOGsURu1HxMd3sU/7oPI8XnvHVtPtdA/2MZ/EndIG58dxe8bkNfUD6U7DYjy0dRRbMJ35yers=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769203417; c=relaxed/simple;
	bh=pJU8otTejAVfCMR/0BAFYLC5/ptXqyZHcsMuUJWrsmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIyhQy6IoBmTNjTK4Gy/dN6RX/BFRzhuUTtKT28S8MKJkfcWUIcGD46km/9EQcwe2PQOXdS5sMgDYcwArltYVhXxO1n8WYo5BvWH2J5ekRRU0pxJqMAp09AU21U3+uNyYInnBbXnWul1GF2f08sxmqfR+hQh4J3+OdRijsOWbc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hyeWe8cC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA08C4CEF1;
	Fri, 23 Jan 2026 21:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769203416;
	bh=pJU8otTejAVfCMR/0BAFYLC5/ptXqyZHcsMuUJWrsmo=;
	h=Date:From:To:Cc:Subject:From;
	b=hyeWe8cCPXTOwLuS7E4//bMwVbTtNJqqIZ97xAO25RBhFn5ixCore2LdE6R1aXxdt
	 ug0gySzaJjPWMYU71H2/s/Z9WWi35oKGrsHl+mhyxnM0ILk7VonwhF/FVtYB5VwEzq
	 0WnY7XIFDVnaLsCPMG1C3t8Hq1gY88vAjEUznG6e5m5me2yAL9XPbjOIimSlje+1jF
	 59mbF5ZCIkfbyPKWUIxd3hLo7HQ5J1CMLsriSlRhFCNPGLTIIIl2ZT4IRlE4J+RWGS
	 HT7wMlHymoHZcKT2ySSCXQrcPR1tQyX+rb3BGuQ8Q3MJDRTEZt4sVmAHMXOi+YXvbO
	 1yM8sFW9gp2uw==
Date: Fri, 23 Jan 2026 22:23:16 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Arkadiusz Kozdra <floss@arusekk.pl>
Subject: [GIT PULL] Kbuild fixes for v6.19-rc7
Message-ID: <aXPmxBcHT-FqfAKB@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Kbuild Mailing List <linux-kbuild@vger.kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Carlos Llamas <cmllamas@google.com>,
	Arkadiusz Kozdra <floss@arusekk.pl>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wx+Jt+7PYcy+Dxjf"
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-10848-lists,linux-kbuild=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 92D567ADE4
X-Rspamd-Action: no action


--wx+Jt+7PYcy+Dxjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

please pull these two Kbuild fixes for 6.19-rc7; accidentially based on
v6.19-rc5.

Thanks and best regards,
Nicolas


The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git tags/kbuild-fixes-6.19-2

for you to fetch changes up to baaecfcac559bcac73206df447eb5c385fa22f2a:

  kconfig: fix static linking of nconf (2026-01-14 14:23:20 +0100)

----------------------------------------------------------------
Second round of Kbuild fixes for 6.19

 - Reduce possible complications when cross-compiling by increasing use
   of ${NM} in check-function-names.sh

 - Fix static linking of nconf

Cc: Carlos Llamas <cmllamas@google.com>
Cc: Arkadiusz Kozdra <floss@arusekk.pl>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Nicolas Schier <nsc@kernel.org>

----------------------------------------------------------------
Arkadiusz Kozdra (1):
      kconfig: fix static linking of nconf

Carlos Llamas (1):
      kbuild: prefer ${NM} in check-function-names.sh

 scripts/check-function-names.sh |  2 +-
 scripts/kconfig/nconf-cfg.sh    | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

--wx+Jt+7PYcy+Dxjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmlz5sMACgkQB1IKcBYm
Eml0FA/+K5af/GYLWkkzL1CP0B1k6hzkNHaZUhsd5g06Lqli81NiOg3rv8GbF5vI
ES2VArmvnm7r6QSw+m2waFnnvrTXFi1KKD37hdr9Gd2G9EyINcxTA0tcsrnslPz2
pCyWLWhnzUN08Nmt1XqPXYgPqRQV1z8BJo0hhgKuMidpJQzEdG7Ui8pFWtGI/gEk
p0D60rM84yaVqD95M+IzDAIW+CiVSFbPDWA6vC9wSsNRYkTN3puzYQDrI4HCKwK/
zqx0csiOAilRsVc2Z4cH2yrOh+hmSsMOoeQBFrZlmIllrTegMWRYTQ7pDOk3CrCF
kjyPrkTtBJIXLtKwZiSxUM863bskwEBCBqZUuYIZmZUIBuoEidUqBRezZToWD+9F
36bz1kQRlK3ULlVOqAQ4A+nAArcMzcpN7v52I9by3HQy6viXdkVdttS0lMGf/0bt
M6IsMefQYuGWsr86TiTcrBLBQch6W5yMQOfPBekN3+QMWSC6i6X3G7oG9CoE8E7L
DoryMat5HKL6oV+WbL029L7kUpICu+3C6FM42OPxJv0Dj2q4ky1y3LoR0Me71REx
qRwNJnKTvjxkNUMhvAy1KX+CDcRiZusdHoPZr3+Gm8XK6g24EQpOorFo7yZmKAba
csW9g4Iv/GSZoZvAgSz6EJwDra3bCwCNSCWnWOQjPaqSYEf0Puo=
=U4To
-----END PGP SIGNATURE-----

--wx+Jt+7PYcy+Dxjf--

