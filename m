Return-Path: <linux-kbuild+bounces-6781-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE3AA0C4E
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 14:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 519605A31FB
	for <lists+linux-kbuild@lfdr.de>; Tue, 29 Apr 2025 12:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 781648BEE;
	Tue, 29 Apr 2025 12:54:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7862D1922
	for <linux-kbuild@vger.kernel.org>; Tue, 29 Apr 2025 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745931287; cv=none; b=LfwCCyboVS46dlxojoDkrqLmVv7nJZzjDWYKNBfodc/BbPKIJN8xZ00//wb2NaF4JDi1Hs2DKQWPclLaCyAxIUXlijt0chyNbPgzqxyHVdtV5DAGpkq01broB7z5bBxu5PK9gT49FcDz1CQHtPXzLV4kYJw2IULLytbXdbJQUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745931287; c=relaxed/simple;
	bh=U6IXl+OeXnl8K/0Nb0K0YO/fYuOrSQntUmXRnW6XOPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=U6VmlolvvDtHD2lLLuzwBSiOqByfjXAOKtTyS34zNuQxFkfAj9fIXn5hSozC9mXhN3AMfOpz/hZZG6rG7SMeW2vzfwVsuzwKGOiKrssunlNPtEYrqvzO/J7ZpIgbp5SMndxkVcOYeQWSxhhga84WAAvPXRKfDQ16TOYGIIjIwLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
Received: from [172.16.0.1] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.52.1)
	(envelope-from <n.schier@avm.de>)
	id 6810cad8-603b-7f0000032729-7f000001a310-1
	for <multiple-recipients>; Tue, 29 Apr 2025 14:49:28 +0200
Received: from mail-notes.avm.de (mail-notes.avm.de [172.16.0.1])
	by mail.avm.de (Postfix) with ESMTP;
	Tue, 29 Apr 2025 14:49:28 +0200 (CEST)
Received: from l-nschier-aarch64.ads.avm.de ([172.17.89.123])
          by mail-notes.avm.de (HCL Domino Release 14.0FP4)
          with ESMTP id 2025042914492842-14743 ;
          Tue, 29 Apr 2025 14:49:28 +0200 
Date: Tue, 29 Apr 2025 14:49:27 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Kees Cook <kees@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: how to create early build deps?
Message-ID: <20250429-emerald-macaw-of-correction-efa87b@l-nschier-aarch64>
References: <202504161928.17A90D9B@keescook>
 <20250425-bouncy-logical-ringtail-4d879a@lindesnes>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250425-bouncy-logical-ringtail-4d879a@lindesnes>
Organization: AVM GmbH
X-MIMETrack: Itemize by SMTP Server on ANIS1/AVM(Release 14.0FP4|March 10, 2025) at
 29.04.2025 14:49:28,
	Serialize by Router on ANIS1/AVM(Release 14.0FP4|March 10, 2025) at
 29.04.2025 14:49:28,
	Serialize complete at 29.04.2025 14:49:28
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Sh/LPi75mZ82OTrT"
Content-Disposition: inline
X-purgate-ID: 149429::1745930968-44C02263-5F137704/0/0
X-purgate-type: clean
X-purgate-size: 2630
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean


--Sh/LPi75mZ82OTrT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Apr 2025, Nicolas Schier wrote:
[...]
> > By what mechanism can I convince kbuild to rebuild everything if
> > randstruct.seed (or the gcc-plugins) are changed?
>=20
> I think the easiest way to achieve a full rebuild due to changes in
> scripts/basic/randstruct.seed would be to let it show up in
> .$(target).cmd.  Limited testing with a very hacky thing like
>=20
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 8c311b997e24..1aceedfe0791 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -206,4 +206,5 @@ if_changed_dep =3D $(if $(if-changed-cond),$(cmd_and_=
fixdep),@:)
>  cmd_and_fixdep =3D                                                      =
       \
>         $(cmd);                                                          =
    \
>         $(objtree)/scripts/basic/fixdep $(depfile) $@ '$(make-cmd)' > $(d=
ot-target).cmd;\
> +       sed -i -re 's,../include/linux/compiler.h,& $(objtree)/scripts/ba=
sic/randstruct.seed,' $(dot-target).cmd ;\
>         rm -f $(depfile)
>=20
> looks promising to me.  But as far as I can see, fixdep does not have
> similar hard-coded dependencies included, yet.  Thus I am unsure if
> fixdep is really the this we want to touch for randstruct.seed.

well, touching fixdep would really not be a nice option.  I'll send a=20
patch that forces the rebuild by adding=20
include/generated/randstruct_hash.h to include/linux/compiler-version.h.

Thanks for the report!

Kind regards,
Nicolas

--Sh/LPi75mZ82OTrT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmgQytMACgkQiMa8nIia
bbjEGw/5AY7kKlDWJCSUyiDBeiUcQNh52im+uhS/zEuYSeRyk6SK1bNSyUmxHp2G
YuxC5OuG7mycjRMKk1vNH3nvySeHJdc5axnfUer8CziMVas5lu51B9r6/b46RMxt
98nj2iuepb0nDWSsv5gS/c0evZYcj+BF4EmgEb0niXAabyObsrkR8GTVHnFWKpz7
yA/KgiGs2P8WoCuzRq8DP3xstUiaXaVlXJSMuG102nUT0T6GtYEWNKADJv59T2LG
Wd+xB5+5Z/fXyYUR70j9BUFYjRFNk1AKlDYyB05E6MMuvCO6EA9u42iYqphfevdI
njdCULdyd5oxjebi0Nq9TJk3ud7ivmDXgcWLwnJUg2ZW32L0KxVkVISsYCCsv1K5
28TwL9tbvNc0eqq4Inku3fz8IdNEOu3HwG+oY0QnN2vsjKI135CXk2eXHn8A7fBk
QEqTC31VmFGf62M01ybJNXbx1mJ7BU8PReQHlVpyFOoEBZOhtdWZP2ism4W3gHzV
BNllhBjrbFy7g0u7GzMsZWX4mtxhH77fAQcVmipHB3gfVuGmiQJboUq62hibgGUM
kQdv/40pwtMQShOscdrCUO+dtR6BuzR+OjANBiMy+yX73wJw2N4M1UmMckSe/S0A
uPMaFRDC0y++9lgeTxA0mlftdWLyupLEf5p2q/saPAYyV9qaMAk=
=pu0D
-----END PGP SIGNATURE-----

--Sh/LPi75mZ82OTrT--

