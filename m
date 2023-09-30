Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DA717B4010
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Sep 2023 13:08:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbjI3LIq (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Sep 2023 07:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbjI3LIp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Sep 2023 07:08:45 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0133ECA
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 04:08:42 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FDFC433CA
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 11:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696072122;
        bh=CLdhkn3fW0Xmny2sWHVesYKE7DyLFoAEWC69y4OUJdM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WNalzO8ICpXYKeXi2FhjHX1CoadRN3GJT2EbFd2O4f5Pwk6XJp77FJpwSTjodWVnd
         WEBU7hnElZPvY9ykhgRQFq4sGPN2QeP+HnfD+loIvzv2eoaNLOcn5CvMiBBe8k2daw
         B4ljsLoPxhhaOo5CgsMN31yqZnATYTy27tXKUH5x4lr6xO7LAnGxrcLiSHLOQqvWiK
         3RB23xf9GuU9ADjoDkJjp0W3+Q5opZplReyUZbWlDI6DdO1DoLKtDcj+WzBCsLf7yk
         ZOURXPEMoRgOpOmtqrEKSxYDhDrD4BI3r0wO9AVBU8wLrk7jdDZMShab8lidabUSU/
         LJdlScAsdT+mw==
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-57b9cb05fa3so808511eaf.1
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 04:08:42 -0700 (PDT)
X-Gm-Message-State: AOJu0YwcPhfhvg7KN4BZ0bhBDzTiI3NxZqQ7P+Y2+7Pilifry1L9poC2
        LVHLtyVkusLrqiPmSRU7vidoO82uiCaNRar+bI4=
X-Google-Smtp-Source: AGHT+IEIChrvmfthmQZ6KBWUJaYcSJ1yqFjgLrXgKRjU08C2r/4nYE1pfMM+dVmKZgyasDnYFetUr+gSQMFXoWJET4s=
X-Received: by 2002:a05:6870:179d:b0:1b0:3821:f09b with SMTP id
 r29-20020a056870179d00b001b03821f09bmr3663404oae.13.1696072121869; Sat, 30
 Sep 2023 04:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230929081540.yija47lsj35xtj4v@pengutronix.de> <20230929174101.3oqx7yxskneuj4gs@pengutronix.de>
In-Reply-To: <20230929174101.3oqx7yxskneuj4gs@pengutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 30 Sep 2023 20:08:05 +0900
X-Gmail-Original-Message-ID: <CAK7LNASkRnJsBdOaXdVizVWHLqYWoJWdzthuSNNEwhYLNYM2cw@mail.gmail.com>
Message-ID: <CAK7LNASkRnJsBdOaXdVizVWHLqYWoJWdzthuSNNEwhYLNYM2cw@mail.gmail.com>
Subject: Re: section mismatch test doesn't work reliably on arm64
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        James Clark <james.clark@arm.com>, kernel@pengutronix.de,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>,
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

On Sat, Sep 30, 2023 at 2:41=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Fri, Sep 29, 2023 at 10:15:40AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > by manual inspection I found a section mismatch in
> > drivers/hwtracing/coresight/coresight-etm4x-core.c where
> > etm4_platform_driver (which lives in ".data") contains a reference to
> > etm4_remove_platform_dev() (which lives in ".exit.text").
> >
> > However building with CONFIG_DEBUG_SECTION_MISMATCH=3Dy +
> > CONFIG_CORESIGHT_SOURCE_ETM4X=3Dy doesn't warn about that one.
>
> Arnd had the right hint in irc: If I do
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 34a5386d444a..070e53be1ea2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1017,7 +1017,7 @@ static int secref_whitelist(const char *fromsec, co=
nst char *fromsym,
>
>         /* symbols in data sections that may refer to meminit/exit sectio=
ns */
>         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> -           match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_EXIT_SECTIONS=
)) &&
> +           match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_XXXEXIT_SECTI=
ONS)) &&
>             match(fromsym, PATTERNS("*driver")))
>                 return 0;
>
> I get a mismatch warning:
>
> WARNING: modpost: vmlinux: section mismatch in reference: etm4x_amba_driv=
er+0x98 (section: .data) -> etm4_remove_amba (section: .exit.text)
> WARNING: modpost: vmlinux: section mismatch in reference: etm4_platform_d=
river+0x8 (section: .data) -> etm4_remove_platform_dev (section: .exit.text=
)
> ERROR: modpost: Section mismatches detected.
>
> I remember that back in the times of CONFIG_HOTPLUG references to
> ".devinit.text" and ".devexit.text" were ok. Is a reference to
> .exit.text ever ok?
>
> I started an allyesconfig build on a few archs with the above patch
> applied. This will take some time, when it's done I will report what it
> found.



