Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B11838F98E
	for <lists+linux-kbuild@lfdr.de>; Tue, 25 May 2021 06:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230262AbhEYEan (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 May 2021 00:30:43 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:59497 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbhEYEam (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 May 2021 00:30:42 -0400
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 14P4SowR015146;
        Tue, 25 May 2021 13:28:50 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 14P4SowR015146
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621916930;
        bh=y37OMvYMyc6Y72QW7JeDxHoGL7y/mvZk6xS6ce204W4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LNCbF3YG9lExrTwQukxV8keWNPz9e1/Ya3InXu74B/+Sz4EvpccsqS9L9RHMOvV2V
         kpgn03hFTBh+4yBTvdc6WJ7uwZsZCDKf36tUTum2SjrgaFrzImXIe6bWQtzqzy2Zfg
         vvd5RA8WYQ3Gg6OfSfwMMwmBVnswkaK8/Sc/qYJT/WASTflQZSS3/M7vq0Bhoybxhj
         CWj685vgDTxevRqsUz62ChlHYy5ftZyPUn5vTaoRyTWbRO8M6UELBDLwZigbOCxJpZ
         pNxH2GAxdbceMIWw6CYaUaw2kGz1k+YggX3p/ACM4o7pwet1oJ35vVmliJ/efJApJu
         g8gyG7N1paCRg==
X-Nifty-SrcIP: [209.85.214.175]
Received: by mail-pl1-f175.google.com with SMTP id 69so15719420plc.5;
        Mon, 24 May 2021 21:28:50 -0700 (PDT)
X-Gm-Message-State: AOAM532vKw5Pz/GU3bSsLI+9aAtpBv7RjTYCq5BwUTU0/7kQ61PET4+S
        C28j9vAHtUYKuLTP/IG4nqmE2ytQiHZqgiLs464=
X-Google-Smtp-Source: ABdhPJxKgES3Wvoxj5khCDiyW7fXG+493VCpG2A/lFH+1+nYeuaIiZvTPaR39/+pRBTfeb7pCNpnPsDXu+cvl924b8Q=
X-Received: by 2002:a17:90a:c7d5:: with SMTP id gf21mr2779227pjb.87.1621916929646;
 Mon, 24 May 2021 21:28:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210513151800.1059435-1-dmitry.baryshkov@linaro.org>
 <CAL_JsqLtaJ43Y5ySEK5OraScigEO_OD3TMoy6DYFREK7kh=uFg@mail.gmail.com>
 <CAK7LNATPUPxyW2Jaxm5WKdW1wMGsvtbsRryf9=H784wmZ+Xe6g@mail.gmail.com> <CAL_JsqKutXbKq5k0mVx5aw2iyLdGzhtWpi9Ez2Oc6t9Z4w7mug@mail.gmail.com>
In-Reply-To: <CAL_JsqKutXbKq5k0mVx5aw2iyLdGzhtWpi9Ez2Oc6t9Z4w7mug@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 25 May 2021 13:28:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT-VrXAjSx7Xg88qJiJyJ1bLrGz5fgeMr=yGS+=NHntkg@mail.gmail.com>
Message-ID: <CAK7LNAT-VrXAjSx7Xg88qJiJyJ1bLrGz5fgeMr=yGS+=NHntkg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow checking single device tree file
To:     Rob Herring <robh@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 25, 2021 at 2:07 AM Rob Herring <robh@kernel.org> wrote:
>
> On Sat, May 22, 2021 at 1:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > On Wed, May 19, 2021 at 10:43 PM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Thu, May 13, 2021 at 10:18 AM Dmitry Baryshkov
> > > <dmitry.baryshkov@linaro.org> wrote:
> > > >
> > > > Add support for testing single device tree file by running
> > > > 'make tree.dt.yaml', e.g. 'make ARCH=arm64 qcom/qrb5165-rb5.dt.yaml'.
> > > > This looks useful for checking idividual changes to dts files.
> > >
> > > typo
> > >
> > > I'd rather not expose .*.dt.yaml as I want to make checking not
> > > optional and I have some plans of integrating the schema checks into
> > > dtc which would eliminate .dt.yaml files. Instead, I think %.dtb
> > > targets should run the checks always.
> > >
> > > >
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  Makefile | 4 ++++
> > > >  1 file changed, 4 insertions(+)
> > > >
> > > > diff --git a/Makefile b/Makefile
> > > > index 53d09c414635..b36a3d48eb68 100644
> > > > --- a/Makefile
> > > > +++ b/Makefile
> > > > @@ -1383,6 +1383,10 @@ ifneq ($(dtstree),)
> > > >  %.dtbo: include/config/kernel.release scripts_dtc
> > > >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> > > >
> > > > +%.dt.yaml: include/config/kernel.release scripts_dtc
> > > > +       $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings Documentation/devicetree/bindings/processed-schema.json
> > >
> > > I don't think we should expose this detail (processed-schema.json) to
> > > the top-level makefile. This will be built if 'dt_binding_check' is a
> > > dependency with CHECK_DTBS=y set.
> > >
> > > > +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y
> > >
> > > CHECK_DTBS here doesn't work. It has to be exported.
> > >
> > > So here's my modified patch (%.dtbo should probably be included too,
> > > but I'm not yet sure how well the schema checks will work on them):
> > >
> > > 8<---------------------------------------------------------
> > > diff --git a/Makefile b/Makefile
> > > index 53d09c414635..a1e246956d65 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1377,12 +1377,18 @@ endif
> > >
> > >  ifneq ($(dtstree),)
> > >
> > > -%.dtb: include/config/kernel.release scripts_dtc
> > > +%.dtb: %.dt.yaml
> > >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> > >
> > >  %.dtbo: include/config/kernel.release scripts_dtc
> > >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> > >
> > > +ifneq ($(filter %.dtb, $(MAKECMDGOALS)),)
> > > +export CHECK_DTBS=y
> > > +endif
> > > +%.dt.yaml: dt_binding_check include/config/kernel.release scripts_dtc
> > > +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> > > +
> >
> > I do not understand how this will work.
> >
> > 'make foo.dtb' will also create foo.dt.yaml
> > (that is, schema check is always run) ?
>
> Yes, that is my intent. As I mentioned above, I have some plans to
> integrate the schema checks into dtc which would eliminate .dt.yaml
> files. So I don't really want to add them as a user make target if we
> might remove it. Also, at some point, running the schema checks
> shouldn't be optional. We can't do that yet for 'dtbs' as there's a
> bunch of warnings. But for %.dtb targets, I don't think getting the
> warnings is a problem.
>
> Rob

OK, your plan is to perform schema-check
as a side-effect of dtb compilation.

The current dt-schema tool only works against yaml files.
Once it is integrated into DTC, will it be able to directly handle .dts files?


-- 
Best Regards
Masahiro Yamada
