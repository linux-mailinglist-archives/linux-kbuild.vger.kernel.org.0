Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 611E87BD432
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 09:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234360AbjJIHXH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 03:23:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbjJIHXH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 03:23:07 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4198DAB
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 00:23:05 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C479EC43395
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696836184;
        bh=gxed+PyPlKV1EIYLptm+8d9sgxEnTJLr23xR3gzhbgc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=d/lhPhMr4x42+7y8aq89/c0rprEwKUVbxa5Ur1Nh1DFZ4u/66qF5vIF5wls6iWdIl
         ICRPra29pQgSxKM2N1um+JM2mqWH3Tq4x8N6U28J6J0qkjL4uzXkb4l6PiDRY/5GAp
         BUrkk1IUoa96SomdslV1Zw5js6zAPA2Q7TcQmN5d2C4+XZGxkN3xM05UwGFLLGLMWH
         2I/ZDAAOjUkxeakzvHb+MLzCCxjmAVoK+kS9Nog0pSjqpW2gnfEZInCVQzhcMXCIYL
         ZRNNgNdt0UjduXXFywSq+Jp7yivSVlN/r8lErbUQ8rjJxLD+z2hQ1hdLpoND073zne
         sRFvyJqJzeqjA==
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3ae5ee80c0dso2950673b6e.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Oct 2023 00:23:04 -0700 (PDT)
X-Gm-Message-State: AOJu0Yx62f1krTUdXU6bMCkLDi6GUwk5AIqf6R2imrI9qL3K68T8FyUv
        Gu2gFci9lWD6Ik22Hwe0fnow4LtvEr8fS71xCbU=
X-Google-Smtp-Source: AGHT+IERynuZ0eRpygHJOJnip83U36ywByKOuj2HMyABKFQ7nt7kfo6a/OqTQJYxIrevx6ZT6gO2J1vlmEOZcYtctXs=
X-Received: by 2002:a05:6870:2b0f:b0:1e1:fe79:6831 with SMTP id
 ld15-20020a0568702b0f00b001e1fe796831mr15440541oab.57.1696836184084; Mon, 09
 Oct 2023 00:23:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de> <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 9 Oct 2023 16:22:27 +0900
X-Gmail-Original-Message-ID: <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
Message-ID: <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        David Woodhouse <David.Woodhouse@intel.com>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mtd@lists.infradead.org, kernel@pengutronix.de,
        linux-kbuild@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>
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

On Mon, Oct 9, 2023 at 5:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via module_platform_driver_probe(). Make this
> explicit to prevent a section mismatch warning with
> CONFIG_MTD_NAND_TXX9NDFMC=3Dm:
>
>         WARNING: modpost: drivers/mtd/nand/raw/txx9ndfmc: section mismatc=
h in reference: txx9ndfmc_driver+0x4 (section: .data) -> txx9ndfmc_remove (=
section: .exit.text)
>
> Fixes: 64fb65baffa5 ("[MTD] TXx9 SoC NAND Flash Memory Controller driver"=
)
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> note this warning only triggers with f177cd0c15fc ("modpost: Don't let
> "driver"s reference .exit.*") that currently waits in next for the next
> merge window + building with W=3D1.
>
> Best regards
> Uwe
>
>  drivers/mtd/nand/raw/txx9ndfmc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx9=
ndfmc.c
> index eddcc0728a67..aff9d6f16851 100644
> --- a/drivers/mtd/nand/raw/txx9ndfmc.c
> +++ b/drivers/mtd/nand/raw/txx9ndfmc.c
> @@ -406,7 +406,13 @@ static int txx9ndfmc_resume(struct platform_device *=
dev)
>  #define txx9ndfmc_resume NULL
>  #endif
>
> -static struct platform_driver txx9ndfmc_driver =3D {
> +/*
> + * txx9ndfmc_remove() lives in .exit.text. For drivers registered via
> + * module_platform_driver_probe() this is ok because they cannot get unb=
ound at
> + * runtime. So mark the driver struct with __refdata to prevent modpost
> + * triggering a section mismatch warning.
> + */
> +static struct platform_driver txx9ndfmc_driver __refdata =3D {
>         .remove         =3D __exit_p(txx9ndfmc_remove),
>         .resume         =3D txx9ndfmc_resume,
>         .driver         =3D {
> --
> 2.40.1
>


We have thousands of module_platform_drivers.
I would be scared if they started to add __refdata.

I am not sure if this is the right direction.

I added Greg and Arnd to CC.



In my understanding of the current DT overlay,
there is no way to create/remove a platform device dynamically.
I do not know if that will happen in the future.



--
Best Regards
Masahiro Yamada
