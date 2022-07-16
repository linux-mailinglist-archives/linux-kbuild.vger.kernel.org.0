Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F91B576D23
	for <lists+linux-kbuild@lfdr.de>; Sat, 16 Jul 2022 11:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232755AbiGPJi7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 16 Jul 2022 05:38:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232747AbiGPJiw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 16 Jul 2022 05:38:52 -0400
X-Greylist: delayed 343 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 16 Jul 2022 02:38:42 PDT
Received: from conssluserg-06.nifty.com (conssluserg-06.nifty.com [210.131.2.91])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55128F58;
        Sat, 16 Jul 2022 02:38:41 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 26G9cMi1009565;
        Sat, 16 Jul 2022 18:38:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 26G9cMi1009565
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1657964304;
        bh=+piROnj9mLzn9Znc44Hr/EP2LS2kMptLJort+MxCcoE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0zCJXA3ZFbeXeWSGWc1BpuDqw8OQO1g8YbwuXq/pxSz1AEQQJ2I+G3GiXuIu4tb9O
         GSA9r/3KmZ2htvyUB5oWgefNbA+sZQv/iqAnz0kb4oO1UjXYlXM1Wt9iHOXb2Dk+Mf
         bsKUYtMmIPrCVK+iXGIYr1nC8pRsUeX7Eyz8kyr1LEYBrNmBe84NAOisMtLQXuKN7G
         Vdis5umY/C7mF75Z9emLKC2z4sFVnWVePv5UQjAWK8E0SWvZsl9wc3QC+aeXEfxCW8
         zinpvZmeI5EgVX+t5nAng4qi2gewMvwi6p5PR65NosPsZFtbuMCCBhSJbQhBWeaK9d
         ZxEoJtvjQQYmw==
X-Nifty-SrcIP: [209.85.221.51]
Received: by mail-wr1-f51.google.com with SMTP id f2so9795684wrr.6;
        Sat, 16 Jul 2022 02:38:23 -0700 (PDT)
X-Gm-Message-State: AJIora9+iWICOULqY+CbcfA59PaMwUfHZT5AwRahNp7pajlzEjo4K3A3
        oqPYE9lciovtGrRDSpkkD6W/2JIJpqVFf8kzNRg=
X-Google-Smtp-Source: AGRyM1uXXoYzn2ED5DqKQOCpe4iWzIt1brPfXQM/ByBpjRgvccY6cDJD4uEHMhD/L9qT7xCC9J5p6J4GwE36DcXvo3Y=
X-Received: by 2002:adf:979b:0:b0:21d:868a:7f2f with SMTP id
 s27-20020adf979b000000b0021d868a7f2fmr15570076wrb.409.1657964302181; Sat, 16
 Jul 2022 02:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220706114407.1507412-1-dmitry.baryshkov@linaro.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 16 Jul 2022 18:37:42 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
