Return-Path: <linux-kbuild+bounces-5073-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 047839EC094
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 01:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B24681699E7
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Dec 2024 00:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B085680;
	Wed, 11 Dec 2024 00:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Vtmg4+Vt"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D4DA95C;
	Wed, 11 Dec 2024 00:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733876236; cv=none; b=RJt8rFSfyO0allooD/62NNWdpve5HlTPTCxHLFKrZjr6Z42Q8GJnNYCj9NJIJKKfkXCn06WWae9mhkcfI2o8IT1NL6kDf/OF+vEpkwHRGAIXPAge7uyG/q6OraGtadJdmUxs1oiJlcHyhto/ShZlB1gmW7TYO0ZkGONOfsR5ygI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733876236; c=relaxed/simple;
	bh=ChQuXlxcg6hRLHbp9EFuFK2D6u/tqKUDbAe7p/pByuU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FrT71b2cLNry8gt4H0py3FSfj6McXqeB+Mx6kY35EXq40fqpZDHZZGNNu9rytipd3q/uxMWzfjIl5Bx8ZwK+LZKJiDGTyv82XJcvq10NcHM1+MgL4WBVMou7xuoKFPBz0gsdoz0yT3q/l954JRnGLOaUbWNyPMIaOb32baji/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Vtmg4+Vt; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1733876225; x=1734135425;
	bh=ChQuXlxcg6hRLHbp9EFuFK2D6u/tqKUDbAe7p/pByuU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Vtmg4+VtXzFhezCK1jLZaflDPyqSjH7z54rPB5oPep4t+b2zGPZk1Y6aWdbDkTG/3
	 lTqnRYVIlZ4lL3vMwbzXtMJJVf4PK/nXqBdYy47ynjRJ1PTcfYGguAIPSVWgCf1ELE
	 TQycIz+ptBCuwIebMIsv2g2UxwdtVLvlwm3ar3kycPaRueV+2PU50+K2fbbIt5GhAO
	 BAOJcgS1QGKhwmLTUygLFHAXdQUKxGFlNwa6pndBoPkrkEPS7B5o57mxOwnx/ldoYp
	 YO5s0OtVdRLo8S0kHHZVGNpIqSu9znT2FaZtr7Kn9KGau76et+kwnfNWtVwfWczDQ5
	 P8RY9KjJBt0Hg==
Date: Wed, 11 Dec 2024 00:17:02 +0000
To: =?utf-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
From: Ihor Solodrai <ihor.solodrai@pm.me>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Kui-Feng Lee <kuifeng@fb.com>, Alan Maguire <alan.maguire@oracle.com>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, bpf@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next] kbuild, bpf: Enable reproducible BTF generation
Message-ID: <REDzg-0aL2-Qw7QvYCKTfsLGh6E6Iq8dgWJPo5a94ym2x5DiUkwdHA-naUtaDO7HJgvOr6zd201E5P_WAquOyOFIiUij6Bi183EyxPusDuo=@pm.me>
In-Reply-To: <20241211-pahole-reproducible-v1-1-22feae19bad9@weissschuh.net>
References: <20241211-pahole-reproducible-v1-1-22feae19bad9@weissschuh.net>
Feedback-ID: 27520582:user:proton
X-Pm-Message-ID: 5d2a7ed76ef656598100a56bd46c9c3d33d2a969
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tuesday, December 10th, 2024 at 3:23 PM, Thomas Wei=C3=9Fschuh <linux@we=
issschuh.net> wrote:

>=20
>=20
> Pahole v1.27 added a new BTF generation feature to support
> reproducibility in the face of multithreading.
> Enable it if supported and reproducible builds are requested.
>=20
> As unknown --btf_features are ignored, avoid the test for the pahole
> version to keep the line readable.
>=20
> Fixes: b4f72786429c ("scripts/pahole-flags.sh: Parse DWARF and generate B=
TF with multithreading.")
> Fixes: 72d091846de9 ("kbuild: avoid too many execution of scripts/pahole-=
flags.sh")
> Link: https://lore.kernel.org/lkml/4154d202-5c72-493e-bf3f-bce882a296c6@g=
entoo.org/
> Link: https://lore.kernel.org/lkml/20240322-pahole-reprodicible-v1-1-3eaa=
fb1842da@weissschuh.net/
> Signed-off-by: Thomas Wei=C3=9Fschuh linux@weissschuh.net
>=20
> ---
> scripts/Makefile.btf | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/scripts/Makefile.btf b/scripts/Makefile.btf
> index c3cbeb13de503555adcf00029a0b328e74381f13..da23265bc8b3cf43c0a1c89fb=
c4f53815a290e13 100644
> --- a/scripts/Makefile.btf
> +++ b/scripts/Makefile.btf
> @@ -22,6 +22,7 @@ else
>=20
> # Switch to using --btf_features for v1.26 and later.
> pahole-flags-$(call test-ge, $(pahole-ver), 126) =3D -j$(JOBS) --btf_feat=
ures=3Dencode_force,var,float,enum64,decl_tag,type_tag,optimized_func,consi=
stent_func,decl_tag_kfuncs
> +pahole-flags-$(if $(KBUILD_BUILD_TIMESTAMP),y) +=3D --btf_features=3Drep=
roducible_build

Hi Thomas,

There are a couple of issues with reproducible_build flag which I
think are worth mentioning here. I don't know all the reasons behind
adding this now, and it's optional too, so feel free to discard my
comments.

Currently with this flag, the BTF output is deterministic for a given
order of DWARF compilation units. So the BTF will be the same for the
same vmlinux binary. However, if the vmlinux is rebuilt due to an
incremental change in a source code, my understanding is that there is
no guarantee that DWARF CUs will be in the same order in the binary.

At the same time, reproducible_build slows down BTF generation by
30-50%, maybe more depending on the kernel config.

Hopefully these problems will be solved in upcoming pahole releases.

Question: why KBUILD_BUILD_TIMESTAMP flag? Isn't it more appropriate
to use a separate flag for this particular feature?

Thanks.

>=20
> ifneq ($(KBUILD_EXTMOD),)
> module-pahole-flags-$(call test-ge, $(pahole-ver), 126) +=3D --btf_featur=
es=3Ddistilled_base
>=20
> ---
> base-commit: 7cb1b466315004af98f6ba6c2546bb713ca3c237
> change-id: 20241124-pahole-reproducible-2b879ac8bdab
>=20
> Best regards,
> --
> Thomas Wei=C3=9Fschuh linux@weissschuh.net
>=20
>=20


