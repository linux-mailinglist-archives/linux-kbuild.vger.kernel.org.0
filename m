Return-Path: <linux-kbuild+bounces-6980-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E625AAD238
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 02:21:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4245B7BBCB7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 00:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FBEFC0E;
	Wed,  7 May 2025 00:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AfZ0be1b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F2C10E9
	for <linux-kbuild@vger.kernel.org>; Wed,  7 May 2025 00:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577259; cv=none; b=uAbsv5FeIdXAYLYbNZV7BLKWnvNBwDlGMlofsoO/wfKT2Mq/vLmb6I7U+ZsdoTVMOv2Sh5KZlskuUliQBGn6hao+AHse+kAsuQKeBApZlPCWzkOFuDTKE1NhFNwWZNtwKxCPVgKlNGaKfhUOGK2qQX5tJ6ghUlOCe6023AbMiuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577259; c=relaxed/simple;
	bh=G6gAUQycut/T+2CZirkREPT2GpqAeWue10g5qr+MmfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WjyIp8fQRrhAggcE836OSkFACYg9tibqt6png2+Gx7FLM4zUpT+8Mno2TM1zQIplsHGcm2p1+8bndVHfL0YjP7DJviHBiDjBptBV0N1NusxC/OTr4vg/9k4TfqTpKDqGMCIXNePTv7hlJNAfBoRXr4+RCKlL/EEpSFBRkD7erQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AfZ0be1b; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso254198339f.1
        for <linux-kbuild@vger.kernel.org>; Tue, 06 May 2025 17:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746577255; x=1747182055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1p8Te43sC4t3hJ6UV6SjoKwR9VsORN78Fe3DTZ7doec=;
        b=AfZ0be1b3f0c5zh2unFqt/5r7cnMgAAfgOmX8lZ2899bwjGn2kiUdk2iO9Gm1kx8Nl
         BEdowkBDFRc3nB64KpTvLCQtvhxjtoP0gs39Z4APwzr+lWkT7mvh6c/W/ikc4jDegDA8
         XMgczl+WWxNj0rZUecLnR7Oaok7KRIb72p8hY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746577255; x=1747182055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1p8Te43sC4t3hJ6UV6SjoKwR9VsORN78Fe3DTZ7doec=;
        b=RZFz8C0Io5P5/yOyNz+0itfWiZAcCr3PJZ/Eh0IpwWFarW4UBFrXR7TqjXLscHz8KQ
         ZG/b/rN1I4oLWxj7m5TGTWMZiHWDIu5QBl1JeZqw21XzG0mM2FLy0jtxIKAL6u7bk+pz
         CzlEZNWPNRAiPRn/H/Aq8t8YP6hcwoPqAe158Jos5G+UHpDEV2qVWhX6pMotkEsYTl86
         L988YibOcAeOHuOdRa6y52SkDzVzRnuAkNpFb549ApWWDceU69PitpQRncTXRyRpmLe3
         ANkhu2rPjni8OcHdEUI632BbRW4io7Sf+aYKi1/XTSTPngPCtZb6jXLBxqOpzLYM390e
         E6dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT5BVV08Vk21eox9PxMVgZgHpXadC6p+hH2eLLEi/1yD9PAC5/F8OThG7LhWegDNHIcF2HNCchK1EUGR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJgQXQ7htr2rxTHRJ53E//D63vcWj9O64TgdCCIPjKjw0a5lY
	XllObdbxCW0qypWTMIkU/rrWpzwQoRJ3/LbPzaMeG+28jkMvs/eJ3ps2tlgdrgg=
X-Gm-Gg: ASbGnctPcXCKxn2ziJy4nPVtb0wgus+C1OaxoDvHo8yw1GMmEx8M/PcbgfbMYm00qsO
	Qkj8BWtasJXnw31MX0tYEGYo3xDIVyrWFcMsH4dD1t8KcJo7x3R6UA7zOUyhxePUGfwMPPkaG6a
	um2q1VOcBoj6dcGZubtS005UnxCShqJmd6zQLUCRqej68+8Jrn+Oc/x5yV6W6eqVMtO6UIfc9m8
	Q/op/SNdvf7vjppBDDPoG8ItiHBkXtEZ224M6q0/J4dMo3Vk5QT/ws7iUJtClTZtV5HLb+A5WRh
	j/EnuGmqcCH7apYLdbznw7FmFjrMWR/Y5dhZXgXrcYJENYWiqGU=
