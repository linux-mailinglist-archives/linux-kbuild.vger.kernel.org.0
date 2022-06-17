Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE6A54ED31
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jun 2022 00:19:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231263AbiFPWTd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jun 2022 18:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbiFPWTc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jun 2022 18:19:32 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC8960A89
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jun 2022 15:19:31 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id i64so2636417pfc.8
        for <linux-kbuild@vger.kernel.org>; Thu, 16 Jun 2022 15:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=AIGAlLa0GZrWuPaGOfAE2iYeZ/CSSgE+k1ly/8lAR5I=;
        b=bPKkpSfoBWhFxGFdhDlYot+bQ6vkY33VMoNVrR2OweaifIJ8KP0539zeFjwG5q9C0T
         Un6fozRblQSR8YTdTYTiLlAQKrKtLfllrlEOYON4R4+I/6QG4RyUab/mjstz5NAPOa3n
         nDLjndSYElEHR4yVwsuu/4a9HD+fz40FjAUZn2XqkydBCwC3Ppx66+oXjcoCY/I45yjO
         j6u/DImWLAi7PjnU+Zta7DZZxyvA3iN30AvzyGU+EmgN13GLz7jWZkTgFzScNpZ+HRWu
         yKh+paLtiUIB82fuWV8ZkBHb9VIKQplNYHxfVJBad+s0I8xAmkXBGC2bWuKKQ4twTTAE
         Uk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AIGAlLa0GZrWuPaGOfAE2iYeZ/CSSgE+k1ly/8lAR5I=;
        b=aJHcRVN8JWFzZsi1otpoSjnqCVVX9/yftA7m755fSUt2wj7uDj6xfxVEhNm0HXdto8
         PA3E0wHmcM1HAAlgohnL9U8OYjD079uPbcovgyFOEjJdcaE09NT1KajW2EI5V+e9VUdZ
         Rlw01zkAoE5Xqx+wRpwbCVCFx7zDGbb33NXiispznuwjRl2HXTABNWavH/dQ/I9HSgCq
         0RQQ87yGPH4TOYdVPYBW5zaC1PZfk2JMR4wdnRIlRJ++gRHdb8eDJI/G0ugjzfOgIGb7
         JwHOa+C09HWxJtsB04qxT5LlBrL6eLT9YzzOiUSa3Y2vHcaprik2EiCBpek4DuMv3T5D
         o7bA==
X-Gm-Message-State: AJIora+YMKWAJHhI6VKpTLGSC41rLu6nnQvuvjfbLUiXziNXGnnl8ZBM
        VN03ihbPFHhJRMn5+7fC8SysJA==
X-Google-Smtp-Source: AGRyM1tXhEu1laURErxLCvURc3HZCP2ln6/Pb/GbB4SoXl6fqgq7CjquzaTwL7/e3PNkrbe98enAgw==
X-Received: by 2002:aa7:8008:0:b0:51a:cae3:7563 with SMTP id j8-20020aa78008000000b0051acae37563mr6938572pfi.16.1655417971138;
        Thu, 16 Jun 2022 15:19:31 -0700 (PDT)
Received: from [192.168.1.189] (cpe-70-95-113-61.san.res.rr.com. [70.95.113.61])
        by smtp.gmail.com with ESMTPSA id n12-20020a17090a928c00b001cd4989fee4sm4242592pjo.48.2022.06.16.15.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 15:19:30 -0700 (PDT)
Message-ID: <936c9eea-d687-d4ce-b5a4-0e7f7ee3b714@google.com>
Date:   Thu, 16 Jun 2022 15:19:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] kbuild: Ignore __this_module in gen_autoksyms.sh
Content-Language: en-US
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Lobakin <alobakin@pm.me>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <20220616195759.3214538-1-samitolvanen@google.com>
From:   Steve Muckle <smuckle@google.com>
In-Reply-To: <20220616195759.3214538-1-samitolvanen@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-20.2 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/16/22 12:57, Sami Tolvanen wrote:
> Module object files can contain an undefined reference to __this_module,
> which isn't resolved until we link the final .ko. The kernel doesn't
> export this symbol, so ignore it in gen_autoksyms.sh. This avoids an
> unnecessary vmlinux rebuild with UNUSED_KSYMS_WHITELIST when we have a
> symbol list that already contains all the module dependencies.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> ---
>   scripts/gen_autoksyms.sh | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index faacf7062122..653fadbad302 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -56,4 +56,7 @@ EOT
>   # point addresses.
>   sed -e 's/^\.//' |
>   sort -u |
> +# Ignore __this_module. It's not an exported symbol, and will be resolved
> +# when the final .ko's are linked.
> +grep -v '^__this_module$' |
>   sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$output_file"

Tested-by: Steve Muckle <smuckle@google.com>
