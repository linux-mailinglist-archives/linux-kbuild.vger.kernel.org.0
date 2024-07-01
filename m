Return-Path: <linux-kbuild+bounces-2301-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B553191EB48
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jul 2024 01:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E6252832F4
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Jul 2024 23:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E4B85626;
	Mon,  1 Jul 2024 23:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="S7+J/66n"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACB438DD9;
	Mon,  1 Jul 2024 23:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719875787; cv=none; b=DZAOOtQ1yPg/hNCREPIN8O0OEzrEEV6xw06pRJHa02LphLISRRODXDca7eHpL7vFWJXxDV7OpQPYtYwK8MZZ+Yv9Z9bxQ9GiAXpZfLuOryfqIVgihIsvATwedBL3ZJhCVc1uwGmLBBNPeeUVphKaa05nHlRp4oQ7N9AKTX4onlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719875787; c=relaxed/simple;
	bh=tSU39dZciMDb8sRhmnUcIch2vV1Fa5AdS7QF6XJHPJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iG1G8wzXS0uHbSz1N0x4sHY2FWFdeat5BsQT0SzXAAebWEGDyYBnBF0xf/ax6PnqQ7IdDtA+CZt8fZ2EQ4MQEBRS1dPKb64B7rvOVieOWgPye2xXkYJK7T52nPyVb1gCOpY6HjT5gOB7GcAKX0ut7Dkit6rQ2hB+TFLiIBseQGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=S7+J/66n; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1719875775;
	bh=Y8wHQu+h5olE2m0mvmAj9n3XXWT5DGPtyl9UEjbVIzY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=S7+J/66nJaCPaCOgTDPPPUJBYNj0XZ1xwsfXirzp99Pz3/6Wa+jGoX6GFXhSOBVvo
	 9XSWs8wOMfzX6nG6f/wFeXzD9Y/x51/zm5BvY508UZ0m6zojXbXnb/5Y1A2WIWpsDt
	 6wccVVskeFD3tgm6ovPaOf4qtuIyrCLHuFJfR7E+tFzIJYIWLnzOjWI1pHxxvgzfG7
	 CeUfJtIxT0bxSOrcdOWaSuJfVYxR3Bxwv6WJ+HEueBl6HcoFjHPfQUvfwOaQ2qhsw2
	 8NCHi5/WOOVaKebYM2HWYHGEgNFf1LtiAwDQI1kGDMlUUvNNYdrDlwryNNWRdq9cI/
	 qXiJAAjFDdbOQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WChk7257bz4wcC;
	Tue,  2 Jul 2024 09:16:14 +1000 (AEST)
Date: Tue, 2 Jul 2024 09:16:14 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Mirsad Todorovac <mtodorovac69@gmail.com>, Mark Brown
 <broonie@kernel.org>, Linux Kernel Build System
 <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PROBLEM linux-next] ERROR: modpost: "devm_qcom_tzmem_pool_new"
 [drivers/firmware/qcom/qcom-scm.ko] undefined!
Message-ID: <20240702091614.2334b182@canb.auug.org.au>
In-Reply-To: <CAMRc=MczeH+ptirFQpFi968m+-4RoABa43M5VQUx4guZTZxLSw@mail.gmail.com>
References: <9d1156b9-cdf1-44be-b65d-45b17c0b681e@gmail.com>
	<CAMRc=MczeH+ptirFQpFi968m+-4RoABa43M5VQUx4guZTZxLSw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gEVH0E3.cizaTH.FlNpjhWH";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/gEVH0E3.cizaTH.FlNpjhWH
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Bart,

