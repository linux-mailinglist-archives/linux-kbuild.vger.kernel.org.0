Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 189EE745456
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Jul 2023 05:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjGCD67 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 2 Jul 2023 23:58:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjGCD66 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Jul 2023 23:58:58 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AC093;
        Sun,  2 Jul 2023 20:58:57 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5577900c06bso3219929a12.2;
        Sun, 02 Jul 2023 20:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688356737; x=1690948737;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B/PQXjkL+Ql9ozRL2pZj1FoItwIuuU1/FoM+PWBLQ0c=;
        b=bisdXdMB4kJWYFdP44MjynQlmsPMqRTKuCIHvEsf99IH14GTNQU4PIHsB3zhEhkdtZ
         dds0STQzdT4k0sh/ANI0ef7sfBS3CeFvVHJQiGac1cX3qLxc3v3guJ1wO+N9SIth+yjS
         caBUE3uPYHOzNhIJPgTUfigb8ONO4YXEyGVggrZKIWEJE5X+vNQLLWe0vuCp7VmhniUO
         P5NYwbN4+MrrS8t8ukoFwTSrQd3AnLSw7JiQckI0urh0+cmPPnOGbUysRQ+fPxzcyns3
         t6uSKt2cL9a5dy5hJHZ/uLsB1Hi7M73OUTQL3An9VJwfC3zG+Swjx9kyYMkKrXYS75Kk
         Dtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688356737; x=1690948737;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B/PQXjkL+Ql9ozRL2pZj1FoItwIuuU1/FoM+PWBLQ0c=;
        b=UsTvgpRkflOMNRT9uqp50SRksay8VtLflM1AymzFvsLVneHytFL9AAbvcFyJWIUy4W
         ZTSkv/bpOwVL6H9KUSezUhGJ0tZAKBJ0BzHvgfLwOo7TFi54oKbwiVeerUerWGvgK8b9
         KIkV/UEmiEE5mcV25+u++p/YMtyPIDNc8TDPe7WrnkJK7P8BCpxmUXNIMxnwTwApeemB
         EP2c3W9QQ6ftpzJME43IYXPYsGndV4zgkyaNQsv+Kp34WFdfuMF9wCMFyqaxbzYHnkGx
         guxPQToeSW24gjSPKuCIY3Cag8cuYpDstZzQav2VeMRtOM9T8WQJb7n2xOs9wMgAEqjO
         S9bA==
X-Gm-Message-State: ABy/qLaIZqH0uzjtSwOvOlJXxsTIQwp4/LXHgSCeMDJe73hE4duJ/ByG
        T2AWOlNHVChTh6hZcbx14hT7wolfa14=
X-Google-Smtp-Source: APBJJlHDG2peAa+bdtQ2zpwU+zP/GyrC6Ad84+kw3JlYBIiRBiesEntfQ3PLoBApiezbXkXINLO0RQ==
X-Received: by 2002:a05:6a20:1043:b0:123:3f03:68f9 with SMTP id gt3-20020a056a20104300b001233f0368f9mr9215812pzc.61.1688356737282;
        Sun, 02 Jul 2023 20:58:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c3-20020a170902848300b001b53d3d8f3dsm14258612plo.299.2023.07.02.20.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Jul 2023 20:58:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4fa56264-f188-46f9-cc77-117b469b3328@roeck-us.net>
Date:   Sun, 2 Jul 2023 20:58:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [CRASH][BISECTED] 6.4.1 crash in boot
Content-Language: en-US
From:   Guenter Roeck <linux@roeck-us.net>
To:     Kees Cook <keescook@chromium.org>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Cc:     Mirsad Goran Todorovac <mirsad.todorovac@alu.unizg.hr>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LLVM <llvm@lists.linux.dev>,
        linux-kbuild@vger.kernel.org,
        Linux Regressions <regressions@list.linux.dev>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
References: <9a8e34ad-8a8b-3830-4878-3c2c82e69dd9@alu.unizg.hr>
 <ZKIoBVzrjZ+Ybxy9@debian.me> <202307022018.B26F5795@keescook>
 <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
In-Reply-To: <625e951e-9922-d15d-5520-e8cd5eba1995@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/2/23 20:26, Guenter Roeck wrote:
> On 7/2/23 20:20, Kees Cook wrote:
>> On Mon, Jul 03, 2023 at 08:44:37AM +0700, Bagas Sanjaya wrote:
>>> On Sun, Jul 02, 2023 at 06:36:12PM +0200, Mirsad Goran Todorovac wrote:
>>>> Hi,
>>>>
>>>> After new git pull the kernel in Torvalds tree with default debug config
>>>> failed to boot with error that occurs prior to mounting filesystems, so there
>>>> is no log safe for the screenshot(s) here:
>>>>
>>>> [1] https://domac.alu.unizg.hr/~mtodorov/linux/crashes/2023-07-02/
>>>>
>>>> Bisect shows the first bad commit is 2d47c6956ab3 (v6.4-rc2-1-g2d47c6956ab3):
>>>>
>>>> # good: [98be618ad03010b1173fc3c35f6cbb4447ee2b07] Merge tag 'Smack-for-6.5' of https://github.com/cschaufler/smack-next
>>>> git bisect good 98be618ad03010b1173fc3c35f6cbb4447ee2b07
>>>> # bad: [f4a0659f823e5a828ea2f45b4849ea8e2dd2984c] drm/i2c: tda998x: Replace all non-returning strlcpy with strscpy
>>>> git bisect bad f4a0659f823e5a828ea2f45b4849ea8e2dd2984c
>>>> .
>>>> .
>>>> .
>>>> # bad: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>>> git bisect bad 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c
>>>> # first bad commit: [2d47c6956ab3c8b580a59d7704aab3e2a4882b6c] ubsan: Tighten UBSAN_BOUNDS on GCC
>>>>
>>>> The architecture is Ubuntu 22.04 with lshw and config give in the attachment.
>>>
>>> Can you show early kernel log (something like dmesg)?
>>>
>>> Anyway, I'm adding it to regzbot:
>>>
>>> #regzbot ^introduced: 2d47c6956ab3c8
>>> #regzbot title: Linux kernel fails to boot due to UBSAN_BOUNDS tightening
>>
>> I'm confused. Commit 2d47c6956ab3c8b580a59d7704aab3e2a4882b6c isn't in the v6.4
>> tree... it's only in Linus's ToT.
>>
> 
> In ToT:
> 
> $ git describe 2d47c6956ab3
> v6.4-rc2-1-g2d47c6956ab3
> 
> $ git describe --contains 2d47c6956ab3
> next-20230616~2^2~51
> $ git describe --contains --match 'v*' 2d47c6956ab3
> fatal: cannot describe '2d47c6956ab3c8b580a59d7704aab3e2a4882b6c'
> 
> "git describe" always shows the parent tree, which I guess was based on
> v6.4-rc2.
> 

Ah, sorry, I didn't realize that the subject claims that the problem
would be in 6.4.1. That indeed does not match the bisect results.

Guenter

> Guenter
> 
> 
>> Also, the config you included does not show CONFIG_UBSAN_BOUNDS_STRICT
>> as even being available, much less present. Something seems very wrong
>> with this report...
>>
>> -Kees
>>
> 

