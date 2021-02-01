Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4AE330A0E8
	for <lists+linux-kbuild@lfdr.de>; Mon,  1 Feb 2021 05:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhBAElz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 Jan 2021 23:41:55 -0500
Received: from ozlabs.org ([203.11.71.1]:39671 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231513AbhBAEkX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 Jan 2021 23:40:23 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DTZwr0V83z9tjw; Mon,  1 Feb 2021 15:39:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1612154380;
        bh=N9e+OrU9v4wZN+aFyI2cap/zl5yJU+k4iunRxe0pTGg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N3m2aUY8qrBsG/HZaaVqqfPAuWBXu6xEv9sm6KWRGrykyZVy1oBQluzXxpFdbCHPH
         Wu5A8tQutFVAGTCD0LAyMbBXU7N7Xur9oUZgLiLsHOedT97sxUFhAy1mzQ1F0WbMA/
         3Fv1LLCQeQpE9EYALyNaTfKb3JSelE62/gwsNtNw=
Date:   Mon, 1 Feb 2021 15:07:48 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Frank Rowand <frowand.list@gmail.com>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>, anmar.oueja@linaro.org,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
Message-ID: <20210201040748.GB2251@yekko.fritz.box>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
 <20210120051740.yph4v7zldvs7szdz@vireshk-i7>
 <20210122063455.GE4400@yekko.fritz.box>
 <83242f56-19a5-6d32-c050-8d9f63ac1e47@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <83242f56-19a5-6d32-c050-8d9f63ac1e47@gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 09:42:21PM -0600, Frank Rowand wrote:
> Hi David,
>=20
> On 1/22/21 12:34 AM, David Gibson wrote:
> > On Wed, Jan 20, 2021 at 10:47:40AM +0530, Viresh Kumar wrote:
> >> +David.
> >>
> >> On 19-01-21, 11:12, Frank Rowand wrote:
> >>> On 1/12/21 2:28 AM, Viresh Kumar wrote:
> >>>> We will start building overlays for platforms soon in the kernel and
> >>>> would need fdtoverlay tool going forward. Lets start fetching and
> >>>> building it.
> >>>>
> >>>> While at it, also remove fdtdump.c file, which isn't used by the ker=
nel.
> >>>>
> >>>> V4:
> >>>> - Don't fetch and build fdtdump.c
> >>>> - Remove fdtdump.c
> >>>>
> >>>> Viresh Kumar (3):
> >>>>   scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
> >>>>   scripts: dtc: Build fdtoverlay tool
> >>>>   scripts: dtc: Remove the unused fdtdump.c file
> >>>>
> >>>>  scripts/dtc/Makefile             |   6 +-
> >>>>  scripts/dtc/fdtdump.c            | 163 ----------------------------=
---
> >>>>  scripts/dtc/update-dtc-source.sh |   6 +-
> >>>>  3 files changed, 8 insertions(+), 167 deletions(-)
> >>>>  delete mode 100644 scripts/dtc/fdtdump.c
> >>>>
> >>>
> >>> My first inclination was to accept fdtoverlay, as is, from the upstre=
am
> >>> project.
> >>>
> >>> But my experiences debugging use of fdtoverlay against the existing
> >>> unittest overlay files has me very wary of accepting fdtoverlay in
> >>> it's current form.
> >>>
> >>> As an exmple, adding an overlay that fails to reply results in the
> >>> following build messages:
> >>>
> >>>    linux--5.11-rc> make zImage
> >>>    make[1]: Entering directory '/local/frowand_nobackup/src/git_linus=
/build/dragon_linus_5.11-rc'
> >>>      GEN     Makefile
> >>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scr=
ipts/checksyscalls.sh
> >>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc/scr=
ipts/atomic/check-atomics.sh
> >>>      CHK     include/generated/compile.h
> >>>      FDTOVERLAY drivers/of/unittest-data/static_test.dtb
> >>>
> >>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NO=
TFOUND
> >>>    make[4]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc=
/drivers/of/unittest-data/Makefile:96: drivers/of/unittest-data/static_test=
=2Edtb] Error 1
> >>>    make[3]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc=
/scripts/Makefile.build:496: drivers/of/unittest-data] Error 2
> >>>    make[2]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc=
/scripts/Makefile.build:496: drivers/of] Error 2
> >>>    make[1]: *** [/local/frowand_nobackup/src/git_linus/linux--5.11-rc=
/Makefile:1805: drivers] Error 2
> >>>    make[1]: Leaving directory '/local/frowand_nobackup/src/git_linus/=
build/dragon_linus_5.11-rc'
> >>>    make: *** [Makefile:185: __sub-make] Error 2
> >>>
> >>>
> >>> The specific error message (copied from above) is:
> >>>
> >>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ERR_NO=
TFOUND
> >>>
> >>> which is cryptic and does not even point to the location in the overl=
ay that
> >>> is problematic.  If you look at the source of fdtoverlay / libfdt, yo=
u will
> >>> find that FDT_ERR_NOTFOUND may be generated in one of many places.
> >>>
> >>> I do _not_ want to do a full review of fdtoverlay, but I think that i=
t is
> >>> reasonable to request enhancing fdtoverlay in the parent project to g=
enerate
> >>> usable error messages before enabling fdtoverlay in the Linux kernel =
tree.
> >=20
>=20
> > That's... actually much harder than it sounds.  fdtoverlay is
> > basically a trivial wrapper around the fdt_overlay_apply() function in
> > libfdt.  Matching the conventions of the rest of the library, really
> > it's only way to report errors is a single error code.
> >=20
> > Returning richer errors is not an easy problem in a C library,
> > especially one designed to be usable in embedded systems, without an
> > allocator or much else available.
> >=20
> > Of course it would be possible to write a friendly command line tool
> > specifically for applying overlays, which could give better errors.
> > fdtoverlay as it stands isn't really that - it was pretty much written
> > just to invoke fdt_overlay_apply() in testcases.
>=20
> Thank you for providing that context.
>=20
> I do not know if there is a way to enable the code that is currently in l=
ibfdt
> to both be useful as an embedded library (for example, U-boot seems to of=
ten
> have a need to keep memory usage very small) and also be part of a tool w=
ith
> effective warning and error messages.

