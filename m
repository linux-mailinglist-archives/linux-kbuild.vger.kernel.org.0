Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E77CC405AB7
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Sep 2021 18:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhIIQYB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 9 Sep 2021 12:24:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:58306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233698AbhIIQYB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Sep 2021 12:24:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 71811611CA;
        Thu,  9 Sep 2021 16:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631204571;
        bh=4I5qNtFV3fFaY9KGvcMMXKDeg8djcA9vyBIRdTx5RfU=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=L2jiRGNyqbNgYSS5tFb/URcYneH9PHH0S1ckdfHbLiSBMTdeAD5pgcNEGglUC6lgp
         UTTJJ65kmU3UQexh3ABoK5iXAc1XlGdVtLWSm5Vc7OGvvCtAAmmuo7psgor/A1rPqx
         y/464eot2n32AC9O16F6vP6Qfwpl8setqOUQ7CFrAJRbAwcceA2ozyvRJoCJfgUDOw
         dXd3sz21NsLIksusCcaESwiEZSG/bplO3jeG1lT8oZDGBG6N9WkPECntlFn8g1kAAL
         j3LQ8ND5RuNbJzburOr8YLUP0MEe1IlZpZ568ZxHpBvvRbBMm1e1sqkGzADI77MEZq
         Yj7TDmtB35YAA==
Received: by mail-ej1-f46.google.com with SMTP id me10so4717877ejb.11;
        Thu, 09 Sep 2021 09:22:51 -0700 (PDT)
X-Gm-Message-State: AOAM5300sQqlSSHa/+VNhBei9gGCYPC+rrIzXWuNABwTcUFT7YdRYB3E
        SXfze0gPN3JVklHLuIL3u1d5K6UYwN9/+OYD4A==
X-Google-Smtp-Source: ABdhPJyYmirRxOMx/nkH5R0TN8ujUXKi8h/ubE2E96R+jKgo81BsMpD1j5g4ryjgyCeJ1PiNDEhi53QjrYrJil3MHLs=
X-Received: by 2002:a17:906:7250:: with SMTP id n16mr4205561ejk.147.1631204570030;
 Thu, 09 Sep 2021 09:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210903155201.3004567-1-robh@kernel.org> <CAK7LNATxdf0o90C--qwumTbLyiSjt4m3m7-QSKYB31ZJ0ARA6w@mail.gmail.com>
In-Reply-To: <CAK7LNATxdf0o90C--qwumTbLyiSjt4m3m7-QSKYB31ZJ0ARA6w@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Thu, 9 Sep 2021 11:22:38 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJYsbe=Gk1bsMM+OxVMDxepsT2Fiz=sNsi_svgF1XjU6g@mail.gmail.com>
Message-ID: <CAL_JsqJYsbe=Gk1bsMM+OxVMDxepsT2Fiz=sNsi_svgF1XjU6g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Enable DT schema checks for %.dtb targets
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 9, 2021 at 8:05 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Sat, Sep 4, 2021 at 12:52 AM Rob Herring <robh@kernel.org> wrote:
> >
> > It is possible to build a single dtb, but not with DT schema validation
> > enabled. Enable the schema validation to run for %.dtb targets. Anyone
> > building a dtb for a specific platform *should* pay attention to schema
> > warnings.
> >
> > This could be supported with a separate %.dt.yaml target instead.
> > However, the .dt.yaml format is considered an intermediate format and
> > could possibly go away at some point if schema checking is integrated
> > into dtc. Also, the plan is to enable the schema checks by default once
> > platforms are free of warnings, and this is a move in that direction.
> >
> > Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Cc: Tom Rini <trini@konsulko.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  Makefile | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index ec9e8a0fe298..01b888cfe1dc 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1399,8 +1399,8 @@ endif
> >
> >  ifneq ($(dtstree),)
> >
> > -%.dtb: include/config/kernel.release scripts_dtc
> > -       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> > +%.dtb: dt_binding_check include/config/kernel.release scripts_dtc
> > +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ $(dtstree)/$*.dt.yaml
> >
> >  %.dtbo: include/config/kernel.release scripts_dtc
> >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
>
> Why didn't you change the %.dtbo part?

Right, it should.

Rob
