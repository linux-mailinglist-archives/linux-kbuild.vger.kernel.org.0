Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6903210C7
	for <lists+linux-kbuild@lfdr.de>; Mon, 22 Feb 2021 07:18:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhBVGSB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 22 Feb 2021 01:18:01 -0500
Received: from ozlabs.org ([203.11.71.1]:41957 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229961AbhBVGR5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 22 Feb 2021 01:17:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
        id 4DkX5j3XzHz9sRf; Mon, 22 Feb 2021 17:17:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
        d=gibson.dropbear.id.au; s=201602; t=1613974633;
        bh=hFMgpQbIDNA/vjq/9bMC+FNx+AbA//njIc4FudBaRz8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L79xAQolI/Vdh49QhB8h/LdmGui/Jab+e4Rn5vqG3v+6iTD/3Hq+7XvBSycpkfgNf
         NCF/Mm/8RBPMYuIozwqSedeST/bZgp2B99S0hKeMXdQjSR5ZnxtS5ZjOrW8FhWpzfD
         7d3Tza21bLhsfg0JCpwiPh9DrLDnSxH/NVQhQoWQ=
Date:   Mon, 22 Feb 2021 17:17:08 +1100
From:   David Gibson <david@gibson.dropbear.id.au>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Bill Mills <bill.mills@linaro.org>,
        Anmar Oueja <anmar.oueja@linaro.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH V4 0/3] scripts: dtc: Build fdtoverlay
Message-ID: <YDNMZMFJtiL5rZi5@yekko.fritz.box>
References: <cover.1610431620.git.viresh.kumar@linaro.org>
 <74f8aa8f-ffab-3b0f-186f-31fb7395ebbb@gmail.com>
 <20210120051740.yph4v7zldvs7szdz@vireshk-i7>
 <20210122063455.GE4400@yekko.fritz.box>
 <83242f56-19a5-6d32-c050-8d9f63ac1e47@gmail.com>
 <20210201040748.GB2251@yekko.fritz.box>
 <CAL_JsqJjR7EknfnbA7RKckUtYVu9jmjf7L_DC=LmF=jMGfThgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="8LcDNZpJwHFkagdo"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJjR7EknfnbA7RKckUtYVu9jmjf7L_DC=LmF=jMGfThgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--8LcDNZpJwHFkagdo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 04, 2021 at 08:25:23AM -0600, Rob Herring wrote:
> On Sun, Jan 31, 2021 at 10:39 PM David Gibson
> <david@gibson.dropbear.id.au> wrote:
> >
> > On Mon, Jan 25, 2021 at 09:42:21PM -0600, Frank Rowand wrote:
> > > Hi David,
> > >
> > > On 1/22/21 12:34 AM, David Gibson wrote:
> > > > On Wed, Jan 20, 2021 at 10:47:40AM +0530, Viresh Kumar wrote:
> > > >> +David.
> > > >>
> > > >> On 19-01-21, 11:12, Frank Rowand wrote:
> > > >>> On 1/12/21 2:28 AM, Viresh Kumar wrote:
> > > >>>> We will start building overlays for platforms soon in the kernel=
 and
> > > >>>> would need fdtoverlay tool going forward. Lets start fetching and
> > > >>>> building it.
> > > >>>>
> > > >>>> While at it, also remove fdtdump.c file, which isn't used by the=
 kernel.
