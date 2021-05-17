Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD2F38230C
	for <lists+linux-kbuild@lfdr.de>; Mon, 17 May 2021 05:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233477AbhEQDYe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 16 May 2021 23:24:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233328AbhEQDYd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 May 2021 23:24:33 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1814C061573
        for <linux-kbuild@vger.kernel.org>; Sun, 16 May 2021 20:23:17 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id b13so267644pfv.4
        for <linux-kbuild@vger.kernel.org>; Sun, 16 May 2021 20:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=fOR5pnDEPGBJt3faYvRqJP82Hiak0OwwFyZyM93jpF0=;
        b=GulJ6QioiL7oOOn+tAThXcktBX6kWZjGIaP4a41f8XvVqSISg49RV8/LFBF4mZnQp6
         ZZ4Np93/Nnq8Urx9XGPrg86WEUnOGJGvGwHwf1om5bi5VLDXuHTRqtUzvgFrEiwJS7ND
         7HrAIUiHACm277b9Z1AF4uAoVLXHHaz8BFtb88zHeMw+z7GtPJiSHGO74emYZ48QBFMK
         aOdJ5rJJSynvSgsr/7ruh/LXO5xR8jpsG1oQcFY1n/c7q/EY/maMV3F65k4titSAENEs
         cxlY3BABf0vVg845cflGqjUuDbiYhwsi4e1J0lG0H+jM0eCFB2hfdwE1YFLP4HotPMu0
         bY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fOR5pnDEPGBJt3faYvRqJP82Hiak0OwwFyZyM93jpF0=;
        b=fhVQUmWXBbUktN6OIQdkjpSXB1lUeI12r+JsXwsNXTTItgKPpDfyOSCRyKhW4Pjmiw
         WKoXjcyiytbyK8bVCRk+196+DYKqEzR4sWypslr23Tm6ppQHWMFu97IJ8Vt0JJ5s5upB
         1oaK406gCAeYHEFA6ExQKplZr5INJwQXIOZ/dh49Vogcc+bHRcPL6VK1kr/6traL1mNr
         5qzRTSQEIFYN58I//cfSZ6LzlC9Q12mvImc8EuWeo4+lMywHjPSkPIxD1HsbRl0EmiaG
         OtiBfVTj6lI4JVXppiXn/i6SifFDRXtLlAfN0AyeXheKVIBTib8Atfgwk1Vz83iCN8r0
         GQbQ==
X-Gm-Message-State: AOAM532zL/5GOlDxNILb5ABD3LmnPWbBkluxT8YbsjohGzLnFxdBIDC8
        VAqk9NJUDVz3yFWMJuR+sJIaCQ==
X-Google-Smtp-Source: ABdhPJwWnFqJVFQof9/l0qEiWwHso3BEziWmmjX0EDlJSIF69+PivmFZHh/kMI8wS2YVSCMaIC+1yQ==
X-Received: by 2002:a62:8f45:0:b029:28e:a5f2:2f2a with SMTP id n66-20020a628f450000b029028ea5f22f2amr57274586pfd.44.1621221797301;
        Sun, 16 May 2021 20:23:17 -0700 (PDT)
Received: from localhost (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.gmail.com with UTF8SMTPSA id z62sm8585359pfb.110.2021.05.16.20.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 20:23:16 -0700 (PDT)
Message-ID: <f8d64d7d-cd2b-342a-de6a-c14a5df9462c@ozlabs.ru>
Date:   Mon, 17 May 2021 13:23:11 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Content-Language: en-US
To:     Segher Boessenkool <segher@kernel.crashing.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20210513115904.519912-1-aik@ozlabs.ru>
 <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
 <CAK7LNASFhRE=1EBj9AoTMMEd2YJdu7bCxARAGJfZ7aXcBrMAUw@mail.gmail.com>
 <20210514084649.GI10366@gate.crashing.org>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20210514084649.GI10366@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 5/14/21 18:46, Segher Boessenkool wrote:
> Hi!
> 
> On Fri, May 14, 2021 at 11:42:32AM +0900, Masahiro Yamada wrote:
>> In my best guess, the reason why powerpc adding the endian flag to CPP
>> is this line in arch/powerpc/kernel/vdso64/vdso64.lds.S
>>
>> #ifdef __LITTLE_ENDIAN__
>> OUTPUT_FORMAT("elf64-powerpcle", "elf64-powerpcle", "elf64-powerpcle")
>> #else
>> OUTPUT_FORMAT("elf64-powerpc", "elf64-powerpc", "elf64-powerpc")
>> #endif
> 
> Which is equivalent to
> 
> #ifdef __LITTLE_ENDIAN__
> OUTPUT_FORMAT("elf64-powerpcle")
> #else
> OUTPUT_FORMAT("elf64-powerpc")
> #endif
> 
> so please change that at the same time if you touch this :-)

"If you touch this" approach did not work well with this patch so sorry 
but no ;)

and for a separate patch, I'll have to dig since when it is equal, do 
you know?


> 
>> __LITTLE_ENDIAN__  is defined by powerpc gcc and clang.
> 
> This predefined macro is required by the newer ABIs, but all older

That's good so I'll stick to it.

> compilers have it as well.  _LITTLE_ENDIAN is not supported on all
> platforms (but it is if your compiler targets Linux, which you cannot
> necessarily rely on).  These macros are PowerPC-specific.
> 
> For GCC, for all targets, you can say
>    #if __BYTE_ORDER__ == __ORDER_LITTLE_ENDIAN__
> You do not need any of the other *ORDER__ macros in most cases.
> See "info cpp" for the sordid details.
> 
>> [2] powerpc-linux-gnu-gcc + -mlittle-endian    -> __LITTLE_ENDIAN__ is defined
> 
> You can just write -mbig and -mlittle btw.  Those aren't available on
> all targets, but neither are the long-winded -m{big,little}-endian
> option names.  Pet peeve, I know :-)

I am looking the same guarantees across modern enough gcc and clang and 
I am not sure all of the above is valid for clang 10.0.something (or 
whatever we say we support) ;)


-- 
Alexey
