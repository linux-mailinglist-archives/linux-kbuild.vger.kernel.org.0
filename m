Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B87783FABF5
	for <lists+linux-kbuild@lfdr.de>; Sun, 29 Aug 2021 15:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235782AbhH2NY2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 29 Aug 2021 09:24:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235759AbhH2NYZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Aug 2021 09:24:25 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A969C061575;
        Sun, 29 Aug 2021 06:23:33 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id h13so18278705wrp.1;
        Sun, 29 Aug 2021 06:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=R3pAucoQ7QlH4/SY6hcDE/PrvHPR7ZVMlnfCsrZbNiM=;
        b=RK8xZvCGrvsBPf0RaCsD0lCgh6cjjEkGhhOHKjVTP8NVaL6pOiNYyp6nbHtg4hqoj7
         mGc3A2Fo+0jG10QLW58twlQk4UGM4a9t0ENwBGGszCFKxU+pLOXgL/yOdB3xXWeQlLdd
         1zURc1YthEJh/lMGgkz2Pc7o0SIKzujoH/rpQjnLAbqRgME/vKXSvsR2VH+wvtKHAGZo
         rnVskSvuYacnWAGoVYhYK9XKFIFDQUPzFdSxz0dy+G4q9FVoQ489ZmLGEJKJzzZUZ1U7
         vJDZ35jPuYsyKRGlwUAgJPWBqxZa89cTxN6XRdtdpxyV5iQls9eIWcP3KdobXjBJu79H
         ZChw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=R3pAucoQ7QlH4/SY6hcDE/PrvHPR7ZVMlnfCsrZbNiM=;
        b=cFtnSp9qaLnfchIY31qoW8eFdU1/pR/Ipe7n3FrLS1p/6oEl6MI+swpulqwqP4dB9n
         1U4HYDJtCSTIJDh9BF6FVKnj7RoTCAdnA/6mGfiyV3swk9lUBZMipsBBjUFX+ui5EUsB
         yuP1Q9ld1yjgT7p5R1CELMZv+wuvyTJ7qWD4eYTg0Q1EOu0M+w2SZeEIvwOZJttuGkHF
         6VI3u2Rp9Ky42LEqEVRgXM+uj/Unm6wXZoV/iW2O2cC01hzS1adCK0zuKtG/MYDI1mTh
         3Fgg+90anKCN1drL5VvIrTEE51fNdcpur1mwZ6YOgbsEecbA/XeTvTl8J3qcZfju8FtL
         lS3A==
X-Gm-Message-State: AOAM532bFogXr4+5bzSG8TeAUJIO/lwMccpbGXASCQwkW5UDG8oa3Vn0
        A2CAoMACwZiusnV2kQGE4sNCbodz/4Ujgg==
X-Google-Smtp-Source: ABdhPJxBrqne3mDHQZusMUKYdndRuQd8LB3mR2SwQDgVTQ8z0QAKEMCTl64z0yQr2kDW5oZDthh4KA==
X-Received: by 2002:adf:c10e:: with SMTP id r14mr3102358wre.313.1630243411780;
        Sun, 29 Aug 2021 06:23:31 -0700 (PDT)
Received: from [192.168.1.107] ([147.235.73.50])
        by smtp.gmail.com with ESMTPSA id u27sm12845779wru.2.2021.08.29.06.23.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 06:23:31 -0700 (PDT)
Subject: Re: [PATCH 3/3] checkkconfigsymbols.py: Forbid passing 'HEAD' to
 --commit
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Ariel Marcovitch <arielmarcovitch@gmail.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Valentin Rothberg <valentinrothberg@gmail.com>
References: <20210822192205.43210-1-arielmarcovitch@gmail.com>
 <20210822192205.43210-4-arielmarcovitch@gmail.com>
 <CAK7LNARmSmTTPRWcgcPF8kRntSFuaPkLD0A=xuz=CAp4SzxV=Q@mail.gmail.com>
From:   Ariel Marcovitch <trhtkmarco@gmail.com>
Message-ID: <b7f9e9a8-6854-ef3b-a20c-3b4b3d2d8440@gmail.com>
Date:   Sun, 29 Aug 2021 16:23:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARmSmTTPRWcgcPF8kRntSFuaPkLD0A=xuz=CAp4SzxV=Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello!

On 24/08/2021 16:31, Masahiro Yamada wrote:
> On Mon, Aug 23, 2021 at 4:23 AM Ariel Marcovitch
> <arielmarcovitch@gmail.com> wrote:
>> As opposed to the --diff option, --commit can get ref names instead of
>> commit hashes.
>>
>> When using the --commit option, the script resets the working directory
>> to the commit before the given ref, by adding '~' to the end of the ref.
>>
>> However, the 'HEAD' ref is relative, and so when the working directory
>> is reset to 'HEAD~', 'HEAD' points to what was 'HEAD~'. Then when the
>> script resets to 'HEAD' it actually stays in the same commit. In this
>> case, the script won't report any cases because there is no diff between
>> the cases of the two refs.
>>
>> Prevent the user from using HEAD refs.
>>
>> A better solution might be to resolve the refs before doing the
>> reset, but for now just disallow such refs.
>
> Better than doing nothing.
> So, applied to linux-kbuild.
>
>
>
>
>
>> Signed-off-by: Ariel Marcovitch <arielmarcovitch@gmail.com>
>> ---
>>   scripts/checkkconfigsymbols.py | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/checkkconfigsymbols.py b/scripts/checkkconfigsymbols.py
>> index 875e9a2c14b2..6259698e662d 100755
>> --- a/scripts/checkkconfigsymbols.py
>> +++ b/scripts/checkkconfigsymbols.py
>> @@ -103,6 +103,9 @@ def parse_options():
>>                        "continue.")
>>
>>       if args.commit:
>> +        if args.commit.startswith('HEAD'):
>> +            sys.exit("The --commit option can't get use the HEAD ref")

Just realized that the message says "can't get use" which doesn't make
much sense :)

Do you want me to send a new patch to fix it?

>> +
>>           args.find = False
>>
>>       if args.ignore:
>> --
>> 2.25.1
>>
>
Thanks for your time :)

Ariel Marcovitch

