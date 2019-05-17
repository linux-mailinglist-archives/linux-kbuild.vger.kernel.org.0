Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 635AA21370
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 May 2019 07:34:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726937AbfEQFeo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 May 2019 01:34:44 -0400
Received: from ozlabs.org ([203.11.71.1]:51269 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726772AbfEQFeo (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 May 2019 01:34:44 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 454xnD321Lz9s55;
        Fri, 17 May 2019 15:34:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1558071281;
        bh=bw+Mmk5RPWITtoR+Iv5JYFrtaaLoLeyObgBQwi6dcLI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=XCLpFXxXnkGQ6zm1XaFLysJ4ke+eg0uUNPbVm4eSpUxSymtzBrVgkFWdlV4uNl67y
         +pg4cjZ7ZGzybJA46gTTF0Y+L/TXqFhjeQ5oTYMNhFw0Gajxy9C1KVvD0GVma5sG26
         CzutJfEWCXNyUVktPAaQ/kbycG8nLQgy9f4xv3FeaXnNuUDym9exXMYygCXA4N3iwB
         CeLJg3Nm0n7+wshwdDxubzDSL+Q2bbmbIirCG7P5v4odEVCBxY7hwNJ3AWRx4fJo/P
         wOYoiYkd23ko0We7ysw/9iKBahJ7PAFgIaIfowNtOgvC55nTEIJyOzlQrR2wDJSGQD
         h1wk5f7UOSGLg==
Date:   Fri, 17 May 2019 15:34:39 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>,
        Jessica Yu <jeyu@kernel.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>,
        Michael Schmitz <schmitzmic@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Rusty Russell <rusty@rustcorp.com.au>,
        Kees Cook <keescook@chromium.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kbuild: check uniqueness of module names
Message-ID: <20190517153439.3b479334@canb.auug.org.au>
In-Reply-To: <20190517042753.25857-1-yamada.masahiro@socionext.com>
References: <20190517042753.25857-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IlsPisnNmYNysYS_bs/ddIU"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/IlsPisnNmYNysYS_bs/ddIU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

Thanks for this, looks good to me.  Just a nit below.

On Fri, 17 May 2019 13:27:53 +0900 Masahiro Yamada <yamada.masahiro@socione=
xt.com> wrote:
>

> diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
> new file mode 100755
> index 000000000000..c875f6eab01e
> --- /dev/null
> +++ b/scripts/modules-check.sh
> @@ -0,0 +1,20 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +
> +set -e
> +
> +# Check uniqueness of module names
> +check_same_name_modules()
> +{
> +	same_name_modules=3D$(cat modules.order modules.builtin | \
                                                                ^
This trailing '\' is unnecessary after a pipe symbol.

> +				xargs -r basename -a -- | sort | uniq -d)
> +
> +	for m in $same_name_modules
> +	do
> +		echo "warning: same basename if the following are built as modules:" >=
&2
> +		grep -h -e "/$m" modules.order modules.builtin | \

Same here

> +						sed 's:^kernel/:  :' >&2
> +	done
> +}
> +
> +check_same_name_modules

Reviewed-by: Stephen ROthwell <sfr@canb.auug.org.au>

--=20
Cheers,
Stephen Rothwell

--Sig_/IlsPisnNmYNysYS_bs/ddIU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzeR+8ACgkQAVBC80lX
0Gzmhwf7B10c15F0Cw1Alt+7cctlQvs4IV/Lpxcg/nFDLrKaGl9UEiAOS1NiUong
cJuqTud0LO2PP41jUDbNoAwf6a90eLkJ28vhU4xz3l9x7lIHIwd8ziwkmbMHPCrY
q6R63Qi6YKRo1ZbJAcKI671d+Dbkv3/VKArWxXHjha17/lYHOTLr15ASO+oaXyz3
oK8IJ6+hX6wCPNV3RHgQ88GrazAaRlH+XefxCtxsV/lX2avmnk8y0rMwkN3v11nq
CsOpLdpBCMgAFZ4Kpt3yr/XGDYBM9Gb3cFvkKbVbdKSKOuu6GZlAEd1JUwpdcSea
YiAuCZu/OOoiNOhXrv3uDZzEJ48zFg==
=Xu3a
-----END PGP SIGNATURE-----

--Sig_/IlsPisnNmYNysYS_bs/ddIU--
