Return-Path: <linux-kbuild+bounces-13273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCLuGoRADGqqawUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13273-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 12:50:44 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F3157CD66
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 12:50:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CFABB3141AEC
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 10:38:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2208D370AF6;
	Tue, 19 May 2026 10:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5x9+4Hf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F14370ADD;
	Tue, 19 May 2026 10:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187097; cv=none; b=M2Xw1YThotD+GFsYbjNzm/G9kbLI0WPHT4M20T/PhEUe6cAd4gKUe90+OHIPrUTRz31aEL39+WrWJJYuSAXAba5GJQd2aGZSXB/2ompybRm0JWZJZ99ZO2JtOBFyRjSdM/7JynjLJaz/V7lXs/acPAYoMBsqG2wHdr24OA6Onmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187097; c=relaxed/simple;
	bh=UrCltXNeVVSzQJQFWNRVx2J0zpmWI7ZuLyLC+h9A3yE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsDIXklUO+4anzxJsJ9BVIhp429a8cESyCiWVPSdA3sgnSb1TNdm2MqJLtey8T78CkYKUtT32+mlviMbSR04nZOaqLrhzvSGgI8VH64uHxbdYvTlbtcHUm5pkYgYUTCKDAZgXvjejThsORMLn+2Je+usw1J4hV9olyXzqN4w794=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5x9+4Hf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BD9CC2BCB3;
	Tue, 19 May 2026 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779187096;
	bh=UrCltXNeVVSzQJQFWNRVx2J0zpmWI7ZuLyLC+h9A3yE=;
	h=Date:From:To:Cc:Subject:From;
	b=Z5x9+4Hf00t0thyvWbfhb3UG3DsuBQ6voDpE7Xxzbsns683qDgCsTpnt3rDvuQNuz
	 GILLxkbSp1aZiqttA8u2A/RduZhQR2Av58rGMg41LQAqieLRbAfDqsBBR5TJgaaUtH
	 auWOT7go0fYlnVwuItvwy/J2SujlDh30PjmjByBgkfbPWNsiHELwDcJTkTlunIcdby
	 p+EWYHwUjoo95nDadefbDEUEgUZtzNmP2RTWIeIMHgwlUQoQ4dPCrIh14cVyznD3vu
	 P60aMA12nnSznaUnRmVEGyLsjOrLnflaY4/Vfe0E91fOMtcevg3nR5Zs6jOug+sCHE
	 4VzhmhYrT4emw==
Date: Tue, 19 May 2026 12:37:36 +0200
From: Nicolas Schier <nsc@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Viktor =?iso-8859-1?Q?J=E4gersk=FCpper?= <viktor_jaegerskuepper@freenet.de>
Subject: [GIT PULL] Kbuild fixes for 7.1 #2
Message-ID: <agw9cJdbgFDGXKNj@levanger>
Mail-Followup-To: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	Hasan Basbunar <basbunarhasan@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Viktor =?iso-8859-1?Q?J=E4gersk=FCpper?= <viktor_jaegerskuepper@freenet.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WI7peLxfAgpSA2wo"
Content-Disposition: inline
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13273-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,infradead.org,weissschuh.net,freenet.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[infradead.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,freenet.de:email,weissschuh.net:email]
X-Rspamd-Queue-Id: E0F3157CD66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--WI7peLxfAgpSA2wo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Linus,

please pull this second round of Kbuild fixes for v7.1-rc5 with two commits.
If there are any issues, please let me know.

Thanks and kind regards,
Nicolas




The following changes since commit 5200f5f493f79f14bbdc349e402a40dfb32f23c8:

  Linux 7.1-rc4 (2026-05-17 13:59:58 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/kbuild/linux.git t=
ags/kbuild-fixes-7.1-2

for you to fetch changes up to 202550713128da20d9381d6d2dc0f6b73839f434:

  kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning scheme=
 (2026-05-19 12:29:19 +0200)

----------------------------------------------------------------
Second round of Kbuild fixes for 7.1

  - modpost: prevent stack buffer overflow in do_input_entry() and do_dmi_e=
ntry()

    Defensively replace unbound sprintf() calls in file2alias to prevent
    silent stack overflows and detect alias name overflows with proper
    error message.

  - kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning sche=
me

    Enable smooth upgrades from "rc" releases w/ pacman packages.

Cc: Hasan Basbunar <basbunarhasan@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Wei=DFschuh <linux@weissschuh.net>
Cc: Viktor J=E4gersk=FCpper <viktor_jaegerskuepper@freenet.de>

----------------------------------------------------------------
Hasan Basbunar (1):
      modpost: prevent stack buffer overflow in do_input_entry() and do_dmi=
_entry()

Viktor J=E4gersk=FCpper (1):
      kbuild: pacman-pkg: make "rc" releases adhere to pacman versioning sc=
heme

 scripts/mod/file2alias.c | 79 ++++++++++++++++++++++++++++++++------------=
----
 scripts/package/PKGBUILD |  2 +-
 2 files changed, 54 insertions(+), 27 deletions(-)

--=20
Nicolas

--WI7peLxfAgpSA2wo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmoMPXAACgkQB1IKcBYm
Emm5Sw//deZk/ziyTVF+Ureve/9aA/PyhcvvTyOtmYq+aqgi+NVYSYP/UG3ZvJdP
nqTA4P8Xk3muHgR5ALvW0AaXmf+RBC2TKQYwxaciNUJ1ISOw94Ee5EFj82ngbULe
p3p1ce8iPAbZTkt6/FUWeNf65E1+OEdEC9llJrGtHCom/1RFirZJL/PCVtQ71pDw
qxKJjOzs59HQsFE97TrErUvwLl+54J4fN5V0tLi1XGo/OoIy+snqXeKwpeYXICaK
zhOoesRP2Z6Am10T83MPWvH52b42Z6C8RaNKzg86YF9t5h5ZuJGmO7Ej+oWdSyFm
cL8rmr8pHgpK2m9bW+D7jKwDBuCV+flLCT1rlqTDLYnT9qu5YCiw+/J1FCMNgc63
BW74nj6++Yms7yCUfNjcxaahNLYMWiTcbQLbhHdiS7ed0vMrsXCoH7RTmeW0O2P8
dTO0JXPx8/X1e8TXvsmoJFQ2frF4iaOA12Rdk87gfWAC3PsKM1adbGcQcFMnpzlY
181GQh+AIdSHlOJD/181O38SY63U0qKA+uA6P6zDjiCZ3A+Gj8t7vFi6l9zi8wbs
fypOd09PZRlk7TpeMD5Bv6eHDFLQplJrDp1qnPQWm6klBRtBL15tHWpzo/auG4SH
J4frvCUwoNlBUj7xAlwTUCh6LMZiYleFfASt1OeZgluFrAXqFHA=
=GiIG
-----END PGP SIGNATURE-----

--WI7peLxfAgpSA2wo--

