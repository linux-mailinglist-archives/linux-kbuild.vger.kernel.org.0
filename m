Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD43B1594AE
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2020 17:19:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729235AbgBKQTI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 11 Feb 2020 11:19:08 -0500
Received: from foss.arm.com ([217.140.110.172]:49324 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727561AbgBKQTI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 11:19:08 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6478830E;
        Tue, 11 Feb 2020 08:19:07 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DDA833F68E;
        Tue, 11 Feb 2020 08:19:06 -0800 (PST)
Date:   Tue, 11 Feb 2020 16:19:05 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        ALSA Development Mailing List <alsa-devel@alsa-project.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [RFC] ASoC: Use imply for SND_SOC_ALL_CODECS
Message-ID: <20200211161905.GM4543@sirena.org.uk>
References: <20200207091351.18133-1-geert@linux-m68k.org>
 <CAK7LNAQGcw1jbb=fWd_CbWv5hQrkqG_QFCw3uY4LXroONGM6BA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="AQYPrgrEUc/1pSX1"
Content-Disposition: inline
In-Reply-To: <CAK7LNAQGcw1jbb=fWd_CbWv5hQrkqG_QFCw3uY4LXroONGM6BA@mail.gmail.com>
X-Cookie: Hire the morally handicapped.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--AQYPrgrEUc/1pSX1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2020 at 01:09:30AM +0900, Masahiro Yamada wrote:

> Why does SND_SOC_ALL_CODECS exist in the first place?
> Is this compile-test or run-test?

It's for compile coverage.

> If it is the former, allyesconfig / allmodconfig
> covers all of them.

No it doesn't.  Those only enable user selectable options, many CODEC
drivers don't have user selectable options as they are selected by
machine drivers some of which either have more platform specific
dependencies that the CODEC drivers or aren't upstream.

--AQYPrgrEUc/1pSX1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5C0/gACgkQJNaLcl1U
h9DTdQf9Gk62wuqjst/9b6n+rQ0tlvq5rLi2q9impw+CjR2IVskAK4uCiioeMyQr
XiKWja8Ip1YsZT5ZPBJLSrti3pphLOQCn52hL8FsJiOrlvork/ZdOP3ebEJnE038
1ASs3ReEJ90eNmA54QJQaC1ufL9CyxJ023osbd9dZTEJ6UNSfEEPxCBnNznINYHw
KGxkJyxzCKpyDi1Ri1VBCuIgt0phvhXeYlQDn071epm/w6RQbOknmJnHK8DKrkTh
N26AF0h8JXdOKEKalEcVgVbjNf/ZZDaWWiRh+KmmYdVCkMbtzlUP3uTMLrDTF3Vw
TD0x1ByKAWkdsVxKpKH8jw/3BfGpYQ==
=uTKZ
-----END PGP SIGNATURE-----

--AQYPrgrEUc/1pSX1--