Message-ID: <CAK7LNAQPS+U1qq4K+7Rao9P7p94bMU3Y6g0+ALUd3t=ioZqSnw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: allow validating individual dtb files against schema
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>, Tom Rini <trini@konsulko.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: multipart/mixed; boundary="0000000000004845d005e3e8e52c"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--0000000000004845d005e3e8e52c
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 6, 2022 at 8:44 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> While it is possible to validate all generated dtb files against the
> schema, it typically results in huge pile of warnings. While working on
> a platform it is quite useful to validate just a single file against
> schema.
>
> Allow specifying CHECK_DTBS=1 on a make command line to enable
> validation while building dtb files. This reuses the infrastructure
> existing for `make dtbs_check`, making dtbs_check a shortcut for
> `make CHECK_DTBS=1 dt_binding_check dtbs`.
>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Tom Rini <trini@konsulko.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Changes since v1:
> - Added dependency to rebuild schema if `make dtbs` was used.
>
> ---
>  Makefile | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 9aa7de1ca58f..5a9858aa4934 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1464,14 +1464,18 @@ endif
>
>  ifneq ($(dtstree),)
>
> -%.dtb: include/config/kernel.release scripts_dtc
> +ifneq ($(CHECK_DTBS),)
> +DT_TMP_BINDING := dt_binding
> +endif
> +
> +%.dtb: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
> -%.dtbo: include/config/kernel.release scripts_dtc
> +%.dtbo: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
>         $(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>
>  PHONY += dtbs dtbs_install dtbs_check
> -dtbs: include/config/kernel.release scripts_dtc
> +dtbs: include/config/kernel.release scripts_dtc $(DT_TMP_BINDING)
>         $(Q)$(MAKE) $(build)=$(dtstree)
>
>  ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
> @@ -1498,8 +1502,10 @@ ifneq ($(filter dt_binding_check, $(MAKECMDGOALS)),)
>  export CHECK_DT_BINDING=y
>  endif
>
> -PHONY += dt_binding_check
> -dt_binding_check: scripts_dtc
> +dt_binding_check: dt_binding
> +
> +PHONY += dt_binding
> +dt_binding: scripts_dtc
>         $(Q)$(MAKE) $(build)=Documentation/devicetree/bindings
>
>  # ---------------------------------------------------------------------------
> @@ -1774,6 +1780,10 @@ help:
>         @echo  '                3: more obscure warnings, can most likely be ignored'
>         @echo  '                e: warnings are being treated as errors'
>         @echo  '                Multiple levels can be combined with W=12 or W=123'
> +       @$(if $(dtstree), \
> +               echo '  make CHECK_DTBS=1 [targets] Check all generated dtb files against schema'; \
> +               echo '         This can be applied both to "dtbs" and to individual "foo.dtb" targets' ; \
> +               )
>         @echo  ''
>         @echo  'Execute "make" or "make all" to build all targets marked with [*] '
>         @echo  'For further info see the ./README file'
> --
> 2.35.1
>


I think the idea seems OK to me, but we can make it simpler.


First, apply the following clean-up patch to reduce the code duplication.
https://lore.kernel.org/all/20220716093122.137494-1-masahiroy@kernel.org/T/#u


Then, apply the attached patch.diff

Please try it.







-- 
Best Regards
Masahiro Yamada

--0000000000004845d005e3e8e52c
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_l5np37ne0>
X-Attachment-Id: f_l5np37ne0

ZGlmZiAtLWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggOGFhNGRiYjhmODc4Li5jYzgw
YjZiOGQ1ZjggMTAwNjQ0Ci0tLSBhL01ha2VmaWxlCisrKyBiL01ha2VmaWxlCkBAIC0xMzgzLDEz
ICsxMzgzLDE2IEBAIGR0YnM6IGR0YnNfcHJlcGFyZQogIyB0YXJnZXRzICgsIHdoaWNoIG1heSBy
dW4gYXMgcm9vdCkgbXVzdCBub3QgbW9kaWZ5IHRoZSB0cmVlLgogZHRic19wcmVwYXJlOiBpbmNs
dWRlL2NvbmZpZy9rZXJuZWwucmVsZWFzZSBzY3JpcHRzX2R0YwogCisjICdtYWtlIGR0YnNfY2hl
Y2snIGlzIGEgc2hvcnRoYW5kIG9mICdtYWtlIENIRUNLX0RUQlM9eSBkdGJzJwogaWZuZXEgKCQo
ZmlsdGVyIGR0YnNfY2hlY2ssICQoTUFLRUNNREdPQUxTKSksKQogZXhwb3J0IENIRUNLX0RUQlM9
eQotZHRiczogZHRfYmluZGluZ19jaGVjawogZW5kaWYKLQogZHRic19jaGVjazogZHRicwogCitp
Zm5lcSAoJChDSEVDS19EVEJTKSwpCitkdGJzX3ByZXBhcmU6IGR0X2JpbmRpbmdfY2hlY2sKK2Vu
ZGlmCisKIGR0YnNfaW5zdGFsbDoKIAkkKFEpJChNQUtFKSAkKGR0Ymluc3QpPSQoZHRzdHJlZSkg
ZHN0PSQoSU5TVEFMTF9EVEJTX1BBVEgpCiAK
--0000000000004845d005e3e8e52c--
