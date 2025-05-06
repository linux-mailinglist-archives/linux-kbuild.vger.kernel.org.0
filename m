Return-Path: <linux-kbuild+bounces-6979-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E342AAD0C7
	for <lists+linux-kbuild@lfdr.de>; Wed,  7 May 2025 00:07:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FFE21B6890F
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 22:07:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B05721578D;
	Tue,  6 May 2025 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SiJPQmub"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B82F1547CC
	for <linux-kbuild@vger.kernel.org>; Tue,  6 May 2025 22:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746569261; cv=none; b=VyjKWFBId3VEkz4lMAZrRyAyVprVYtkb7zSIWOebsgeBBzqv8NBwhl1KiZEW7iLuhr3GYi4eVCnoP7dVuQYIRRF5ooRg1EgTStK3D0y6PmnNgFMuiZiz4YB81suGUcLccvUabDaAQg7QNESbwbBoviarKw2S2qH5alV1XHqUUng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746569261; c=relaxed/simple;
	bh=QjE1nlrSZya14I8EJupdzC/BpPZW2TwLrhAF+5ao5JE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HhECSB8zc5A91ou2NPwGE0dz+8auiAweZ5GYvgosmsJSEsRmOy0G9lA2aLNX5xZiXOWCKASNuB/qeZ1K0TZc73uPYxtapqQRqAz5qkhvUriRhG6MthIEnWR9ThY1md34p8ZuPZdTUN0i+aQrlDN2gWq22D1yS2azUvYfEV8bQaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SiJPQmub; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3d812103686so1350745ab.0
        for <linux-kbuild@vger.kernel.org>; Tue, 06 May 2025 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1746569258; x=1747174058; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KblXo4CIEIn6gd3GGRAaOBy56G3y46NU1/f1UBl2plY=;
        b=SiJPQmubE4+VnCI0oHshxd9zl9kMVL1rucKYnk44P3PKxL6NBaz7IfC+bNO7NOP7Mm
         rvOzzwsIvhQ8ej8Cf9ve/O+J3kaD9JSxYvZsfzoQMszZj6QrV07a8n2+VfmaOIDeg1cx
         l2EAh+Pvd3u5WNuj5+DLKZXnZLwUp2OSEmUXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746569258; x=1747174058;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KblXo4CIEIn6gd3GGRAaOBy56G3y46NU1/f1UBl2plY=;
        b=GRz0Pp4WUms+IJhGynGjRsENhMr5FRRVPWLJqtWZOiLuETGqtQAuWam9i2zIDLBw3w
         HpaZg18UyDth2ZCug53qg6QrAcb67NUiKFkWViRdArOqvi7kBFJwhZnV7Q9r6QmbUXV8
         y8xY/xhHasFwkRc//iN3YsrdKOV4RzOf/0fJHCyztU3sK2JsamNkIMs4xv3JymP1jwT2
         50wxZ3VLBfKOOLg39iec8uqzE376oQABmPK8l9UQXFyGyDru5AtYnJUkwH+7RYzcm6cc
         PRGWdS2zY1JPDXg2PfprL99Xs6D0oKk+Nd5NR7XuArYe+fYXeoanNKaB6p0q/mw9/u3j
         /18A==
X-Forwarded-Encrypted: i=1; AJvYcCWXuU4pyIsKlNyS6wweWb8d5TTYbMNVLoI42Ng8N1io/bRBfMglgfBG+PrF4RzZcarMuowctQHg4eqmjng=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLbkD9ZghUhawklHZsKdbASJRwBkkACCNI+OTwMlIN9jSdH4O
	55MIAA4vYDfMBpcKALLK8K658WkpT8kzWeLkZSJ52SMgI5ffIxmuZtwwygEDHbw=
X-Gm-Gg: ASbGncsTD27iINTOPHFHGl9/XNf0f7VKPwrmmyGXLcWrcya885gfNk0xKpVXNQ3NybJ
	15X2g1npI09vaB3sjE4WsFy0+ttqaZEJHOczKtPOcN/otWdzrDnymKewFNgcXcEV79Kuu0BpYc7
	ZOcj0UAJ4kgTDl38cx9QASRj9h1RynPDujg+51nRPBaRPT5IOgqsvfEwTSbK1MCJ7lNI+78Eigj
	Qqw4oagice/QjlI8iGfXQCKMrapVIysIIZPkwjgFHCc94OZPac7htSy0kfuT2m7aKyFXScdsOOB
	Cb0WKHaNIc85zWAppAmiVZ50VYDHimsq5pRtRuQ9ptg8mwur2gU=
