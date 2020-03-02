Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E945175B71
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 14:21:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbgCBNV6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 08:21:58 -0500
Received: from foss.arm.com ([217.140.110.172]:60728 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727334AbgCBNV6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 08:21:58 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDC762F;
        Mon,  2 Mar 2020 05:21:57 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 32FEA3F534;
        Mon,  2 Mar 2020 05:21:57 -0800 (PST)
Date:   Mon, 2 Mar 2020 13:21:55 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Richard Cochran <richardcochran@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
Message-ID: <20200302132155.GF4166@sirena.org.uk>
References: <20200219074950.23344-1-masahiroy@kernel.org>
 <CAMuHMdU7=jRNCWvtiFhJwUM6P4xNmqwXdPX14qvE=6by1V7APA@mail.gmail.com>
 <CAK7LNATKh9Y_QmO19iPw+zXT8RG-HfXBFY5bvpX0YSyOO-=NGA@mail.gmail.com>
 <CAMuHMdWNhd3kwqQ2OYOscq3VFDjip_FZtt8w6PVCenz095kCZg@mail.gmail.com>
 <CAK7LNAQNb-5RdivSwMONVT_YCXohR-0NMJW5ceVrJPxWUGF+Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rMWmSaSbD7nr+du9"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQNb-5RdivSwMONVT_YCXohR-0NMJW5ceVrJPxWUGF+Lg@mail.gmail.com>
X-Cookie: Whistler's mother is off her rocker.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--rMWmSaSbD7nr+du9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2020 at 05:21:51PM +0900, Masahiro Yamada wrote:
> On Wed, Feb 19, 2020 at 6:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> > I always do, when running make oldconfig ;-)

> > I only see expected changes from y to m.
> > I don't see any unexpected changes from m to n.

> This is because you used oldconfig.

> The 'imply' keyword defines the default
> of symbols _without_ user-defined values.

This is going to make the behaviour of imply statements a bit
inconsistent which doesn't seem ideal though it's *probably* fine for
the SND_SOC_ALL_CODECS case.

--rMWmSaSbD7nr+du9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5dCHIACgkQJNaLcl1U
h9D7iAf+PCYi3hwZfSI7GUn9mnmz3xVd890KXV1oVj/Ydpqg88/cMNF99lnezlzV
MF4B10UmHMv02hHHRxFuX4J7sYecAU6E8cNs3fnrraA5ykrW6hXq83DFprv4PqYi
X0EyO1dj3jEMxRRE7Q2wESspE9QFg/EoHz+fej7B1LU7Os3YVYMfDISUjZkWbl3y
l566hoDDN2XfcrP/k+tpv/qFQ5xc2kHjBliUH2F8PCETePWYVN0qXBE6UdfIuKar
Gyj7JIZEXtZzU8BauE1QGQ1SXYFB5C8ezu75MfxX9sXtzvr3UR3eO8A9AtqsCItx
u6DiWozVeV+kWjI0V7F0EXdCCD6mKw==
=rptL
-----END PGP SIGNATURE-----

--rMWmSaSbD7nr+du9--
