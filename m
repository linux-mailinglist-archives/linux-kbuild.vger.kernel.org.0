Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CFFB7B3AC2
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Sep 2023 21:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbjI2Tnm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Sep 2023 15:43:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233215AbjI2Tnl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Sep 2023 15:43:41 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89F5B113
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2023 12:43:39 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20058C433CB
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2023 19:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696016619;
        bh=SoA6lkrsebMj+dlIDifDtkzkR4JooNbk27hCmXKcOOw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YEb5epIkMfCSmwkrsl6Sk1GNje81Z9apDDHF1c13Jt0PqztyYAOl368vdqA4NmwFd
         OWgUYPGQs66TF13KAMqWy15unc1ZxO7C10oQoeUfAVKhH/ZVEwEOw/Xmf/QYPHlLMe
         SKbeWF2J0laTVhB3FJACJViecFaIdz0+dqWU1FQ/vFgmX73Xoi+uZw15uikLfk23vy
         uzbjG0WdAvuwbbv3EEo3wKv3Xynh7E0xYbwP48A+2+q3xe7896hpozAV+02wnpK5IU
         JoiE/OioHpAHC8ROCs6ReXvpS9HDJbtDz7nuyIxw4KAZ0P1tp4idYRBQeKqeiGdzcY
         aoszBxcyndo4w==
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dd1714b9b6so5157536fac.0
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Sep 2023 12:43:39 -0700 (PDT)
X-Gm-Message-State: AOJu0YxEDcgBFOv3NZR5bRPw75T2V7s0dsATvqBKTILEjGEGxQZ4RpR1
        jovrJr89jt20h22KYUZCnwHCiirx0Apg7XHeAI8=
X-Google-Smtp-Source: AGHT+IH3Keg5kU7m/cTIZdgld0EFau6l0CJbglyq++wuq6fZoQj8z9oo4qJi5Y66CDXRT3snl4fcZKYjb0Z2iBep/JE=
X-Received: by 2002:a05:6870:230d:b0:1dc:6f48:504e with SMTP id
 w13-20020a056870230d00b001dc6f48504emr5760370oao.8.1696016618473; Fri, 29 Sep
 2023 12:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230929081540.yija47lsj35xtj4v@pengutronix.de> <20230929174101.3oqx7yxskneuj4gs@pengutronix.de>
In-Reply-To: <20230929174101.3oqx7yxskneuj4gs@pengutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 30 Sep 2023 04:43:01 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQegXeep+8fWCLH4TBGFah20kUcdHGn5sOeXS3L533egg@mail.gmail.com>
Message-ID: <CAK7LNAQegXeep+8fWCLH4TBGFah20kUcdHGn5sOeXS3L533egg@mail.gmail.com>
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
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
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


No. I do not think it has ever been OK.

I guess this issue has been hidden for a long time.


The following commit disallows the reference to .init.*
but nothing happened to .exit.*



commit 0db252452378aa7a9e001a13226e1cd1dc61453d
Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
Date:   Sat Jan 30 21:14:23 2010 +0100

    modpost: don't allow *driver to reference .init.*

    Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>





--=20
Best Regards
Masahiro Yamada
