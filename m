Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C16F37CA412
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Oct 2023 11:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbjJPJ0O (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Oct 2023 05:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232661AbjJPJ0N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2023 05:26:13 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B235AD
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Oct 2023 02:26:10 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 12B9B320098C;
        Mon, 16 Oct 2023 05:26:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 16 Oct 2023 05:26:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1697448365; x=1697534765; bh=p7PcE01KHeRoR2ct5bCU2kxE+dndvpf8ZTa
        WPUxw4zQ=; b=G7BWhK50PXn7HUrtwW0hBhuYo+v1uXdHdEfhs6sV1XmexO289Le
        KXkdtSHpL8mGgtT0pJa4FI4/7oaS4V0HujMzi9PBCM/OTq6IDbd39iY+uf4vKZa2
        kL38FI1K3LSFqbbd35p7mVQOUYBJS7tOmlKQG8rTxFXpJVxmyBEENExYQL7oZr1M
        TS5rx3hhj/WbrefUNTB1o3YNbzY0osFmvqdNeXuWcSxlIYjqiPy0zmil8Tveb+Pf
        ije2DyiD7wfELNxYOoQJCejKQPLbpimUjW/lLVwfog6xzETnfVZR7czSX5K/jE7D
        Xs6iAQ1k9KsjWoAUcyq42x4cQKKH/oUPD5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1697448365; x=1697534765; bh=p7PcE01KHeRoR2ct5bCU2kxE+dndvpf8ZTa
        WPUxw4zQ=; b=tPkU9lhofLWbYMyq6t2yN55aGidPw69xQzXEpX/mzQ5lyHG7Jre
        S+0I80uGXGAVXkp/mkflWcZlRyJ886A4mQ9G6EGC0ZcvLquyFBwuxdGW+E3ACcKL
        GF63w6I0K20W3ReHlrsDAFz5LyZ0Mre21aNs3gLHQkGDCZzphF5EdZvrvmbhjEuy
        ylRxaFaS+/2MO8lwbvVta5xJEnEPrGcmfzqaI9QtK1pyL6ABkHYUQnZRiiswMsP/
        3DoYrTE4mWYrg+QjykF6XqNK8rZuhOK4c0sVmxR318KEML39s3ODpZNDSCV9rUj4
        1dWc4PsGkfOi3bezbXfeyLIrRa1uUQa/LcA==
X-ME-Sender: <xms:rAEtZX5EqDXqwn7SAl7aHJeK063ZSiOQ85XEmg0ZMEsapWe29lia5A>
    <xme:rAEtZc55TLYWBt3QDbI3bGvc9VrAhil1ftY89eXgSqPOZ1KRkwJx9whA91DbedSEU
    GFuC3yLCv7Brw30lCM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrjedtgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:rAEtZedIRzmCJ9LRNI4K1oOexhP8aVZo1DANYRYaaLrJvkONUNu7RQ>
    <xmx:rAEtZYIAsTrnlZxeQqaLtscPkHWwe5W_5Y9nl44lZkkUoAbaxr-hsA>
    <xmx:rAEtZbLH7XMOT6IKq4fpr_W5uQa5kPnmhE2XGlMELzkajTcK9rseAQ>
    <xmx:rQEtZcVF72CJTxOYPobBepYwK2km5GyUzaT-74P8pkkSZbat9zYfyQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id AC02AB60089; Mon, 16 Oct 2023 05:26:04 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1019-ged83ad8595-fm-20231002.001-ged83ad85
MIME-Version: 1.0
Message-Id: <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com>
In-Reply-To: <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
 <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
Date:   Mon, 16 Oct 2023 11:25:44 +0200
From:   "Arnd Bergmann" <arnd@arndb.de>
To:     =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     "Masahiro Yamada" <masahiroy@kernel.org>,
        "David Woodhouse" <dwmw2@infradead.org>,
        linux-kbuild@vger.kernel.org,
        "Richard Weinberger" <richard@nod.at>,
        "Atsushi Nemoto" <anemo@mba.ocn.ne.jp>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-mtd@lists.infradead.org,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Miquel Raynal" <miquel.raynal@bootlin.com>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Vignesh Raghavendra" <vigneshr@ti.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with __refdata
 to prevent section mismatch warning
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 9, 2023, at 12:30, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:
>
> only a slight correction: As not having a remove callback can be fine
> and platform_remove() only calls .remove (or .remove_new) when non-NULL
> we're not hitting a NULL pointer dereference in the presence of
>
> 	.remove =3D __exit_p(somefunc),
>
> But a problem can arise later if some resource isn't properly freed and
> so it might be used at a later point in time which then most likely
> oopses.
>
> I didn't double check Arnd's list, but otherwise I agree to his
> analysis.

Hi Uwe,

Based on a few days of randconfig build testing, the patch
below addresses the remaining warnings I get for arm, arm64 and
x86 on linux-next. This is a shorter list than the ones that
I found in theory, possibly because some of the other ones
are only used in built-in code, or because they are never used
on these three architectures.

Have you already sent patches for (some of) these?

      Arnd

 drivers/char/hw_random/mxc-rnga.c                                 | 2 +-
 drivers/gpu/drm/bridge/ti-tpd12s015.c                             | 4 +=
+--
 drivers/hwmon/smsc47m1.c                                          | 2 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c                | 8 +=
+++----
 drivers/media/i2c/et8ek8/et8ek8_driver.c                          | 4 +=
+--
 drivers/memory/emif.c                                             | 2 +-
 drivers/mmc/host/davinci_mmc.c                                    | 2 +-
 drivers/mtd/nand/raw/txx9ndfmc.c                                  | 2 +-
 drivers/pci/controller/dwc/pci-exynos.c                           | 4 +=
+--
 drivers/pci/controller/dwc/pcie-kirin.c                           | 4 +=
+--
 drivers/power/reset/at91-poweroff.c                               | 2 +-
 drivers/power/reset/at91-reset.c                                  | 2 +-
 drivers/power/reset/at91-sama5d2_shdwc.c                          | 2 +-
 drivers/rtc/rtc-at91rm9200.c                                      | 2 +-
 drivers/rtc/rtc-imxdi.c                                           | 2 +-
 drivers/rtc/rtc-mv.c                                              | 2 +-
 drivers/rtc/rtc-pxa.c                                             | 2 +-
 drivers/rtc/rtc-sh.c                                              | 2 +-
 drivers/video/fbdev/atmel_lcdfb.c                                 | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c   | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c         | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c        | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c        | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c        | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c     | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c             | 2 +-
 drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c          | 2 +-
 .../video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c   | 2 +-
 drivers/virt/coco/sev-guest/sev-guest.c                           | 2 +-
 drivers/watchdog/at91sam9_wdt.c                                   | 2 +-
 sound/soc/codecs/tlv320adc3xxx.c                                  | 4 +=
+--
 31 files changed, 39 insertions(+), 39 deletions(-)
diff --git a/drivers/char/hw_random/mxc-rnga.c b/drivers/char/hw_random/=
mxc-rnga.c
index 008763c988ed8..fc23777fffc90 100644
--- a/drivers/char/hw_random/mxc-rnga.c
+++ b/drivers/char/hw_random/mxc-rnga.c
@@ -194,7 +194,7 @@ static const struct of_device_id mxc_rnga_of_match[]=
 =3D {
 };
 MODULE_DEVICE_TABLE(of, mxc_rnga_of_match);
=20
-static struct platform_driver mxc_rnga_driver =3D {
+static struct platform_driver mxc_rnga_driver __refdata =3D {
 	.driver =3D {
 		.name =3D "mxc_rnga",
 		.of_match_table =3D mxc_rnga_of_match,
diff --git a/drivers/gpu/drm/bridge/ti-tpd12s015.c b/drivers/gpu/drm/bri=
dge/ti-tpd12s015.c
index e0e015243a602..ecd0e0db68af3 100644
--- a/drivers/gpu/drm/bridge/ti-tpd12s015.c
+++ b/drivers/gpu/drm/bridge/ti-tpd12s015.c
@@ -179,7 +179,7 @@ static int tpd12s015_probe(struct platform_device *p=
dev)
 	return 0;
 }
=20
-static int __exit tpd12s015_remove(struct platform_device *pdev)
+static int tpd12s015_remove(struct platform_device *pdev)
 {
 	struct tpd12s015_device *tpd =3D platform_get_drvdata(pdev);
=20
@@ -197,7 +197,7 @@ MODULE_DEVICE_TABLE(of, tpd12s015_of_match);
=20
 static struct platform_driver tpd12s015_driver =3D {
 	.probe	=3D tpd12s015_probe,
-	.remove	=3D __exit_p(tpd12s015_remove),
+	.remove	=3D tpd12s015_remove,
 	.driver	=3D {
 		.name	=3D "tpd12s015",
 		.of_match_table =3D tpd12s015_of_match,
diff --git a/drivers/hwmon/smsc47m1.c b/drivers/hwmon/smsc47m1.c
index 37531b5c82547..ff454f4fb0ffb 100644
--- a/drivers/hwmon/smsc47m1.c
+++ b/drivers/hwmon/smsc47m1.c
@@ -850,7 +850,7 @@ static int __exit smsc47m1_remove(struct platform_de=
vice *pdev)
 	return 0;
 }
=20
-static struct platform_driver smsc47m1_driver =3D {
+static struct platform_driver smsc47m1_driver __refdata =3D {
 	.driver =3D {
 		.name	=3D DRVNAME,
 	},
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/driver=
s/hwtracing/coresight/coresight-etm4x-core.c
index 77b0271ce6eb9..69e292ca49f0a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2224,7 +2224,7 @@ static void clear_etmdrvdata(void *info)
 	per_cpu(delayed_probe, cpu) =3D NULL;
 }
=20
-static void __exit etm4_remove_dev(struct etmv4_drvdata *drvdata)
+static void etm4_remove_dev(struct etmv4_drvdata *drvdata)
 {
 	bool had_delayed_probe;
 	/*
@@ -2253,7 +2253,7 @@ static void __exit etm4_remove_dev(struct etmv4_dr=
vdata *drvdata)
 	}
 }
=20
-static void __exit etm4_remove_amba(struct amba_device *adev)
+static void etm4_remove_amba(struct amba_device *adev)
 {
 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&adev->dev);
=20
@@ -2261,7 +2261,7 @@ static void __exit etm4_remove_amba(struct amba_de=
vice *adev)
 		etm4_remove_dev(drvdata);
 }
=20
-static int __exit etm4_remove_platform_dev(struct platform_device *pdev)
+static int etm4_remove_platform_dev(struct platform_device *pdev)
 {
 	struct etmv4_drvdata *drvdata =3D dev_get_drvdata(&pdev->dev);
=20
@@ -2305,7 +2305,7 @@ static const struct amba_id etm4_ids[] =3D {
=20
 MODULE_DEVICE_TABLE(amba, etm4_ids);
=20
-static struct amba_driver etm4x_amba_driver =3D {
+static struct amba_driver etm4x_amba_driver __refdata =3D {
 	.drv =3D {
 		.name   =3D "coresight-etm4x",
 		.owner  =3D THIS_MODULE,
diff --git a/drivers/media/i2c/et8ek8/et8ek8_driver.c b/drivers/media/i2=
c/et8ek8/et8ek8_driver.c
index d6fc843f9368e..0d6f0f8506f76 100644
--- a/drivers/media/i2c/et8ek8/et8ek8_driver.c
+++ b/drivers/media/i2c/et8ek8/et8ek8_driver.c
@@ -1460,7 +1460,7 @@ static int et8ek8_probe(struct i2c_client *client)
 	return ret;
 }
=20
-static void __exit et8ek8_remove(struct i2c_client *client)
+static void et8ek8_remove(struct i2c_client *client)
 {
 	struct v4l2_subdev *subdev =3D i2c_get_clientdata(client);
 	struct et8ek8_sensor *sensor =3D to_et8ek8_sensor(subdev);
@@ -1502,7 +1502,7 @@ static struct i2c_driver et8ek8_i2c_driver =3D {
 		.of_match_table	=3D et8ek8_of_table,
 	},
 	.probe		=3D et8ek8_probe,
-	.remove		=3D __exit_p(et8ek8_remove),
+	.remove		=3D et8ek8_remove,
 	.id_table	=3D et8ek8_id_table,
 };
=20
diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index f305643209f03..b0378dca13b85 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -1184,7 +1184,7 @@ static const struct of_device_id emif_of_match[] =3D=
 {
 MODULE_DEVICE_TABLE(of, emif_of_match);
 #endif
=20
-static struct platform_driver emif_driver =3D {
+static struct platform_driver emif_driver __refdata =3D {
 	.remove		=3D __exit_p(emif_remove),
 	.shutdown	=3D emif_shutdown,
 	.driver =3D {
diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_m=
mc.c
index ee3b1a4e08485..f35436e3ffc1e 100644
--- a/drivers/mmc/host/davinci_mmc.c
+++ b/drivers/mmc/host/davinci_mmc.c
@@ -1391,7 +1391,7 @@ static const struct dev_pm_ops davinci_mmcsd_pm =3D=
 {
 #define davinci_mmcsd_pm_ops NULL
 #endif
=20
-static struct platform_driver davinci_mmcsd_driver =3D {
+static struct platform_driver davinci_mmcsd_driver __refdata =3D {
 	.driver		=3D {
 		.name	=3D "davinci_mmc",
 		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
diff --git a/drivers/mtd/nand/raw/txx9ndfmc.c b/drivers/mtd/nand/raw/txx=
9ndfmc.c
index eddcc0728a676..cb8bd5324e1d3 100644
--- a/drivers/mtd/nand/raw/txx9ndfmc.c
+++ b/drivers/mtd/nand/raw/txx9ndfmc.c
@@ -406,7 +406,7 @@ static int txx9ndfmc_resume(struct platform_device *=
dev)
 #define txx9ndfmc_resume NULL
 #endif
=20
-static struct platform_driver txx9ndfmc_driver =3D {
+static struct platform_driver txx9ndfmc_driver __refdata =3D {
 	.remove		=3D __exit_p(txx9ndfmc_remove),
 	.resume		=3D txx9ndfmc_resume,
 	.driver		=3D {
diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/contr=
oller/dwc/pci-exynos.c
index 6319082301d68..c6bede3469320 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -375,7 +375,7 @@ static int exynos_pcie_probe(struct platform_device =
*pdev)
 	return ret;
 }
=20
-static int __exit exynos_pcie_remove(struct platform_device *pdev)
+static int exynos_pcie_remove(struct platform_device *pdev)
 {
 	struct exynos_pcie *ep =3D platform_get_drvdata(pdev);
=20
@@ -431,7 +431,7 @@ static const struct of_device_id exynos_pcie_of_matc=
h[] =3D {
=20
 static struct platform_driver exynos_pcie_driver =3D {
 	.probe		=3D exynos_pcie_probe,
-	.remove		=3D __exit_p(exynos_pcie_remove),
+	.remove		=3D exynos_pcie_remove,
 	.driver =3D {
 		.name	=3D "exynos-pcie",
 		.of_match_table =3D exynos_pcie_of_match,
diff --git a/drivers/pci/controller/dwc/pcie-kirin.c b/drivers/pci/contr=
oller/dwc/pcie-kirin.c
index d93bc29069502..2ee146767971c 100644
--- a/drivers/pci/controller/dwc/pcie-kirin.c
+++ b/drivers/pci/controller/dwc/pcie-kirin.c
@@ -741,7 +741,7 @@ static int kirin_pcie_power_on(struct platform_devic=
e *pdev,
 	return ret;
 }
=20
-static int __exit kirin_pcie_remove(struct platform_device *pdev)
+static int kirin_pcie_remove(struct platform_device *pdev)
 {
 	struct kirin_pcie *kirin_pcie =3D platform_get_drvdata(pdev);
=20
@@ -818,7 +818,7 @@ static int kirin_pcie_probe(struct platform_device *=
pdev)
=20
 static struct platform_driver kirin_pcie_driver =3D {
 	.probe			=3D kirin_pcie_probe,
-	.remove	        	=3D __exit_p(kirin_pcie_remove),
+	.remove	        	=3D kirin_pcie_remove,
 	.driver			=3D {
 		.name			=3D "kirin-pcie",
 		.of_match_table		=3D kirin_pcie_match,
diff --git a/drivers/power/reset/at91-poweroff.c b/drivers/power/reset/a=
t91-poweroff.c
index dd5399785b691..061e3e2af751e 100644
--- a/drivers/power/reset/at91-poweroff.c
+++ b/drivers/power/reset/at91-poweroff.c
@@ -223,7 +223,7 @@ static const struct of_device_id at91_poweroff_of_ma=
tch[] =3D {
 };
 MODULE_DEVICE_TABLE(of, at91_poweroff_of_match);
=20
-static struct platform_driver at91_poweroff_driver =3D {
+static struct platform_driver at91_poweroff_driver __refdata =3D {
 	.remove =3D __exit_p(at91_poweroff_remove),
 	.driver =3D {
 		.name =3D "at91-poweroff",
diff --git a/drivers/power/reset/at91-reset.c b/drivers/power/reset/at91=
-reset.c
index aa9b012d3d00b..5750e58b7daf9 100644
--- a/drivers/power/reset/at91-reset.c
+++ b/drivers/power/reset/at91-reset.c
@@ -427,7 +427,7 @@ static int __exit at91_reset_remove(struct platform_=
device *pdev)
 	return 0;
 }
=20
-static struct platform_driver at91_reset_driver =3D {
+static struct platform_driver at91_reset_driver __refdata =3D {
 	.remove =3D __exit_p(at91_reset_remove),
 	.driver =3D {
 		.name =3D "at91-reset",
diff --git a/drivers/power/reset/at91-sama5d2_shdwc.c b/drivers/power/re=
set/at91-sama5d2_shdwc.c
index e76b102b57b1f..0a6bc0ad2310d 100644
--- a/drivers/power/reset/at91-sama5d2_shdwc.c
+++ b/drivers/power/reset/at91-sama5d2_shdwc.c
@@ -441,7 +441,7 @@ static int __exit at91_shdwc_remove(struct platform_=
device *pdev)
 	return 0;
 }
=20
-static struct platform_driver at91_shdwc_driver =3D {
+static struct platform_driver at91_shdwc_driver __refdata =3D {
 	.remove =3D __exit_p(at91_shdwc_remove),
 	.driver =3D {
 		.name =3D "at91-shdwc",
diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index add4f71d7b3b9..04eed377c7eb0 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -635,7 +635,7 @@ static int at91_rtc_resume(struct device *dev)
=20
 static SIMPLE_DEV_PM_OPS(at91_rtc_pm_ops, at91_rtc_suspend, at91_rtc_re=
sume);
=20
-static struct platform_driver at91_rtc_driver =3D {
+static struct platform_driver at91_rtc_driver __refdata =3D {
 	.remove		=3D __exit_p(at91_rtc_remove),
 	.shutdown	=3D at91_rtc_shutdown,
 	.driver		=3D {
diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 4b712e5ab08a0..05f26c5fcc955 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -851,7 +851,7 @@ static const struct of_device_id dryice_dt_ids[] =3D=
 {
=20
 MODULE_DEVICE_TABLE(of, dryice_dt_ids);
=20
-static struct platform_driver dryice_rtc_driver =3D {
+static struct platform_driver dryice_rtc_driver __refdata =3D {
 	.driver =3D {
 		   .name =3D "imxdi_rtc",
 		   .of_match_table =3D dryice_dt_ids,
diff --git a/drivers/rtc/rtc-mv.c b/drivers/rtc/rtc-mv.c
index 6c526e2ec56d8..0d6226f9a4b46 100644
--- a/drivers/rtc/rtc-mv.c
+++ b/drivers/rtc/rtc-mv.c
@@ -303,7 +303,7 @@ static const struct of_device_id rtc_mv_of_match_tab=
le[] =3D {
 MODULE_DEVICE_TABLE(of, rtc_mv_of_match_table);
 #endif
=20
-static struct platform_driver mv_rtc_driver =3D {
+static struct platform_driver mv_rtc_driver __refdata =3D {
 	.remove		=3D __exit_p(mv_rtc_remove),
 	.driver		=3D {
 		.name	=3D "rtc-mv",
diff --git a/drivers/rtc/rtc-pxa.c b/drivers/rtc/rtc-pxa.c
index e400c78252e82..be0b36dd9d150 100644
--- a/drivers/rtc/rtc-pxa.c
+++ b/drivers/rtc/rtc-pxa.c
@@ -403,7 +403,7 @@ static int pxa_rtc_resume(struct device *dev)
=20
 static SIMPLE_DEV_PM_OPS(pxa_rtc_pm_ops, pxa_rtc_suspend, pxa_rtc_resum=
e);
=20
-static struct platform_driver pxa_rtc_driver =3D {
+static struct platform_driver pxa_rtc_driver __refdata =3D {
 	.remove		=3D __exit_p(pxa_rtc_remove),
 	.driver		=3D {
 		.name	=3D "pxa-rtc",
diff --git a/drivers/rtc/rtc-sh.c b/drivers/rtc/rtc-sh.c
index 613a5a3a09cf3..96dd3a73707d6 100644
--- a/drivers/rtc/rtc-sh.c
+++ b/drivers/rtc/rtc-sh.c
@@ -668,7 +668,7 @@ static const struct of_device_id sh_rtc_of_match[] =3D=
 {
 };
 MODULE_DEVICE_TABLE(of, sh_rtc_of_match);
=20
-static struct platform_driver sh_rtc_platform_driver =3D {
+static struct platform_driver sh_rtc_platform_driver __refdata =3D {
 	.driver		=3D {
 		.name	=3D DRV_NAME,
 		.pm	=3D &sh_rtc_pm_ops,
diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atm=
el_lcdfb.c
index a908db2334098..aad6efae964ad 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1300,7 +1300,7 @@ static int atmel_lcdfb_resume(struct platform_devi=
ce *pdev)
 #define atmel_lcdfb_resume	NULL
 #endif
=20
-static struct platform_driver atmel_lcdfb_driver =3D {
+static struct platform_driver atmel_lcdfb_driver __refdata =3D {
 	.remove		=3D __exit_p(atmel_lcdfb_remove),
 	.suspend	=3D atmel_lcdfb_suspend,
 	.resume		=3D atmel_lcdfb_resume,
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-=
tv.c b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
index 0daaf9f89bab5..3f555b65e81a0 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c
@@ -245,7 +245,7 @@ static const struct of_device_id tvc_of_match[] =3D {
=20
 MODULE_DEVICE_TABLE(of, tvc_of_match);
=20
-static struct platform_driver tvc_connector_driver =3D {
+static struct platform_driver tvc_connector_driver __refdata =3D {
 	.probe	=3D tvc_probe,
 	.remove	=3D __exit_p(tvc_remove),
 	.driver	=3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c b=
/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
index c8ad3ef42bd31..dfcfba9b6efa7 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c
@@ -328,7 +328,7 @@ static const struct of_device_id dvic_of_match[] =3D=
 {
=20
 MODULE_DEVICE_TABLE(of, dvic_of_match);
=20
-static struct platform_driver dvi_connector_driver =3D {
+static struct platform_driver dvi_connector_driver __refdata =3D {
 	.probe	=3D dvic_probe,
 	.remove	=3D __exit_p(dvic_remove),
 	.driver	=3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c =
b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
index 8f9ff9fb4ca4c..2ed3103005034 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c
@@ -272,7 +272,7 @@ static const struct of_device_id hdmic_of_match[] =3D=
 {
=20
 MODULE_DEVICE_TABLE(of, hdmic_of_match);
=20
-static struct platform_driver hdmi_connector_driver =3D {
+static struct platform_driver hdmi_connector_driver __refdata =3D {
 	.probe	=3D hdmic_probe,
 	.remove	=3D __exit_p(hdmic_remove),
 	.driver	=3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c =
b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
index dd29dc5c77ec8..cc19eef9a4609 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c
@@ -258,7 +258,7 @@ static const struct of_device_id opa362_of_match[] =3D=
 {
 };
 MODULE_DEVICE_TABLE(of, opa362_of_match);
=20
-static struct platform_driver opa362_driver =3D {
+static struct platform_driver opa362_driver __refdata =3D {
 	.probe	=3D opa362_probe,
 	.remove	=3D __exit_p(opa362_remove),
 	.driver	=3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c =
b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
index 7bac420169a69..4900edaf1068d 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c
@@ -245,7 +245,7 @@ static const struct of_device_id tfp410_of_match[] =3D=
 {
=20
 MODULE_DEVICE_TABLE(of, tfp410_of_match);
=20
-static struct platform_driver tfp410_driver =3D {
+static struct platform_driver tfp410_driver __refdata =3D {
 	.probe	=3D tfp410_probe,
 	.remove	=3D __exit_p(tfp410_remove),
 	.driver	=3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015=
.c b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
index 67f0c9250e9e4..648bb1367dc5a 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c
@@ -311,7 +311,7 @@ static const struct of_device_id tpd_of_match[] =3D {
=20
 MODULE_DEVICE_TABLE(of, tpd_of_match);
=20
-static struct platform_driver tpd_driver =3D {
+static struct platform_driver tpd_driver __refdata =3D {
 	.probe	=3D tpd_probe,
 	.remove	=3D __exit_p(tpd_remove),
 	.driver	=3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c b/dri=
vers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
index 9790053c5877c..e39becd4d8ecf 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c
@@ -234,7 +234,7 @@ static const struct of_device_id panel_dpi_of_match[=
] =3D {
=20
 MODULE_DEVICE_TABLE(of, panel_dpi_of_match);
=20
-static struct platform_driver panel_dpi_driver =3D {
+static struct platform_driver panel_dpi_driver __refdata =3D {
 	.probe =3D panel_dpi_probe,
 	.remove =3D __exit_p(panel_dpi_remove),
 	.driver =3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c b/=
drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
index 77fce1223a640..5d8b6daeb199b 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c
@@ -1280,7 +1280,7 @@ static const struct of_device_id dsicm_of_match[] =
=3D {
=20
 MODULE_DEVICE_TABLE(of, dsicm_of_match);
=20
-static struct platform_driver dsicm_driver =3D {
+static struct platform_driver dsicm_driver __refdata =3D {
 	.probe =3D dsicm_probe,
 	.remove =3D __exit_p(dsicm_remove),
 	.driver =3D {
diff --git a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037=
v7dw01.c b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7=
dw01.c
index cc30758300e25..9181008c5c79c 100644
--- a/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
+++ b/drivers/video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c
@@ -315,7 +315,7 @@ static const struct of_device_id sharp_ls_of_match[]=
 =3D {
=20
 MODULE_DEVICE_TABLE(of, sharp_ls_of_match);
=20
-static struct platform_driver sharp_ls_driver =3D {
+static struct platform_driver sharp_ls_driver __refdata =3D {
 	.probe =3D sharp_ls_probe,
 	.remove =3D __exit_p(sharp_ls_remove),
 	.driver =3D {
diff --git a/drivers/virt/coco/sev-guest/sev-guest.c b/drivers/virt/coco=
/sev-guest/sev-guest.c
index 97dbe715e96ad..5b299af5b1867 100644
--- a/drivers/virt/coco/sev-guest/sev-guest.c
+++ b/drivers/virt/coco/sev-guest/sev-guest.c
@@ -852,7 +852,7 @@ static int __exit sev_guest_remove(struct platform_d=
evice *pdev)
  * support any SEV guest API. As such, even though it has been introduc=
ed
  * with the SEV-SNP support, it is named "sev-guest".
  */
-static struct platform_driver sev_guest_driver =3D {
+static struct platform_driver sev_guest_driver __refdata =3D {
 	.remove		=3D __exit_p(sev_guest_remove),
 	.driver		=3D {
 		.name =3D "sev-guest",
diff --git a/drivers/watchdog/at91sam9_wdt.c b/drivers/watchdog/at91sam9=
_wdt.c
index b111b28acb948..b55ae7998a8d3 100644
--- a/drivers/watchdog/at91sam9_wdt.c
+++ b/drivers/watchdog/at91sam9_wdt.c
@@ -392,7 +392,7 @@ static const struct of_device_id at91_wdt_dt_ids[] =3D=
 {
 MODULE_DEVICE_TABLE(of, at91_wdt_dt_ids);
 #endif
=20
-static struct platform_driver at91wdt_driver =3D {
+static struct platform_driver at91wdt_driver __refdata =3D {
 	.remove		=3D __exit_p(at91wdt_remove),
 	.driver		=3D {
 		.name	=3D "at91_wdt",
diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320a=
dc3xxx.c
index 420bbf588efea..e100cc9f5c192 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -1429,7 +1429,7 @@ static int adc3xxx_i2c_probe(struct i2c_client *i2=
c)
 	return ret;
 }
=20
-static void __exit adc3xxx_i2c_remove(struct i2c_client *client)
+static void adc3xxx_i2c_remove(struct i2c_client *client)
 {
 	struct adc3xxx *adc3xxx =3D i2c_get_clientdata(client);
=20
@@ -1452,7 +1452,7 @@ static struct i2c_driver adc3xxx_i2c_driver =3D {
 		   .of_match_table =3D tlv320adc3xxx_of_match,
 		  },
 	.probe =3D adc3xxx_i2c_probe,
-	.remove =3D __exit_p(adc3xxx_i2c_remove),
+	.remove =3D adc3xxx_i2c_remove,
 	.id_table =3D adc3xxx_i2c_id,
 };
=20
