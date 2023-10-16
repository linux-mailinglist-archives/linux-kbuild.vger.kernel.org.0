Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7FC7CA2EE
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Oct 2023 10:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233094AbjJPI5u (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Oct 2023 04:57:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233188AbjJPI5s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2023 04:57:48 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9277B107
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Oct 2023 01:57:45 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1ED6E0008;
        Mon, 16 Oct 2023 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1697446663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8twWkfoS+52F5q11cAzMRnwRGmoKZNzcuZ6S/LXmAfQ=;
        b=LZibeEe4QaTLH4OeyVNbFipDRO00IrlycOnZ2v7eq2ca3kLq2GP29LSqEJGZ1tbAH1mmKO
        5PHaZx0gNuH38LZx4qooqqjOkO06/y+UXKi/d9Fl3B03qMc5kRlK1lB7efc1snriXFoW0J
        fRBRIOxfbAFhEkuu+kvZKeqqschboD4afrU2Z0ejwpUVddwEK9wbwOXLUq3aoFpotu7jLp
        jjxuS635RUVLgjXQU1fnhDvGdnCQStG1+24nphrWUb/VmFP7G8CQpNq700jc3QMUPFqudr
        lUWcc0tXl9eixJ0+b3qxSP6sj86CUoS2CqVXwv8A+6h4cI6cjD5uw69ZpKCycQ==
Date:   Mon, 16 Oct 2023 10:57:37 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     "Arnd Bergmann" <arnd@arndb.de>
Cc:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        "David Woodhouse" <dwmw2@infradead.org>,
        linux-kbuild@vger.kernel.org,
        "Richard Weinberger" <richard@nod.at>,
        "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-mtd@lists.infradead.org,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231016105737.7b851d85@xps-13>
In-Reply-To: <20231009153741.5b04a137@xps-13>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
        <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
        <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
        <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
        <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
        <20231009144610.4ff82afa@xps-13>
        <55a03e14-7a92-4cf0-82d4-5cbde64d69db@app.fastmail.com>
        <20231009153741.5b04a137@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

miquel.raynal@bootlin.com wrote on Mon, 9 Oct 2023 15:37:41 +0200:

> Hi Arnd,
>=20
> arnd@arndb.de wrote on Mon, 09 Oct 2023 15:01:17 +0200:
>=20
> > On Mon, Oct 9, 2023, at 14:46, Miquel Raynal wrote: =20
> > >> On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:   =20
> > >> > On Mon, Oct 9, 2023, at 09:22, Masahiro Yamada wrote:     =20
> > >> > > On Mon, Oct 9, 2023 at 5:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig <u.=
kleine-koenig@pengutronix.de> > Can we instead question the use of module_p=
latform_driver_probe()?   =20
> > > I don't have the history in mind, but why not just switch to regular
> > > module_platform_driver() registration instead? It seems like the
> > > original authors just did not care about the remove path and were
> > > happy to skip its implementation.
> > >
> > > On mtd devices one can argue that the flash underlying stores the
> > > rootfs and thus cannot be removed, but I believe today this is a
> > > questionable (software) design.   =20
> >=20
> > It was changed to module_platform_driver_probe() in commit
> > 3a2a13fa902d2 ("mtd: txx9ndfmc: use module_platform_driver_probe()")
> > with a short changelog text:
> >=20
> > commit 3a2a13fa902d232a1e56582647aed6cb2591349b
> > Author: Jingoo Han <jg1.han@samsung.com>
> > Date:   Tue Mar 5 13:31:24 2013 +0900
> >=20
> >     mtd: txx9ndfmc: use module_platform_driver_probe()
> >    =20
> >     This patch uses module_platform_driver_probe() macro which makes
> >     the code smaller and simpler.
> >    =20
> >     Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> >     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> >     Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> >=20
> > Instead of just simplifying the code, I think that was actually
> > a bugfix because it prevented both the probe and remove callbacks
> > from getting called after getting dropped (deferred probe or
> > unbind/rebind). Using module_platform_driver() is probably
> > even better here, but then we need to remove both the __init
> > and __exit annotations. =20
>=20
> Agreed.
>=20
> Thanks,
> Miqu=C3=A8l

FYI I've collected all the patches in this series except the txx9ndfmc
ones.

Thanks,
Miqu=C3=A8l
