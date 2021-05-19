Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B346C388F62
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 May 2021 15:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344637AbhESNox (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 May 2021 09:44:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229531AbhESNow (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 May 2021 09:44:52 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2D536112F;
        Wed, 19 May 2021 13:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621431812;
        bh=e5Ou1Wf1l1cSB41OpuLSI6u4W4jDM0imYmUHvUByYGw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=t2o8PCwrAxkbSZcGIZ4nqGRnmeOBTVIZHInA+q5Ty+iTSSpld1yiEpQklSiqKkXCT
         dVgXF3d2k3VhE8qG3fUacGvbigSIme6TNweMEu+WERkFidcAc95lrCjc0724e8HbYU
         ijzdfSK6kREcldvO8VRS8svhqKUwK9xXsoX2hvlJh/zoNxxoOftOQfoppjmCQdvLsN
         EOcspGldbMo1Bexw6TwuMTAixcJK1h9PTOfyM8pxx2m3DRbTZSMGR9sWA/oywHRArL
         mmWsi4xMlvvIdtx4Ko5kWhfBBWGUPZfZ5Whke3Gwyyh7u0EQ0y+O2jl8pbzJaPB/i5
         4bK1o8MbqgB2w==
Received: by mail-ej1-f41.google.com with SMTP id k14so16568836eji.2;
        Wed, 19 May 2021 06:43:32 -0700 (PDT)
X-Gm-Message-State: AOAM531KetzHXH6ZIfD4075XCkbhFufL5bDizS86SQoeFQvEIFzrDFVc
        rqADVbc/zex9wqVR17p2+YZdX1QbluX0ZkP9YQ==
X-Google-Smtp-Source: ABdhPJxH/lGICnQpzeFewbWAeIwW5++saiskkNC6RUL2H4yoNw1jdP+qO7cZEQ2+dyj9ooceOrwNhG0W2iKlZ4Iahmw=
X-Received: by 2002:a17:907:78cd:: with SMTP id kv13mr177415ejc.360.1621431811389;
 Wed, 19 May 2021 06:43:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210513151800.1059435-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210513151800.1059435-1-dmitry.baryshkov@linaro.org>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 19 May 2021 08:43:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLtaJ43Y5ySEK5OraScigEO_OD3TMoy6DYFREK7kh=uFg@mail.gmail.com>
Message-ID: <CAL_JsqLtaJ43Y5ySEK5OraScigEO_OD3TMoy6DYFREK7kh=uFg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: allow checking single device tree file
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 13, 2021 at 10:18 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add support for testing single device tree file by running
> 'make tree.dt.yaml', e.g. 'make ARCH=arm64 qcom/qrb5165-rb5.dt.yaml'.
> This looks useful for checking idividual changes to dts files.

typo

I'd rather not expose .*.dt.yaml as I want to make checking not
optional and I have some plans of integrating the schema checks into
dtc which would eliminate .dt.yaml files. Instead, I think %.dtb
targets should run the checks always.

>
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Makefile | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 53d09c414635..b36a3d48eb68 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1383,6 +1383,10 @@ ifneq ($(dtstree),)
>  %.dtbo: include/config/kernel.release scripts_dtc
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> +%.dt.yaml: include/config/kernel.release scripts_dtc
> +       $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings Documentation/devicetree/bindings/processed-schema.json

I don't think we should expose this detail (processed-schema.json) to
the top-level makefile. This will be built if 'dt_binding_check' is a
dependency with CHECK_DTBS=y set.

> +       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@ CHECK_DTBS=y

CHECK_DTBS here doesn't work. It has to be exported.

So here's my modified patch (%.dtbo should probably be included too,
but I'm not yet sure how well the schema checks will work on them):

8<---------------------------------------------------------
diff --git a/Makefile b/Makefile
index 53d09c414635..a1e246956d65 100644
--- a/Makefile
+++ b/Makefile
@@ -1377,12 +1377,18 @@ endif

 ifneq ($(dtstree),)

-%.dtb: include/config/kernel.release scripts_dtc
+%.dtb: %.dt.yaml
        $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@

 %.dtbo: include/config/kernel.release scripts_dtc
        $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@

+ifneq ($(filter %.dtb, $(MAKECMDGOALS)),)
+export CHECK_DTBS=y
+endif
+%.dt.yaml: dt_binding_check include/config/kernel.release scripts_dtc
+       $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
+
