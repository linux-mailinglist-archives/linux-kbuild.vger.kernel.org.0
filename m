Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3621755DF
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 09:22:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgCBIWd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 03:22:33 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:31050 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726953AbgCBIWd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 03:22:33 -0500
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0228MRcA017331;
        Mon, 2 Mar 2020 17:22:28 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0228MRcA017331
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583137348;
        bh=0NFqNxJyxan6aRmOhiOYfjzVH/cuDJuR1BoBM2znMoI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=D3uBq8wmBHFaLItBjkFFC8Z01rN7LdpebGuiK4KU6oHMXE91CaUyW3KfUyVybfSJe
         t1SbP526w1Ets2u1kT8iq+zNlMIyRqPm4BV8WqiQm8iBMJriVNMwxhAFRIhHMHEyzv
         0PtBtIZIf0Oj7PQc3er3p8yRDtqe9qnZwh8M20Jx75EC7LptD3Xy/vqMUOXsVpzq9/
         ZaGunzLrpMf2zWdszPteVcBpKop0eXNGJXr0TySyqVp9M0kIsUW+nb9DEbM8C2w8fO
         5hR6qQ3rKuMkdMgePwHLdoa+sWvdTRinas5jPij5pcXJbiMptXDohD4tS6PH34baJe
         YmPu61g9FXLcg==
X-Nifty-SrcIP: [209.85.222.50]
Received: by mail-ua1-f50.google.com with SMTP id y3so3302012uae.3;
        Mon, 02 Mar 2020 00:22:28 -0800 (PST)
X-Gm-Message-State: ANhLgQ3u84tO0g5Bm3RlzOoez9I0B+uPM7gNb0Pyy/vZCqbjo3L34MaQ
        hoES2BjI3JT4qCuNsozi196vzoGTE7/C2G/499E=
X-Google-Smtp-Source: ADFU+vt4TH9XlZghKnEnQCXPSJgYjYvMJZ4r+dBC2Zmb2bsqxJAoGOGBeuSmm17BXzmE+2c2sdMlesfZVbA/nrh1CSY=
X-Received: by 2002:ab0:2414:: with SMTP id f20mr7620189uan.121.1583137347176;
 Mon, 02 Mar 2020 00:22:27 -0800 (PST)
MIME-Version: 1.0
References: <20200219074950.23344-1-masahiroy@kernel.org> <CAMuHMdU7=jRNCWvtiFhJwUM6P4xNmqwXdPX14qvE=6by1V7APA@mail.gmail.com>
 <CAK7LNATKh9Y_QmO19iPw+zXT8RG-HfXBFY5bvpX0YSyOO-=NGA@mail.gmail.com> <CAMuHMdWNhd3kwqQ2OYOscq3VFDjip_FZtt8w6PVCenz095kCZg@mail.gmail.com>
In-Reply-To: <CAMuHMdWNhd3kwqQ2OYOscq3VFDjip_FZtt8w6PVCenz095kCZg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 2 Mar 2020 17:21:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQNb-5RdivSwMONVT_YCXohR-0NMJW5ceVrJPxWUGF+Lg@mail.gmail.com>
Message-ID: <CAK7LNAQNb-5RdivSwMONVT_YCXohR-0NMJW5ceVrJPxWUGF+Lg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make 'imply' obey the direct dependency
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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

Hi Geert,


On Wed, Feb 19, 2020 at 6:54 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Yamada-san,
>
> On Wed, Feb 19, 2020 at 10:24 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > On Wed, Feb 19, 2020 at 5:42 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Wed, Feb 19, 2020 at 8:51 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> > > > The 'imply' statement may create unmet direct dependency when the
> > > > implied symbol depends on m.
> > > >
> > > > [Test Code]
> > > >
> > > >   config FOO
> > > >           tristate "foo"
> > > >           imply BAZ
> > > >
> > > >   config BAZ
> > > >           tristate "baz"
> > > >           depends on BAR
> > > >
> > > >   config BAR
> > > >           def_tristate m
> > > >
> > > >   config MODULES
> > > >           def_bool y
> > > >           option modules
> > > >
> > > > If you set FOO=y, BAZ is also promoted to y, which results in the
> > > > following .config file:
> > > >
> > > >   CONFIG_FOO=y
> > > >   CONFIG_BAZ=y
> > > >   CONFIG_BAR=m
> > > >   CONFIG_MODULES=y
> > > >
> > > > This ignores the dependency "BAZ depends on BAR".
> > > >
> > > > Unlike 'select', what is worse, Kconfig never shows the
> > > > "WARNING: unmet direct dependencies detected for ..." for this case.
> > > >
> > > > Because 'imply' should be weaker than 'depends on', Kconfig should
> > > > take the direct dependency into account.
> > > >
> > > > Describe this case in Documentation/kbuild/kconfig-language.rst for
> > > > clarification.
> > > >
> > > > Commit 237e3ad0f195 ("Kconfig: Introduce the "imply" keyword") says that
> > > > a symbol implied by y is restricted to y or n, excluding m.
> > > >
> > > > As for the combination of FOO=y and BAR=m, the case of BAZ=m is excluded
> > > > by the 'imply', and BAZ=y is also excluded by 'depends on'. So, only the
> > > > possible value is BAZ=n.
> > > >
> > > > Having said that, this case was probably "We don't care" at that time
> > > > because Kconfig did not handle 'depends on m' correctly until
> > > > commit f622f8279581 ("kconfig: warn unmet direct dependency of tristate
> > > > symbols selected by y") fixed it.
> > > >
> > > > Backporting this to 4.19+ will probably be fine. If you care this
> > > > problem on 4.14.x, you need to backport f622f8279581 as well.
> > > >
> > > > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > >
> > > Thanks a lot! This fixes the build issues in
> > > https://lore.kernel.org/alsa-devel/CAMuHMdW8SvDgQJyenTtEm4Xn2Ma6PK9pfwKR2_gn60t2AqNWXg@mail.gmail.com/
> > >
> > > Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Even if this patch fixes the build issues,
> > the result may not be what you expect.
> >
> > The very subtle part of 'imply' is that
> > symbols implied by 'y' cannot be 'm'.
> >
> > When CONFIG_SND_SOC_ALL_CODECS=y,
> > the select'ed drivers were previously able to be 'm'.
> >
> > After ea00d95200d02, drivers that were previously
> > 'm' are now 'n'.
> >
> > Probably, it shrunk the test-coverage.
> >
> > I'd recommend to compare the .config file.
>
> I always do, when running make oldconfig ;-)
>
> I only see expected changes from y to m.
> I don't see any unexpected changes from m to n.


