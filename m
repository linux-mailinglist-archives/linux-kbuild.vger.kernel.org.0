Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76DC575686
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jul 2022 22:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240624AbiGNUpX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jul 2022 16:45:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240604AbiGNUpW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jul 2022 16:45:22 -0400
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44657545E2
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jul 2022 13:45:21 -0700 (PDT)
Received: by mail-il1-x12d.google.com with SMTP id w16so1128538ilh.0
        for <linux-kbuild@vger.kernel.org>; Thu, 14 Jul 2022 13:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=l5kqjDQxPDfnO/p1iTyqBq5xMARQy02hbfQd6S9DIxo=;
        b=AqJOSaWTPWW4l7m2eAwfo/OBadcln3Rf8X/B99A4tzqg31Qcnc5bc22CJit/vgjfth
         W2FwUX2BxbbaDgU0hCy05bI62PAzNPis1M/PjZunq0MA/frWB5cZ4l6/BwJNQgneT931
         +38C0bEI9HaZTFnT5FFoBjVKvVyIFYxfNcE08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l5kqjDQxPDfnO/p1iTyqBq5xMARQy02hbfQd6S9DIxo=;
        b=VuKdmaSyZiTDlfUx/lxk4kak0oSXKYFLHpdnZeyCzfKnhqBoTNA6/dvY7jzic0ZeFP
         5c9TLjW0WU4yhsdRwIjTU5InqcDGdZX/o6jqFck7v57q2nBfjuBMHeQ0/kgNEZO6vRNG
         w8IRJi77vpGH82ZUOyA9nz1Kr3edpKd7E7iJ/TBQhISpzJEtoMMBts3HHmu3z8Uob9QL
         6jVffQLhcE2tTuQl/mihZWD8d8EeSUsxOohH3haMml16h0T/tCVxuiXdSJnKXYp2DXIZ
         st/aU2K8gfkI8Bq9kvY8IFTsEfWmclNE5ZJ6JmA/y+hWBOlDgfnbKU+/n2tJhfPiLlwo
         lofQ==
X-Gm-Message-State: AJIora+NvcKIollNm7F9CkvOyoCkJTHnWbtDdtIg38yCRdZBfGISKvHi
        4O3Pfhk6m/fvV/RiEHmFYQzbBA==
X-Google-Smtp-Source: AGRyM1twniS5ciAxaVqt5XzCd3NVKOLc6Y2l/ntXh54cUObh6jEh5CbFwC0S90S0IeqfssIWMGSveg==
X-Received: by 2002:a05:6e02:1a45:b0:2dc:27a6:7651 with SMTP id u5-20020a056e021a4500b002dc27a67651mr5508056ilv.102.1657831520566;
        Thu, 14 Jul 2022 13:45:20 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id p123-20020a022981000000b0033eb2f2ccfasm1147979jap.43.2022.07.14.13.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 13:45:19 -0700 (PDT)
Subject: Re: [PATCH] Makefile: replace headers_install with headers for
 kselftest
To:     Guillaume Tucker <guillaume.tucker@collabora.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Shuah Khan <shuah@kernel.org>,
        Kees Cook <keescook@chromium.org>
Cc:     Anders Roxell <anders.roxell@linaro.org>, Tim.Bird@sony.com,
        kernel@collabora.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <a7af58feaa6ae6d3b0c8c55972a470cec62341e5.1657693952.git.guillaume.tucker@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <f35a71d6-bd96-7aa9-c143-39ae88bc85d5@linuxfoundation.org>
Date:   Thu, 14 Jul 2022 14:45:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a7af58feaa6ae6d3b0c8c55972a470cec62341e5.1657693952.git.guillaume.tucker@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/13/22 12:33 AM, Guillaume Tucker wrote:
> Replace headers_install with headers as kselftest uses the header
> files from within the kernel tree rather than from a system-wide
> installation.
> 
> We can still run this directly:
> 
>    $ make O=build kselftest-all
> 
> and when building from the selftests directory:
> 
>    $ make O=build headers
>    $ make O=build -C tools/testing/selftests all
> 
> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> Reported-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>   Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index fb2f3bb53a6b..5c934d16664c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1347,10 +1347,10 @@ tools/%: FORCE
>   # Kernel selftest
>   
>   PHONY += kselftest
> -kselftest: headers_install
> +kselftest: headers
>   	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests run_tests
>   
> -kselftest-%: headers_install FORCE
> +kselftest-%: headers FORCE
>   	$(Q)$(MAKE) -C $(srctree)/tools/testing/selftests $*
>   
>   PHONY += kselftest-merge
> 

Thank you for taking care of this. This will go through kbuild?

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