On Mon, 1 Jul 2024 09:33:47 +0200 Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Fri, Jun 28, 2024 at 8:27=E2=80=AFPM Mirsad Todorovac <mtodorovac69@gm=
ail.com> wrote:
> >
> > In vanilla linux-next next-20240627 branch, there seems to be a build e=
rror with
> > KCONFIG_SEED=3D0x44AB31A6.
> >
> > The error log is:
> >
> > ~/linux/kernel/linux-next$ time nice make -j 36 bindeb-pkg |& tee ../er=
r-6.10-rc5-next-20240627-29.log; date
> >   GEN     debian
> > dpkg-buildpackage --build=3Dbinary --no-pre-clean --unsigned-changes -R=
'make -f debian/rules' -j1 -a$(cat debian/arch)
> > dpkg-buildpackage: info: source package linux-upstream
> > dpkg-buildpackage: info: source version 6.10.0-rc5-38
> > dpkg-buildpackage: info: source distribution jammy
> > dpkg-buildpackage: info: source changed by marvin <marvin@defiant>
> >  dpkg-source --before-build .
> > dpkg-buildpackage: info: host architecture amd64
> >  make -f debian/rules binary
> > #
> > # No change to .config
> > #
> > mkdir -p /home/marvin/linux/kernel/linux-next/tools/objtool && make O=
=3D/home/marvin/linux/kernel/linux-next subdir=3Dtools/objtool --no-print-d=
irectory -C objtool
> > mkdir -p /home/marvin/linux/kernel/linux-next/tools/bpf/resolve_btfids =
&& make O=3D/home/marvin/linux/kernel/linux-next subdir=3Dtools/bpf/resolve=
_btfids --no-print-directory -C bpf/resolve_btfids
> >   INSTALL libsubcmd_headers
> >   INSTALL libsubcmd_headers
> >   CALL    scripts/checksyscalls.sh
> >   UPD     init/utsversion-tmp.h
> >   CC      init/version.o
> >   AR      init/built-in.a
> >   CHK     kernel/kheaders_data.tar.xz
> >   AR      built-in.a
> >   AR      vmlinux.a
> >   LD      vmlinux.o
> >   OBJCOPY modules.builtin.modinfo
> >   GEN     modules.builtin
> >   MODPOST Module.symvers
> > ERROR: modpost: "devm_qcom_tzmem_pool_new" [drivers/firmware/qcom/qcom-=
scm.ko] undefined!
> > make[5]: *** [scripts/Makefile.modpost:145: Module.symvers] Error 1
> > make[4]: *** [Makefile:1886: modpost] Error 2
> > make[3]: *** [debian/rules:74: build-arch] Error 2
> > dpkg-buildpackage: error: make -f debian/rules binary subprocess return=
ed exit status 2
> > make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
> > make[1]: *** [/home/marvin/linux/kernel/linux-next/Makefile:1555: binde=
b-pkg] Error 2
> > make: *** [Makefile:240: __sub-make] Error 2
> >
> > real    0m5.950s
> > user    0m15.971s
> > sys     0m10.430s
> > Fri Jun 28 20:22:03 CEST 2024
> > ~/linux/kernel/linux-next$
> >
> > Please find attached .config, just to be sure that we are talking about=
 the same thing.
> >
> > Best regards,
> > Mirsad Todorovac =20
>=20
> The fix for this is in the qcom tree[1] but I'm not sure why it still
> hasn't been pulled into next. I don't see any notifications about
> conflicts in next which could be the reason. Cc'ing Mark and Stephen.
>=20
> Bart
>=20
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit=
/?h=3Dfor-next&id=3Dd96377892dd89bd4e7e5ae7293647f6bc7bddf7d

The qcom tree has another build failure and so new versions of it have
not been merged into linux-next since June 24.  Hopefully today the
other build failure will be fixed.

--=20
Cheers,
Stephen Rothwell

--Sig_/gEVH0E3.cizaTH.FlNpjhWH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmaDOL4ACgkQAVBC80lX
0GyGRQgAo2Wta0jZeIzedy6FN/CUQwgG42NjJmW9mHJypbFEi36DohRLHHpyqMsk
gGfkxvRRuNbzbK5ES3ni2j0rfRt357l2uFYmMkfA52J0ZxyZ+taBpUiRELh1aTge
1L0tGm5AOwoYY9md1AV4iUPgo9OFmVK9WVUPaJCPD/BEoWA8Gc4GBkm9vImay3ts
zXnCZKXtq97Nbaa4i8mjaiP6LcP8zWAmqXDCurRGDdudwDehV6zLv7EhNQB4agn+
0CyxQoWjgakbts/m5cD7KOEzbp3a1cq5nYFGKDxmcq2VGj5/qjUkRGnPJRMPXOg6
Wq+HC70SBoGwThQMQPp6OZtHTkIq1w==
=YIZu
-----END PGP SIGNATURE-----

--Sig_/gEVH0E3.cizaTH.FlNpjhWH--

