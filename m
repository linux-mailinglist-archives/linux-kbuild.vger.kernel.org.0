Return-Path: <linux-kbuild+bounces-7021-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF03AAEECD
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 00:48:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D615C988031
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 22:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC6120CCFB;
	Wed,  7 May 2025 22:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fBKEeWeT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B472616
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 22:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746658113; cv=none; b=d0bwL0YeWiS+JXNOoiqz8bQX+fKTsw4fAwL045mDy7rYxVl3cTdZC2RpZqTG9REBSNmZXkwTul9Afo+P/JsB39bTl7S/wVk4bqjos+/lDketSFfuoAtbSjpRLOSrxjic+m6DQFuanaQ8XOf7dZXfd4Bx/hhf3KSXXcasZ5qut4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746658113; c=relaxed/simple;
	bh=UeN+k4ZyO9Dh4Nb3AcxJ0REtDmmRTFGNUAhRgZfmPmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FmnvZwexq0Thc4fztmuIhFbWy0QAlooXynVaKmJxTsEl5BchmGhmYWMLicVuTqsYPUQAWKzlJU9J2s/hXinNvpUiI/02Rizz9Kir6FNhTNJtMfZgDfef+M4L6Rywkg9gR7Zh746MaoBxvHBrZkZoexQ0JzQqs4gUTTvHasOl04o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fBKEeWeT; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-86192b64d0bso23311239f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 07 May 2025 15:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746658111; x=1747262911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=acGmQM7tifOr8+Eoy2xvyAghcRlqFxatC9kGV77CrC0=;
        b=fBKEeWeT7LAh5q3Hfexz1acUu3KaF8wA+VEz5n4a8OJ1KF1hIU1Y3+xIxwDvyZ8+YU
         orMO0lTWaMNQLDdlTH0sLkzgnoNuQ7uly9Yy68uJdtH5SYnavqhTHi+ZGPOKLcI+M3QK
         sFMXYkciKpq6vNO1SpwLAWr0yDP5sa+6XbNK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746658111; x=1747262911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acGmQM7tifOr8+Eoy2xvyAghcRlqFxatC9kGV77CrC0=;
        b=TBI0J8TBhZ/XIKv+j4gdOWi2MC99A02PMB3QBn9P7BgIU64YNEKQAOakxOngEtVktM
         WT6+m+2kQCAZPnzo9EZaaHFu14RMJCb1qLEoDnbhJytxJAuj8yBjBaAOgBOQwKO6qmmq
         wt1KiPdUXty+vuSquxFFrWQnaVGu9hBA2zrHCcR7xtcyoH4iENBoGl0a9MqZnIPn85cF
         vM7rxTi+R1wiYllX98hQfp7W2Fa08gu3FMzP67lSn6bYLXLGRmjfAzRE317fqy5KhNl/
         cn18Y6JW9RM95Ll9n0UYQQL+BpCIw1vl8sUa879lbhgiZ93sTuihcqRcoPfKQXA5DAkF
         xVVA==
X-Forwarded-Encrypted: i=1; AJvYcCUjhk6MR0AwU/6flH8nWvtk2ClwOdu2IjZncOKy7deh43qcVkCnsn35YMGO5PmZqpc7n2xiE5atL3ZaeAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4OHxi0pjhjdeo0kUnwqumGmgBCxKeaWbbnBIfc/PJQW7++Sr1
	WQ4jMd4WD1ZIM7OJ/NcJdJc8BIVAT14JUZ3QbyMTUjj1ZIgdi0V8Pblucb8Uxck=
X-Gm-Gg: ASbGncsmhrboTcP5go/ZBNlHK6zIVYpHQQKQ6NdQFdHEiEXvBYvJ3KpYhQufLxywCnL
	BC/33qz93MQ/HAteNkbia2MD08eCQCkkUxa36ovm/YQSB4wAfW41NTZRmgH5oYdtt34pkmhphom
	Kq/ENQ5m5j2F4W0uK8PmfrF3aUzQCm3hlkD3nNPvVktV1krkZ9iaYG3iCRF8/hB4b2uc53KhN1u
	+YXXUsmu5UIdaWVAyOaMGQxrnCegr9c5AyYhW96wL4NdwLkgqU4jwEn104/s+dituLsARd57qWV
	X4mWIVE5NKL807WPqZC4MtONPx8JpRESZUjZZ53m+E6NlOUMYBQ=
X-Google-Smtp-Source: AGHT+IEu5aZ8NNHwHrPGNG8KVywgZI2cgKqfKJOrqQm1obC1gOdxK5HIUSdN3QGZNXi+lEbcLcKzDA==
X-Received: by 2002:a05:6602:490:b0:85a:e279:1ed6 with SMTP id ca18e2360f4ac-867473aae44mr662438539f.11.1746658111089;
        Wed, 07 May 2025 15:48:31 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa8ecb9sm2907127173.122.2025.05.07.15.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 15:48:30 -0700 (PDT)
Message-ID: <9458d0d0-3096-4b77-bd20-3c051b082b57@linuxfoundation.org>
Date: Wed, 7 May 2025 16:48:29 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: use ARCH from compile.h in unclean source tree
 msg
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, nathan@kernel.org,
 brendan.higgins@linux.dev, davidgow@google.com, rmoar@google.com,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250502172459.14175-1-skhan@linuxfoundation.org>
 <20250506-accomplished-earthworm-from-valhalla-dbcbcc@l-nschier-aarch64>
 <0d27886e-5a3c-4073-a044-f6684de8333d@linuxfoundation.org>
 <CAK7LNATTE62vNgW5bMhh8rA3=eDO5WoGGvt0N0AkNn3DFGR4bA@mail.gmail.com>
 <e7b517ee-08a3-4bbe-a9c0-497f1469b04e@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <e7b517ee-08a3-4bbe-a9c0-497f1469b04e@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/25 16:21, Shuah Khan wrote:
> On 5/7/25 01:23, Masahiro Yamada wrote:
>> On Wed, May 7, 2025 at 7:07 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>
>>> On 5/6/25 05:12, Nicolas Schier wrote:
>>>> On Fri, 02 May 2025, Shuah Khan wrote:
>>>>
>>>>> When make finds the source tree unclean, it prints a message to run
>>>>> "make ARCH=x86_64 mrproper" message using the ARCH from the command
>>>>> line. The ARCH specified in the command line could be different from
>>>>> the ARCH of the existing build in the source tree.
>>>>>
>>>>> This could cause problems in regular kernel build and kunit workflows.
>>>>>
>>>>> Regular workflow:
>>>>>
>>>>> - Build x86_64 kernel
>>>>>       $ make ARCH=x86_64
>>>>> - Try building another arch kernel out of tree with O=
>>>>>       $ make ARCH=um O=/linux/build
>>>>> - kbuild detects source tree is unclean
>>>>>
>>>>>     ***
>>>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>>>     *** in /linux/linux_srcdir
>>>>>     ***
>>>>>
>>>>> - Clean source tree as suggested by kbuild
>>>>>       $ make ARCH=um mrproper
>>>>> - Source clean appears to be clean, but it leaves behind generated header
>>>>>     files under arch/x86
>>>>>       arch/x86/realmode/rm/pasyms.h
>>>>>
>>>>> A subsequent x86_64e build fails with
>>>>>     "undefined symbol sev_es_trampoline_start referenced ..."
>>>>>
>>>>> kunit workflow runs into this issue:
>>>>>
>>>>> - Build x86_64 kernel
>>>>> - Run kunit tests:  it tries to build for user specified ARCH or uml
>>>>>     as default:
>>>>>       $ ./tools/testing/kunit/kunit.py run
>>>>>
>>>>> - kbuild detects unclean source tree
>>>>>
>>>>>     ***
>>>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>>>     *** in /linux/linux_6.15
>>>>>     ***
>>>>>
>>>>> - Clean source tree as suggested by kbuild
>>>>>       $ make ARCH=um mrproper
>>>>> - Source clean appears to be clean, but it leaves behind generated header
>>>>>     files under arch/x86
>>>>>
>>>>> The problem shows when user tries to run tests on ARCH=x86_64:
>>>>>
>>>>>       $ ./tools/testing/kunit/kunit.py run ARCH=x86_64
>>>>>
>>>>>       "undefined symbol sev_es_trampoline_start referenced ..."
>>>>>
>>>>> Build trips on arch/x86/realmode/rm/pasyms.h left behind by a prior
>>>>> x86_64 build.
>>>>>
>>>>> Problems related to partially cleaned source tree are hard to debug.
>>>>> Change Makefile to unclean source logic to use ARCH from compile.h
>>>>> UTS_MACHINE string. With this change kbuild prints:
>>>>>
>>>>>       $ ./tools/testing/kunit/kunit.py run
>>>>>
>>>>>     ***
>>>>>     *** The source tree is not clean, please run 'make ARCH=x86_64 mrproper'
>>>>>     *** in /linux/linux_6.15
>>>>>     ***
>>>>>
>>>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>>>> ---
>>>>>    Makefile | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/Makefile b/Makefile
>>>>> index 5aa9ee52a765..7ee29136b4da 100644
>>>>> --- a/Makefile
>>>>> +++ b/Makefile
>>>>> @@ -674,7 +674,7 @@ ifeq ($(KBUILD_EXTMOD),)
>>>>>                -d $(srctree)/include/config -o \
>>>>>                -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
>>>
>>> Would it make sense to check for include/generated as a catch all?
>>>
>>>>>               echo >&2 "***"; \
>>>>> -            echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
>>>>> +            echo >&2 "*** The source tree is not clean, please run 'make ARCH=$(shell grep UTS_MACHINE $(srctree)/include/generated/compile.h | cut -d '"' -f 2) mrproper'"; \
>>>>
>>>> Please 'grep' option '-s'.
>>>>
>>>> There are some (rare) occassions, when there is no include/generated/compile.h
>>>> but still the source tree will be considered to be dirty:
>>>
>>> I considered adding a check for not finding include/generated/compile.h
>>> and figured if include/config is found we are probably safe.
>>>
>>> I will fix that.
>>
>>
>> I do not think this patch makes sense.
>>
>> Kbuild correctly detects that "the source tree is not clean enough
>> to build with ARCH=um", and displays the following message:
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>    *** in /linux/linux_srcdir
>>    ***
>>
>> This is absolutely correct.
> 
> It detects it can't build um - but it doesn't detect that the
> source tree is not clean. The problem is once user runs
> 'make ARCH=um mrproper' - these checks will find the source tree
> clean even though it isn't - a subsequent x86_64 build could
> fail.

kbuild can no longer detect that the tree is unclean since
mrproper um deletes files and directories kbuild checks to
determine if the source tree is unclean.

These failures are hard to debug and wastes lot of time.

thanks,
-- Shuah