allmodconfig on x86 detects several issues.

WARNING: modpost: drivers/pci/controller/dwc/pci-exynos: section
mismatch in reference: exynos_pcie_driver+0x8 (section: .data) ->
exynos_pcie_remove (section: .exit.text)
WARNING: modpost: drivers/pci/controller/dwc/pcie-kirin: section
mismatch in reference: kirin_pcie_driver+0x8 (section: .data) ->
kirin_pcie_remove (section: .exit.text)
WARNING: modpost:
drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362: section
mismatch in reference: opa362_driver+0x8 (section: .data) ->
opa362_remove (section: .exit.text)
WARNING: modpost:
drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410: section
mismatch in reference: tfp410_driver+0x8 (section: .data) ->
tfp410_remove (section: .exit.text)
WARNING: modpost:
drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015: section
mismatch in reference: tpd_driver+0x8 (section: .data) -> tpd_remove
(section: .exit.text)
WARNING: modpost:
drivers/video/fbdev/omap2/omapfb/displays/connector-dvi: section
mismatch in reference: dvi_connector_driver+0x8 (section: .data) ->
dvic_remove (section: .exit.text)
WARNING: modpost:
drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi: section
mismatch in reference: hdmi_connector_driver+0x8 (section: .data) ->
hdmic_remove (section: .exit.text)
WARNING: modpost:
drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv: section
mismatch in reference: tvc_connector_driver+0x8 (section: .data) ->
tvc_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-dpi:
section mismatch in reference: panel_dpi_driver+0x8 (section: .data)
-> panel_dpi_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/atmel_lcdfb: section mismatch in
reference: atmel_lcdfb_driver+0x8 (section: .data) ->
atmel_lcdfb_remove (section: .exit.text)
WARNING: modpost: drivers/char/hw_random/mxc-rnga: section mismatch in
reference: mxc_rnga_driver+0x8 (section: .data) -> mxc_rnga_remove
(section: .exit.text)
WARNING: modpost: drivers/gpu/drm/bridge/ti-tpd12s015: section
mismatch in reference: tpd12s015_driver+0x8 (section: .data) ->
tpd12s015_remove (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-at91rm9200: section mismatch in
reference: at91_rtc_driver+0x8 (section: .data) -> at91_rtc_remove
(section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-mv: section mismatch in reference:
mv_rtc_driver+0x8 (section: .data) -> mv_rtc_remove (section:
.exit.text)
WARNING: modpost: drivers/rtc/rtc-pcap: section mismatch in reference:
pcap_rtc_driver+0x8 (section: .data) -> pcap_rtc_remove (section:
.exit.text)
WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in
reference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove
(section: .exit.text)
WARNING: modpost: drivers/watchdog/at91sam9_wdt: section mismatch in
reference: at91wdt_driver+0x8 (section: .data) -> at91wdt_remove
(section: .exit.text)
WARNING: modpost: drivers/mmc/host/davinci_mmc: section mismatch in
reference: davinci_mmcsd_driver+0x10 (section: .data) ->
davinci_mmcsd_remove (section: .exit.text)
WARNING: modpost: drivers/platform/x86/hp/hp-wmi: section mismatch in
reference: hp_wmi_driver+0x8 (section: .data) -> hp_wmi_bios_remove
(section: .exit.text)
WARNING: modpost: drivers/virt/coco/sev-guest/sev-guest: section
mismatch in reference: sev_guest_driver+0x8 (section: .data) ->
sev_guest_remove (section: .exit.text)
WARNING: modpost: drivers/memory/emif: section mismatch in reference:
emif_driver+0x8 (section: .data) -> emif_remove (section: .exit.text)
WARNING: modpost: drivers/mtd/nand/raw/txx9ndfmc: section mismatch in
reference: txx9ndfmc_driver+0x8 (section: .data) -> txx9ndfmc_remove
(section: .exit.text)
WARNING: modpost: drivers/hwmon/smsc47m1: section mismatch in
reference: smsc47m1_driver+0x8 (section: .data) -> smsc47m1_remove
(section: .exit.text)
WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section
mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) ->
adc3xxx_i2c_remove (section: .exit.text)



Linus requires zero warning, so we cannot enable the modpost warning
unless we fix all the sources of the warnings.
That will need one or two dev cycles.


If you want to turn on the warning now, you can surround the check
with 'if (extra_warn) '.


Since commit 20ff36856fe00879f82de71fe6f1482ca1b72334
it is possible to enable a modpost warning only under W=3D1 builds.



--=20
Best Regards
Masahiro Yamada
