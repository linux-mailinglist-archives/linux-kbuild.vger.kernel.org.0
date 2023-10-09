Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A71E7BDCAF
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 14:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346437AbjJIMqT (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 08:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346553AbjJIMqS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 08:46:18 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C13DF93
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 05:46:16 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 464A51C0003;
        Mon,  9 Oct 2023 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1696855574;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7Q066ZPCeTQl4OjuzYK2I3npDxEu3BEi0dRV7tfy/7E=;
        b=mJJhnmBmUJ+qr4E/zJLlgC+ow2VGssAKIjSwLC57tAVfpQaLJ/2dTw2XrsMrFlhu9DrK98
        6/eBmQR/i+Aya0dfv5DeK4ZO4CmTQSCr3dsndhmPNuWirP3Ru4aiyU1xwCICZ6ofeBNBzo
        yorzlFgxgardXGff7OzlBCxdXKW/DSi41ue3NoNYSdpK6oiKe7YQ+aUbSzggYX1mq8fI3c
        KuUIlKnrqWqwjEMywJQywZ+DJNoreUK7M3AKOmjfMal2XZWwMkl5qa5CID8Zj7QmY1tqmM
        Plj6qgq7J7LJ6thGgrctBxMDqcV7vmb1j+BoFtvE53UtTHIf1MmiJ+QyPZ0XNw==
Date:   Mon, 9 Oct 2023 14:46:10 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        linux-kbuild@vger.kernel.org, Richard Weinberger <richard@nod.at>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mtd@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231009144610.4ff82afa@xps-13>
In-Reply-To: <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
        <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
        <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
        <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
        <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello,

u.kleine-koenig@pengutronix.de wrote on Mon, 9 Oct 2023 12:30:37 +0200:

> Hello,
>=20
> [Changed email address for David Woodhouse from intel to infradead]
>=20
> On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:
> > On Mon, Oct 9, 2023, at 09:22, Masahiro Yamada wrote: =20
> > > On Mon, Oct 9, 2023 at 5:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig <u.klein=
e-koenig@pengutronix.de> wrote: =20
> > >>
> > >> As described in the added code comment, a reference to .exit.text is=
 ok
> > >> for drivers registered via module_platform_driver_probe(). Make this
> > >> explicit to prevent a section mismatch warning with =20
> >  =20
> > >
> > > We have thousands of module_platform_drivers.
> > > I would be scared if they started to add __refdata.
> > >
> > > I am not sure if this is the right direction. =20
> >=20
> > For a normal module_platform_driver(), this would indeed be
> > wrong, but as Uwe said above there is a special case for
> > module_platform_driver_probe(), which implicitly sets the
> > drv->driver.suppress_bind_attrs=3Dtrue flag.
> >  =20
> > > In my understanding of the current DT overlay,
> > > there is no way to create/remove a platform device dynamically.
> > > I do not know if that will happen in the future. =20
> >=20
> > For drivers without suppress_bind_attrs, you can manually
> > unbind the device from a driver, which in case of a loadable
> > module ends up calling the .remove callback (this is fine),
> > but in a built-in driver this would use a NULL pointer for
> > .remove and cause unexpected behavior. =20
>=20
> only a slight correction: As not having a remove callback can be fine
> and platform_remove() only calls .remove (or .remove_new) when non-NULL
> we're not hitting a NULL pointer dereference in the presence of
>=20
> 	.remove =3D __exit_p(somefunc),
>=20
> But a problem can arise later if some resource isn't properly freed and
> so it might be used at a later point in time which then most likely
> oopses.
>=20
> I didn't double check Arnd's list, but otherwise I agree to his
> analysis.

Can we instead question the use of module_platform_driver_probe()?
I don't have the history in mind, but why not just switch to regular
module_platform_driver() registration instead? It seems like the
original authors just did not care about the remove path and were
happy to skip its implementation.

On mtd devices one can argue that the flash underlying stores the
rootfs and thus cannot be removed, but I believe today this is a
questionable (software) design.

Thanks,
Miqu=C3=A8l
