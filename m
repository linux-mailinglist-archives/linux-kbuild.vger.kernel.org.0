Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D9B403192
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 01:35:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345710AbhIGXgz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 19:36:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:45612 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231519AbhIGXgz (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 19:36:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D3286610C8;
        Tue,  7 Sep 2021 23:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631057748;
        bh=6Z5C24l+Nn5gCus4xIpvDMsQ10y2qd3z5H9hvJwqCAQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=r7NCcd40KNgY9Hd2had6m7GQMB+MJPGL3oWq6CpYF9pu0B6z50NnEg2HY5M7BbYmw
         b642w1AcOWtslVleSN/aThpfPEMIXzRZ4vKhk68hY6TXQkGzWI8awZ+sHbzj4lVs9h
         7l6t16vPSLv5qC1vlpdtIAXPqd8n9DNIRHgSC3Cf49wY3Ro0XVQ5+zNlWezAy9WwE8
         SKuAaz9nVtuwO+7PV4rUFd1e8eeO8Km4/fsXIt6/dDymn3w74ExvVddfIgwzyn9Qtz
         kE1bZVVRrWJ39+tGVgCZaHGQZYrGVGW0zqNY1N/GLkre3fX5NDJTfUVrBc99IaV9ug
         bsTIwMYh29ZDA==
Date:   Wed, 8 Sep 2021 00:35:12 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
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
Message-ID: <20210907233512.GA4071@sirena.org.uk>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
X-Cookie: Non-sequiturs make me eat lampshades.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 07, 2021 at 12:16:22PM -0700, Linus Torvalds wrote:
> On Tue, Sep 7, 2021 at 11:39 AM Nick Desaulniers
> <ndesaulniers@google.com> wrote:

> > The above commit seems as though it was merged in response to
> > https://lore.kernel.org/linux-hardening/CAHk-=wj4EG=kCOaqyPEq5VXa97kyUHsBpBn3DWwE91qcnDytOQ@mail.gmail.com/.

> No. It was merged in response of _years_ of pain, with the last one
> just being the final drop.

> I'm not going to revert that change. I probably will have to limit it
> (by making that WERROR option depend on certain expectations), but
> basically any maintainer who has code that causes warnings should
> expect that they will have to fix those warnings.

Echoing what others have said about runtime testing having -Werror on by
default for defconfigs is going to cause issues for bisection and just
generally noticing promptly when runtime issues are introduced - people
or systems bisecting boot or testsuite issues will encounter more blocks
of commits that they skip due to unrelated issues, and it's much more
likely that we'll just have gaps in coverage when for example the day's
-next has some random warning on some platforms.  In terms of
prioritisation it feels like the wrong call to have -Werror on
everywhere.

The bisection really is helpful, especially when the people looking at
the problem don't have direct access the systems to be able to run tests
themselves - it really increases the quality of reports when the
automation in CI services is able to identify the likely commit, and
makes it *much* more likely those reports be sent in the first place.

Of course this isn't insurmountable, the test systems can always add
config fragments to tweak the configurations they're testing (they
already need to do this to run lots of kselftest for example) but that's
something we've generally tried to minimise since everyone working with
custom configs has generally caused friction in the past.

> And it really shouldn't be "Linus cares about warnings, so
> configurations that Linus doesn't test can continue for years to have
> them".

> My "no warnings" policy isn't exactly new, and people shouldn't be
> shocked when I then say "time to clean up *YOUR* house too".

IME pushing on this stuff it's not that people don't care, it's that
they naturally have different test coverage due to their particular
interests and the resources available to them.  Even people who are very
dilligent in their own testing and paying a lot of attention to -next
and the automated test stuff that's out there are going to introduce
some breakage from time to time, and sometimes there's good reasons for
processes to get short circuited.

Some of this is also on the people doing the more niche stuff to keep on
top of reporting issues that come up as they do so, they should be able
to expect that people will pay attention when they do so but the more
niche you get the less surprising it is when nobody else notices issues.

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmE39zAACgkQJNaLcl1U
h9BW7gf/RfYzzbUHixWw/gmzBD7+an9JYWpEsUOJ8Vefg5WDCPaWk/V441rZ0E6j
/GWZKr2MUF+R+0py96KUjcnwi3QET3tKtheUGUN6zFWGUZ1VhO6ZaWDCKnXjZ+zR
HvCi7AlhECX9EJRKuENqhrhtjd5AKnrqpaqCzwVDiC37JjlY89yrE1nE307nUClV
9TGHszSS6+3oSbsmGbq7Y4i4eu90T74Lb2uK+HinZlVEgX/zWw363SPHzvDARO/0
2O1grc4g2cWLKEd6UxP5yuEEa/5Qtb0L7Tjtbz4a/vW52xTBUYjnelfAikBZxAME
Xl/Bn8WGsLblpyQLuWS73KjW3zuXLA==
=XmAd
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
