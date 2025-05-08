Return-Path: <linux-kbuild+bounces-7049-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5D7AB05E1
	for <lists+linux-kbuild@lfdr.de>; Fri,  9 May 2025 00:15:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7CD797AB392
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 May 2025 22:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF40D227B8E;
	Thu,  8 May 2025 22:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J1ymQxiY"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CBC224AFE
	for <linux-kbuild@vger.kernel.org>; Thu,  8 May 2025 22:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746742486; cv=none; b=DVOlRaj48VXyTAV+POydiLO9KditsPxlfwbAgB5MlXmhoDfn9BapUmOAY30N5fN2SwP4h3/OdfiXybJcv+o6rzHvV58A3KqAQIk6Omg2oTiDYbg1R9/IGBZ0O7rqKjIXL2N88DeRqepc4qKoV/gRFbH6UU4s1gcj3e7UCNmCe4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746742486; c=relaxed/simple;
	bh=oQhDfKn0pMpd3jEaJ5ukmAhurZ7x+QJ/lmdMNdMwE2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NIw26S448Ie57C0YqqVVODPBQOVaFoa3A7PfYIav3HeJv/K7i9snh28y7205ixa9Pr7YymWdAeWJRa7MXrxIt/mLQ3PeKGCaMGoeJUIF0Cv8bkJC25uxUVB4i4AngCF9mubuCmkgbmAbPA/zE9gcQuuBATxHSly1MmnmL4A9YYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=J1ymQxiY; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86135ac9542so60323439f.1
        for <linux-kbuild@vger.kernel.org>; Thu, 08 May 2025 15:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746742483; x=1747347283; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9CK1elPKWXClSLPdRPqW5P03MZNYsbIZRsBDl9jKU4I=;
        b=J1ymQxiY/w1ewYwN/07QPFeUtNMbMZfNC1cym//JUkwdy774nrgj5V7IvLoj6MKgvR
         iTDaBoDAF1PO8M2qXz0nHUAhzf5jfG0VXShJMVwxhJGnFVv5fDji+kA1KUIqXNSPy9Zx
         vw+ZGwdvOpNk2+4uHsTKLMdU0mmQ0UEzVX0vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746742483; x=1747347283;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9CK1elPKWXClSLPdRPqW5P03MZNYsbIZRsBDl9jKU4I=;
        b=AHGlcCatUwDJPq4q7EFXCcPBvZBg9jlHw/RfxPULK6gmybZxFWAoocD/JXVWRZ+qEp
         sZR6NWnzlnUOjMexexG6vYkzYCPxTVknyoUaWmy6EjdqFkE7eYSotsfRkByIkojXTTqW
         WPL4ZLPxu/sz6S9KhZDxQGEz2tHf08lwI7owbFk1I22GPeqaq5C3cOfasqM8OAyyNxfv
         f5uo5HSgTInTyoV6tWjs2pRDpiHXAJ9qcaWDve24KjgdTeYggYrc9AofJExa+/mkbgyV
         JdpJ1t1VI52ybmzF8fPldcknH/Rbts7M1f4asEqLQUSRdJRwiBiwY/uYP4Qc+HvGZ7xv
         Y42Q==
X-Gm-Message-State: AOJu0Yz5IOC145hVziSIjlEOEjLqWcISkb+mo3ToCmJGBdleetkZuojt
	kysdGXIYljwn4LCrVtZguSbbT3n9vjN8bsZGAC+oyz7qcFTf0xCpKFU18RqOt4w=
X-Gm-Gg: ASbGncuWAS2z2BaoPwEuNgEi8D1nE8OLLVn009e9UQn/Uoo2CilOIc2xuwmfucHg2d/
	6UijYz1ZGWmTdI74P53o4AyPB02s9cT6CGQIINbj26hugD6TM/8Ye6tr5E9o6oG3/qhePI79USn
	KZXoy7gs4lGHtIpqXDKTcanKXljBFYTxbO0a6UaAcWkjyDQkA2v4sRSCmXDNBTbMp0xMZXRJDP2
	jeGzHrir1Hz84+4VYAF+mowNGkEb1Q5Pnk7AgPNWkGeVADD0aZXhvdUDUYtgso+s7e2gPA61PqL
	Ssi8O4Krq5VeLCubDoR1eanasF4Ph4fbNIeKOjmDmiQfusXnLNs=
