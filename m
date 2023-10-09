Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B86F97BD575
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Oct 2023 10:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345431AbjJIIoV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Oct 2023 04:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345499AbjJIIoP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2023 04:44:15 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23936BA
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Oct 2023 01:44:13 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 2534B320093B;
        Mon,  9 Oct 2023 04:44:09 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute5.internal (MEProxy); Mon, 09 Oct 2023 04:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1696841048; x=1696927448; bh=1sZxVc5EigODDoOyigeTGKUmaWkUnrbXaUh
        wwKGR3lE=; b=aQ9SElXZqX1QOGiUCAIU8Zuf/SFKLBgYKtCDcjRpNEmnkIx/fTj
        sj0ODczbWdeSHv84egvy04/SZereoI8nmMuRK9Gs24k9n0W4K31G5M0Ua+v7mUNz
        qdgkYn/Q5dJGKcL67LEC7hyYIBtdQWqEWcyCC4iHOG8M5dZj7cOsTnVMXirx/5z6
        0zqDU3JW9aHlXerKmrJjHv+dK6k5cjSMpRBor5Ha8RaqmmE3txQiZbUBPOiPo2gH
        ag1RPhGZFMiTQZ6dWHPkCEL2io6trIScbCizcHE58OypbvMcsTk23UVtVYlkZ4y1
        o9FdkMAfbf9f+KRiUpVVpr7QxY5mRMFrA4Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1696841048; x=1696927448; bh=1sZxVc5EigODDoOyigeTGKUmaWkUnrbXaUh
        wwKGR3lE=; b=M34ZpYF040jVzYm33BYv2cytOWlr+Nj4nOm/3WNIoF9T5goxNZR
        A9VNfWBICQ3+Lr2CQHpsJsKP4aNjhReApGIyVK3Y/ZtEV0f9Znk4zIOOLik1I99A
        Uyfn5ADHS/diq00gUhUjZFFT3EER4D4c2TE5RNoTYk9jN0H3jcj0dik24mLpON8R
        zbiMXVPbsbuDSGdIqwLh2yHoB9LHU+IS22P+h/ZkUMDQ07qot3kJS7X64bHzwMgV
        SkK1gnHISBHsYY/+xr1q4dKnv3G2pGsBpHLdcgtJ45x380/uDq1GAVDqqhhTufy6
        jOC0n3kF5Q1W5l5lAKPTdl/R6a2BkMn/0RQ==
X-ME-Sender: <xms:V70jZaC5AajGd07uhfMTYXKn3kYxpGwJv2ovQ9W-VUY5akCO0iMlsQ>
    <xme:V70jZUjl9zws6jmfsWA6a8oOlSYv1Hae_QZ-ne2DD4ng9Ljyuxf78uIz7b9NkemIv
    0yEhOS6RAeCXCfmbdE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheefgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:V70jZdmnS3MrAoU0NUweVpF8FK1v7GdL_FDK5vOr-83bvdFWJculgw>
    <xmx:V70jZYzZ8j4RbzAm8KhmJKFlKZ2-NzCMJ8ykD76z7BE0P30Ug5vu1A>
    <xmx:V70jZfQsLi683DNfFjfDiUKcTC3sDVhzxcN1baV-a9NcCC72BuJDVA>
    <xmx:WL0jZU914RGKyOdFi2FxMCNSjZ1nlHDD_1h3BPhG89U6kiXkF3J7aA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 5BE641700089; Mon,  9 Oct 2023 04:44:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
In-Reply-To: <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
Date:   Mon, 09 Oct 2023 10:43:46 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     "Masahiro Yamada" <masahiroy@kernel.org>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     "Miquel Raynal" <miquel.raynal@bootlin.com>,
        "Richard Weinberger" <richard@nod.at>,
        "Vignesh Raghavendra" <vigneshr@ti.com>,
        "David Woodhouse" <David.Woodhouse@intel.com>,
        "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        linux-mtd@lists.infradead.org,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        linux-kbuild@vger.kernel.org,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with __refdata
 to prevent section mismatch warning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 9, 2023, at 09:22, Masahiro Yamada wrote:
> On Mon, Oct 9, 2023 at 5:02=E2=80=AFAM Uwe Kleine-K=C3=B6nig <u.kleine=
-koenig@pengutronix.de> wrote:
>>
>> As described in the added code comment, a reference to .exit.text is =
ok
>> for drivers registered via module_platform_driver_probe(). Make this
>> explicit to prevent a section mismatch warning with

