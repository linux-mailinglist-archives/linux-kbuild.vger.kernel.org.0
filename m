Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CEF3FCDFF
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 22:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240895AbhHaTly (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 15:41:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234715AbhHaTly (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 15:41:54 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3C87C061575;
        Tue, 31 Aug 2021 12:40:58 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id bi4so583476oib.9;
        Tue, 31 Aug 2021 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qvcMN2KJSm0Glt1zzqTqjBfpcMvYb7sh/Q3A1fId/Sg=;
        b=mDsk+f1Jh4vsinPzAnJYQRS3gF+NGP+rXi9V9oBu196jJgewBPFew4x0BUjtRlIWix
         /jy5SRODQpn1vCaYZ7m0G1UOFDsnOl7G9AvFE5GhobEafRlv6YpS8wxELkutZ8myZN0+
         0+PLmkwpdKiZmMeKORJIcgUxH/GC0gSQW+/khvjv6/S/Ck2gr1fNc2tU728Tq9TxiL6K
         1rKgZ0qntTG5V2uqx+PP3JJassFTbDCjvfFepVScwbQHnu9nvz7TqqRvH2doj4dPlNR6
         INe2dRk5OtBmRKiOxOAq8YBT51bGgck/x+zLBlOu0T+j6D23dV6i/0BVnjvzBeSto/lY
         BBRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qvcMN2KJSm0Glt1zzqTqjBfpcMvYb7sh/Q3A1fId/Sg=;
        b=H7h+psE/Jwn09PhUGJqvkGU9ks+I0C1e9V6s4G3j074k10HWi4mueUM3eHuXCO1but
         EDTqBeef1y2Zu5dQ8oujDDFUxa7HA/Wnq+aSM6VINyfAbOwN4nrbL0jKqv2Mx++9nFw3
         AKFbb4upjFPJWKjoyn3kzZUepZ+2TPzQ7JdTY1y294gweUyx6GeWpSG1/ihkfEzHL4SO
         FaBTZ/ujGBtJS+8nU/+CzUcbb4FEhRMKa0BsAOCWSpgvgLb0VY+9tQMGAW8gVUMewtHu
         y869/x2JD/Lt8/b8kNBzFVDDWzwVjbSRAr2MKDBbIdhwQdLtToTQ7mo+b12dU1xMDUC/
         Zhug==
X-Gm-Message-State: AOAM531Iyhyy/s+JuITvv132vg/oE4+9sEdtf1eJFleDQmiW1qk3rHx2
        2zgEOcI634gyK/H+H/Ox3b+mQap/TCM=
X-Google-Smtp-Source: ABdhPJyt0s9o4xD8EnlOeHifb9h2/4DMioCjspclUT6SyLK0KtuFtwo9PQRNcgs7eo1NbJUPtARakQ==
X-Received: by 2002:aca:e10b:: with SMTP id y11mr4436924oig.172.1630438857917;
        Tue, 31 Aug 2021 12:40:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y24sm4191795oto.40.2021.08.31.12.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Aug 2021 12:40:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Keith Packard <keithp@keithp.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        clang-built-linux@googlegroups.com, linux-hardening@vger.kernel.org
References: <20210827163015.3141722-1-keescook@chromium.org>
 <20210827163015.3141722-5-keescook@chromium.org>
 <20210831043128.GA2749311@roeck-us.net> <202108311042.FFE1818D@keescook>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v3 4/5] Makefile: Enable -Warray-bounds
Message-ID: <3ab153ec-2798-da4c-f7b1-81b0ac8b0c5b@roeck-us.net>
Date:   Tue, 31 Aug 2021 12:40:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108311042.FFE1818D@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Kees,

On 8/31/21 10:46 AM, Kees Cook wrote:
> On Mon, Aug 30, 2021 at 09:31:28PM -0700, Guenter Roeck wrote:
>> On Fri, Aug 27, 2021 at 09:30:14AM -0700, Kees Cook wrote:
>>> With the recent fixes for flexible arrays and expanded FORTIFY_SOURCE
>>> coverage, it is now possible to enable -Warray-bounds. Since both
>>> GCC and Clang include -Warray-bounds in -Wall, we just need to stop
>>> disabling it.
>>>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Cc: Masahiro Yamada <masahiroy@kernel.org>
>>> Cc: linux-kbuild@vger.kernel.org
>>> Co-developed-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
>>> Signed-off-by: Kees Cook <keescook@chromium.org>
>>> ---
>>>   Makefile | 1 -
>>>   1 file changed, 1 deletion(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index e4f5895badb5..8e7e73a642e2 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -995,7 +995,6 @@ KBUILD_CFLAGS += $(call cc-disable-warning, stringop-truncation)
>>>   
>>>   # We'll want to enable this eventually, but it's not going away for 5.7 at least
>>>   KBUILD_CFLAGS += $(call cc-disable-warning, zero-length-bounds)
>>> -KBUILD_CFLAGS += $(call cc-disable-warning, array-bounds)
>>>   KBUILD_CFLAGS += $(call cc-disable-warning, stringop-overflow)
>>>   
>>
>> This patch causes 'alpha' builds to fail when trying to build an image with
>> gcc 11.2.
>>
>> In file included from include/linux/string.h:20,
>>                   from include/linux/bitmap.h:11,
>>                   from include/linux/cpumask.h:12,
>>                   from include/linux/smp.h:13,
>>                   from include/linux/lockdep.h:14,
>>                   from include/linux/spinlock.h:63,
>>                   from include/linux/mmzone.h:8,
>>                   from include/linux/gfp.h:6,
>>                   from include/linux/mm.h:10,
>>                   from include/linux/pagemap.h:8,
>>                   from arch/alpha/mm/init.c:10:
>> In function '__memset',
>>      inlined from '__bad_pagetable' at arch/alpha/mm/init.c:79:2:
>> arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>>     37 |                         return __builtin_memset(s, c, n);
>>        |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
>> In function '__memset',
>>      inlined from '__bad_page' at arch/alpha/mm/init.c:86:2:
>> arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>>     37 |                         return __builtin_memset(s, c, n);
>>        |                                ^~~~~~~~~~~~~~~~~~~~~~~~~
>> In function '__memset',
>>      inlined from 'paging_init' at arch/alpha/mm/init.c:256:2:
>> arch/alpha/include/asm/string.h:37:32: error: '__builtin_memset' offset [0, 8191] is out of the bounds [0, 0] [-Werror=array-bounds]
>>     37 |                         return __builtin_memset(s, c, n);
>>
>> Seen in next-20210830.
> 
> Ah-ha, thanks for the report! I didn't see this in my builds -- what
> config target did you use for this?
> 

The configuration doesn't matter; it fails for me for all configurations,
including defconfig, alllnoconfig, and allmodconfig.
Key is to use gcc 11.2. The image builds just fine with gcc 9.4 and 10.3.

Guenter
