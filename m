Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B37A71640D7
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Feb 2020 10:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbgBSJyP (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Feb 2020 04:54:15 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40960 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726385AbgBSJyO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Feb 2020 04:54:14 -0500
Received: by mail-ot1-f66.google.com with SMTP id r27so22501090otc.8;
        Wed, 19 Feb 2020 01:54:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Bwu5MvltkUCeRO6er5fMDfuqToYZYnvunzcK/Xsz8w=;
        b=GipGYnlpTXfmKu7qfmhDTY3idobdA8zsr75Pls5mhIOG2NgwC81J+DvqBpItncaLNf
         jaG0UrnWYRhlr5gW9gctnYEO1Q4XahLC7uMe2KOAZinYIiwaNkxECUkEJ1Btv3Zd5GYu
         3KJLHblGdFqK9lxNwx9vGtVlvct1vOO2dWGMMmtXMr8wEAkJq+15jw96TWh8pK8kJCcW
         yOdBWAbQa4cVuoKoqlXq/y3KqssiWL9HUFAxv9KCJhpA/6A5QmdsQftg3HNqanXs+7jd
         uZuLoEsl7qQU5LQvcGp6s5D8rEFRtLA0oxnvDkz2Tz23yT/LcxdtxcF1b/gCR4RUSGxX
         4p8A==
X-Gm-Message-State: APjAAAXr1XuIvwT4w+9JUA+KFZwC0+ukMOIFLUf6RnyfsbsRbvuhSClT
        VZzlHPxztOU3mvmirHgOlvS7m6Y0YoymkaGQYWc=
X-Google-Smtp-Source: APXvYqzhFpH5yv+pwpfRXrH0llwuXSBHn72PI0fYAG3+XUnu4MPJ7Jwpc2zSdUW9NS/fDFpYU1Crl8Xj9Aev933ISaQ=
X-Received: by 2002:a9d:7602:: with SMTP id k2mr19153780otl.39.1582106053391;
 Wed, 19 Feb 2020 01:54:13 -0800 (PST)
MIME-Version: 1.0
References: <20200219074950.23344-1-masahiroy@kernel.org> <CAMuHMdU7=jRNCWvtiFhJwUM6P4xNmqwXdPX14qvE=6by1V7APA@mail.gmail.com>
 <CAK7LNATKh9Y_QmO19iPw+zXT8RG-HfXBFY5bvpX0YSyOO-=NGA@mail.gmail.com>
In-Reply-To: <CAK7LNATKh9Y_QmO19iPw+zXT8RG-HfXBFY5bvpX0YSyOO-=NGA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 19 Feb 2020 10:54:02 +0100
Message-ID: <CAMuHMdWNhd3kwqQ2OYOscq3VFDjip_FZtt8w6PVCenz095kCZg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild <linux-kbuild@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Richard Cochran <richardcochran@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Josh Triplett <josh@joshtriplett.org>,
        Mark Brown <broonie@kernel.org>,
        Ulf Magnusson <ulfalizer@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Marek <michal.lkml@markovi.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Yamada-san,

On Wed, Feb 19, 2020 at 10:24 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> On Wed, Feb 19, 2020 at 5:42 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, Feb 19, 2020 at 8:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > The 'imply' statement may create unmet direct dependency when the
> > > implied symbol depends on m.
> > >
> > > [Test Code]
> > >
> > >   config FOO
> > >           tristate "foo"
> > >           imply BAZ
> > >
> > >   config BAZ
> > >           tristate "baz"
> > >           depends on BAR
> > >
> > >   config BAR
> > >           def_tristate m
> > >
> > >   config MODULES
> > >           def_bool y
> > >           option modules
> > >
> > > If you set FOO=y, BAZ is also promoted to y, which results in the
> > > following .config file:
> > >
> > >   CONFIG_FOO=y
> > >   CONFIG_BAZ=y
> > >   CONFIG_BAR=m
> > >   CONFIG_MODULES=y
> > >
> > > This ignores the dependency "BAZ depends on BAR".
> > >
> > > Unlike 'select', what is worse, Kconfig never shows the
> > > "WARNING: unmet direct dependencies detected for ..." for this case.
> > >
> > > Because 'imply' should be weaker than 'depends on', Kconfig should
> > > take the direct dependency into account.
> > >
> > > Describe this case in Documentation/kbuild/kconfig-language.rst for
> > > clarification.
> > >
> > > Commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword") says that
> > > a symbol implied by y is restricted to y or n, excluding m.
> > >
> > > As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> > > by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> > > possible value is BAZ=n.
> > >
> > > Having said that, this case was probably "We don't care" at that time
> > > because Kconfig did not handle 'depends on m' correctly until
> > > commit f622f8279581 ("kconfig: warn unmet direct dependency of tristate
> > > symbols selected by y") fixed it.
> > >
> > > Backporting this to 4.19+ will probably be fine. If you care this
> > > problem on 4.14.x, you need to backport f622f8279581 as well.
> > >
> > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> >
> > Thanks a lot! This fixes the build issues in
> > https://lore.kernel.org/alsa-devel/CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com/
> >
> > Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Even if this patch fixes the build issues,
> the result may not be what you expect.
>
> The very subtle part of 'imply' is that
> symbols implied by 'y' cannot be 'm'.
>
> When CONFIG_SND_SOC_ALL_CODECS=y,
> the select'ed drivers were previously able to be 'm'.
>
> After ea00d95200d02, drivers that were previously
> 'm' are now 'n'.
>
> Probably, it shrunk the test-coverage.
>
> I'd recommend to compare the .config file.

I always do, when running make oldconfig ;-)

I only see expected changes from y to m.
I don't see any unexpected changes from m to n.
I do see a few unexpected "CONFIG_<foo> is not set" that are no longer
suppressed.

--- .config.orig        2020-02-19 09:26:41.411812042 +0100
+++ .config     2020-02-19 09:28:05.143822097 +0100
@@ -1193,7 +1193,7 @@
 CONFIG_REGMAP=y
 CONFIG_REGMAP_AC97=y
 CONFIG_REGMAP_I2C=y
-CONFIG_REGMAP_SLIMBUS=y
+CONFIG_REGMAP_SLIMBUS=m
 CONFIG_REGMAP_SPI=y
 CONFIG_REGMAP_MMIO=y
 CONFIG_REGMAP_IRQ=y
@@ -5235,7 +5235,7 @@
 CONFIG_SND_SOC_UDA1334=y
 CONFIG_SND_SOC_UDA134X=y
 CONFIG_SND_SOC_UDA1380=y
 CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WL1273=y
 CONFIG_SND_SOC_WM0010=y
@@ -5017,6 +5017,7 @@
 CONFIG_SND_SOC_ARIZONA=y
 CONFIG_SND_SOC_WM_HUBS=y
 CONFIG_SND_SOC_WM_ADSP=y
+# CONFIG_SND_SOC_AB8500_CODEC is not set
 CONFIG_SND_SOC_AC97_CODEC=y
 CONFIG_SND_SOC_AD1836=y
 CONFIG_SND_SOC_AD193X=y
@@ -5085,6 +5086,7 @@
 CONFIG_SND_SOC_CS4341=y
 CONFIG_SND_SOC_CS4349=y
 CONFIG_SND_SOC_CS47L15=y
+# CONFIG_SND_SOC_CS47L24 is not set
 CONFIG_SND_SOC_CS47L35=y
 CONFIG_SND_SOC_CS47L85=y
 CONFIG_SND_SOC_CS47L90=y
@@ -5117,6 +5119,7 @@
 CONFIG_SND_SOC_INNO_RK3036=y
 CONFIG_SND_SOC_ISABELLE=y
 CONFIG_SND_SOC_LM49453=y
+# CONFIG_SND_SOC_LOCHNAGAR_SC is not set
 CONFIG_SND_SOC_MADERA=y
 CONFIG_SND_SOC_MAX98088=y
 CONFIG_SND_SOC_MAX98090=y
@@ -5228,11 +5231,12 @@
 CONFIG_SND_SOC_TSCS42XX=y
 CONFIG_SND_SOC_TSCS454=y
 CONFIG_SND_SOC_TWL4030=y
+# CONFIG_SND_SOC_TWL6040 is not set
 CONFIG_SND_SOC_UDA1334=y
 CONFIG_SND_SOC_UDA134X=y
 CONFIG_SND_SOC_UDA1380=y
-CONFIG_SND_SOC_WCD9335=y
-CONFIG_SND_SOC_WCD934X=y
+CONFIG_SND_SOC_WCD9335=m
+CONFIG_SND_SOC_WCD934X=m
 CONFIG_SND_SOC_WL1273=y
 CONFIG_SND_SOC_WM0010=y
 CONFIG_SND_SOC_WM1250_EV1=y
@@ -5241,6 +5245,8 @@
 CONFIG_SND_SOC_WM5100=y
 CONFIG_SND_SOC_WM5102=m
 CONFIG_SND_SOC_WM5110=y
+# CONFIG_SND_SOC_WM8350 is not set
+# CONFIG_SND_SOC_WM8400 is not set
 CONFIG_SND_SOC_WM8510=y
 CONFIG_SND_SOC_WM8523=y
 CONFIG_SND_SOC_WM8524=y
@@ -5293,7 +5299,7 @@
 CONFIG_SND_SOC_MAX9768=y
 CONFIG_SND_SOC_MAX9877=y
 # CONFIG_SND_SOC_DUMMY is not set
-CONFIG_SND_SOC_MC13783=y
+CONFIG_SND_SOC_MC13783=m
 CONFIG_SND_SOC_ML26124=y
 CONFIG_SND_SOC_MT6351=y
 CONFIG_SND_SOC_MT6358=y
@@ -5899,6 +5905,7 @@
 # CONFIG_COMMON_CLK_MT8516 is not set
 # end of Clock driver for MediaTek SoC

+# CONFIG_COMMON_CLK_AXG_AUDIO is not set
 CONFIG_QCOM_GDSC=y
 CONFIG_COMMON_CLK_QCOM=m
 CONFIG_QCOM_A53PLL=m

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