> > > >>>>
> > > >>>> V4:
> > > >>>> - Don't fetch and build fdtdump.c
> > > >>>> - Remove fdtdump.c
> > > >>>>
> > > >>>> Viresh Kumar (3):
> > > >>>>   scripts: dtc: Add fdtoverlay.c to DTC_SOURCE
> > > >>>>   scripts: dtc: Build fdtoverlay tool
> > > >>>>   scripts: dtc: Remove the unused fdtdump.c file
> > > >>>>
> > > >>>>  scripts/dtc/Makefile             |   6 +-
> > > >>>>  scripts/dtc/fdtdump.c            | 163 ------------------------=
-------
> > > >>>>  scripts/dtc/update-dtc-source.sh |   6 +-
> > > >>>>  3 files changed, 8 insertions(+), 167 deletions(-)
> > > >>>>  delete mode 100644 scripts/dtc/fdtdump.c
> > > >>>>
> > > >>>
> > > >>> My first inclination was to accept fdtoverlay, as is, from the up=
stream
> > > >>> project.
> > > >>>
> > > >>> But my experiences debugging use of fdtoverlay against the existi=
ng
> > > >>> unittest overlay files has me very wary of accepting fdtoverlay in
> > > >>> it's current form.
> > > >>>
> > > >>> As an exmple, adding an overlay that fails to reply results in the
> > > >>> following build messages:
> > > >>>
> > > >>>    linux--5.11-rc> make zImage
> > > >>>    make[1]: Entering directory '/local/frowand_nobackup/src/git_l=
inus/build/dragon_linus_5.11-rc'
> > > >>>      GEN     Makefile
> > > >>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc=
/scripts/checksyscalls.sh
> > > >>>      CALL    /local/frowand_nobackup/src/git_linus/linux--5.11-rc=
/scripts/atomic/check-atomics.sh
> > > >>>      CHK     include/generated/compile.h
> > > >>>      FDTOVERLAY drivers/of/unittest-data/static_test.dtb
> > > >>>
> > > >>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ER=
R_NOTFOUND
> > > >>>    make[4]: *** [/local/frowand_nobackup/src/git_linus/linux--5.1=
1-rc/drivers/of/unittest-data/Makefile:96: drivers/of/unittest-data/static_=
test.dtb] Error 1
> > > >>>    make[3]: *** [/local/frowand_nobackup/src/git_linus/linux--5.1=
1-rc/scripts/Makefile.build:496: drivers/of/unittest-data] Error 2
> > > >>>    make[2]: *** [/local/frowand_nobackup/src/git_linus/linux--5.1=
1-rc/scripts/Makefile.build:496: drivers/of] Error 2
> > > >>>    make[1]: *** [/local/frowand_nobackup/src/git_linus/linux--5.1=
1-rc/Makefile:1805: drivers] Error 2
> > > >>>    make[1]: Leaving directory '/local/frowand_nobackup/src/git_li=
nus/build/dragon_linus_5.11-rc'
> > > >>>    make: *** [Makefile:185: __sub-make] Error 2
> > > >>>
> > > >>>
> > > >>> The specific error message (copied from above) is:
> > > >>>
> > > >>>    Failed to apply 'drivers/of/unittest-data/overlay.dtb': FDT_ER=
R_NOTFOUND
> > > >>>
> > > >>> which is cryptic and does not even point to the location in the o=
verlay that
> > > >>> is problematic.  If you look at the source of fdtoverlay / libfdt=
, you will
> > > >>> find that FDT_ERR_NOTFOUND may be generated in one of many places.
> > > >>>
> > > >>> I do _not_ want to do a full review of fdtoverlay, but I think th=
at it is
> > > >>> reasonable to request enhancing fdtoverlay in the parent project =
to generate
> > > >>> usable error messages before enabling fdtoverlay in the Linux ker=
nel tree.
> > > >
> > >
> > > > That's... actually much harder than it sounds.  fdtoverlay is
> > > > basically a trivial wrapper around the fdt_overlay_apply() function=
 in
