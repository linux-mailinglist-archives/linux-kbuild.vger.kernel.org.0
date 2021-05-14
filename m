Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5600038019A
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 May 2021 03:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbhENB5V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 13 May 2021 21:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232229AbhENB5U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 May 2021 21:57:20 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 123B6C06174A
        for <linux-kbuild@vger.kernel.org>; Thu, 13 May 2021 18:56:09 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id c13so9955977pfv.4
        for <linux-kbuild@vger.kernel.org>; Thu, 13 May 2021 18:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=N2iyxhvY8HuVpNdOOBZq1NpZlD91R7+QI6hopy2Mk2Q=;
        b=19J/++URiFUjrk+oenyeI9BhvaveKztadya3XD5BC77hYM5hbpMflirOKNIy2sii/b
         F/Vkb/wM8+iMN6wp+Cpqs9GegHfoZE9b8o26505w1GIRSRKXOcpinLlMqG566glFgVlQ
         Zp1R8TDxqgl0XivBH79Ta7HmmziBn4LDKyA6ZlIEW7+wmHA6b3DKfj0/QTYETEzBPO14
         mipcigIaXUwjRF6bR9qNJ2XSxvOocPdlhzqguslf/uL19yekWW45GgiX+/BvdZiiCN2c
         5i/HVIX6rNcdwpuVjA4KGRiP/v59y4dsgJaHf+3LBqxSAMoR+Dr9u/h1qaI051dmqZQ4
         gcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=N2iyxhvY8HuVpNdOOBZq1NpZlD91R7+QI6hopy2Mk2Q=;
        b=N0VSRkOoH9KS7PPq4DvuF/NtoE1pNjAwiNA+Azm7BGVE6EPldgot2+uuEvHfKbz7X/
         JzjC+j5Qz2fnpuTpPObOB376DiPOAwhJWIvLNO62ApmSZyzG8PRDL1MyEeaObYj+ZlTs
         XbUq7aqhHvG8GRQUifS2cSHCby5l/9gb6aoQSl3gxl7bn67Bi4CpRjcKjz+/I7a8Er7U
         iAzEPVoXp8Aj5qBWZmXymop5OHMzFDp9OFB15VxHTlqAzc1PbXtynVYvbdb5PV44oI3b
         ijJC/BXt76LF2C2mWRh8g6T4YTGlQRYK02jcdsvQusIdGnxyZfKkMYHTtEM7gqRQg8qG
         HJ0Q==
X-Gm-Message-State: AOAM530n7/nhwip5AXSjPBrFiHsyyFk9AXWFaqmwZj0HVn5NyypYLIRf
        R+EXqHZj/Ia/ulnbo0pRMRjoRQ==
X-Google-Smtp-Source: ABdhPJygIn6W7AEsgikd3SeUywjO8Xv+3iaYAxvfacJmtcfsOeDyomYAg06OosKWdL4GB8DevmhKzw==
X-Received: by 2002:a63:b94b:: with SMTP id v11mr43699851pgo.76.1620957368493;
        Thu, 13 May 2021 18:56:08 -0700 (PDT)
Received: from localhost (ppp121-45-194-51.cbr-trn-nor-bras38.tpg.internode.on.net. [121.45.194.51])
        by smtp.gmail.com with UTF8SMTPSA id w127sm2937460pfw.4.2021.05.13.18.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 18:56:07 -0700 (PDT)
Message-ID: <af1e3d74-a373-09ae-ba61-8db2a906d71a@ozlabs.ru>
Date:   Fri, 14 May 2021 11:56:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: [PATCH kernel v3] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Content-Language: en-US
To:     Nathan Chancellor <nathan@kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Segher Boessenkool <segher@kernel.crashing.org>
References: <20210513115904.519912-1-aik@ozlabs.ru>
 <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
