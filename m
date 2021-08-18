Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A78FF3F0398
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 14:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236163AbhHRMNT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 08:13:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:46356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235943AbhHRMNQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 08:13:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E701360EBC;
        Wed, 18 Aug 2021 12:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629288762;
        bh=v2fKI+bPzybQVJkFbPZ7QLGe6RoSceJs21/Hl1k0DgQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hUhyMLBeZgfsQBRpW04OKFKEt+cZFiRIyyaP96405hbYdXZDgydwe+gmGuNdGXpwZ
         XG34sa/K0ZcCn84t/r6pZj6XD51siUdKWBH3NhzVatKTnIoTSvCdpy0y9tR8lTOIEC
         XY5WSxtSYx/UfqR41V3VDbiriOLiR0Q5K9iJpOwlY2c2DuDeJJPKBQX8SutKaN9VDF
         XWR2v2WNUAVEcJmMU/y6SBMFTdeiBEHi6RHX2OaHevO8QrPVgDAVpSGINu4cRJYQGY
         hCPPhhQiuZ2t/pPTBjW8d20EdjsUpYFnocPmZ+xKZhusJ3R7ZDrvUypikTmTu9maV5
         hYmBUU6Qs6m9g==
Date:   Wed, 18 Aug 2021 13:12:18 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Philip Li <philip.li@intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] kbuild: Enable -Wimplicit-fallthrough for clang 14.0.0+
Message-ID: <20210818121218.GC4177@sirena.org.uk>
References: <20210817005624.1455428-1-nathan@kernel.org>
 <80fa539a-b767-76ed-dafa-4d8d1a6b063e@kernel.org>
 <CAHk-=wgFXOf9OUh3+vmWjhp1PC47RVsUkL0NszBxSWhbGzx4tw@mail.gmail.com>
 <5c856f36-69a7-e274-f72a-c3aef195adeb@kernel.org>
 <202108171056.EDCE562@keescook>
 <3f28b45e-e725-8b75-042a-d34d90c56361@kernel.org>
 <CAK7LNAQFgYgavTP2ZG9Y16XBVdPuJ98J_Ty1OrQy1GXHq6JjQQ@mail.gmail.com>
 <71d76c41-7f9b-6d60-ba4f-0cd84596b457@embeddedor.com>
 <202108171602.159EB2C7EA@keescook>
 <72ae69b4-6069-ade5-a12b-8ee0435f803a@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="OBd5C1Lgu00Gd/Tn"
Content-Disposition: inline
In-Reply-To: <72ae69b4-6069-ade5-a12b-8ee0435f803a@kernel.org>
X-Cookie: She sells cshs by the cshore.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--OBd5C1Lgu00Gd/Tn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 17, 2021 at 04:23:41PM -0700, Nathan Chancellor wrote:

> I do not know of any other CI aside from ours that is testing with tip of
> tree clang and ours should already have a clang that includes my patch since
> it comes from apt.llvm.org.

FWIW we have some testing internally at Arm but that's building from
source so it's not an issue for us.

--OBd5C1Lgu00Gd/Tn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEc+SEACgkQJNaLcl1U
h9CuEgf6AhImdwxnsV8aEvTuQR82slmZtz5rVQrdZSyHW8JWRYTeS4xoYienTEv3
HpFEgAPb0ZVs8fCWfRKg9Lxcdm8h1cOFUgqibjYgS2zWcBhOqGkaAhGNe0tCpvHP
ZZ4uvs82kwjDIHJ0/JFDugThZsfQDpcPnw0UZUTGKX6YZvXwEl+1AMI/eE/cGQPS
EJ+ADZZo9LAyS1iCP/yiNvzE3Oqkv5jS3KxGlG79ezz3oErYklKeD+MjNnimmR2c
SFU2BkiYEGVg5nC70EeqSs+LL2dEg0iFtbfd3/zK26qcEDNCBDHjAMGgO5WmkG7Q
0u18wJuI4eZ2ggkq+/GAVX9IfDvrCQ==
=annl
-----END PGP SIGNATURE-----

--OBd5C1Lgu00Gd/Tn--