>
> We have thousands of module_platform_drivers.
> I would be scared if they started to add __refdata.
>
> I am not sure if this is the right direction.

For a normal module_platform_driver(), this would indeed be
wrong, but as Uwe said above there is a special case for
module_platform_driver_probe(), which implicitly sets the
drv->driver.suppress_bind_attrs=3Dtrue flag.

> In my understanding of the current DT overlay,
> there is no way to create/remove a platform device dynamically.
> I do not know if that will happen in the future.

For drivers without suppress_bind_attrs, you can manually
unbind the device from a driver, which in case of a loadable
module ends up calling the .remove callback (this is fine),
but in a built-in driver this would use a NULL pointer for
.remove and cause unexpected behavior.

This is the list of module_platform_driver_probe() instances
I found that have a .remove callback:

drivers/ata/pata_falcon.c-	.remove =3D __exit_p(pata_falcon_remove_one),
drivers/ata/pata_gayle.c-	.remove =3D __exit_p(pata_gayle_remove_one),
drivers/char/hw_random/mxc-rnga.c-	.remove =3D __exit_p(mxc_rnga_remove),
drivers/hwmon/mc13783-adc.c-	.remove_new	=3D mc13783_adc_remove,
drivers/input/mouse/amimouse.c-	.remove =3D __exit_p(amimouse_remove),
drivers/input/serio/q40kbd.c-	.remove_new	=3D q40kbd_remove,
drivers/input/touchscreen/mc13783_ts.c-	.remove_new	=3D mc13783_ts_remov=
e,
drivers/leds/leds-mc13783.c-	.remove_new	=3D mc13xxx_led_remove,
drivers/media/platform/renesas/sh_vou.c:	.remove_new =3D sh_vou_remove,
drivers/media/rc/meson-ir-tx.c-	.remove_new =3D meson_irtx_remove,
drivers/memory/emif.c-	.remove		=3D __exit_p(emif_remove),
drivers/memory/ti-aemif.c-	.remove =3D aemif_remove,
drivers/memory/ti-emif-pm.c-	.remove =3D ti_emif_remove,
drivers/mtd/devices/docg3.c-	.remove		=3D docg3_release,
drivers/net/ethernet/broadcom/tg3.c-	.remove		=3D tg3_remove_one,
drivers/rapidio/switches/idt_gen3.c-	.remove =3D idtg3_remove,
drivers/video/fbdev/cg3.c-	.remove_new	=3D cg3_remove,
drivers/mtd/nand/raw/fsmc_nand.c-	.remove_new =3D fsmc_nand_remove,
drivers/mtd/nand/raw/orion_nand.c-	.remove_new	=3D orion_nand_remove,
drivers/mtd/nand/raw/sh_flctl.c-	.remove_new	=3D flctl_remove,
drivers/mtd/nand/raw/txx9ndfmc.c-	.remove		=3D __exit_p(txx9ndfmc_remove=
),
drivers/net/ethernet/cirrus/cs89x0.c-	.remove_new =3D cs89x0_platform_re=
move,
drivers/parport/parport_amiga.c-	.remove =3D __exit_p(amiga_parallel_rem=
ove),
drivers/power/reset/at91-poweroff.c-	.remove =3D __exit_p(at91_poweroff_=
remove),
drivers/power/reset/at91-reset.c-	.remove =3D __exit_p(at91_reset_remove=
),
drivers/power/reset/at91-sama5d2_shdwc.c-	.remove =3D __exit_p(at91_shdw=
c_remove),
drivers/rtc/rtc-at91rm9200.c-	.remove		=3D __exit_p(at91_rtc_remove),
drivers/rtc/rtc-at91sam9.c-	.remove_new	=3D at91_rtc_remove,
drivers/rtc/rtc-ftrtc010.c-	.remove_new	=3D ftrtc010_rtc_remove,
drivers/rtc/rtc-imxdi.c-	.remove =3D __exit_p(dryice_rtc_remove),
drivers/rtc/rtc-mc13xxx.c-	.remove_new =3D mc13xxx_rtc_remove,
drivers/rtc/rtc-mv.c-	.remove		=3D __exit_p(mv_rtc_remove),
drivers/rtc/rtc-pcap.c-	.remove =3D __exit_p(pcap_rtc_remove),
drivers/rtc/rtc-pxa.c-	.remove		=3D __exit_p(pxa_rtc_remove),
drivers/rtc/rtc-sh.c-	.remove		=3D __exit_p(sh_rtc_remove),
drivers/scsi/a3000.c-	.remove =3D __exit_p(amiga_a3000_scsi_remove),
drivers/scsi/a4000t.c-	.remove =3D __exit_p(amiga_a4000t_scsi_remove),
drivers/scsi/atari_scsi.c-	.remove =3D __exit_p(atari_scsi_remove),
drivers/scsi/mac_scsi.c-	.remove =3D __exit_p(mac_scsi_remove),
drivers/scsi/sun3_scsi.c-	.remove =3D __exit_p(sun3_scsi_remove),
drivers/tty/amiserial.c-	.remove =3D __exit_p(amiga_serial_remove),
drivers/usb/gadget/udc/at91_udc.c-	.remove		=3D at91udc_remove,
drivers/staging/emxx_udc/emxx_udc.c-	.remove_new	=3D nbu2ss_drv_remove,
drivers/usb/gadget/udc/aspeed_udc.c-	.remove			=3D ast_udc_remove,
drivers/usb/gadget/udc/at91_udc.c-	.remove		=3D at91udc_remove,
drivers/usb/gadget/udc/atmel_usba_udc.c-	.remove_new	=3D usba_udc_remove,
drivers/usb/gadget/udc/bcm63xx_udc.c-	.remove_new	=3D bcm63xx_udc_remove,
drivers/usb/gadget/udc/dummy_hcd.c-	.remove_new	=3D dummy_udc_remove,
drivers/usb/gadget/udc/fsl_qe_udc.c-	.remove_new     =3D qe_udc_remove,
drivers/usb/gadget/udc/fsl_udc_core.c-	.remove		=3D fsl_udc_remove,
drivers/usb/gadget/udc/lpc32xx_udc.c-	.remove		=3D lpc32xx_udc_remove,
drivers/usb/gadget/udc/mv_udc_core.c-	.remove_new	=3D mv_udc_remove,
drivers/usb/gadget/udc/omap_udc.c-	.remove_new	=3D omap_udc_remove,
drivers/usb/gadget/udc/pch_udc.c-	.remove =3D	pch_udc_remove,
drivers/usb/gadget/udc/pxa25x_udc.c-	.remove		=3D pxa25x_udc_remove,
drivers/usb/gadget/udc/pxa27x_udc.c-	.remove_new	=3D pxa_udc_remove,
drivers/usb/gadget/udc/renesas_usbf.c-	.remove_new     =3D usbf_remove,
drivers/usb/gadget/udc/tegra-xudc.c-	.remove_new =3D tegra_xudc_remove,
drivers/usb/gadget/udc/udc-xilinx.c-	.remove_new =3D xudc_remove,
drivers/usb/usbip/vudc_main.c-	.remove		=3D vudc_remove,
drivers/usb/gadget/udc/fusb300_udc.c-	.remove_new =3D	fusb300_remove,
drivers/usb/gadget/udc/lpc32xx_udc.c-	.remove		=3D lpc32xx_udc_remove,
drivers/usb/gadget/udc/m66592-udc.c-	.remove_new =3D	m66592_remove,
drivers/usb/gadget/udc/r8a66597-udc.c-	.remove_new =3D	r8a66597_remove,
drivers/usb/host/r8a66597-hcd.c-	.remove_new =3D	r8a66597_remove,
drivers/video/fbdev/amifb.c-	.remove =3D __exit_p(amifb_remove),
drivers/video/fbdev/atmel_lcdfb.c-	.remove		=3D __exit_p(atmel_lcdfb_rem=
ove),
drivers/video/fbdev/omap2/omapfb/vrfb.c-	.remove		=3D __exit_p(vrfb_remo=
ve),
drivers/virt/coco/sev-guest/sev-guest.c-	.remove		=3D __exit_p(sev_guest=
_remove),
drivers/watchdog/at91rm9200_wdt.c-	.remove_new	=3D at91wdt_remove,
drivers/watchdog/at91sam9_wdt.c-	.remove		=3D __exit_p(at91wdt_remove),
drivers/watchdog/txx9wdt.c-	.remove =3D __exit_p(txx9wdt_remove),

