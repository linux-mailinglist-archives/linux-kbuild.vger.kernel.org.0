Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5199663A1A
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Jan 2023 08:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235498AbjAJHmY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Jan 2023 02:42:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbjAJHmX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jan 2023 02:42:23 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91D6017438
        for <linux-kbuild@vger.kernel.org>; Mon,  9 Jan 2023 23:42:22 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id bn26so10803763wrb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Jan 2023 23:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xCR/5Hx4NATrbBZTdEBXrTKuKP6muZPLwQu+AxLiao0=;
        b=ilq5vYVAKMDGVuhI6spROnL42ZmvWq3zjVfDIJQWoUWT2lonAGnLw/wViEwVaIfWJW
         4/qArhal9JNnWaxTMyv3FkH+A8YC6BeW8jfcHCKrGOktEkuMYa9XakZrYsGpQ2v4lWvY
         SCNmoUEhyeoNEcAVpVntpliqKG94OgugwXk8NePOYUPxqF4dqozNoCzGarfzOpMDooV3
         TqOu9Xumu65uOkmPZk+OQYZDFdFWk0eMTsbXVMpdckpgHqbWE4h70RaE74UdysRBjT/E
         J7oDGwVkmxWN0SBtaFPGJxz1795UaM32gfMstSKrPWDzgyYAjzy+syiOKHgEOaifqieN
         roeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xCR/5Hx4NATrbBZTdEBXrTKuKP6muZPLwQu+AxLiao0=;
        b=MTRJNYZitZwYpLLCYaZTT1uCic6mmdx3l/u9aXyexSUmDPbPLMTccGuutKJla1FsmT
         2YXCLMJuUGGxelTuA9RxV3HeFSiArvDikSBlGjg6hwAYSlbJoawiJj7HaK/PQUdGFv3L
         LlX0Eos0juNkGEgVuMe2faV3baJ7ol3dtdUbG064sdpfSRVYeLTyHXXxvlE65iYqn95V
         7xs41LF4ZVmArudZrQG770NuvAuuF3rJvTsKoePFgSk9oTZYSdl8Q9t5oevJDxNnwTdJ
         SP6I/en+oI5NzelovX3Pm+13KcxzKacYc7C5sOL5TSEHDhIoX9jkj0INCWwwDmRm7Q0R
         sHMA==
X-Gm-Message-State: AFqh2krzqA2G1hglHb3xGeNxEdP7/YoF6O8FT+l3pmIUkQySLCSKU8gy
        NYPSVsjSKUW2YyAYaFL2tTIbtw==
X-Google-Smtp-Source: AMrXdXuhw4Ynk4e4lsMHI3M5xmOmxfxlohSaHdYOdbO4EKcCZT6f24cAO+0bK3pqfAw3GntDd4iMPg==
X-Received: by 2002:a05:6000:a1d:b0:2bb:dcf9:482b with SMTP id co29-20020a0560000a1d00b002bbdcf9482bmr6276843wrb.47.1673336540752;
        Mon, 09 Jan 2023 23:42:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id f2-20020adfdb42000000b0024274a5db0asm10675795wrj.2.2023.01.09.23.42.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 23:42:20 -0800 (PST)
Message-ID: <a67ec96a-cd07-47ee-f715-0b4e29770b40@linaro.org>
Date:   Tue, 10 Jan 2023 08:42:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 03/14] MIPS: Prefer cc-option for additions to cflags
Content-Language: en-US
To:     Nathan Chancellor <nathan@kernel.org>, masahiroy@kernel.org,
        ndesaulniers@google.com
Cc:     nicolas@fjasle.eu, trix@redhat.com, linux-kbuild@vger.kernel.org,
        llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
References: <20221228-drop-qunused-arguments-v1-0-658cbc8fc592@kernel.org>
 <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221228-drop-qunused-arguments-v1-3-658cbc8fc592@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 4/1/23 20:54, Nathan Chancellor wrote:
> A future change will switch as-option to use KBUILD_AFLAGS instead of
> KBUILD_CFLAGS to allow clang to drop -Qunused-arguments, which may cause
> issues if the flag being tested requires a flag previously added to
> KBUILD_CFLAGS but not KBUILD_AFLAGS. Use cc-option for cflags additions
> so that the flags are tested properly.
> 
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
> Cc: tsbogend@alpha.franken.de
> Cc: linux-mips@vger.kernel.org
> ---
>   arch/mips/Makefile             | 2 +-
>   arch/mips/loongson2ef/Platform | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

