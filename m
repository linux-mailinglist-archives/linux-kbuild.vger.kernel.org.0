Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90CBF572B4C
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 Jul 2022 04:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233952AbiGMC1t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Jul 2022 22:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234044AbiGMC1s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Jul 2022 22:27:48 -0400
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC119D4BD6
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jul 2022 19:27:46 -0700 (PDT)
Received: by mail-il1-x12a.google.com with SMTP id u13so5947965iln.6
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jul 2022 19:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cbU9v9plTYYPMcnTfIcPSWQX14jbm9qmi2G0XnJwWTY=;
        b=anrpZgaBstbJa6blUFrbmicw8U+lvjVWjxgyaFoJUb/SK0I+8SVHOR7jSiZEuH/anv
         PuyQ7MPwUAfShDlCubNl5nDfa2YLnniS/pZudvQ3Jfji9NXZJan4ISupAjqe2GYgyW8C
         lXN+D2fhBo+1EMjW/Vtx7bx2QTv38AmHpl8+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cbU9v9plTYYPMcnTfIcPSWQX14jbm9qmi2G0XnJwWTY=;
        b=YS0lkRNlhNE2JxL8tZqG9v7UXw/bec6edH1PFxnLX9E2qATqewYNMvcyH6rlyLjNlp
         eGxMMSHPgZuUjy81sWcY9+LJbxe3tD0TMpXgC55D1SoACE8MdAInUD4onrK23TWISgb4
         ry3jK8WEZLrdXf0YORUiKEVrdqmE2DAcs5t2zSVo/XHcBrqCFYT0q34/4jG1o+AHRxvQ
         CEq7rPQmlAv5TjAe9GZLlrbYB0aJkkIZ64knG3cfMOKY1NoAcVE8QOP/xOhpP3Lk3J21
         XM8kf9SkXGkhDRpKUsLyx4mzwfcV8buwj0ej2+pQdM4DLjhkk0DvTKDEe4xTIuUHfGjc
         wTVA==
X-Gm-Message-State: AJIora/ci2sBzzJKnbL8wDN1Ld9kudR0IwEVDZMNc2LuA97b3E1nckfy
        yyGLZC15vlaaFfUzWMABmj4/+g==
X-Google-Smtp-Source: AGRyM1tUzfKEKaDtA1v9zPGEc9cgjFX1o/mNb41jX7SEWnUF5U4pB4WVjzW2q1/WQhvUpcj5pfrXVg==
X-Received: by 2002:a05:6e02:184c:b0:2dc:52ef:24cd with SMTP id b12-20020a056e02184c00b002dc52ef24cdmr648158ilv.173.1657679265864;
        Tue, 12 Jul 2022 19:27:45 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id cs16-20020a056638471000b0033f0e12b862sm4715552jab.172.2022.07.12.19.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jul 2022 19:27:45 -0700 (PDT)
Subject: Re: [PATCH v2 0/4] Fix kselftest build with sub-directory
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
References: <cover.1657614127.git.guillaume.tucker@collabora.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <d32187ae-8e8a-72ad-d422-3d3b47101160@linuxfoundation.org>
Date:   Tue, 12 Jul 2022 20:27:44 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <cover.1657614127.git.guillaume.tucker@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/12/22 2:29 AM, Guillaume Tucker wrote:
> Earlier attempts to get "make O=build kselftest-all" to work were
> not successful as they made undesirable changes to some functions
> in the top-level Makefile.  This series takes a different
> approach by removing the root cause of the problem within
> kselftest, which is when the sub-Makefile tries to install kernel
> headers "backwards" by calling make with the top-level Makefile.
> The actual issue comes from the fact that $(srctree) is ".." when
> building in a sub-directory with "O=build" which then obviously
> makes "-C $(top_srcdir)" point outside of the real source tree.
> 
> With this series, the generic kselftest targets work as expected
> from the top level with or without a build directory e.g.:
> 
>    $ make kselftest-all
> 
>    $ make O=build kselftest-all
> 
> Then in order to build using the sub-Makefile explicitly, the
> headers have to be installed first.  This is arguably a valid
> requirement to have when building a tool from a sub-Makefile.
> For example, "make -C tools/testing/nvdimm/" fails in a similar
> way until <asm/rwonce.h> has been generated by a kernel build.
> 
> v2: replace headers_install with headers
> 

I already applied the series. Please send me patches I can apply
on top of the ones in linux-kselftest next branch.

thanks,
-- Shuah