Out of these, only 29 have the .remove callback in the .exit.text sectio=
n,
and they all use __exit_p:

drivers/ata/pata_falcon.c:static int __exit pata_falcon_remove_one(struc=
t platform_device *pdev)
drivers/ata/pata_gayle.c:static int __exit pata_gayle_remove_one(struct =
platform_device *pdev)
drivers/char/hw_random/mxc-rnga.c:static int __exit mxc_rnga_remove(stru=
ct platform_device *pdev)
drivers/input/mouse/amimouse.c:static int __exit amimouse_remove(struct =
platform_device *pdev)
drivers/memory/emif.c:static int __exit emif_remove(struct platform_devi=
ce *pdev)
drivers/mtd/nand/raw/txx9ndfmc.c:static int __exit txx9ndfmc_remove(stru=
ct platform_device *dev)
drivers/parport/parport_amiga.c:static int __exit amiga_parallel_remove(=
struct platform_device *pdev)
drivers/power/reset/at91-poweroff.c:static int __exit at91_poweroff_remo=
ve(struct platform_device *pdev)
drivers/power/reset/at91-reset.c:static int __exit at91_reset_remove(str=
uct platform_device *pdev)
drivers/power/reset/at91-sama5d2_shdwc.c:static int __exit at91_shdwc_re=
move(struct platform_device *pdev)
drivers/rtc/rtc-at91rm9200.c:static int __exit at91_rtc_remove(struct pl=
atform_device *pdev)
drivers/rtc/rtc-imxdi.c:static int __exit dryice_rtc_remove(struct platf=
orm_device *pdev)
drivers/rtc/rtc-mv.c:static int __exit mv_rtc_remove(struct platform_dev=
ice *pdev)
drivers/rtc/rtc-pcap.c:static int __exit pcap_rtc_remove(struct platform=
_device *pdev)
drivers/rtc/rtc-pxa.c:static int __exit pxa_rtc_remove(struct platform_d=
evice *pdev)
drivers/rtc/rtc-sh.c:static int __exit sh_rtc_remove(struct platform_dev=
ice *pdev)
drivers/scsi/a3000.c:static int __exit amiga_a3000_scsi_remove(struct pl=
atform_device *pdev)
drivers/scsi/a4000t.c:static int __exit amiga_a4000t_scsi_remove(struct =
platform_device *pdev)
drivers/scsi/atari_scsi.c:static int __exit atari_scsi_remove(struct pla=
tform_device *pdev)
drivers/scsi/mac_scsi.c:static int __exit mac_scsi_remove(struct platfor=
m_device *pdev)
drivers/scsi/sun3_scsi.c:static int __exit sun3_scsi_remove(struct platf=
orm_device *pdev)
drivers/tty/amiserial.c:static int __exit amiga_serial_remove(struct pla=
tform_device *pdev)
drivers/video/fbdev/amifb.c:static int __exit amifb_remove(struct platfo=
rm_device *pdev)
drivers/video/fbdev/atmel_lcdfb.c:static int __exit atmel_lcdfb_remove(s=
truct platform_device *pdev)
drivers/video/fbdev/omap2/omapfb/vrfb.c:static void __exit vrfb_remove(s=
truct platform_device *pdev)
drivers/virt/coco/sev-guest/sev-guest.c:static int __exit sev_guest_remo=
ve(struct platform_device *pdev)
drivers/watchdog/at91sam9_wdt.c:static int __exit at91wdt_remove(struct =
platform_device *pdev)
drivers/watchdog/at91sam9_wdt.c:static int __exit at91wdt_remove(struct =
platform_device *pdev)
drivers/watchdog/txx9wdt.c:static int __exit txx9wdt_remove(struct platf=
orm_device *dev)

These are mostly ancient drivers, and half of them don't even have
DT support, so I think annotating them with __refdata is probably
fine, but removing the __exit_p() and __exit annotations would
also work, depending on the individual maintainer's preferences.

There are three more drivers that set .suppress_bind_addrs=3Dtrue
and have a __exit_p .remove callback (coresight-etm4x-core.c,
pcie-kirin.c, omapfb), they would also need to make the same
decision to shut up the warning.

All other drivers that have an __exit annotated .remove callback
are in probably broken and need a proper fix.

      Arnd
