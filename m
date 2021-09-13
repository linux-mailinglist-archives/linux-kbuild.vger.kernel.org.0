Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8A74088AE
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Sep 2021 12:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238870AbhIMKDs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 13 Sep 2021 06:03:48 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:59950 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238444AbhIMKDs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 Sep 2021 06:03:48 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 25E301C0BA4; Mon, 13 Sep 2021 12:02:31 +0200 (CEST)
Date:   Mon, 13 Sep 2021 12:02:30 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Marco Elver <elver@google.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20210913100230.GB11752@amd>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
 <CAHk-=wgPaQsEr+En=cqCqAC_sWmVP6x5rD2rmZRomH9EnTQL7Q@mail.gmail.com>
 <c8fb537f-26e5-b305-6bc5-06f0d27a4029@infradead.org>
 <20210913093256.GA12225@amd>
 <YT8d5a6ZVW7JlsRl@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <YT8d5a6ZVW7JlsRl@kroah.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > Do we really want developers treat warnings as errors? When the code
> > is okay but some random version of gcc dislikes it...
> >=20
> > Plus, there's question of stable. We already get ton of churn there
> > ("this fixes random warning"). WERROR will only encourage that...
>=20
> I will not be backporting this patch to older stable kernels, but I
> _want_ to see stable builds build with no warnings.  When we add
> warnings, they are almost always things we need to fix up properly.

Well, everyone _wants_ to see clean builds... unless the price is too
high.

> Over time, I have worked to reduce the number of build warnings in older
> stable kernels.  For newer versions of gcc, sometimes that is
> impossible, but we are close...

You clearly can't backport this patch, but for 5.16-stable, you'll
have it in, and now warnings are same as errors... and I don't believe
that's good idea for stable.

Best regards,
								Pavel
--=20
http://www.livejournal.com/~pavelmachek

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmE/IbYACgkQMOfwapXb+vKcjQCgsx/nkYPj+Zfb6WZVMcX1mNgO
QQcAn0SIZwPJI7cQj6g6p75gp2KIo6FC
=iJmG
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
