Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6A01F1A70
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2020 15:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729829AbgFHNwO (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jun 2020 09:52:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729040AbgFHNwO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 09:52:14 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A1CC08C5C2;
        Mon,  8 Jun 2020 06:52:14 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x207so8580931pfc.5;
        Mon, 08 Jun 2020 06:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5yTduhn4RewZ8tIc8IvJNzhBbfAtUwR3nIVu+3qxoT4=;
        b=Tbni9kmWSTwvrtCasTNAYV5o1p3CRTaB4SWtyL1rfN7Fqg6RTVjnweDJIYgRxm5TMD
         CmQqgcVrK1hdxcC9sjKK0jpzd+GhFUK6x0wOGNX/2wHHyDXbTU7F8vFdz0TG39u7Mt8D
         3npLFDW3fon4IQpDKG/cU5gI7NSeK6aUdeSQI/Tq9U3kh/FUVOjVadl6y6KXp88/Ed04
         UkD0wuOCsWdl3ufncdFMtHjKb/FOlZtxrspWQzWtIv86UILWjCKIl4ObnootkpdNWtMU
         sl5r24xGiVMqz77J1VSCuAI5Quhv4ZJQsc5T5m31AvpOYNmktQdB5vR17U/DezN7bUy3
         PPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=5yTduhn4RewZ8tIc8IvJNzhBbfAtUwR3nIVu+3qxoT4=;
        b=YM6ZOjwuuIM5TFrcyiK5AK0rlLPCEDGIRRiSvY1iXmRNgkWANCqIYEoryJm445lm51
         XKKSEerMP/H33W4a6F+fHnjuZ6f5ErTFKP1sIxPQi8WaofbsxiMZWjPavfF4j0QolzJq
         vk0BcrklxCmv28vSSrbGIYK/9ZMqU2gr9bBhFL2NfkIMdFlTYM79oYmY8WYaxBZTvjlv
         utmpO0VAIUHFzNQIts3K0RvEtrolA307owh9fdtPmTw4C7UFmMxjTPDVM5sMT/F4VNkU
         mNec+fcnJk5O2oASpOuPxHyWd4fqzj+9cyDbnmpNH5rp7CUiXtJ6FwxmGGu+Wl7FX690
         2QfQ==
X-Gm-Message-State: AOAM532Zz7NREsKFGyK2Wtm4jw2HuCGir9BF7kAo4SePrYUybhTjyAc0
        Mt791cBx/6+AirVkULI0FQtpwO5W
X-Google-Smtp-Source: ABdhPJw6jz3nyzqd7Rl9wd4xkSs1HBl4i9znxSakuduOAykn9ydcQdgNMkdbPfPJQmmir6e6W7HjsQ==
X-Received: by 2002:a63:7d4e:: with SMTP id m14mr20888256pgn.391.1591624333611;
        Mon, 08 Jun 2020 06:52:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y10sm6280468pgi.54.2020.06.08.06.52.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2020 06:52:12 -0700 (PDT)
Subject: Re: [PATCH v5] kbuild: add variables for compression tools
To:     Denis Efremov <efremov@linux.com>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20200514131234.380097-1-efremov@linux.com>
 <20200605073955.6384-1-efremov@linux.com>
 <20200608013012.GA216607@roeck-us.net>
 <CAK7LNASQamajjeV+VMq5G8fECfB6f9uKvZ32zGic72O0qp8Mtw@mail.gmail.com>
 <d7e4a235-35eb-1c13-09dc-19a523cbf4ea@linux.com>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <adafe608-7502-fae2-9ff4-deefaec4783f@roeck-us.net>
Date:   Mon, 8 Jun 2020 06:52:11 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d7e4a235-35eb-1c13-09dc-19a523cbf4ea@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 6/8/20 3:28 AM, Denis Efremov wrote:
> 
> 
> On 6/8/20 7:59 AM, Masahiro Yamada wrote:
>> On Mon, Jun 8, 2020 at 10:30 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> Hi,
>>>
>>> On Fri, Jun 05, 2020 at 10:39:55AM +0300, Denis Efremov wrote:
>>>> Allow user to use alternative implementations of compression tools,
>>>> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
>>>> speed up the build:
>>>> $ make GZIP=pigz BZIP2=pbzip2
>>>>
>>>> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
>>>> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
>>>> since 2015. However, alternative implementations (e.g., pigz) still rely
>>>> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>>>>
>>>
>>> When building mips:defconfig, this patch results in:
>>>
>>> Building mips:defconfig ... failed
>>> --------------
>>> Error log:
>>> /bin/sh: -n: command not found
>>> make[3]: *** [kernel/config_data.gz] Error 127
>>> make[3]: *** Deleting file 'kernel/config_data.gz'
>>> make[3]: *** Waiting for unfinished jobs....
>>> make[2]: *** [kernel] Error 2
>>> make[2]: *** Waiting for unfinished jobs....
>>> make[1]: *** [autoksyms_recursive] Error 2
>>> make: *** [__sub-make] Error 2
>>>
>>> Reverting this patch fixes the problem. Bisect log is attached.
>>>
>>> Guenter
>>
> 
> I tried to reproduce it with cross-compilation on Fedora32.
> $ export ARCH=mips
> $ export CROSS_COMPILE=mips64-linux-gnu-
> $ make defconfig
> $ make -j12
> 
> And the kernel builds successfully. Could you please provide details about your
> compilation steps and environment, esp. what "env | grep ZIP" shows,
> "gzip --version", "sh --version", "bash --version"? This will be very helpful.
> 
> Additionally:
> $ make GZIP=gzip -j12 # works
> $ make GZIP=pigz -j12 # works
> $ make GZIP=nosuchcommand -j12 # fails, as expected
>  

I use

make -j30 ARCH=mips CROSS_COMPILE=mips64-linux- ...

ie I don't use environment variables. Using environment variables indeed makes
the problem "disappear". Also, it is important to run "make mrproper" first
to ensure that the generated file does not already exist.

make -j30 ARCH=mips CROSS_COMPILE=mips64-linux- GZIP=gzip ...

does not work for me.

Guenter
