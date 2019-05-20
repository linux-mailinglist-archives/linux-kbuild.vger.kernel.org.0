Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8ED22978
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 May 2019 02:04:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728016AbfETAEl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 19 May 2019 20:04:41 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:43469 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727720AbfETAEl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 May 2019 20:04:41 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 456fK20cjwz9s3l;
        Mon, 20 May 2019 10:04:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1558310678;
        bh=pZcgB5aQrClEmkJbHCnZA6xWxdkeqKTCyUtTxpH7sYo=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=iB3S1IwJZiOzvGM5FdZcY27eyAoaF+65n6TlJ9euu6Of0clySD0G5GeGZiKE5MO6F
         UQfUFzXDeuXwYsiQiyqrMTyA0VCFuDSvvqvMaxitNuH2RXnRw8QAWVCr4xw/DbBwy9
         e5HAgj4xLTwORdq7uoJrFsQToiVc6qDVVbBBcvYIYrrISDVm/Vli3Y4SgMmOuK0d39
         QSeqHHgN7e+BuCXLsDlkiTDFhGmmWBryXldImwetipuacYwbj2G9CVdUujkNsiZecc
         /nW83IIFnhInicDqmKjVeZcUJ9Gsb0wBOY+yDHoDTLSRyjrNC+bFuwxGz+teBnPe7b
         frLaXys4o9xxQ==
Date:   Mon, 20 May 2019 10:04:37 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Bernd Petrovitsch <bernd@petrovitsch.priv.at>,
        Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] kbuild: check uniqueness of module names
Message-ID: <20190520100437.54142214@canb.auug.org.au>
In-Reply-To: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
References: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3dAX7L8JPnsN0p+_o1m6Pq5"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/3dAX7L8JPnsN0p+_o1m6Pq5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

On Sat, 18 May 2019 01:07:15 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>=20
> +++ b/scripts/modules-check.sh
> @@ -0,0 +1,16 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +# Check uniqueness of module names
> +check_same_name_modules()
> +{
> +	for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
> +	do
> +		echo "warning: same basename if the following are built as modules:" >=
&2
> +		sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2

(bringing out my bike shed paint brush :-))
this could be
	sed -n "/\/$m/s:^kernel/:  :p" ...

--=20
Cheers,
Stephen Rothwell

--Sig_/3dAX7L8JPnsN0p+_o1m6Pq5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzh7xUACgkQAVBC80lX
0GxtuQf/XV73OxF/ig8/6h1gF16geBlX31hBIHbQ/lqzfZ02xQ98N6dzkDP72cvK
HAblUyWj3ZeGB6x4OASl1wCNHdRTFr5ex/422Si65InuHCelpVBYRqq6PfMljCKg
pAaDVJ5+IUmlkMN/gSsvhJCdEaZ+5IS/C3k7TH2P1XNLaTe9C+LHpWNQfKeypmIZ
MuFd9ufZ2bdSRUhmmoctBfDv35ErEJu9I4+bup2/E4K/AkTvv6Ux0s7EAPJYnP3Z
c97dMHwaMUQoHlgmTHTVTCWP7ckpc/jPleu8Yyr7SQlzOPt+UIqsqKnDcb5ioAGZ
YbrwTkP7ORCZv2fSxLpA/1V9/e1MKQ==
=ycTi
-----END PGP SIGNATURE-----

--Sig_/3dAX7L8JPnsN0p+_o1m6Pq5--
