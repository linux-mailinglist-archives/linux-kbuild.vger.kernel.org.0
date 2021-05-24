Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4412638F204
	for <lists+linux-kbuild@lfdr.de>; Mon, 24 May 2021 19:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233357AbhEXRJI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 24 May 2021 13:09:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:47450 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232543AbhEXRJF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 May 2021 13:09:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 321E461411;
        Mon, 24 May 2021 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621876057;
        bh=HiISOaPzpLI+gyiU+WyrRGTKBa+QZCoPSuzxkq14mdE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=a+GvEHwKI3sZ4esmlyC8BGBQE1WoXDs7HuPMTqURztkyoIF3EwQxIc9iPc7wFkSQb
         gGQgnnb0EPL2rKGsbuvyY0ogJW9cbeG0NOtW9d8oM8Ot+OWv1ica4J68++g1Oo6Iw6
         kmU5wkumn9f+qoSvyreFpqEqH/2Tg+XqLgIf5frKqXbs4kmg4yYB0auK2HZDSNLc8B
         ypfWuLfhPucdG3NmGBCvuxjNGB3jqiTpXa+a/sTMGs3UpncuX4L28HrOy5kusLDkUo
         4FmSlhcR0/Vmap40goDW9I+AdUpdW4aTJrNFRDBRxEXHVckRXrv//y8afApENgUknL
         maBkzKtOKqPqA==
Received: by mail-ed1-f44.google.com with SMTP id s6so32763373edu.10;
        Mon, 24 May 2021 10:07:37 -0700 (PDT)
X-Gm-Message-State: AOAM532tHdIsI6SE0w7/zmfo/naBy0Z7bd9Ml5lClQ5B9lV+EDTwvwKB
        aymlc5Kc2nOLJQszTaMVBScmA0kQI7cME+b5pA==
X-Google-Smtp-Source: ABdhPJypTJVulJbKq62dqu+kTC6Xi6tJA83r7h4/5mRl9q4C66WiMxduoiSiAO8i0f3rRbNE8TBfkyOxVOq4eR4CDXE=
X-Received: by 2002:aa7:cd83:: with SMTP id x3mr26424670edv.373.1621876055823;
 Mon, 24 May 2021 10:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210513151800.1059435-1-dmitry.baryshkov@linaro.org>
 <CAL_JsqLtaJ43Y5ySEK5OraScigEO_OD3TMoy6DYFREK7kh=uFg@mail.gmail.com> <CAK7LNATPUPxyW2Jaxm5WKdW1wMGsvtbsRryf9=H784wmZ+Xe6g@mail.gmail.com>
In-Reply-To: <CAK7LNATPUPxyW2Jaxm5WKdW1wMGsvtbsRryf9=H784wmZ+Xe6g@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 24 May 2021 12:07:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKutXbKq5k0mVx5aw2iyLdGzhtWpi9Ez2Oc6t9Z4w7mug@mail.gmail.com>
Message-ID: <CAL_JsqKutXbKq5k0mVx5aw2iyLdGzhtWpi9Ez2Oc6t9Z4w7mug@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow checking single device tree file
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 22, 2021 at 1:48 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, May 19, 2021 at 10:43 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Thu, May 13, 2021 at 10:18 AM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Add support for testing single device tree file by running
> > > 'make tree.dt.yaml', e.g. 'make ARCH=arm64 qcom/qrb5165-rb5.dt.yaml'.
> > > This looks useful for checking idividual changes to dts files.
> >
> > typo
> >
> > I'd rather not expose .*.dt.yaml as I want to make checking not
> > optional and I have some plans of integrating the schema checks into
> > dtc which would eliminate .dt.yaml files. Instead, I think %.dtb
> > targets should run the checks always.
> >
> > >
> > > Cc: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  Makefile | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Makefile b/Makefile
> > > index 53d09c414635..b36a3d48eb68 100644
> > > --- a/Makefile
> > > +++ b/Makefile
> > > @@ -1383,6 +1383,10 @@ ifneq ($(dtstree),)
> > >  %.dtbo: include/config/kernel.release scripts_dtc
> > >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> > >
> > > +%.dt.yaml: include/config/kernel.release scripts_dtc
> > > +       $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings Documentation/devicetree/bindings/processed-schema.json
> >
> > I don't think we should expose this detail (processed-schema.json) to
> > the top-level makefile. This will be built if 'dt_binding_check' is a
> > dependency with CHECK_DTBS=y set.
> >
> > > +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y
> >
> > CHECK_DTBS here doesn't work. It has to be exported.
> >
> > So here's my modified patch (%.dtbo should probably be included too,
> > but I'm not yet sure how well the schema checks will work on them):
> >
> > 8<---------------------------------------------------------
> > diff --git a/Makefile b/Makefile
> > index 53d09c414635..a1e246956d65 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1377,12 +1377,18 @@ endif
> >
> >  ifneq ($(dtstree),)
> >
> > -%.dtb: include/config/kernel.release scripts_dtc
> > +%.dtb: %.dt.yaml
> >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> >  %.dtbo: include/config/kernel.release scripts_dtc
> >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> > +ifneq ($(filter %.dtb, $(MAKECMDGOALS)),)
> > +export CHECK_DTBS=y
> > +endif
> > +%.dt.yaml: dt_binding_check include/config/kernel.release scripts_dtc
> > +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> > +
>
> I do not understand how this will work.
>
> 'make foo.dtb' will also create foo.dt.yaml
> (that is, schema check is always run) ?

Yes, that is my intent. As I mentioned above, I have some plans to
integrate the schema checks into dtc which would eliminate .dt.yaml
files. So I don't really want to add them as a user make target if we
might remove it. Also, at some point, running the schema checks
shouldn't be optional. We can't do that yet for 'dtbs' as there's a
bunch of warnings. But for %.dtb targets, I don't think getting the
warnings is a problem.

Rob