X-Google-Smtp-Source: AGHT+IGefz039PqNhxopulHgibNakcS2hQwx2wuEu+yzw8CisJq34UbImELUvr3RlJI24jHT18c8yw==
X-Received: by 2002:a05:6e02:180b:b0:3d9:6e2d:c7fd with SMTP id e9e14a558f8ab-3da738b974dmr10086125ab.2.1746569258415;
        Tue, 06 May 2025 15:07:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d975f58866sm26961125ab.50.2025.05.06.15.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 15:07:37 -0700 (PDT)
Message-ID: <0d27886e-5a3c-4073-a044-f6684de8333d@linuxfoundation.org>
Date: Tue, 6 May 2025 16:07:36 -0600
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
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250506-accomplished-earthworm-from-valhalla-dbcbcc@l-nschier-aarch64>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/6/25 05:12, Nicolas Schier wrote:
> On Fri, 02 May 2025, Shuah Khan wrote:
> 
>> When make finds the source tree unclean, it prints a message to run
>> "make ARCH=x86_64 mrproper" message using the ARCH from the command
>> line. The ARCH specified in the command line could be different from
>> the ARCH of the existing build in the source tree.
>>
>> This could cause problems in regular kernel build and kunit workflows.
>>
>> Regular workflow:
>>
>> - Build x86_64 kernel
>> 	$ make ARCH=x86_64
>> - Try building another arch kernel out of tree with O=
>> 	$ make ARCH=um O=/linux/build
>> - kbuild detects source tree is unclean
>>
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>    *** in /linux/linux_srcdir
>>    ***
>>
>> - Clean source tree as suggested by kbuild
>> 	$ make ARCH=um mrproper
>> - Source clean appears to be clean, but it leaves behind generated header
>>    files under arch/x86
>>   	arch/x86/realmode/rm/pasyms.h
>>
>> A subsequent x86_64e build fails with
>>    "undefined symbol sev_es_trampoline_start referenced ..."
>>
>> kunit workflow runs into this issue:
>>
>> - Build x86_64 kernel
>> - Run kunit tests:  it tries to build for user specified ARCH or uml
>>    as default:
>> 	$ ./tools/testing/kunit/kunit.py run
>>
>> - kbuild detects unclean source tree
>>
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=um mrproper'
>>    *** in /linux/linux_6.15
>>    ***
>>
>> - Clean source tree as suggested by kbuild
>> 	$ make ARCH=um mrproper
>> - Source clean appears to be clean, but it leaves behind generated header
>>    files under arch/x86
>>
>> The problem shows when user tries to run tests on ARCH=x86_64:
>>
>> 	$ ./tools/testing/kunit/kunit.py run ARCH=x86_64
>>
>> 	"undefined symbol sev_es_trampoline_start referenced ..."
>>
>> Build trips on arch/x86/realmode/rm/pasyms.h left behind by a prior
>> x86_64 build.
>>
>> Problems related to partially cleaned source tree are hard to debug.
>> Change Makefile to unclean source logic to use ARCH from compile.h
>> UTS_MACHINE string. With this change kbuild prints:
>>
>> 	$ ./tools/testing/kunit/kunit.py run
>>
>>    ***
>>    *** The source tree is not clean, please run 'make ARCH=x86_64 mrproper'
>>    *** in /linux/linux_6.15
>>    ***
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   Makefile | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 5aa9ee52a765..7ee29136b4da 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -674,7 +674,7 @@ ifeq ($(KBUILD_EXTMOD),)
>>   		 -d $(srctree)/include/config -o \
>>   		 -d $(srctree)/arch/$(SRCARCH)/include/generated ]; then \

Would it make sense to check for include/generated as a catch all?

>>   		echo >&2 "***"; \
>> -		echo >&2 "*** The source tree is not clean, please run 'make$(if $(findstring command line, $(origin ARCH)), ARCH=$(ARCH)) mrproper'"; \
>> +		echo >&2 "*** The source tree is not clean, please run 'make ARCH=$(shell grep UTS_MACHINE $(srctree)/include/generated/compile.h | cut -d '"' -f 2) mrproper'"; \
> 
> Please 'grep' option '-s'.
> 
> There are some (rare) occassions, when there is no include/generated/compile.h
> but still the source tree will be considered to be dirty:

I considered adding a check for not finding include/generated/compile.h
and figured if include/config is found we are probably safe.

I will fix that.

> 
>      grep: ../include/generated/compile.h: No such file or directory
>      ***
>      *** The source tree is not clean, please run 'make ARCH= mrproper'
>      ...
> 

thanks,
-- Shuah

