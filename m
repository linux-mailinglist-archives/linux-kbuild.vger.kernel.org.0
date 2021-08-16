Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00A5E3EE075
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 01:31:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbhHPXbs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 19:31:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbhHPXbs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 19:31:48 -0400
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C89C061764;
        Mon, 16 Aug 2021 16:31:15 -0700 (PDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4GpVlv3BLjz9sSs;
        Tue, 17 Aug 2021 09:31:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1629156671;
        bh=YNKagkj0w/Z++HsJavgR0XFe1f9k+nbxF7Wm/gC5leI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=qwaFCj6LZXVowpxBWVQ6QRGhHhCHd4Wt30bJZHKDZ+RhKkKQyGLt/7gvrG4U4a1+r
         2ePq4Ju/IxqIiOZxpye2m7gctbE1pGDLSPPo1ouxcL9OOEQR23sH01tX/YIHwWEZ3a
         7ruxfa55NS67Lfq/uwqFjrXqKz2eD4eePW3FS6xVEXjN5YjPAIgZDCwAkvwGf3Mz/p
         0CInUHoMocvgilAT7W0VDiq/AoyXKoQ+f8XxIEQSt9JrzVaZy3zlt8tQuvdIiOSYzt
         xHPBYNoi+SwSwg5ATMflaK7aBbFi50r8LiPy6VLxwrh64BIS58HRBXC/puRkU3t1EQ
         /6OHqwgUtaMxQ==
Date:   Tue, 17 Aug 2021 09:31:06 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Vitor Massaru Iha <vitor@massaru.org>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Daniel Latypov <dlatypov@google.com>,
        linux-kbuild@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>, lkft-triage@lists.linaro.org
Subject: Re: [PATCH] Makefile: remove stale cc-option checks
Message-ID: <20210817093106.71315de3@canb.auug.org.au>
In-Reply-To: <CAKwvOdkckey1=VUHApTcJYufyhdRJ=jb4qYs52f59g6ha7qphw@mail.gmail.com>
References: <20210810204240.4008685-1-ndesaulniers@google.com>
        <CA+G9fYtPBp_-Ko_P7NuOX6vN9-66rjJuBt21h3arrLqEaQQn6w@mail.gmail.com>
        <CAKwvOdkckey1=VUHApTcJYufyhdRJ=jb4qYs52f59g6ha7qphw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/toHh=u=Y5SRXotU7RVYPv46";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--Sig_/toHh=u=Y5SRXotU7RVYPv46
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Mon, 16 Aug 2021 11:37:23 -0700 Nick Desaulniers <ndesaulniers@google.co=
m> wrote:
>
> Thanks for the report. Andrew has dropped the patch from mm-next.
> Looks like it's too soon to remove build configuration tests for
> -mfentry.

I have removed that patch from linux-next today as well.

--=20
Cheers,
Stephen Rothwell

--Sig_/toHh=u=Y5SRXotU7RVYPv46
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmEa9ToACgkQAVBC80lX
0Gz05AgAjSG4Pl77aQUWuGOgD5vrAWBc0gyQxvGKP9TvCVvqg3/6IuAVsDLAdt2o
ONLNxA2MFYJofy7nCniBnh8g46GqKvFKYLhwg8U+/5IU2Vn8NX47d5TKzgyxFWVh
/LJkkh5+tUewDJUsNWVxpS6wPbGwkjaBSaKbZlO3ITvaW3yC8Aqm2xPOC1JBn1at
yQ4eEkhgVGH8g7RWZQXAY87XTYTDZV5LaTagpfpHyHKKmnrImKmeF7ywVJQsl+d/
U4+lLyhDkXHAicjzJKHf/GQAcnnNfjO7IR1PQ3aIpJLmuZHsW0JWp+wiJUFpC5D0
78VWXdohr5V59k49ztdUqKeT4S7jVw==
=d2l8
-----END PGP SIGNATURE-----

--Sig_/toHh=u=Y5SRXotU7RVYPv46--
