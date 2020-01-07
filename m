Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58B30131DD0
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jan 2020 04:03:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727481AbgAGDDC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jan 2020 22:03:02 -0500
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:59314 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727416AbgAGDDC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jan 2020 22:03:02 -0500
Received: from [192.168.4.242] (helo=deadeye)
        by shadbolt.decadent.org.uk with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <ben@decadent.org.uk>)
        id 1iof8v-0008BM-Ii; Tue, 07 Jan 2020 03:02:53 +0000
Received: from ben by deadeye with local (Exim 4.93)
        (envelope-from <ben@decadent.org.uk>)
        id 1iof8v-0059ry-4n; Tue, 07 Jan 2020 03:02:53 +0000
Message-ID: <3d7ba1397e3af10e9e79082437da60a2c759e08c.camel@decadent.org.uk>
Subject: Re: [PATCH v2 04/13] initramfs: rename gen_initramfs_list.sh to
 gen_initramfs.sh
From:   Ben Hutchings <ben@decadent.org.uk>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Greg Thelen <gthelen@google.com>,
        "H. Peter Anvin" <hpa@zytor.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Tue, 07 Jan 2020 03:02:47 +0000
In-Reply-To: <CAK7LNAT2ai=-wbLmU2hqihbzVy7kKCGg=ipOK09XtSWiDYMW1Q@mail.gmail.com>
References: <20200104150238.19834-1-masahiroy@kernel.org>
         <20200104150238.19834-5-masahiroy@kernel.org>
         <xr93ftgt6ndv.fsf@gthelen.svl.corp.google.com>
         <CAK7LNAT2ai=-wbLmU2hqihbzVy7kKCGg=ipOK09XtSWiDYMW1Q@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-pydIA3pqIthWuyOSi5Sx"
User-Agent: Evolution 3.34.1-2+b1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.168.4.242
X-SA-Exim-Mail-From: ben@decadent.org.uk
X-SA-Exim-Scanned: No (on shadbolt.decadent.org.uk); SAEximRunCond expanded to false
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--=-pydIA3pqIthWuyOSi5Sx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-01-06 at 19:26 +0900, Masahiro Yamada wrote:
> (+CC Ben Hutchings, H. Peter Anvin)
>=20
> In my understanding, the klibc build system is standalone.
> So, the change in Linux kernel does not affect klibc at all.
> Only the depending part is UAPI headers (make headers_install).
>=20
> So, this patch
> (https://lore.kernel.org/patchwork/patch/1175336/)
> should be OK.
>=20
> Please correct me if I am wrong.

I think you're right.

[...]
> I do not think so.
>=20
> As I stated above, the klibc build system is independent of
> any script in the Linux kernel.
>=20
> The klibc Makefile refers to
> scripts/gen_initramfs_list.sh, which does not exist.
[...]

Right.  I believe the original intent was to include klibc in the
kernel tree, so this would have existed because of that.

There's no sign of that in the current klibc.git, but I think it might
have gone through "git filter-branch" at some point after it was
decided not to include it upstream.  In any case, this was already
broken for as long as klibc has been separate.

Ben.

--=20
Ben Hutchings
Larkinson's Law: All laws are basically false.



--=-pydIA3pqIthWuyOSi5Sx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl4T9NgACgkQ57/I7JWG
EQkZsRAAgNCsDnpcylyh73hEce5L27rBxfMFOjHE4D2QElm1z72pQcVYL1eT/02S
FM0GgKvjugyofvRM3JAcPh11jptJR3qWFpyE6tILyJ5ThIqxFA0sYPeGngkVRhbJ
sN6yrLIujw6NZKrfrpHFz9t91vKstR0QoHtW3AAJ3129vxRAXRzih15FLm++Sfyg
Wuv28Qrlf/zWkXiHNwbcp+VpbMQ0eMg2N1PVIgZdmsNsxdtfeT5qOkkt7e/VvGwn
yRcJQZrMZgjE7gWVN7RNqdNB31gy6Dre4RfQ/gIhy4DWFWxI4hWZWCBtQsMKEMHd
j+ulHSlaX2IN4mSqE5fmDi/DUjY/DPyGd61k4sevwiWJfbI8eGxo7FBMuzvF5wV0
D2VROXpeCqgEwy7Hmw3XQzPkUTAtlOVq/cHeGEvuo5i2CBfSQ4U8VYmmvbseV+JE
dpkkZSZsctRbPJZJ0Id/5CPwwaof2b5Sy5qmmbdLtHXy246SqNeQ9NDZ2PdQZpus
5C9XDlHtil3EPuUHITHf0ELW0zY3DVSLnn/MKYbBvF5mfxInf+l278ZBT4z1DlLl
DtMfFdtHPT/iRCeyoodu/+supeQawrqUkDgL4QRnfBvxr1UTPlIZLfdMD3cF6j4G
U9ndHUg0R7Air23eCWIvnutD9xY9NSYeqQu8ZibuixU+nGp/4GQ=
=oLsl
-----END PGP SIGNATURE-----

--=-pydIA3pqIthWuyOSi5Sx--