From:   Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <dedc7262-2956-37b2-ebfd-ae8eb9b56716@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 14/05/2021 04:59, Nathan Chancellor wrote:
> On 5/13/2021 4:59 AM, Alexey Kardashevskiy wrote:
>> The $(CPP) (do only preprocessing) macro is already defined in Makefile.
>> However POWERPC redefines it and adds $(KBUILD_CFLAGS) which results
>> in flags duplication. Which is not a big deal by itself except for
>> the flags which depend on other flags and the compiler checks them
>> as it parses the command line.
>>
>> Specifically, scripts/Makefile.build:304 generates ksyms for .S files.
>> If clang+llvm+sanitizer are enabled, this results in
>>
>> -emit-llvm-bc -fno-lto -flto -fvisibility=hidden \
>>   -fsanitize=cfi-mfcall -fno-lto  ...
>>
>> in the clang command line and triggers error:
>>
>> clang-13: error: invalid argument '-fsanitize=cfi-mfcall' only allowed 
>> with '-flto'
>>
>> This removes unnecessary CPP redefinition. Which works fine as in most
>> place KBUILD_CFLAGS is passed to $CPP except
>> arch/powerpc/kernel/vdso64/vdso(32|64).lds. To fix vdso, this does:
>> 1. add -m(big|little)-endian to $CPP
>> 2. add target to $KBUILD_CPPFLAGS as otherwise clang ignores 
>> -m(big|little)-endian if
>> the building platform does not support big endian (such as x86).
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> ---
>> Changes:
>> v3:
>> * moved vdso cleanup in a separate patch
>> * only add target to KBUILD_CPPFLAGS for CLANG
>>
>> v2:
>> * fix KBUILD_CPPFLAGS
>> * add CLANG_FLAGS to CPPFLAGS
>> ---
>>   Makefile              | 1 +
>>   arch/powerpc/Makefile | 3 ++-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 15b6476d0f89..5b545bef7653 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -576,6 +576,7 @@ CC_VERSION_TEXT = $(subst $(pound),,$(shell $(CC) 
>> --version 2>/dev/null | head -
>>   ifneq ($(findstring clang,$(CC_VERSION_TEXT)),)
>>   ifneq ($(CROSS_COMPILE),)
>>   CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>> +KBUILD_CPPFLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
> 
> You can avoid the duplication here by just doing:
> 
> KBUILD_CPPFLAGS    += $(CLANG_FLAGS)

This has potential of duplicating even more flags which is exactly what 
I am trying to avoid here.


> I am still not super happy about the flag duplication but I am not sure 
> I can think of a better solution. If KBUILD_CPPFLAGS are always included 
> when building .o files,


My understanding is that KBUILD_CPPFLAGS should not be added for .o. Who 
does know or decide for sure about what CPPFLAGS are for? :)


> maybe we should just add $(CLANG_FLAGS) to 
> KBUILD_CPPFLAGS instead of KBUILD_CFLAGS?
> 
>>   endif
>>   ifeq ($(LLVM_IAS),1)
>>   CLANG_FLAGS    += -integrated-as
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index 3212d076ac6a..306bfd2797ad 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -76,6 +76,7 @@ endif
>>   ifdef CONFIG_CPU_LITTLE_ENDIAN
>>   KBUILD_CFLAGS    += -mlittle-endian
>> +KBUILD_CPPFLAGS    += -mlittle-endian
>>   KBUILD_LDFLAGS    += -EL
>>   LDEMULATION    := lppc
>>   GNUTARGET    := powerpcle
>> @@ -83,6 +84,7 @@ MULTIPLEWORD    := -mno-multiple
>>   KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-save-toc-indirect)
>>   else
>>   KBUILD_CFLAGS += $(call cc-option,-mbig-endian)
>> +KBUILD_CPPFLAGS += $(call cc-option,-mbig-endian)
>>   KBUILD_LDFLAGS    += -EB
>>   LDEMULATION    := ppc
>>   GNUTARGET    := powerpc
>> @@ -208,7 +210,6 @@ KBUILD_CPPFLAGS    += -I $(srctree)/arch/$(ARCH) 
>> $(asinstr)
>>   KBUILD_AFLAGS    += $(AFLAGS-y)
>>   KBUILD_CFLAGS    += $(call cc-option,-msoft-float)
>>   KBUILD_CFLAGS    += -pipe $(CFLAGS-y)
>> -CPP        = $(CC) -E $(KBUILD_CFLAGS)
>>   CHECKFLAGS    += -m$(BITS) -D__powerpc__ -D__powerpc$(BITS)__
>>   ifdef CONFIG_CPU_BIG_ENDIAN
>>
> 

-- 
Alexey
