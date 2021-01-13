Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421882F4B9E
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jan 2021 13:49:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725949AbhAMMrk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 13 Jan 2021 07:47:40 -0500
Received: from mx1.emlix.com ([136.243.223.33]:34702 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbhAMMrk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jan 2021 07:47:40 -0500
X-Greylist: delayed 421 seconds by postgrey-1.27 at vger.kernel.org; Wed, 13 Jan 2021 07:47:39 EST
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id 3E5D15FA09;
        Wed, 13 Jan 2021 13:39:57 +0100 (CET)
From:   Rolf Eike Beer <eb@emlix.com>
To:     linux-kernel@vger.kernel.org, Alistair Delva <adelva@google.com>
Cc:     kernel-team@android.com, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: improve libelf detection
Date:   Wed, 13 Jan 2021 13:39:53 +0100
Message-ID: <1773849.ZV7lO1mt4u@devpool47>
Organization: emlix GmbH
In-Reply-To: <20210112190010.1582888-1-adelva@google.com>
References: <20210112190010.1582888-1-adelva@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1932816.7BvnNAJlAO"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--nextPart1932816.7BvnNAJlAO
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Rolf Eike Beer <eb@emlix.com>
To: linux-kernel@vger.kernel.org, Alistair Delva <adelva@google.com>
Cc: kernel-team@android.com, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] kbuild: improve libelf detection
Date: Wed, 13 Jan 2021 13:39:53 +0100
Message-ID: <1773849.ZV7lO1mt4u@devpool47>
Organization: emlix GmbH
In-Reply-To: <20210112190010.1582888-1-adelva@google.com>
References: <20210112190010.1582888-1-adelva@google.com>

Am Dienstag, 12. Januar 2021, 20:00:10 CET schrieb Alistair Delva:
> When `pkg-config --libs' wasn't used or didn't return anything useful,
> the test for libelf would fail even if the headers and libraries were
> available to kbuild via KBUILD_HOSTCFLAGS and KBUILD_HOSTLDFLAGS.
>=20
> This makes the check in the core Makefile match the check that is done
> in tools/objtool/Makefile. Specifically, the C compiler is passed the
> full KBUILD_HOSTCFLAGS and KBUILD_HOSTLDFLAGS, which may have set up
> additional sysroot/include/library search paths to find libelf.

Sounds plausible.

=2D-=20
Rolf Eike Beer, emlix GmbH, http://www.emlix.com
=46on +49 551 30664-0, Fax +49 551 30664-11
Gothaer Platz 3, 37083 G=C3=B6ttingen, Germany
Sitz der Gesellschaft: G=C3=B6ttingen, Amtsgericht G=C3=B6ttingen HR B 3160
Gesch=C3=A4ftsf=C3=BChrung: Heike Jordan, Dr. Uwe Kracke =E2=80=93 Ust-IdNr=
=2E: DE 205 198 055

emlix - smart embedded open source

--nextPart1932816.7BvnNAJlAO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iLMEAAEIAB0WIQQ/Uctzh31xzAxFCLur5FH7Xu2t/AUCX/7qGQAKCRCr5FH7Xu2t
/Pt8A/9VXf5zZ6AIu08yd945F+E9KewLjbsziI+YZ6uQy8ZEhNNLCVz8KgM3l5dV
fxsFt1v1/Hpg4iIiAYtU4i6PFkM3YsfSp+2tWJyAU8snM3iewOnkL7z4m09EAs4H
jUZWATfm+DK+CBkAlS9UZd+Dr99AOw1kGvWkSEm6FdT0LNXHbw==
=tr7/
-----END PGP SIGNATURE-----

--nextPart1932816.7BvnNAJlAO--



