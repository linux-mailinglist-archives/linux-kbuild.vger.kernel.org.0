Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CD09582391
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jul 2022 11:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbiG0J7F (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 27 Jul 2022 05:59:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiG0J7E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jul 2022 05:59:04 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5261327B29
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 02:59:02 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id h12so1689803ljg.7
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jul 2022 02:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GwqFtPt/xmNEM9oGm20Ezy8JHRp4k937wt14MI6jUS4=;
        b=IN9Xzww+/6pEM6LT6pKFO5qZW1gBv8j/A0PvWMT4vMvcZUbYJOfwhc+k6Op2JIzVvM
         VsDi2DYYDxVdVLbxWkGlN7cFc7walUDcTJhJ/O3AV2Wxg3J6TaF+SvJe2QDN3JNLaY9A
         dExWVNjuMOz2YZ/5b3yx3YZNvlf2HNbSfumQko3+exRj/kYs3kNVaAGoSqj/aovU7o7x
         QfIh6+WetoQKV+fJnjSaMPyWI7M7zgwSGvKkPJnYcI6q5KK8CN87V8XV+9C1sDM7zSiZ
         Hn+8AsAVhlrCddg5GCSqoUr/R5ktG5gvYKL7tjT/dvL3iyi3PUoBfVJHH20Nj6ElOguU
         V9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GwqFtPt/xmNEM9oGm20Ezy8JHRp4k937wt14MI6jUS4=;
        b=WqIJqWrQ0TzPjKbrrOb4TiWMYUSVBuJkIKQUPH/nqJp9T9RT5yh0p7s2ATS0bRnZec
         ggGuLoxVjMXNkUrW3J6nsRYtMgZI1NrD5jOG2lFXEMmgBRl1BvUnnve3aBqS9vvqkogM
         1fDrSjmocQUzLJ4WbuoconQcGSefGp1KcjoK0gG/Cm6mpki0QquPZnipAcYQBKwepgnV
         HNibFhSuMksrjwuw9c5/G5O1iuvVlKwD71D/QgC+HgCNCdIT4qYbUBShFlAyDfOu/+ZN
         QSLY9oNIbdTdvWFPzek+hroRuIzAtUID+rSqwN//DrHrBGKlpeLhU7o0ZFcEP5grF5iM
         ImBw==
X-Gm-Message-State: AJIora84NQWuy85qIG2NnuTmMH40xi2sms2uHkDjvtD21n7AVlM6blix
        InP27OSu+cpGXKy6XFD/+JDKvRU0QnlpNA==
X-Google-Smtp-Source: AGRyM1vOjpH1M1Y46yNkQ5PFkJlMXeww9/PEnzRuXfOLskRj6ZXLJYgoIgP3L7K1Cog13GSAXoFR4A==
X-Received: by 2002:a2e:a408:0:b0:25d:f594:146a with SMTP id p8-20020a2ea408000000b0025df594146amr7321581ljn.76.1658915940447;
        Wed, 27 Jul 2022 02:59:00 -0700 (PDT)
Received: from [192.168.43.7] ([188.162.64.29])
        by smtp.gmail.com with ESMTPSA id v16-20020a05651203b000b0048a8899df3esm1800155lfp.168.2022.07.27.02.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 02:58:59 -0700 (PDT)
Message-ID: <721e4896-6edb-9427-1dbb-0b17742615e6@linaro.org>
Date:   Wed, 27 Jul 2022 12:58:58 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] kbuild: add dtbs_prepare target
Content-Language: en-GB
To:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
References: <20220716093122.137494-1-masahiroy@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220716093122.137494-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 16/07/2022 12:31, Masahiro Yamada wrote:
> Factor out the common prerequisites for DT compilation into the new
> target, dtbs_prepare.
> 
> Add comments in case you wonder why include/config/kernel.release is
> the prerequisite. Our policy is that installation targets must not
> (re)compile any build artifacts in the tree. If we make modules_install
> depend on include/config/kernel.release and it is executed under the
> root privilege, it may be owned by root.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

With the comment fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> 
>   Makefile | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a9bd55edb75e..8aa4dbb8f878 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1367,16 +1367,22 @@ endif
>   
>   ifneq ($(dtstree),)
>   
> -%.dtb: include/config/kernel.release scripts_dtc
> +%.dtb: dtbs_prepare
>   	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>   
> -%.dtbo: include/config/kernel.release scripts_dtc
> +%.dtbo: dtbs_prepare
>   	$(Q)$(MAKE) $(build)=$(dtstree) $(dtstree)/$@
>   
> -PHONY += dtbs dtbs_install dtbs_check
> -dtbs: include/config/kernel.release scripts_dtc
> +PHONY += dtbs dtbs_prepare dtbs_install dtbs_check
> +dtbs: dtbs_prepare
>   	$(Q)$(MAKE) $(build)=$(dtstree)
>   
> +# include/config/kernel.release is not actually required for building DTBs,
> +# but for installing DTBs because INSTALL_DTBS_PATH contains $(KERNELRELEASE).
> +# We do not want to move it to dtbs_install. The policy is installation
> +# targets (, which may run as root) must not modify the tree.
> +dtbs_prepare: include/config/kernel.release scripts_dtc
> +
>   ifneq ($(filter dtbs_check, $(MAKECMDGOALS)),)
>   export CHECK_DTBS=y
>   dtbs: dt_binding_check


-- 
With best wishes
Dmitry
