Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 287962FE029
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 04:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbhAUDwh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Jan 2021 22:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727980AbhAUAx7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 19:53:59 -0500
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F7D9C061798;
        Wed, 20 Jan 2021 16:51:55 -0800 (PST)
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DLkP40CpCz9sWq; Thu, 21 Jan 2021 11:51:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1611190312;
        bh=HiVHioXSTKBtutywfp29ji3JhD+pMtjFZIbPJ1HuoHs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TvJ+rIHjsw9DsHDBiXVGgbeuHmbFgmjYc926+sjsJ3jfs0NmqTm1md+tQKurHmHd3
         Bl9YWhd4c8KL/q39oEyIbn6x789IzznnUQ4AaNP52eb2jJKxgP+q2QfNeEmFWnLreo
         B9EOOBUj5bnjxvv5wR3AejfKHjjV/jEhl5rlti9g=
Date:   Thu, 21 Jan 2021 11:49:55 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Viresh Kumar <viresh.kumar@linaro.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH V5 4/5] kbuild: Add support to build overlays (%.dtbo)
Message-ID: <20210121004955.GE5174@yekko.fritz.box>
References: <cover.1611124778.git.viresh.kumar@linaro.org>
 <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="FEz7ebHBGB6b2e8X"
Content-Disposition: inline
In-Reply-To: <6e57e9c84429416c628f1f4235c42a5809747c4c.1611124778.git.viresh.kumar@linaro.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--FEz7ebHBGB6b2e8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 20, 2021 at 12:36:46PM +0530, Viresh Kumar wrote:
> Add support for building DT overlays (%.dtbo). The overlay's source file
> will have the usual extension, i.e. .dts, though the blob will have
> .dtbo extension to distinguish it from normal blobs.
>=20
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  .gitignore               | 3 +--
>  Makefile                 | 4 ++--
>  scripts/Makefile.dtbinst | 3 +++
>  scripts/Makefile.lib     | 4 +++-
>  4 files changed, 9 insertions(+), 5 deletions(-)
>=20
> diff --git a/.gitignore b/.gitignore
> index d01cda8e1177..0458c36f3cb2 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -17,8 +17,7 @@
>  *.bz2
>  *.c.[012]*.*
>  *.dt.yaml
> -*.dtb
> -*.dtb.S
> +*.dtb*
>  *.dwo
>  *.elf
>  *.gcno
> diff --git a/Makefile b/Makefile
> index 9e73f82e0d86..b84f5e0b46ab 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1334,7 +1334,7 @@ endif
> =20
>  ifneq ($(dtstree),)
> =20
> -%.dtb: include/config/kernel.release scripts_dtc
> +%.dtb %.dtbo: include/config/kernel.release scripts_dtc
>  	$(Q)$(MAKE) $(build)=3D$(dtstree) $(dtstree)/$@
> =20
>  PHONY +=3D dtbs dtbs_install dtbs_check
> @@ -1816,7 +1816,7 @@ clean: $(clean-dirs)
>  	@find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
>  		\( -name '*.[aios]' -o -name '*.ko' -o -name '.*.cmd' \
>  		-o -name '*.ko.*' \
> -		-o -name '*.dtb' -o -name '*.dtb.S' -o -name '*.dt.yaml' \
> +		-o -name '*.dtb' -o -name '*.dtbo' -o -name '*.dtb.S' -o -name '*.dt.y=
aml' \
>  		-o -name '*.dwo' -o -name '*.lst' \
>  		-o -name '*.su' -o -name '*.mod' \
>  		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
> diff --git a/scripts/Makefile.dtbinst b/scripts/Makefile.dtbinst
> index 50d580d77ae9..ba01f5ba2517 100644
> --- a/scripts/Makefile.dtbinst
> +++ b/scripts/Makefile.dtbinst
> @@ -29,6 +29,9 @@ quiet_cmd_dtb_install =3D INSTALL $@
>  $(dst)/%.dtb: $(obj)/%.dtb
>  	$(call cmd,dtb_install)
> =20
> +$(dst)/%.dtbo: $(obj)/%.dtbo
> +	$(call cmd,dtb_install)
> +
>  PHONY +=3D $(subdirs)
>  $(subdirs):
>  	$(Q)$(MAKE) $(dtbinst)=3D$@ dst=3D$(patsubst $(obj)/%,$(dst)/%,$@)
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 213677a5ed33..30bc0a8e0087 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -86,7 +86,9 @@ extra-$(CONFIG_OF_ALL_DTBS)	+=3D $(dtb-)
> =20
>  ifneq ($(CHECK_DTBS),)
>  extra-y +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> +extra-y +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-y))
>  extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> +extra-$(CONFIG_OF_ALL_DTBS) +=3D $(patsubst %.dtbo,%.dt.yaml, $(dtb-))
>  endif
> =20
>  # Add subdir path
> @@ -324,7 +326,7 @@ cmd_dtc =3D $(HOSTCC) -E $(dtc_cpp_flags) -x assemble=
r-with-cpp -o $(dtc-tmp) $< ;
>  		-d $(depfile).dtc.tmp $(dtc-tmp) ; \
>  	cat $(depfile).pre.tmp $(depfile).dtc.tmp > $(depfile)
> =20
> -$(obj)/%.dtb: $(src)/%.dts $(DTC) FORCE
> +$(obj)/%.dtb $(obj)/%.dtbo: $(src)/%.dts $(DTC) FORCE
>  	$(call if_changed_dep,dtc)

If you're using overlays, you probably need the -@ flag, for both the
base file and the overlays, which AFAICT is not already the case.

> =20
>  DT_CHECKER ?=3D dt-validate

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--FEz7ebHBGB6b2e8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAIz7IACgkQbDjKyiDZ
s5LNVQ/+J1yNGFsJCG7bQzYaJ/gdL8oMx4bjOpmsu0hTzJGWTx6PrcqKESor8A0W
bAw6ZWccNsbi/6SvVWm9nMzKHCT+XUzvvH9n1qMb9bzoqYZKQq/JHyv/awJRoRmB
EoB5qtbn9qjyQgFR93n4DfIpN+Ex+8ln5Iho+7RHdrqbpOoGI7Ox0YxIr/D4A4+k
nFKT00H7pT1H30Rvn9UdjxCz1vt1LT+aXRfN4L3QKwESLYnuhsE3IJAm+/co35fy
PUOnox9zZ/x2b/RE3j0ghptAWCbEQ6r27abHCK1TqgbguAh5VMVIgsLHlVJakqpS
YQjKir4MnLpPPNeUSYL3r/iPonXcGqh5G9z/PuuudDi+ZRlXRUJxHENDrzXMWp7E
EoVTipJhwJNxA67FQWHAmoWOgDvsadvNP6ncjVVsaJcamKchwIQW1mojd4zWEeLH
HD3XfAW1+AX86POKZQlJ5RdcyraZEctMnfV2m7Ae9symBiAtX84cyAVZVYckNzv8
BTvaZYfodoxWZZVxh6SWgl0UHnAElD15sMyalYfuUVFFXtbEm68w6U3quxhSumw0
qSRcCWBzyCXLTt512kkv+gwOKqtQdoUuBpWW9dxzMrNlCpUev5QJYrkvXl5ftwii
Kokiz2dY2rKo2jh2YTy2+YtKH4SK5uR43+z3Bx8FpUvmU4D2n0A=
=ZOFm
-----END PGP SIGNATURE-----

--FEz7ebHBGB6b2e8X--
