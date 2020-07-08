Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 418C62192DB
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 23:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgGHVwg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 17:52:36 -0400
Received: from 131-148-138-139.adstx.net ([139.138.148.131]:10772 "EHLO
        pukcab.korelogic.com" rhost-flags-OK-FAIL-OK-OK) by vger.kernel.org
        with ESMTP id S1725903AbgGHVwg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 17:52:36 -0400
X-Greylist: delayed 418 seconds by postgrey-1.27 at vger.kernel.org; Wed, 08 Jul 2020 17:52:35 EDT
Received: from mail.marc.info (marc1.marc.info [205.134.191.172])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (Client did not present a certificate)
        by pukcab.korelogic.com (Postfix) with ESMTPS id 97ABC2B20080
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Jul 2020 17:45:36 -0400 (EDT)
Received: from ultron.spinoli.org (unknown [71.33.226.61])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: hlein)
        by mail.marc.info (Postfix) with ESMTPSA id CBDE19C6007F;
        Wed,  8 Jul 2020 17:45:32 -0400 (EDT)
Date:   Wed, 8 Jul 2020 15:45:26 -0600
From:   Hank Leininger <hlein@marc.info>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>, webguy@marc.info,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        helpdesk@kernel.org, Sam Ravnborg <sam@ravnborg.org>,
        Nathan Huckleberry <nhuck@google.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: linux-kbuild missing from lore?
Message-ID: <20200708214526.GA1893@ultron.spinoli.org>
Reply-To: Hank Leininger <hlein@marc.info>
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
 <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
 <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6TrnltStXW4iwmi0"
Content-Disposition: inline
In-Reply-To: <CAKwvOdnNW0JiX1SMUePKCS37Cjfa+rx=SKrcu0jU1qyMNCq0yA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


--6TrnltStXW4iwmi0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2020 at 01:49:18PM -0700, Nick Desaulniers wrote:
> On Wed, Jul 8, 2020 at 1:43 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > On 7/8/20 11:42 AM, Nick Desaulniers wrote:
> > > On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> =
wrote:
> > >>
> > >> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
> > >>> Hi Nick,
> > >>>
> > >>> On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
> > >>> <ndesaulniers@google.com> wrote:
> > >>>>
> > >>>> Hi Masahiro,
> > >>>> I noticed that linux-kbuild@vger.kernel.org seems to be missing fr=
om
> > >>>> https://lore.kernel.org/lists.html.  Is that intentional or
> > >>>> accidental?
[snip]
> > Has anyone thought about trying to get the kbuild archive from
> > marc.info/?l=3Dlinux-kbuild ?  or contacted the marc.info admin?
>=20
> Clicking "add a list" on
> https://marc.info/
> opens an emailto: link to webguy@marc.info, so adding them here.
> Dear marc.info admin, is exporting a copy of the linux-kbuild mail
> archive something that you can help us with?

Hi! That sounds like it should be doable; we keep .gz backups of all
the lists we're subscribed to. At a quick glance I have them going back
to Jan 2, 2008, I thiiiink uninterrupted. There's probably some spam
that got sent to the list and/or sent to our subscribed address
included.

Can someone please contact me off-thread and we'll work out details of
how to best get them to you?

Thanks,

--

Hank Leininger <hlein@marc.info>
ED0E 3040 4240 1DD9 5B2E  6DEC A60B CB9D 0939 76F7

--6TrnltStXW4iwmi0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEE7Q4wQEJAHdlbLm3spgvLnQk5dvcFAl8GPnYACgkQpgvLnQk5
dvd85gf/V7q09Y2qmpSWARD9kAi05UuKf45pU8pUfNgtT/bzjso73wXfHtlEC7lV
f7gvHusEhIo19CHQFFP4kcQuWH/X/o8darVQbdG3ZmCoh4ud3Nry5jJZzz+EYUEb
cKQIZVAHmqsUAYeiETbIbDELMpxHakU2FGdk1KlzlvjHykS+rlpoTi5o9hWcyuCE
ae7SDLmnWm0nVGRgQUD6rGExKluaghcWx1otZxcgiHOcOrwI0wLxEtQLzJqaE2Rm
O6UbiknJ5rcjHYSaEMMTYlJ+pkatzurRK9LqBJMa6M4cYzM58SVpoDTbQgSfyeVp
t0jbWBXJsCU3fVJbkCM80HLpUPURYQ==
=5ClQ
-----END PGP SIGNATURE-----

--6TrnltStXW4iwmi0--
