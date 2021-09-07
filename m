Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2788B403136
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 00:55:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243642AbhIGW5E (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 18:57:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:42736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhIGW5E (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 18:57:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D619F610F8;
        Tue,  7 Sep 2021 22:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631055357;
        bh=pqhuRk0JknHnJoif+xNYU0aw4+UPHhsHd3PdJqaE6nU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C9ZhrRrXpOxTlgadYR58CPb6Li7eLXtXUKYDme/9JCzsXWZAmzYZnWKNB8gP3gS5c
         cg1FnKYaX76sBWsXgLkeMl1mpts8nt7xqGQ9ismdWXQfSP82ALS6xMjj/eizIUMM+t
         Y/BPIY2CfX7WipIgkeAYWvj6xFSXInRGRAGoPNwQvNoACYqMy+FlK0F9BxWpOal5Sk
         WJhUUqEFizq5/FZoga8AnkRyxCKmqj3Z9B6lQaFjzbxPQHVk1aw84mARsQRWUb1G1/
         n+p3WZDOBU8cdXYO0x23Gb6Ln1J6nUnBH/y8u5y/apIw9v3z52a/W18COnaf2t9wyE
         5PyVzy3IfQrqQ==
Date:   Tue, 7 Sep 2021 23:55:22 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Marco Elver <elver@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
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
Message-ID: <20210907225522.GA24901@sirena.org.uk>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
 <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com>
 <YTfkO2PdnBXQXvsm@elver.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="r5Pyd7+fXNt84Ff3"
Content-Disposition: inline
In-Reply-To: <YTfkO2PdnBXQXvsm@elver.google.com>
X-Cookie: <<<<< EVACUATION ROUTE <<<<<
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 08, 2021 at 12:14:19AM +0200, Marco Elver wrote:

> I'm predicting most distributions and runtime-focused CIs will disable
> the warning.

Yes, indeed.

> Date: Tue, 7 Sep 2021 23:12:08 +0200
> Subject: [PATCH] kbuild: Only default to -Werror if COMPILE_TEST
>=20
> The cross-product of the kernel's supported toolchains, architectures,
> and configuration options is large. So large, that it's generally
> accepted to be infeasible to enumerate and build+test them all
> (many compile-testers rely on randomly generated configs).

Reviwed-by: Mark Brown <broonie@kernel.org>

--r5Pyd7+fXNt84Ff3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE37dkACgkQJNaLcl1U
h9D/+ggAgWj/i1gizRbWFFYr2BLDiU+b9vUEurxkkajDDZ19kGHmsvHVl3VirsYS
gzf7J1+LL6hrJ+xp2GgtG+IoxMblhCpEBOv0MUbzE8u2MfzmDpn4l2tzNCK9uCty
IwkYbn+/FrBdchGXTnaGpjbaapNmfH6Dma8ujgaZ2mmayRKjNmoqEMNMaitZkh2p
0d9dyoV3D5k/VNn/SEP0ki5tGV64twL3v9jnDJQEpdAL1imwscG61BCpi+vs1xf6
nf69gmf8P+JZ1/UFwAB3RHWf7DlMjF0v2NHONrD0aBrqZU8ibDb0tmdyTHSbY8+g
stQN1SzdP64hyzvQcju9LH6ERV6KOg==
=7aSj
-----END PGP SIGNATURE-----

--r5Pyd7+fXNt84Ff3--
