Return-Path: <linux-kbuild+bounces-2901-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EED94AFB2
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 20:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B6BC282DCF
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 Aug 2024 18:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADBD713BACE;
	Wed,  7 Aug 2024 18:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b="gAS1Gu4q"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DDC12C6BB;
	Wed,  7 Aug 2024 18:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723055362; cv=none; b=tGQvMpjNPsPJMez2yygabZ348Ml/HSrAT6qzPikXK5U8Wvrn4T6Cg/5hCr3F3lkadSHIMdnK8qnvtTABZHQo2K39qmUIxjMm65een4Ecqv7U83wXBoRU3g5a87u6/iIYSnbjeCdNgWT+l+fsvF4rYRYZn0pGxA8G6s9o/yAm5e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723055362; c=relaxed/simple;
	bh=hymLWoyV7ht6ypbp/U4Xl6MRVpEFOPRbV+1LTvu/f9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwT0AbaLs73PKkRI7tFOFWeezuy6bG2qEjWOi2BBPAtbBB04745RpmlgV9EGMD5fO1xVO/KSSj2NtZ7BKz6g5EKSQc1bAcMzEwHLwfmhkzCXoFguxyudSa6ewM06r+Hpy6N53VGwrGTGRwdv6Wq/HGKbZMRqEjY9bM2ZwQ+gkZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu; spf=pass smtp.mailfrom=fjasle.eu; dkim=pass (2048-bit key) header.d=fjasle.eu header.i=@fjasle.eu header.b=gAS1Gu4q; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fjasle.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fjasle.eu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=fjasle.eu;
	s=ds202307; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Z7pgQwVDo65YP6uPtDpNzmw1a9FUYGQ17ingsCWikoc=; b=gAS1Gu4q4PHuMhob6d7Hj6LTFb
	6bFvpKvpgSKkrgY6gZGykTR27h87vvzZ40oKz9sV9lxa7/xxK3PlEibTJ3qgAa2xsxVahT3FhqG+M
	AdLn4RSBmqErl9dw3S464i8Eod54HC4r4mNbeHjonw60SnFI15jMJZrPcnmXdpA//85B7J7kMtyNJ
	cbMKXM+7Z3uGHLFCSCqbFG46fpKlizHbk89SmxkUz57MKGrRzQHTceUDiJRAiKDWAk5Oh7orw7O0n
	xf6ipnQmQcyb7R9BDULly8+ZUwAb0c5aTbrUAFxDv6n3/Zt0+0NCYjgxJecfL3RMdCc5RSmn9+WIT
	UjBMTeFQ==;
Received: from [2001:9e8:9f8:5201:6f0:21ff:fe91:394] (port=55800 helo=bergen)
	by smtp.domeneshop.no with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <nicolas@fjasle.eu>)
	id 1sblPK-00AK7q-7c;
	Wed, 07 Aug 2024 20:29:10 +0200
Date: Wed, 7 Aug 2024 20:29:05 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
	Daniel Gomez <da.gomez@samsung.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] kbuild: avoid scripts/kallsyms parsing /dev/null
Message-ID: <ZrO88YnT8vg5oQGz@bergen>
References: <20240807181148.660157-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m7D6HnzGoX8PnQSC"
Content-Disposition: inline
In-Reply-To: <20240807181148.660157-1-masahiroy@kernel.org>
X-Operating-System: Debian GNU/Linux 12.6
Jabber-ID: nicolas@jabber.no


--m7D6HnzGoX8PnQSC
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu 08 Aug 2024 03:03:00 GMT, Masahiro Yamada wrote:
> On macOS, getline() sets ENOTTY to errno if it is requested to read
> from /dev/null.
>=20
> If this is worth fixing, I would rather pass an empty file to
> scripts/kallsyms instead of adding the ugly #ifdef __APPLE__.
>=20
> Fixes: c442db3f49f2 ("kbuild: remove PROVIDE() for kallsyms symbols")
> Reported-by: Daniel Gomez <da.gomez@samsung.com>
> Closes: https://lore.kernel.org/all/20240807-macos-build-support-v1-12-4c=
d1ded85694@samsung.com/
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  scripts/link-vmlinux.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index f7b2503cdba9..41c68ae3415d 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -219,7 +219,8 @@ kallsymso=3D
>  strip_debug=3D
> =20
>  if is_enabled CONFIG_KALLSYMS; then
> -	kallsyms /dev/null .tmp_vmlinux0.kallsyms
> +	truncate -s0 .tmp_vmlinux.kallsyms0.syms
> +	kallsyms .tmp_vmlinux.kallsyms0.syms .tmp_vmlinux0.kallsyms
>  fi
> =20
>  if is_enabled CONFIG_KALLSYMS || is_enabled CONFIG_DEBUG_INFO_BTF; then
> --=20
> 2.43.0
>=20
>=20

Thanks!  I definitely support moving special MacOS support from source=20
code into scripts and Makefiles.

Might you want to add a comment to truncate, to prevent accidental=20
attempts to revert/refactor this?

Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>

Kind regards,
Nicolas

--m7D6HnzGoX8PnQSC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmazvPAACgkQB1IKcBYm
Emk6UhAAxb9yy+rWy/BcJtl8533FQ4kFHrm9ddEVOQnctWSilpuMba3gP2Kf1gy8
8zVdq57XKg4zmJk2qySS46Og0hbl3Fo6967I+ZIXJCMPxc9V787h+75UJsLdTKzk
9bDMVT2PSBk1LMRB6rK9y0G1IuheafU6roozFQr+x7+DfSelw1ShYD7/Zmgv90EZ
vQLCQDLlg0vlYkqvcecedKMIU0OISXn+csvEho6ukeVpIDzHCuSw2L39Af6argdf
r6L8Gta96qIhDxHoesNcWZxLH52mQotUMKBoDnto+Rom2o+uOL3Q/o/54Q0qQoQQ
5EBdlkDkcrziToe1g2VCL0Lt6+Tn2jCKuOfdIPVaV/xa8vtmJRL5Wv6xyCNw1zYh
bGlF+C/eVr8YZ5vBgnyUdtSTlNDx/4QtF8X05jRYRc+wHO1tUV2g3Mr18+6ULtbo
yoaDZHJV8T7MCD1IZXvMxJ9GX5EV1hRCdrCScxFoIyXG2Q6n4pOXoSrKAqeqL77F
qsIkjuTwkS14OEbzSlwfBIUZfCrxpMz9LZNhoVOevif5AwJiowyltsBYpcySBeUK
IwUJ1DZoLCkMLpH2t+8It271qVhYSv/y3ETwGE/5YSBzUMOdEBsONS7gBXNdBLaB
eYjf3fMuvMbmRCluEw3BgoCRbQJCR7yEEXqiQMns5wthndukiTE=
=Dq6u
-----END PGP SIGNATURE-----

--m7D6HnzGoX8PnQSC--

