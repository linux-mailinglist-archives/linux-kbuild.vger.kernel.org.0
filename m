Return-Path: <linux-kbuild+bounces-13477-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C7qkElnhHmr8XgAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13477-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:57:45 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 978FF62F045
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 15:57:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=bhg8pFb1;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13477-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13477-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D70C4307D7CC
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 13:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6B43E717A;
	Tue,  2 Jun 2026 13:54:06 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7963E5EF7;
	Tue,  2 Jun 2026 13:54:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780408445; cv=none; b=tIrQpykdcMDwsr8S2Nddq6RKKeDls3DU6l/hyxEyZtbb35pzsUhUUhqm+QU4Mu3OY1s4tGj6JGHDbSAg00IWHpa+Ft2QseFcHj331kezpovJjCaYdysEeHzFLXk6WNceOh2+7WtfJq4pOefGvtLvgpWsF06pQtD1a+xx/SvgsY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780408445; c=relaxed/simple;
	bh=ztm0S2apfXR2YPeL2Ivnd2WA2af3lKVBz9tI+thwSCk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAqRJXbojskQAyoNvaPAIha6l5bb3GJeX/0D/veKuMWxXIjUXzLvNRTABvYSMpY1rKQELRQ6Q3Oop/53ZRSKy5tBOlYhq+3O7xBaLg1mlEuLDK8+Q2uenYWSLkpgCp+7vpt6do+F03UkmmOVF1d047UScPH0CF5TEUyACl69btc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bhg8pFb1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D2A1F00893;
	Tue,  2 Jun 2026 13:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780408444;
	bh=dshr4JV7io60F2peG9AKsFQL3XOYnBCiIcd5ZS94RT8=;
	h=Date:From:To:Cc:Subject;
	b=bhg8pFb1ZnjvC/Sl0+35ppYp0qtBLQ0A65y+fW56ISoEkdVs2FMnwGcg8PisbR0Ii
	 olx0Y1k2PlNIcMkzSm4sahNddCynBzTq4xS3mfGgcJlw/V0VaNVLBcpwiYpw27pSJq
	 i3IUNPC/RkzP0CHNPv0SHJqWdU3zREXUxI1YdlecaKNjZpExNcN7neM6i+I1loCJtv
	 4U8Z/Lxs5aiujaBHZ2/Kmx1lboLA2zo+49gwIqto+FZRsXanjuEvqX848NbzmUiGYi
	 rLSC6ur8ZulPjomZjWTJOMEC2keIU94HRGAO72Z885EjvwtrwCIf8sDzfba+chK1sm
	 H4x8b5IBo53fg==
Date: Tue, 2 Jun 2026 14:54:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
	KBuild Mailing List <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the kbuild tree with the clang-fixes tree
Message-ID: <ah7geBSoDn696L9S@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3saV1wf8TKnbYn2i"
Content-Disposition: inline
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-next@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13477-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sirena.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 978FF62F045


--3saV1wf8TKnbYn2i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  include/linux/compiler-clang.h

between commit:

  175db11786bde ("Disable -Wattribute-alias for clang-23 and newer")

=66rom the clang-fixes tree and commit:

  c919893eabb43 ("compiler-clang.h: Drop explicit version number from "all"=
 diagnostic macro")

=66rom the kbuild tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/linux/compiler-clang.h
index 527e4e1360205,a105e2e8016c2..0000000000000
--- a/include/linux/compiler-clang.h
+++ b/include/linux/compiler-clang.h
@@@ -131,16 -122,10 +122,16 @@@
  #define __diag_str(s)		__diag_str1(s)
  #define __diag(s)		_Pragma(__diag_str(clang diagnostic s))
 =20
 +#if CONFIG_CLANG_VERSION >=3D 230000
 +#define __diag_clang_23(s)	__diag(s)
 +#else
 +#define __diag_clang_23(s)
 +#endif
 +
- #define __diag_clang_13(s)	__diag(s)
+ #define __diag_clang_all(s)	__diag(s)
 =20
  #define __diag_ignore_all(option, comment) \
- 	__diag_clang(13, ignore, option)
+ 	__diag_clang(all, ignore, option)
 =20
  /*
   * clang has horrible behavior with "g" or "rm" constraints for asm

--3saV1wf8TKnbYn2i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe4HgACgkQJNaLcl1U
h9BWfwf+P759imWCAS0o2xv3zxktcAJjoMPhiuE+PAALHWXIEZBPFD45w+FwzoEc
wF+JKHQYAYo6nn6CRELeGWur6I24MOuMlH8H9zWcDVkBv4NxbcbhYtL2ancMmEzN
cWYqjP9xHWuEkNp9CK/LTrpM1ututyq2GeXT9T5z7O6KOQ/byz4mNu+Mv/rVX2J4
qUe0ZUJdYL7v9cltsTlAVLDVsFGZsnl7xy8PfH9Q2rKLXwp5a84oB82i62IL37XF
6q4jf7rS2y5wjPNYLNgpRGNoUHq6Vv1xWDSuIxJCQsZWhjlNtfy4D90Grx6y01Yr
QIdCXleOoNseFq3QJHH4WcqKmQl6CA==
=Yb79
-----END PGP SIGNATURE-----

--3saV1wf8TKnbYn2i--

