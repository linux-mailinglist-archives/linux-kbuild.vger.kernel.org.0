Return-Path: <linux-kbuild+bounces-3616-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5141F97BF12
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 18:24:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BD2F1C20F1F
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Sep 2024 16:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5EEF1BC062;
	Wed, 18 Sep 2024 16:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b="Kd0G40gn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.94])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D43EAC6;
	Wed, 18 Sep 2024 16:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.42.244.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726676652; cv=none; b=hkXZdP8qLvyuwJ4QN/rnE8xWwD/KygBdz0OlvLBMuhOi21074QiZjgXhaGV+4odPx7t2SCZ5GgAS5rXC3yNzAE+t6bdDrqo1rT8YhaTPJV5AodFTK06gZ+RCpyAQLDnp3CuaXGDGcD619Wp1GQZqa1MC9Il+m8lo0imG5FJZPW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726676652; c=relaxed/simple;
	bh=v4srWa54wrNGyko4K4u56hrNP/STbrE3QgoWOwtwKtQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QznLqRCHfkcg7PIDtpQVPZK3MOr4kSP8BBFSqrEOp07r72evdHm+Xrr24kn/U+Jt1S4ULpdW0g0UZqN3BLT9hEaMeMqWm9FJJenXQuEBTCwwiuGeDFyML/TL425kKEbLNAnrhBLa2Q+wyZECTvNymW646uDmJdwLr+cKPVgoczk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de; spf=pass smtp.mailfrom=avm.de; dkim=pass (1024-bit key) header.d=avm.de header.i=@avm.de header.b=Kd0G40gn; arc=none smtp.client-ip=212.42.244.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=avm.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=avm.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
	t=1726676647; bh=v4srWa54wrNGyko4K4u56hrNP/STbrE3QgoWOwtwKtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kd0G40gnoRASQ1t+WuqSE9ke0KAeP2nU5/LvLCoo+5DpwyxNkvzBlLO+u91vFntRz
	 BEsBZB6MWjNreLb87KQDeTfD9D7+HWfK6oRdW19/PecNoANh611INIIzGueoECXgIE
	 4YC33N3EegTY89ExI8hbBOhboEYpqTFTxe7LdR90=
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 18 Sep 2024 18:24:07 +0200 (CEST)
Received: from l-nschier-nb (unknown [83.68.141.146])
	by mail-auth.avm.de (Postfix) with ESMTPSA id 42F9280130;
	Wed, 18 Sep 2024 18:24:07 +0200 (CEST)
Date: Wed, 18 Sep 2024 18:24:05 +0200
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 04/23] kbuild: doc: remove the description about shipped
 files
Message-ID: <Zur-pVW_2oBJdjgy@l-nschier-nb>
References: <20240917141725.466514-1-masahiroy@kernel.org>
 <20240917141725.466514-5-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="09H9jjuh+dXBHf1Q"
Content-Disposition: inline
In-Reply-To: <20240917141725.466514-5-masahiroy@kernel.org>
X-purgate-ID: 149429::1726676647-E1626DC4-09DE9648/0/0
X-purgate-type: clean
X-purgate-size: 3876
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean


--09H9jjuh+dXBHf1Q
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2024 at 11:16:32PM +0900, Masahiro Yamada wrote:
> The use of shipped files is discouraged in the upstream kernel these
> days. [1]
>=20
> Downstream Makefiles have the freedom to use shipped files or other
> options to handle binaries, but this is not what should be advertised
> in the upstream document.
>=20
> [1]: https://lore.kernel.org/all/CAHk-=3DwgSEi_ZrHdqr=3D20xv+d6dr5G895CbO=
Ai8ok+7-CQUN=3DfQ@mail.gmail.com/
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  Documentation/kbuild/modules.rst | 35 +++-----------------------------
>  1 file changed, 3 insertions(+), 32 deletions(-)

Do you want to remove the TODO point refering to *_shipped files from
Documentation/kbuild/makefiles.rst as well?

$ git grep -Hrne _shipped Documentation/
Documentation/kbuild/makefiles.rst:1668:- Describe how kbuild supports ship=
ped files with _shipped.

>=20
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modu=
les.rst
> index 7eceb9a65e9c..1afa6b1b4090 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
[...]
> @@ -240,35 +235,11 @@ module 8123.ko, which is built from the following f=
iles::
>  		default:
>  			$(MAKE) -C $(KDIR) M=3D$$PWD
> =20
> -		# Module specific targets
> -		genbin:
> -			echo "X" > 8123_bin.o_shipped
> -
>  	The split in example 2 is questionable due to the simplicity of
>  	each file; however, some external modules use makefiles
>  	consisting of several hundred lines, and here it really pays
>  	off to separate the kbuild part from the rest.
> =20
> -3.3 Binary Blobs
> -----------------
> -
> -	Some external modules need to include an object file as a blob.
> -	kbuild has support for this, but requires the blob file to be
> -	named <filename>_shipped. When the kbuild rules kick in, a copy
> -	of <filename>_shipped is created with _shipped stripped off,
> -	giving us <filename>. This shortened filename can be used in
> -	the assignment to the module.
> -
> -	Throughout this section, 8123_bin.o_shipped has been used to
> -	build the kernel module 8123.ko; it has been included as
> -	8123_bin.o::
> -
> -		8123-y :=3D 8123_if.o 8123_pci.o 8123_bin.o
> -
> -	Although there is no distinction between the ordinary source
> -	files and the binary file, kbuild will pick up different rules
> -	when creating the object file for the module.
> -

I think renumbering the following sections would provide a more consistent =
document.  If you think that keeping the numbering constant:  would you min=
d adding a note about section 3.3 being removed?
(And possibly as well in the table of contents?)

Either way,

Reviewed-by: Nicolas Schier <n.schier@avm.de>

--09H9jjuh+dXBHf1Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmbq/qUACgkQiMa8nIia
bbgtRQ/8CVG4VeA5XKboBTYzhHtk92dYGJWO3WCgIESOPICa6lq/mRnGOJTUQSqX
yjXIUgv29yxF0tjmoQ1PBHR1yrUMRvtMNc80RGuYUc5JOprQDLq2tW6PXvmwjL1/
N3KxuNzNp3fz9DTNaIKs6BBgHMely4Wnzu/sSx2ZLIk1mN7sdTdbRyh8XRHo1t7O
Qb0fCUddbk+CqluyNhbfOkMU5H6JmZ+MJTYYF97v2dBjoDdI/ohnrdDXKw8M0gYY
YXJwtalcXsEk/kS5YUUCrexgtzPfbOpkjhqFqpT0PAgVeMKI/8luc3lDBX7jjE4O
5gnSF1ivjqmR6aBTJJJFqsOC6ZYji8xry2IHosLpMdwHT7UYiWDMN1POJITlSGhu
jGqcPUReb05tSXepKxMENoweIudjEXLY6ghXOVi1W5+H8nFFT3yIQ3DaDrGhKlz6
ECaVZBivIHjHrV6swVFh0H1rWJCyZoBZ4hpNYfiuZ0zl/1KToRTYGarm4pvK9o0v
5BG775NJEVAP9YHF20nFzg/LieVmMrV578Yw9UL7vY7FcvmJpx9LY3fy3PyOUutT
MhZTCdByJOMif6uSgckNDQVJcgdc/Q6zz3SJvYOmnwRMg2iNqdZ14Pj8c3Tncs/G
BM3l5r1RoVh9eBbKJz+KDJ1LgNL/MXXNYBCV8Y/oj1ot+9riEs4=
=dewM
-----END PGP SIGNATURE-----

--09H9jjuh+dXBHf1Q--

