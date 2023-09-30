Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 702BA7B437B
	for <lists+linux-kbuild@lfdr.de>; Sat, 30 Sep 2023 22:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbjI3UWW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 30 Sep 2023 16:22:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjI3UWW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 30 Sep 2023 16:22:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E1CBD
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 13:22:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F243C433CC
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 20:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696105339;
        bh=PYLwwXL9/59vRfEez49VaPBOkhiyPd9JiQMOF+FHq7g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mI9D0GTavcs417e6KcQ2APyBqBlA4vLsU1HNzbuvUi4kMkWHy0yvEJKJyslG5X9Li
         d81LXv/En3XKSC8PJ5ZsVQoSBO/X6aiAQhllZpn/xX/oqNge2jZESvZbB2UwHWC7WS
         fIUs5v3zcPZxInGmXDoDy8HRL+h1UiKbuMPk59FjgCh8R1wuCfggYk7nIuKr0Zxc94
         0l6iAgYgULS24LQWg7CoKKvLJOjj6/DNsI1NSbGSFjXh6oo1z2THAFzcIdp5t4TT7x
         V6Q9W3aPFlMTatPLlXvr2deVt9KO5lnVWdvd2XrO8PKc7+wbDSWkQ2turnh32TnC3Y
         jjxWeyw6l+xXg==
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1c0fcbf7ae4so9352356fac.0
        for <linux-kbuild@vger.kernel.org>; Sat, 30 Sep 2023 13:22:19 -0700 (PDT)
X-Gm-Message-State: AOJu0YynJHxAv6K2Gk0IHvcmE4KUFS78sV6ez8p3llvWCymVIiTDqUXq
        8HF4GOoQokJ/rkx4tC6VFJoN6LKOaA8fI5bxbzk=
X-Google-Smtp-Source: AGHT+IGmvzmfCWFs/yAcVTFM4tvc2zDlSFM2yo9lys9Vbk0MkyKk8oc2462hsjDSAEv3hCk8KUUjRp2jMO0P0CiPSc4=
X-Received: by 2002:a05:6870:230e:b0:1bb:7d24:eabb with SMTP id
 w14-20020a056870230e00b001bb7d24eabbmr8231863oao.0.1696105339007; Sat, 30 Sep
 2023 13:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230929081540.yija47lsj35xtj4v@pengutronix.de>
 <20230929174101.3oqx7yxskneuj4gs@pengutronix.de> <CAK7LNASkRnJsBdOaXdVizVWHLqYWoJWdzthuSNNEwhYLNYM2cw@mail.gmail.com>
 <20230930160413.an3xoejevwl73gkk@pengutronix.de>
In-Reply-To: <20230930160413.an3xoejevwl73gkk@pengutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 1 Oct 2023 05:21:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ8OgB7_eXpUHtDmehUx-c4KeKDDqvMgVHsNHqcgYtLXg@mail.gmail.com>
Message-ID: <CAK7LNAQ8OgB7_eXpUHtDmehUx-c4KeKDDqvMgVHsNHqcgYtLXg@mail.gmail.com>
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
        Arnd Bergmann <arnd@arndb.de>,
        James Clark <james.clark@arm.com>, kernel@pengutronix.de,
        Leo Yan <leo.yan@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Mike Leach <mike.leach@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Oct 1, 2023 at 1:04=E2=80=AFAM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> Hello,
>
> On Sat, Sep 30, 2023 at 08:08:05PM +0900, Masahiro Yamada wrote:
> > On Sat, Sep 30, 2023 at 2:41=E2=80=AFAM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@pengutronix.de> wrote:
> > >
> > > Hello,
> > >
> > > On Fri, Sep 29, 2023 at 10:15:40AM +0200, Uwe Kleine-K=C3=B6nig wrote=
:
> > > > by manual inspection I found a section mismatch in
> > > > drivers/hwtracing/coresight/coresight-etm4x-core.c where
> > > > etm4_platform_driver (which lives in ".data") contains a reference =
to
> > > > etm4_remove_platform_dev() (which lives in ".exit.text").
> > > >
> > > > However building with CONFIG_DEBUG_SECTION_MISMATCH=3Dy +
> > > > CONFIG_CORESIGHT_SOURCE_ETM4X=3Dy doesn't warn about that one.
> > >
> > > Arnd had the right hint in irc: If I do
> > >
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index 34a5386d444a..070e53be1ea2 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -1017,7 +1017,7 @@ static int secref_whitelist(const char *fromsec=
, const char *fromsym,
> > >
> > >         /* symbols in data sections that may refer to meminit/exit se=
ctions */
> > >         if (match(fromsec, PATTERNS(DATA_SECTIONS)) &&
> > > -           match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_EXIT_SECT=
IONS)) &&
> > > +           match(tosec, PATTERNS(ALL_XXXINIT_SECTIONS, ALL_XXXEXIT_S=
ECTIONS)) &&
> > >             match(fromsym, PATTERNS("*driver")))
> > >                 return 0;
> > >
> > > I get a mismatch warning:
> > >
> > > WARNING: modpost: vmlinux: section mismatch in reference: etm4x_amba_=
driver+0x98 (section: .data) -> etm4_remove_amba (section: .exit.text)
> > > WARNING: modpost: vmlinux: section mismatch in reference: etm4_platfo=
rm_driver+0x8 (section: .data) -> etm4_remove_platform_dev (section: .exit.=
text)
> > > ERROR: modpost: Section mismatches detected.
> > >
> > > I remember that back in the times of CONFIG_HOTPLUG references to
> > > ".devinit.text" and ".devexit.text" were ok. Is a reference to
> > > .exit.text ever ok?
> > >
> > > I started an allyesconfig build on a few archs with the above patch
> > > applied. This will take some time, when it's done I will report what =
it
> > > found.
> >
> >
> >
> > allmodconfig on x86 detects several issues.
> >
> > [...]
> > WARNING: modpost: sound/soc/codecs/snd-soc-tlv320adc3xxx: section
> > mismatch in reference: adc3xxx_i2c_driver+0x10 (section: .data) ->
> > adc3xxx_i2c_remove (section: .exit.text)
>
> I checked just one of those, this is also a valid warning:
>
>         static void __exit adc3xxx_i2c_remove(struct i2c_client *client)
>         {
>                 ...
>         }
>
>         static struct i2c_driver adc3xxx_i2c_driver =3D {
>                 ...
>                 .remove =3D __exit_p(adc3xxx_i2c_remove),
>                 ...
>         };
>
> so if adc3xxx_i2c_remove is discarded (happens with
> CONFIG_SND_SOC_TLV320ADC3XXX=3Dy) no warning happens, but .remove is just
> NULL and so if the driver is unbound no code runs and so it leaks
> resources. My thought was that allyesconfig would catch all problems,
> didn't consider driver authors to be that creative :-)


Yeah, allyesconfig does not detect this issue much due to __exit_p().
allmodconfig does.


The __exit_p() is questionable.
If we fix up all drivers, __exit_p() may go away.




--=20
Best Regards
Masahiro Yamada
