Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2734F381679
	for <lists+linux-kbuild@lfdr.de>; Sat, 15 May 2021 09:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232071AbhEOHP0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 15 May 2021 03:15:26 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:44274 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229724AbhEOHPZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 15 May 2021 03:15:25 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 6324B1C0B80; Sat, 15 May 2021 09:14:11 +0200 (CEST)
Date:   Sat, 15 May 2021 09:14:10 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Mackerras <paulus@samba.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] Raise the minimum GCC version to 5.2
Message-ID: <20210515071410.GA27201@amd>
References: <20210501151538.145449-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2fHTh5uZTiUOsy+g"
Content-Disposition: inline
In-Reply-To: <20210501151538.145449-1-masahiroy@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--2fHTh5uZTiUOsy+g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun 2021-05-02 00:15:38, Masahiro Yamada wrote:
> The current minimum GCC version is 4.9 except ARCH=3Darm64 requiring
> GCC 5.1.

Please don't. I'm still on 4.9 on machine I can't easily update,

>  Documentation/process/changes.rst | 2 +-
>  arch/arm64/Kconfig                | 2 +-
>  arch/powerpc/Kconfig              | 2 +-
>  arch/riscv/Kconfig                | 2 +-
>  include/linux/compiler-gcc.h      | 6 +-----
>  lib/Kconfig.debug                 | 2 +-
>  scripts/min-tool-version.sh       | 8 +-------
>  7 files changed, 7 insertions(+), 17 deletions(-)

and 10 lines of cleanups is really not worth that.

Best regards,
								Pavel

--=20
http://www.livejournal.com/~pavelmachek

--2fHTh5uZTiUOsy+g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAmCfdMIACgkQMOfwapXb+vJRuQCgkvFNWySx/cRHndnAzB2BNEcE
fUgAoLeFGahKOr8VmTLEps0tT667xra4
=bRN/
-----END PGP SIGNATURE-----

--2fHTh5uZTiUOsy+g--
