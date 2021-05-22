Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29D3538D3F9
	for <lists+linux-kbuild@lfdr.de>; Sat, 22 May 2021 08:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbhEVGqH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 22 May 2021 02:46:07 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:54837 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbhEVGqG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 22 May 2021 02:46:06 -0400
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 14M6iLtp031410;
        Sat, 22 May 2021 15:44:21 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 14M6iLtp031410
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1621665861;
        bh=KL7zuh1Gfzyq0RAJTL4tgQIixkVQ64nFtd1KDMiifbo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ecKNuXw4gr+yNvjRDRMVbqe47neyjbGsw5UKylL57qBjwR9eQEltGGP5tOqS8aNEL
         QRh6dbjaiOdvgf6sa4UpLatEmaN9sgIsB165IfG4SKT4t7rcfOF/Ap/78XD0eoLNR0
         RUD0wgM0EQy9xO/vSRpTI+KIkKttssKByF8oiQExGO3pKb3LW9bN9ubkCpezWP668A
         8Lxhy8YOcFjIqFanm61ySw6n1brA11YoQhoXlm56bf8GZcWL53IRtIBKh0B+GmwXnj
         JwkNcjNaJ6OYJULkvuykoGMbPi9HAM5cEZ9yPif5u/fzZPVJnj75NjpdUv+IpbS9u2
         jjcNrpKzdXGAQ==
X-Nifty-SrcIP: [209.85.210.180]
Received: by mail-pf1-f180.google.com with SMTP id y15so5164155pfn.13;
        Fri, 21 May 2021 23:44:21 -0700 (PDT)
X-Gm-Message-State: AOAM530uTOWg7aLREKk0FokwrM2q1ihhqIBJWAdnooC6vHqGGVFzBkx8
        eYAy2Jsykeh4cUDvBDJWDrBjHo5YwfpbRqSNxmQ=
X-Google-Smtp-Source: ABdhPJziDO7e1jsgAEMoRGRm55w54OoNa5+8ms60lVBANczpWOUhmNjZuscl3z8e6ErAdDqFsOeu0XaoOtmPzmj2gv0=
X-Received: by 2002:a63:a547:: with SMTP id r7mr2729407pgu.7.1621665860653;
 Fri, 21 May 2021 23:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210513151800.1059435-1-dmitry.baryshkov@linaro.org> <CAL_JsqLtaJ43Y5ySEK5OraScigEO_OD3TMoy6DYFREK7kh=uFg@mail.gmail.com>
In-Reply-To: <CAL_JsqLtaJ43Y5ySEK5OraScigEO_OD3TMoy6DYFREK7kh=uFg@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 22 May 2021 15:43:43 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPUPxyW2Jaxm5WKdW1wMGsvtbsRryf9=H784wmZ+Xe6g@mail.gmail.com>
Message-ID: <CAK7LNATPUPxyW2Jaxm5WKdW1wMGsvtbsRryf9=H784wmZ+Xe6g@mail.gmail.com>
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

On Wed, May 19, 2021 at 10:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, May 13, 2021 at 10:18 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > Add support for testing single device tree file by running
> > 'make tree.dt.yaml', e.g. 'make ARCH=arm64 qcom/qrb5165-rb5.dt.yaml'.
> > This looks useful for checking idividual changes to dts files.
>
> typo
>
> I'd rather not expose .*.dt.yaml as I want to make checking not
> optional and I have some plans of integrating the schema checks into
> dtc which would eliminate .dt.yaml files. Instead, I think %.dtb
> targets should run the checks always.
>
> >
> > Cc: Rob Herring <robh@kernel.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  Makefile | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Makefile b/Makefile
> > index 53d09c414635..b36a3d48eb68 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1383,6 +1383,10 @@ ifneq ($(dtstree),)
> >  %.dtbo: include/config/kernel.release scripts_dtc
> >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> > +%.dt.yaml: include/config/kernel.release scripts_dtc
> > +       $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings Documentation/devicetree/bindings/processed-schema.json
>
> I don't think we should expose this detail (processed-schema.json) to
> the top-level makefile. This will be built if 'dt_binding_check' is a
> dependency with CHECK_DTBS=y set.
>
> > +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y
>
> CHECK_DTBS here doesn't work. It has to be exported.
>
> So here's my modified patch (%.dtbo should probably be included too,
> but I'm not yet sure how well the schema checks will work on them):
>
> 8<---------------------------------------------------------
> diff --git a/Makefile b/Makefile
> index 53d09c414635..a1e246956d65 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1377,12 +1377,18 @@ endif
>
>  ifneq ($(dtstree),)
>
> -%.dtb: include/config/kernel.release scripts_dtc
> +%.dtb: %.dt.yaml
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
>  %.dtbo: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> +ifneq ($(filter %.dtb, $(MAKECMDGOALS)),)
> +export CHECK_DTBS=y
> +endif
> +%.dt.yaml: dt_binding_check include/config/kernel.release scripts_dtc
> +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> +

I do not understand how this will work.

'make foo.dtb' will also create foo.dt.yaml
(that is, schema check is always run) ?




-- 
Best Regards
Masahiro Yamada
