Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718A6430708
	for <lists+linux-kbuild@lfdr.de>; Sun, 17 Oct 2021 09:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234703AbhJQH0L (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 17 Oct 2021 03:26:11 -0400
Received: from jabberwock.ucw.cz ([46.255.230.98]:34600 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232716AbhJQH0I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 17 Oct 2021 03:26:08 -0400
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 284931C0B76; Sun, 17 Oct 2021 09:23:57 +0200 (CEST)
Date:   Sun, 17 Oct 2021 09:23:56 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     kernel list <linux-kernel@vger.kernel.org>,
        vitaly.lubart@intel.com, tomas.winkler@intel.com,
        daniele.ceraolospurio@intel.com, jani.nikula@linux.intel.com,
        joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
        intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org,
        masahiroy@kernel.org
Subject: Re: intel_mei_pxp: needs better help text
Message-ID: <20211017072356.GA4756@duo.ucw.cz>
References: <20211014105334.GA19786@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Content-Disposition: inline
In-Reply-To: <20211014105334.GA19786@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

Extended Cc list. Should I attempt to prepare a patch?

Best regards,
							Pavel

On Thu 2021-10-14 12:53:34, Pavel Machek wrote:
>=20
> CONFIG_INTEL_MEI_PXP:
>=20
> MEI Support for PXP Services on Intel platforms.
>=20
> Enables the ME FW services required for PXP support through
> I915 display driver of Intel.
>=20
>=20
> That's ... very useless help text. According to
> https://www.phoronix.com/scan.php?page=3Dnews_item&px=3DIntel-PXP-Protect=
ed-Xe-Path
> this is some kind of DRM. Help text should probably say it has to do
> with i915 video, and explain the acronyms, and probably its usecases.
>=20
>=20
>=20
> --=20
> http://www.livejournal.com/~pavelmachek



--=20
http://www.livejournal.com/~pavelmachek

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCYWvPjAAKCRAw5/Bqldv6
8tHNAJ9QYSkmp7jyhFkIJg8sv/IS7PuVzQCfX4fQagMXQURLHXIhTgDjk9oOj5s=
=vhjq
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