Yeah, I don't know either.

> Before having looked at libfdt only at a cursory level while debugging th=
e proposed
> use of fdtoverlay in Linux, my first thought was that maybe it would be p=
ossible
> to add warning and error messages within "#ifdef" blocks, or other ways t=
hat
> cause the error code to _not_ be compiled as part of library version of l=
ibfdt,
> but only be compiled as part of fdtoverlay _when built in the Linux kerne=
l_
> (noting that the proposed Linux patch builds the libfdt files as part of
> the fdtoverlay compile instead of as a discrete library).  After looking =
at
> the libfdt source a tiny bit more carefully, I would probably shoot down =
this
> suggestion, as it makes the source code uglier and harder to understand a=
nd
> maintain for the primary purpose of being an embedded library.

Oof.  That sounds really ugly, but maybe it could be pulled off.

> Do you have any thoughts on how warning and error messages could be added,
> or if it is even possible?  Or maybe your suggestion of writing a "friend=
ly
> command line tool specifically for applying overlays" is the path that
> Viresh should pursue?

I think at this stage it's a matter of trying a few approaches and
seeing what works out.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAXfpQACgkQbDjKyiDZ
s5IlrA//QP622vcV5CrkqDQgErKmVnGmjFnzD+SyqYLngYikvQY1GmhafNPCMNip
dBEN6e2LnTE8B96xQVxJVpAAoGcRp+X8A3IsLRU380npclYPnoY4vc9998Af8lSD
aXHDQT5OmrnbMYhwkm8VKcdwXwf4btblq/I1hRpoAYGmIXBe7Kgcr3ieK0QOD9h0
oiv0oaxpwebndI/d8O46HKkqCrBuz1uKFGHlFy75Xh/xRtMhbsPxzRY7WiPOfi6w
GLhhKI0E4mdpPzidVE5HeY7Wq1fL91eMHDsVzttY/SXHeiHq31ZOG0cKhv/Mhiw9
eiNJv+/l9mQzB5BWo+gz0dlIf4QqqCZ8CjsCpovXtDibtb7OlLts3NVjwjGDPOe6
P3+e2T4uX+2rSdW9jkucKpPtN8nBEyuqFwjro5ezz5512QSocW7szWTWVdyamFN9
RDszvtTGRVIzKvfspxvScLNYLBw3hm1edcjmIMuOh/YtTSUSDvhajWDjZbC9zGsD
YleCuPRYhAyn7j1WKhGS3AliqdIduZY8dD1No6jLGqFRrVVrKGBpfN87hEXWOzj4
M6ULUTA4MgT4+tN0F9ms34dC1689V7Rl7TGwaEtPNZ8QaMkBjBoRCnIKPiA51VgB
Pcy/08xHwbUfgfLx71IsIT1CgdqtsTsa4iN2OwWt6aWnoIZvLGc=
=nEYc
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
