Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0650758238B
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jul 2022 11:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiG0J5q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jul 2022 05:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiG0J5p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jul 2022 05:57:45 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF91527154
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 02:57:43 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id i4so12551078qvv.7
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=53lHHtLgGKTt9V4FYXYOyjU1GmgFzy4P5pSpDKGgZ6w=;
        b=PVMtec8RT8WrY/hI2fdU5fZRz3HpXcTT70BXeZeB8odu8Yvf0qJwiZc4mCd30YDiAl
         d6b1slz+Dkak1vcvvfJjqELk4fdPT9stC5u9RVpzpkq8ttpN46qQuaDYDkP9i7WQ/ezT
         +YUL0B2nKLf8rbu6VsMk1UzRGJi8HU0CnudmfjmdwJChwAlVjnTObOtwr9qzcTNE7a6w
         S2inRaRGcQ2I2neYi7/Xa1a5AE81Hd8Q7Z/eBERxVTnNA5v/eyH6lzh+hs3rFbxFrejJ
         grEV6esSyPqdL76DFdrfvWmLBoDrTlnKjOuxjBv5y/ETFMcIAh+vM+60l6EV9hUj/LQH
         3/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=53lHHtLgGKTt9V4FYXYOyjU1GmgFzy4P5pSpDKGgZ6w=;
        b=Nf/5IBUZgLH0Zdh0nLNooqmg3k6yUdpoDMZ+59owR3pJSVfRS3zbMwdsj/wpKCq46y
         2AK/fF2e0Bv2wZ8i8eabC0EaO37zWYFMGX+oum4DfeB1OCztv/xjvffa5YlN2Oqt5Upz
         oEHDP8gN1nD6/BXYSt8xHQOnOEtSPNRAtT3Ix3CjbFy216o86tOqEyscm1XXUQbzRDGT
         ZYm/AahnKHHlD0LFtvIpt6bb1+F+BHFKYvFAuj5scjwNBRGifkdM5je8A7Y05SVdjyGB
         RCXmcXclNVv+rW+z99ONyCi/4HbGsMbPwGSw2iT+5k3oFHgHiXaWfcyi/GrPrq6rtgTY
         zDaQ==
X-Gm-Message-State: AJIora8TKyTf5bFTYJQhAj7pWKkvQjx+97hGjZXWiTMthVy94YRVizrs
        ooVcAgni3KfnepamYPeT6nDArRqN2OdVK63xYK/YQQ==
X-Google-Smtp-Source: AGRyM1szWR/2xIGX9mO0iLSAnkKOAFNqVzTKIjPGDDheFKdTjA03iXww/q5rndlh945EGUuDO4gK7Gv3dmlfYLxh3Yc=
X-Received: by 2002:a0c:8ecc:0:b0:473:2fa4:df7c with SMTP id
 y12-20020a0c8ecc000000b004732fa4df7cmr18055616qvb.55.1658915862975; Wed, 27
 Jul 2022 02:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org> <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
In-Reply-To: <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Wed, 27 Jul 2022 12:57:31 +0300
Message-ID: <CAA8EJprdCftvie3UF9QpCWr9oQ5SQbqW8OPOHg0qigf9=RXU-w@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow validating individual dtb files against schema
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 16 Jul 2022 at 12:38, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> On Wed, Jul 6, 2022 at 8:44 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > While it is possible to validate all generated dtb files against the
> > schema, it typically results in huge pile of warnings. While working on
> > a platform it is quite useful to validate just a single file against
> > schema.
> >
> > Allow specifying CHECK_DTBS=1 on a make command line to enable
> > validation while building dtb files. This reuses the infrastructure
> > existing for `make dtbs_check`, making dtbs_check a shortcut for
> > `make CHECK_DTBS=1 dt_binding_check dtbs`.
> >
> > Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Cc: Tom Rini <trini@konsulko.com>
> > Cc: Masahiro Yamada <masahiroy@kernel.org>
> > Cc: linux-kbuild@vger.kernel.org
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >
> > Changes since v1:
> > - Added dependency to rebuild schema if `make dtbs` was used.
> >
> > ---
> >  Makefile | 20 +++++++++++++++-----
> >  1 file changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 9aa7de1ca58f..5a9858aa4934 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1464,14 +1464,18 @@ endif
> >
> >  ifneq ($(dtstree),)
> >
> > -%.dtb: include/config/kernel.release scripts_dtc
> > +ifneq ($(CHECK_DTBS),)
> > +DT_TMP_BINDING := dt_binding
> > +endif
> > +
> > +%.dtb: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
> >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> > -%.dtbo: include/config/kernel.release scripts_dtc
> > +%.dtbo: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
> >         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
> >
> >  PHONY += dtbs dtbs_install dtbs_check
> > -dtbs: include/config/kernel.release scripts_dtc
> > +dtbs: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
> >         $(Q)$(MAKE) $(build)=$(dtstree)
> >
> >  ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
> > @@ -1498,8 +1502,10 @@ ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
> >  export CHECK_DT_BINDING=y
> >  endif
> >
> > -PHONY += dt_binding_check
> > -dt_binding_check: scripts_dtc
> > +dt_binding_check: dt_binding
> > +
> > +PHONY += dt_binding
> > +dt_binding: scripts_dtc
> >         $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
> >
> >  # ---------------------------------------------------------------------------
> > @@ -1774,6 +1780,10 @@ help:
> >         @echo  '                3: more obscure warnings, can most likely be ignored'
> >         @echo  '                e: warnings are being treated as errors'
> >         @echo  '                Multiple levels can be combined with W=12 or W=123'
> > +       @$(if $(dtstree), \
> > +               echo '  make CHECK_DTBS=1 [targets] Check all generated dtb files against schema'; \
> > +               echo '         This can be applied both to "dtbs" and to individual "foo.dtb" targets' ; \
> > +               )
> >         @echo  ''
> >         @echo  'Execute "make" or "make all" to build all targets marked with [*] '
> >         @echo  'For further info see the ./README file'
> > --
> > 2.35.1
> >
>
>
> I think the idea seems OK to me, but we can make it simpler.
>
>
> First, apply the following clean-up patch to reduce the code duplication.
> https://lore.kernel.org/all/20220716093122.137494-1-masahiroy@kernel.org/T/#u
>
>
> Then, apply the attached patch.diff
>
> Please try it.

Please excuse me, it took me a bit to get back to the issue and test your patch.
It works like a charm, feel free to add while posting it:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

--
With best wishes
Dmitry