> > > > libfdt.  Matching the conventions of the rest of the library, really
> > > > it's only way to report errors is a single error code.
> > > >
> > > > Returning richer errors is not an easy problem in a C library,
> > > > especially one designed to be usable in embedded systems, without an
> > > > allocator or much else available.
> > > >
> > > > Of course it would be possible to write a friendly command line tool
> > > > specifically for applying overlays, which could give better errors.
> > > > fdtoverlay as it stands isn't really that - it was pretty much writ=
ten
> > > > just to invoke fdt_overlay_apply() in testcases.
> > >
> > > Thank you for providing that context.
> > >
> > > I do not know if there is a way to enable the code that is currently =
in libfdt
> > > to both be useful as an embedded library (for example, U-boot seems t=
o often
> > > have a need to keep memory usage very small) and also be part of a to=
ol with
> > > effective warning and error messages.
> >
> > Yeah, I don't know either.
> >
> > > Before having looked at libfdt only at a cursory level while debuggin=
g the proposed
> > > use of fdtoverlay in Linux, my first thought was that maybe it would =
be possible
> > > to add warning and error messages within "#ifdef" blocks, or other wa=
ys that
> > > cause the error code to _not_ be compiled as part of library version =
of libfdt,
> > > but only be compiled as part of fdtoverlay _when built in the Linux k=
ernel_
> > > (noting that the proposed Linux patch builds the libfdt files as part=
 of
> > > the fdtoverlay compile instead of as a discrete library).  After look=
ing at
> > > the libfdt source a tiny bit more carefully, I would probably shoot d=
own this
> > > suggestion, as it makes the source code uglier and harder to understa=
nd and
> > > maintain for the primary purpose of being an embedded library.
> >
> > Oof.  That sounds really ugly, but maybe it could be pulled off.
> >
> > > Do you have any thoughts on how warning and error messages could be a=
dded,
> > > or if it is even possible?  Or maybe your suggestion of writing a "fr=
iendly
> > > command line tool specifically for applying overlays" is the path that
> > > Viresh should pursue?
> >
> > I think at this stage it's a matter of trying a few approaches and
> > seeing what works out.
>=20
> Another way would be applying overlays to dtc's live tree. This could
> apply overlays from dts in addition to dtb. It could be a plug-in if
> we ever get that finished up.

This is actually a really interesting idea, because in a sense dtc
already *does* apply overlays.  It's just that it effectively resolves
as it is parsing, rather than realizing separate overlay objects then
merging as a separate step.

I would actually like to change that, so that it *does* explicitly
produce a chain of overlays internally.  That has advantages for the
checking code, because some checks make sense to apply to individual
overlay fragments, but some only make sense on a fully resolved tree.

As a bonus, it could handle this use case.  Unlike libfdt, dtc is a
much more normal userspace program and adding extra verbose debugging
is no realy problem.

It probably is more work in the short term, though.

> The downside of this is not testing libfdt's code and possible
> differences between 2 implementations.

That can be mitigated by having a bunch of examples in the testsuite
where we cross compare fdtoverlay's output with dtc's.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--8LcDNZpJwHFkagdo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmAzTGQACgkQbDjKyiDZ
s5LrVQ/9Gju0d9kQazxGUx/IUTVUTPA5gHuyhv+eGPjzckyS7eHEgfr31loyj5p5
bAVIIQtdikjI4nhD3elVI+M0AqU0sPmxZfsTxxmk4euuKnAT5o+M4muI5MeMW3Mr
s4lqFxs1NDs2yuvJ6eyUq4mGjJUcfM5MbLmhL6zV+AV2xmDyVGETvMsMnM6K3pvB
Ma9wBEXm1faQOa/HYIOPbDoIa8n3j8wA6pGTHrijB3QWXwk0z7ujLbtqrWwZAnjr
/Dhxf3OggTdg8O4CHCtcwlWoi8RrrCCfdZgkgSxhiptq8jZDw3T+7lEpHBVOZDgw
5g8dSti+MwlQ9W3cU5tr0Z76kjO4l1vN25tJ6J5c6jeiujyS9gB2Yl0740KmV0rF
0rq9pefKNGzq0QObjkZBcJ8gspEacHBoiq6xb2QSyVq8w7xT/kLDzyYntGZ+EKEs
feYdDpsFjtm9FqsxlHiIQmP2D+cqraN1Y9pFAsSnWNhg39bUmYAKu73MGKxjBxod
t5IxYjI9c5oKbIQDjsFpRr6KrPbHZnMnBXOYxKYyvOB/Bay8S6mAEkR4gpj4b1+i
jwpvVr6JejEJkYmdNBAu5wyvGT3TjduE5638DxJsKkO/IXphMXJvOA5Xp3xS47M0
HE8WKm/S6tHeZ4JLMxr6EIDB8mrAC8mhEG1vPeJrmXm09ac0Et4=
=oy4T
-----END PGP SIGNATURE-----

--8LcDNZpJwHFkagdo--