X-Google-Smtp-Source: AGHT+IH5MQwed+065d9LOVuxEKO6ubkA9Ob6pEePe9HD+g9AN4JF3g2On82Lij+nTEGd4vyd0n7qaQ==
X-Received: by 2002:a05:6602:1401:b0:867:c17:a6ff with SMTP id ca18e2360f4ac-86764496f6fmr113977539f.8.1746742483142;
        Thu, 08 May 2025 15:14:43 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-867636e0efdsm15990639f.29.2025.05.08.15.14.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 15:14:42 -0700 (PDT)
Message-ID: <a4558815-f400-41c9-973d-90680ceb3ede@linuxfoundation.org>
Date: Thu, 8 May 2025 16:14:41 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] um: let 'make clean' properly clean underlying SUBARCH as
 well
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Richard Weinberger <richard@nod.at>, linux-um@lists.infradead.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>
References: <20250507074936.486648-1-masahiroy@kernel.org>
 <9ec50ce0-f60b-4d87-bc44-adaf2a1a97a1@linuxfoundation.org>
 <CAK7LNARF=ANEEeENSwcWeayympi6Svci+ScWGpWQimyWm8xUzA@mail.gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <CAK7LNARF=ANEEeENSwcWeayympi6Svci+ScWGpWQimyWm8xUzA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/7/25 17:49, Masahiro Yamada wrote:
> On Thu, May 8, 2025 at 6:38 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>>
>> On 5/7/25 01:49, Masahiro Yamada wrote:
>>> Building the kernel with O= is affected by stale in-tree build artifacts.
>>>
>>> So, if the source tree is not clean, Kbuild displays the following:
>>>
>>>     $ make ARCH=um O=build defconfig
>>>     make[1]: Entering directory '/.../linux/build'
>>>     ***
>>>     *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>     *** in /.../linux
>>>     ***
>>>     make[2]: *** [/.../linux/Makefile:673: outputmakefile] Error 1
>>>     make[1]: *** [/.../linux/Makefile:248: __sub-make] Error 2
>>>     make[1]: Leaving directory '/.../linux/build'
>>>     make: *** [Makefile:248: __sub-make] Error 2
>>>
>>> Usually, running 'make mrproper' is sufficient for cleaning the source
>>> tree for out-of-tree builds.
>>>
>>> However, building UML generates build artifacts not only in arch/um/,
>>> but also in the SUBARCH directory (i.e., arch/x86/). If in-tree stale
>>> files remain under arch/x86/, Kbuild will reuse them instead of creating
>>> new ones under the specified build directory.
>>>
>>> This commit makes 'make ARCH=um clean' recurse into the SUBARCH directory.
>>>
>>> Reported-by: Shuah Khan <skhan@linuxfoundation.org>
>>> Closes: https://lore.kernel.org/lkml/20250502172459.14175-1-skhan@linuxfoundation.org/
>>> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
>>
>> It doesn't solve the problem. I still see arch/x86/realmode/rm/pasyms.h
>> after running make ARCH=um mrproper
> 
> 
> Why not?
> 
> This patch allows 'make ARCH=um mrproper'
> to clean up both arch/um and arch/x86/.
> 
> It is really simple to test the behavior.
> 
> 
> [Without this patch]
> 
> masahiro@zoe:~/workspace/linux-kbuild(master)$ touch
> arch/x86/realmode/rm/pasyms.h
> masahiro@zoe:~/workspace/linux-kbuild(master)$ make ARCH=um mrproper
> masahiro@zoe:~/workspace/linux-kbuild(master)$ ls arch/x86/realmode/rm/pasyms.h
> arch/x86/realmode/rm/pasyms.h
> 
> [With this patch]
> 
> masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ touch
> arch/x86/realmode/rm/pasyms.h
> masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ make ARCH=um mrproper
>    CLEAN   arch/x86/realmode/rm
> masahiro@zoe:~/workspace/linux-kbuild(kbuild)$ ls arch/x86/realmode/rm/pasyms.h
> ls: cannot access 'arch/x86/realmode/rm/pasyms.h': No such file or directory
> 

I ran another controlled test starting from a totally clean repo
and the building - looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


