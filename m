Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C40B66D889
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 09:46:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236183AbjAQIqz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 03:46:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236242AbjAQIqd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 03:46:33 -0500
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F10232CFFC
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Jan 2023 00:46:18 -0800 (PST)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
        by mail.avm.de (Postfix) with ESMTPS;
        Tue, 17 Jan 2023 09:46:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
        t=1673945175; bh=fAt88WbIbC+v4MMTzOt+wZMESEhARWAzX+407Atwoec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xiOjah/6I5tvpLyQUgXd9MuIAqqDoH/PReqQAvyiNtCFery4StbjfjEj+0w3c3+uR
         AENJ04lX7MzXmXHbHj40h8zxqA0vc9buDvXgdAi9+g5F084RWpUesiHUmAr7ZKyPHm
         Qa26zJWyk+/1+N/vgpZzxe5nwLk32pxSbgtVZM50=
Date:   Tue, 17 Jan 2023 09:46:02 +0100
From:   Nicolas Schier <n.schier@avm.de>
To:     Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Amy Parker <apark0006@student.cerritos.edu>
Subject: Re: [PATCH] kheaders: explicitly validate existence of cpio command
Message-ID: <Y8ZgTgtA9oH8W17Y@buildd.core.avm.de>
Mail-Followup-To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        Amy Parker <apark0006@student.cerritos.edu>
References: <20230117-kernel-kheaders-cpio-v1-1-058d3e1c8621@weissschuh.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dpXCB7SDqqrl+bBO"
Content-Disposition: inline
In-Reply-To: <20230117-kernel-kheaders-cpio-v1-1-058d3e1c8621@weissschuh.net>
X-purgate-ID: 149429::1673945175-E5FE9DA2-A9E12ADD/0/0
X-purgate-type: clean
X-purgate-size: 2646
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--dpXCB7SDqqrl+bBO
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Jan 2023 09:46:02 +0100
From: Nicolas Schier <n.schier@avm.de>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org,
	Amy Parker <apark0006@student.cerritos.edu>
Subject: Re: [PATCH] kheaders: explicitly validate existence of cpio command

On Tue, Jan 17, 2023 at 05:30:43AM +0000, Thomas Wei=C3=9Fschuh wrote:
> If the cpio command is not available the error emitted by
> gen_kheaders.so is not clear as all output of the call to cpio is
> discarded:
>=20
> GNU make 4.4:
>=20
>   GEN     kernel/kheaders_data.tar.xz
> find: 'standard output': Broken pipe
> find: write error
> make[2]: *** [kernel/Makefile:157: kernel/kheaders_data.tar.xz] Error 127
> make[1]: *** [scripts/Makefile.build:504: kernel] Error 2
>=20
> GNU make < 4.4:
>=20
>   GEN     kernel/kheaders_data.tar.xz
> make[2]: *** [kernel/Makefile:157: kernel/kheaders_data.tar.xz] Error 127
> make[2]: *** Waiting for unfinished jobs....
> make[1]: *** [scripts/Makefile.build:504: kernel] Error 2
>=20
> Add an explicit check that will trigger a clear message about the issue:
>=20
>   CHK     kernel/kheaders_data.tar.xz
> ./kernel/gen_kheaders.sh: line 17: type: cpio: not found

Thanks for the patch!  What would you think about an even more verbose
message?  Perhaps something like:

    echo >&2 ' *** "cpio" is required for "CONFIG_IKHEADERS". >&2

Reviewed-by: Nicolas Schier <n.schier@avm.de>

Kind regards,
Nicolas

--dpXCB7SDqqrl+bBO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEDv+Fiet06YHnC6RpiMa8nIiabbgFAmPGYEoACgkQiMa8nIia
bbjCSQ//TdrltRwCTswcDKx7qoUGhSTDgVvZYiQJ0Sn+W1cL5j70Kl9qrXvD8pke
M2RmLLHSRIewkZmc+qEJBlrFK1WD48LMnwleq+zSXUgAMjGMvc9DdCLN0K9Y0C1a
L4agawARh0313wZMgWi9wj29yDQD8Z0fIk0OirCkEFVkz3PwPKL0b/gGKT1+9Jtn
pvnrBUDJ6wUeF28Seg/LR8n9vvNx1m+MH08wQr8xQL4uSW1e4feIbH13KaXOZkWK
mqjFCg85UelD/LUw2dxIOrK3uc0+/EqZvh23wMfA60DRASqUsuEB+Tp2N3EYP3BA
1vII5MNsOIJEKJ0S7v2vl2lo/ZcgvYCwABdibqJCbyIKegn4aCc1zs/w/9BTxbFU
6W9jz30lGzzAmXFQP8iR7nehh/MBAcsaJYGYxopRv2rXIx59LjX6Lu2GtZaAobwm
7xgArkbReUK6TTa5DiUal7Cm40oVyvnwvI5TDVMCjvk+BbMCiF2gEcg459ymWhyp
FY1N9KzYwcXbeyZOnKpxXnghYRKyPRLbiGXjqVIWMYLFxSai197AEeu8KjKBwXp2
ZmshLRKxd88x2dGHxFyJpuxA+4suXfc2vr74J63rWrrE80q/FPv48+HpZTaI6V+C
vDEFmnVoMRIIF/wd6/MIKFARwosL/voO3K1xCG6/yhy5xfEykfY=
=OpfU
-----END PGP SIGNATURE-----

--dpXCB7SDqqrl+bBO--
