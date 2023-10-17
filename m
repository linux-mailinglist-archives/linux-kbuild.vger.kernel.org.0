Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4259E7CC098
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Oct 2023 12:22:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbjJQKWd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Oct 2023 06:22:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235057AbjJQKWU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2023 06:22:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12A512D51
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2023 03:20:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1B0EC433C9
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2023 10:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697538056;
        bh=s3ei31bLns3eZrhmZvMizV8gKlFQZLKQttQ5Pkr1EZI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rgDnj81X+znbG/PaJ28LA92m/uhZ19YdAh0+dFE4fzRbDxi3Rt8uux5wZx7S8n6FM
         toDOz9yWVnkJr7V2xqIQjtNkLmvcaRIxso3Hfi/mIaczusyVlx/zfbf1fhzfRywLWE
         zOwD3L1B6vXd1Omqu44T7iWlclHlR/TQ1lge8HQ9aakpH6gR22hnrgAhrKI//mfi8t
         VeDPRDGEdWSEgz4GZfklDn/at+mzDhAfEfpO1v3XunNXGWYTVJocOrcZ004q+BnCS4
         iHHAVc/hyF/Lr4ottw12u40xIZLa7ciJI3iboK8y9AhWxAbnY5C2Ua86xSG2T37dUg
         48Xlj8hNJ3eBA==
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6bd04558784so3888263a34.3
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Oct 2023 03:20:56 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx9noIF8T4+39V/UdMHLfo3RyoOh1tWHuD47k6fdYeM0thcNQAm
        xKSGs2us3UfUWOBTU5QZxTL/pIWuDLKT7tUqz3M=
X-Google-Smtp-Source: AGHT+IFgOt6Dj/5n3JHKIf+od7/6gfrvlvgCZOWB83LIMlBeQcFiM3JJJF83K6R2kdngSFg/UscgOSg5/ChMpvqRNgk=
X-Received: by 2002:a05:6870:1605:b0:1e9:ab99:6b7 with SMTP id
 b5-20020a056870160500b001e9ab9906b7mr2048546oae.3.1697538056089; Tue, 17 Oct
 2023 03:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de> <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com> <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com> <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
In-Reply-To: <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Oct 2023 19:20:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
Message-ID: <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-kbuild@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-mtd@lists.infradead.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Weinberger <richard@nod.at>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 16, 2023 at 7:21=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Mon, Oct 16, 2023 at 11:25:44AM +0200, Arnd Bergmann wrote:
> > On Mon, Oct 9, 2023, at 12:30, Uwe Kleine-K=C3=B6nig wrote:
> > > On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:
> > >
> > > only a slight correction: As not having a remove callback can be fine
> > > and platform_remove() only calls .remove (or .remove_new) when non-NU=
LL
> > > we're not hitting a NULL pointer dereference in the presence of
> > >
> > >     .remove =3D __exit_p(somefunc),
> > >
> > > But a problem can arise later if some resource isn't properly freed a=
nd
> > > so it might be used at a later point in time which then most likely
> > > oopses.
> > >
> > > I didn't double check Arnd's list, but otherwise I agree to his
> > > analysis.
> >
> > Hi Uwe,
> >
> > Based on a few days of randconfig build testing, the patch
> > below addresses the remaining warnings I get for arm, arm64 and
> > x86 on linux-next. This is a shorter list than the ones that
> > I found in theory, possibly because some of the other ones
> > are only used in built-in code, or because they are never used
> > on these three architectures.
> >
> > Have you already sent patches for (some of) these?
> >
> >       Arnd
> >
> >  drivers/char/hw_random/mxc-rnga.c                                 | 2 =
+-
> >  drivers/gpu/drm/bridge/ti-tpd12s015.c                             | 4 =
++--
> >  drivers/hwmon/smsc47m1.c                                          | 2 =
+-
> >  drivers/hwtracing/coresight/coresight-etm4x-core.c                | 8 =
++++----
> >  drivers/media/i2c/et8ek8/et8ek8_driver.c                          | 4 =
++--
> >  drivers/memory/emif.c                                             | 2 =
+-
> >  drivers/mmc/host/davinci_mmc.c                                    | 2 =
+-
> >  drivers/mtd/nand/raw/txx9ndfmc.c                                  | 2 =
+-
>
> The txx9ndfmc driver was fixed as part of this series, but Miqu=C3=A8l di=
dn't
> take the patch, I guess because he wants it to be converted to
> module_platform_driver().


So, there are two ways for fixing, and it is
up to subsystem maintainers?




A question is, is module_platform_driver_probe()
still worth supporting?






--=20
Best Regards
Masahiro Yamada
