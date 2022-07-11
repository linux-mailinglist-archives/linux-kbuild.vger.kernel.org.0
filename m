Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 069DB55CF47
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jun 2022 15:06:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237052AbiF0Qyn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jun 2022 12:54:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235421AbiF0Qym (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jun 2022 12:54:42 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B388186F2
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jun 2022 09:54:41 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id y18so10196587iof.2
        for <linux-kbuild@vger.kernel.org>; Mon, 27 Jun 2022 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=4PFA5xY31bsA5xLySpMra+nYbcLXicy6qxBOudOdw6s=;
        b=C99mxI++15wHrpzLPS7WtIw1OxAq4W8+KG2tTx6ndyhkpVLjtdCL1+s4z5S5U/++VL
         G3bThLkPVFOWL30UHDII21uIlDANxc9++0ldJKskucSCSCv5+XNf1/Sx9HmYN9MNNaxd
         5iu4yIubRTzeVLOBPoxBgPw2voMZ3nyMZ7Jmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4PFA5xY31bsA5xLySpMra+nYbcLXicy6qxBOudOdw6s=;
        b=qwHQ26arBEelBTKYHVrhGVwnyHAUE38FczsneTLT+XyqJv6BVLjCFeJyDjD3H+fXUi
         r3RCT5lIV6D6tSkaZMK96+GJ+LkkvhUKIP2rtP5Q2hV1y2euhSfiDWCogSjOmuGG4ODX
         ODoGXMO8HZHhAIfwpcjfTg5pxXhLi06YsNZwYCqp3EFdWYMaglUWHhxaoAi7SF/llAWD
         HWZfCImgY5RLlZikUJ0Ug/7UsOcs6O1EKGKp8XOnobYm+644jKzSH0IvFQGsRw6yXheo
         gdlkby1DBofVR0cF2wqqbRjS+glFijpGGvXkGkR6bNR2Nq1Vdr0NvRRQAyg7GJ+sPgqc
         IC8w==
X-Gm-Message-State: AJIora89uheZeXH+RO608oHeWmOOXojpTvfjQi+DklEmSUnNeabWn404
        dxHu8nMOikc6eEFvkkJp6jbFyg==
X-Google-Smtp-Source: AGRyM1tF/p82Zhcy7H9U5p2rOolwBm86AMPGBqiPAvivGjweR94NYzafyP1fYfeQLL8dgfHWkEh3Jg==
X-Received: by 2002:a05:6638:3297:b0:335:df89:8f46 with SMTP id f23-20020a056638329700b00335df898f46mr7765812jav.19.1656348880816;
        Mon, 27 Jun 2022 09:54:40 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id a14-20020a5d980e000000b006696754eef5sm5405348iol.13.2022.06.27.09.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 09:54:40 -0700 (PDT)
Subject: Re: [PATCH v1] kbuild: fix sub directory output build of kselftests
To:     Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Kieran Bingham <kbingham@kernel.org>
Cc:     kernel@collabora.com,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20220627070214.432390-1-usama.anjum@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <15532d64-6744-c8a5-184b-18358211d345@linuxfoundation.org>
Date:   Mon, 27 Jun 2022 10:54:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20220627070214.432390-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/27/22 1:02 AM, Muhammad Usama Anjum wrote:
> Build of kselftests fail if kernel's top most Makefile is used for
> running or building kselftests with separate output directory which is
> sub-directory. srctree is set to .. erroneously.
> 
> make kselftest-all O=/linux_mainline/build
> Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory
> 
> make kselftest-all O=build
> Makefile:1080: ../scripts/Makefile.extrawarn: No such file or directory
> 
> Fix this by comparing abs_srctree with CURDIR instead of abs_objtree.
> CURDIR changes based on from where the command has been run and it sets
> the srctree correctly.
> 
> Fixes: 25b146c5b8cee("kbuild: allow Kbuild to start from any directory")
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
> Changes in V2:
> - Correct the bugfix instead of workaround
> 
> V1: https://lore.kernel.org/lkml/20220223191016.1658728-1-usama.anjum@collabora.com/
> ---
>   Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e66358b64ede..4090d7afcda4 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -238,12 +238,12 @@ ifeq ($(need-sub-make),)
>   # so that IDEs/editors are able to understand relative filenames.
>   MAKEFLAGS += --no-print-directory
>   
> -ifeq ($(abs_srctree),$(abs_objtree))
> +ifeq ($(abs_srctree),$(CURDIR))
>           # building in the source tree
>           srctree := .
>   	building_out_of_srctree :=
>   else
> -        ifeq ($(abs_srctree)/,$(dir $(abs_objtree)))
> +        ifeq ($(abs_srctree)/,$(dir $(CURDIR)))
>                   # building in a subdirectory of the source tree
>                   srctree := ..
>           else
> 

Please resend cc'ing linux-kselftest

thanks,
-- Shuah