This is because you used oldconfig.

The 'imply' keyword defines the default
of symbols _without_ user-defined values.

oldconfig loads the .config file,
which contains the user-defined values.

When you test the 'imply' keyword,
you must start Kconfig from a pristine state
(e.g. 'make defconfig')



Compare the difference between v5.6-rc4 and
v5.6-rc4 + the following two patches.

https://lore.kernel.org/patchwork/patch/1190445/
https://lore.kernel.org/patchwork/patch/1196514/



[How to reproduce]

Tweak x86_64_defconfig as follows, then
compare the result of 'make defconfig'.



masahiro@pug:~/ref/linux$ git diff
diff --git a/arch/x86/configs/x86_64_defconfig
b/arch/x86/configs/x86_64_defconfig
index 0b9654c7a05c..e102d75d3707 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -194,7 +194,7 @@ CONFIG_WATCHDOG=y
 CONFIG_AGP=y
 CONFIG_AGP_AMD64=y
 CONFIG_AGP_INTEL=y
-CONFIG_DRM=y
+# CONFIG_DRM is not set
 CONFIG_DRM_I915=y
 CONFIG_FB_MODE_HELPERS=y
 CONFIG_FB_TILEBLITTING=y
@@ -296,3 +296,11 @@ CONFIG_SECURITY_SELINUX_DISABLE=y
 CONFIG_EFI_STUB=y
 CONFIG_EFI_MIXED=y
 CONFIG_ACPI_BGRT=y
+CONFIG_EXPERT=y
+# CONFIG_TTY is not set
+CONFIG_INPUT=m
+CONFIG_I2C=y
+CONFIG_SPI=y
+CONFIG_COMPILE_TEST=y
+CONFIG_SND_SOC=y
+CONFIG_SND_SOC_ALL_CODECS=y


masahiro@pug:~/ref/linux$ git checkout v5.6-rc4
M arch/x86/configs/x86_64_defconfig
Note: checking out 'v5.6-rc4'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 98d54f81e36b Linux 5.6-rc4
masahiro@pug:~/ref/linux$ git log --oneline  -1
98d54f81e36b (HEAD, tag: v5.6-rc4, origin/master, origin/HEAD, master)
Linux 5.6-rc4
masahiro@pug:~/ref/linux$ make -s O=before   defconfig
M arch/x86/configs/x86_64_defconfig
Previous HEAD position was 98d54f81e36b Linux 5.6-rc4
Switched to branch 'geert'
masahiro@pug:~/ref/linux$ git log --oneline  -3
231be9523aee (HEAD -> geert) kconfig: make 'imply' obey the direct dependency
4132db11c62e ASoC: Use imply for SND_SOC_ALL_CODECS
98d54f81e36b (tag: v5.6-rc4, origin/master, origin/HEAD, master) Linux 5.6-rc4
masahiro@pug:~/ref/linux$ make -s O=after   defconfig
masahiro@pug:~/ref/linux$ ./scripts/diffconfig  before/.config after/.config
 SND_SOC_CS42L52 m -> n
 SND_SOC_CS42L56 m -> n
 SND_SOC_MT6351 n -> y
 SND_SOC_MT6358 n -> y
 SND_SOC_WM8962 m -> n
+SND_SOC_88PM860X n
+SND_SOC_ARIZONA y
+SND_SOC_CROS_EC_CODEC n
+SND_SOC_CS47L15 y
+SND_SOC_CS47L24 y
+SND_SOC_CS47L35 y
+SND_SOC_CS47L85 y
+SND_SOC_CS47L90 y
+SND_SOC_CS47L92 y
+SND_SOC_CX20442 n
+SND_SOC_LOCHNAGAR_SC n
+SND_SOC_MADERA y
+SND_SOC_MC13783 y
+SND_SOC_RT1308_SDW n
+SND_SOC_RT700_SDW n
+SND_SOC_RT711_SDW n
+SND_SOC_RT715_SDW n
+SND_SOC_SI476X y
+SND_SOC_TWL4030 n
+SND_SOC_TWL6040 n
+SND_SOC_WCD9335 n
+SND_SOC_WCD934X n
+SND_SOC_WL1273 y
+SND_SOC_WM5102 y
+SND_SOC_WM5110 y
+SND_SOC_WM8350 n
+SND_SOC_WM8400 n
+SND_SOC_WM8994 y
+SND_SOC_WM8997 y
+SND_SOC_WM8998 y
+SND_SOC_WSA881X n



SND_SOC_CS42L52, SND_SOC_CS42L56 and SND_SOC_WM8962
were previously m, but now disabled.


--
Best Regards
Masahiro Yamada
