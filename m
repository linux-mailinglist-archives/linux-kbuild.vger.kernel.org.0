Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA564408843
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 11:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238597AbhIMJeO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 05:34:14 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:57012 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238444AbhIMJeO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 05:34:14 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6F4DD1C0B7A; Mon, 13 Sep 2021 11:32:57 +0200 (CEST)
Date:   Mon, 13 Sep 2021 11:32:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel
 builds"
Message-ID: <20210913093256.GA12225@amd>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
 <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> >>  config WERROR
> >>         bool "Compile the kernel with warnings as errors"
> >>-       default y
> >>+       default COMPILE_TEST
> >
> >That seems reasonable. It very much is about build-testing.
>=20
> That and 2 more things IMO:
>=20
> a. having developers be responsible for build warnings, not just
>    build errors
>=20
> b. having maintainers merge them more like they are build errors
>    and not just some warnings that can be overlooked.
>=20
> I don't see enough of a. or b.  :(

Do we really want developers treat warnings as errors? When the code
is okay but some random version of gcc dislikes it...

Plus, there's question of stable. We already get ton of churn there
("this fixes random warning"). WERROR will only encourage that...

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmE/GscACgkQMOfwapXb+vKf6wCeMl/kwYj5SUzbAi0/ynpYblZF
888AoKqSN5XRNc1+75+8cGEAonrC2YAc
=uY8f
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