X-Google-Smtp-Source: AGHT+IH7QbHC9bqwsqypvxUzmNSPFB9WbqLDm+bCP/SWmCn31scTykEeIuT9VsesmC58fV0f4we/7Q==
X-Received: by 2002:a05:6602:490:b0:862:ba37:eb0e with SMTP id ca18e2360f4ac-867473b0b2emr213153439f.12.1746577255116;
        Tue, 06 May 2025 17:20:55 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88a8cfb51sm2461914173.3.2025.05.06.17.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 17:20:54 -0700 (PDT)
Message-ID: <37234cf8-ac79-45b8-9bcf-dcf4792b9877@linuxfoundation.org>
Date: Tue, 6 May 2025 18:20:53 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: use ARCH from compile.h in unclean source tree
 msg
To: Nicolas Schier <nicolas.schier@linux.dev>
Cc: masahiroy@kernel.org, nathan@kernel.org, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, kunit-dev@googlegroups.com,
 linux-kselftest@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250502172459.14175-1-skhan@linuxfoundation.org>
 <20250506-accomplished-earthworm-from-valhalla-dbcbcc@l-nschier-aarch64>
 <0d27886e-5a3c-4073-a044-f6684de8333d@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <0d27886e-5a3c-4073-a044-f6684de8333d@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/6/25 16:07, Shuah Khan wrote:
> On 5/6/25 05:12, Nicolas Schier wrote:
>> On Fri, 02 May 2025, Shuah Khan wrote:
>>
>>> When make finds the source tree unclean, it prints a message to run
>>> "make ARCH=x86_64 mrproper" message using the ARCH from the command
>>> line. The ARCH specified in the command line could be different from
>>> the ARCH of the existing build in the source tree.
>>>
>>> This could cause problems in regular kernel build and kunit workflows.
>>>
>>> Regular workflow:
>>>
>>> - Build x86_64 kernel
>>>     $ make ARCH=x86_64
>>> - Try building another arch kernel out of tree with O=
>>>     $ make ARCH=um O=/linux/build
>>> - kbuild detects source tree is unclean
>>>
>>>    ***
>>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>    *** in /linux/linux_srcdir
>>>    ***
>>>
>>> - Clean source tree as suggested by kbuild
>>>     $ make ARCH=um mrproper
>>> - Source clean appears to be clean, but it leaves behind generated header
>>>    files under arch/x86
>>>       arch/x86/realmode/rm/pasyms.h
>>>
>>> A subsequent x86_64e build fails with
>>>    "undefined symbol sev_es_trampoline_start referenced ..."
>>>
>>> kunit workflow runs into this issue:
>>>
>>> - Build x86_64 kernel
>>> - Run kunit tests:  it tries to build for user specified ARCH or uml
>>>    as default:
>>>     $ ./tools/testing/kunit/kunit.py run
>>>
>>> - kbuild detects unclean source tree
>>>
>>>    ***
>>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>>    *** in /linux/linux_6.15
>>>    ***
>>>
>>> - Clean source tree as suggested by kbuild
>>>     $ make ARCH=um mrproper
>>> - Source clean appears to be clean, but it leaves behind generated header
>>>    files under arch/x86
>>>
>>> The problem shows when user tries to run tests on ARCH=x86_64:
>>>
>>>     $ ./tools/testing/kunit/kunit.py run ARCH=x86_64
>>>
>>>     "undefined symbol sev_es_trampoline_start referenced ..."
>>>
>>> Build trips on arch/x86/realmode/rm/pasyms.h left behind by a prior
>>> x86_64 build.
>>>
>>> Problems related to partially cleaned source tree are hard to debug.
>>> Change Makefile to unclean source logic to use ARCH from compile.h
>>> UTS_MACHINE string. With this change kbuild prints:
>>>
>>>     $ ./tools/testing/kunit/kunit.py run
>>>
>>>    ***
>>>    *** The source tree is not clean, please run 'make ARCH=x86_64 mrproper'
>>>    *** in /linux/linux_6.15
>>>    ***
>>>
>>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>>> ---
>>>   Makefile | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 5aa9ee52a765..7ee29136b4da 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -674,7 +674,7 @@ ifeq ($(KBUILD_EXTMOD),)
>>>            -d $(srctree)/include/config -o \
>>>            -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \
> 
> Would it make sense to check for include/generated as a catch all?

Adding check is good, but it won't cover the compile.h missing. I don't
know if compile.h could go missing if include/generated exists. In any
case, it is good to check for compile exists or not and print appropriate
message for these cases.

I have the change working. Will send it out. Thanks for the tip on
the (rare) cases.

thanks,
-- Shuah

