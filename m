Return-Path: <linux-kbuild+bounces-2273-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FB591B05B
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 22:28:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E80871C216FB
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Jun 2024 20:28:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B7619DF60;
	Thu, 27 Jun 2024 20:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6++9WqG"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4A419D075;
	Thu, 27 Jun 2024 20:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719520111; cv=none; b=LTlFOVLD6Zzopyai0hizJogM+sVgUgw03Wr1u0dn835+Ps9FTFbA6qZHAIxuQWzfyqEWkwGn0oJ7Jr0fxWXv+SAbUdPrvog+7nOr3B1/mkV19phB8tX+2nL5aFVjZ0EkHcs0rLxyGgXmLGmxLGooUeuJHFHVzGXx1SgmFlQiZP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719520111; c=relaxed/simple;
	bh=S+R2QX1tilrg+RUQU/FDNC4IW7DgRfKoA2nt5gdfKV0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yqa/6SBO7wy6B6C1AT14SuFnHyrY/Apl+1VVpNkYN8KgvNIN35552iw2JkW1vAejI09eGERo893691GJvmjiEZkfvQYaHXbZXpYeuY2wLiHhrpXdh8Z94ljVd0wZwPwm/c22e/3Hl4flhmecw7r8ttxHJWeV6iSrP5GNvknj3Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6++9WqG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a72477a60fbso672090566b.2;
        Thu, 27 Jun 2024 13:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719520108; x=1720124908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kr/vl3elJzQreDFa3wev9iqnm3TAjcOzYlf7kMOiaWE=;
        b=F6++9WqGNhlHW16i+1Ewk7P/ensUSKeRjnyUaQJ5fIavpZLta56pYD3I8x14z9ExiP
         kJWL6JXMKa5Hco8NFnn+iaU3L0ZlsjS9WhbCtVEmTUylD4kkLVHx7AjkXPNkutokFOCz
         us77NCn/Ho5S+ZewhObVVGTsoQFW4TnglMxlz0LMV0Z9zA2h+N71oqzTANyrJVSLcqLl
         hb1hC5TNoWsgE0poQG7dL7oSWdn3njlr9tR4aqoPIxvlXKdQtmjs6zfJNgPunm9RvkAH
         wSkExzl37ZlTNdymVRF/3yg+MXtsQCN4Fu30PaqTWGUmEOR1Xupvn8R+Do/ZkM2uBnZY
         oehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719520108; x=1720124908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kr/vl3elJzQreDFa3wev9iqnm3TAjcOzYlf7kMOiaWE=;
        b=SRlfObm1l6G4zNliZmvSDG6CYHwK/GWpZWyfaywo+d0zWeT/Y17ABCcGyvLaRvdYFN
         pBs85Y3KX/hYxSYGlyWqduD31sV+YRmRd1vPvHMx6HCAc7ZYhxTYTteTzFJc8tZvZ3IS
         n+6KWW/SbOH4sbmXj4z3+dHx9dTC5SkLECl0yFvdXYI5xdr5k5/LycDidk+3MHGNXYHK
         XdqSaImoUKcDdCSnEKF5dKN5yKCsZvQ141Ib0N27E17fkDtiMLfJEfi1t8uftH+BcTym
         GBYpaOkqmOe/C4r6NHlu0I2fpbuSigUgZ0zJfEWZUckupPwcTevXknRwKc+3sIKyxJqH
         LEqw==
X-Forwarded-Encrypted: i=1; AJvYcCUd3PcICSevOIi6ftgY2VQHQ+GxoCnKKqaFLSSvU3pDqO6lj5/k8Ze1t3gvTY7NIJFg6qPVVVyNRo3Mey/MrFCO2Jbk8lfko3rvCXhMTfg9Zg+qDxWtXTd0fBuyOSyP9vFkJrvfF7903MCO/G/6
X-Gm-Message-State: AOJu0YwJbTVe5kw3tGEPu5YCtHtVffj9mz3nk58Xf5IhDSzzBDV9bK1A
	qKcJLr0FHxOzdi3KrjQOT4K/MLVALDwaxjAa/mTjMDKy23nWWLfl
X-Google-Smtp-Source: AGHT+IEqp8tTNd/gv7WptaooU+7LGPWxUFggIcWL+e5r9vokcpe8Gq0TWRNoSvdcu9hfvb3k1CovRg==
X-Received: by 2002:a17:907:3a92:b0:a6f:e8df:4f0b with SMTP id a640c23a62f3a-a7245bacb91mr771053566b.38.1719520108253;
        Thu, 27 Jun 2024 13:28:28 -0700 (PDT)
Received: from [192.168.178.20] (dh207-41-166.xnet.hr. [88.207.41.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf63a96sm9131666b.81.2024.06.27.13.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jun 2024 13:28:27 -0700 (PDT)
Message-ID: <e7564dbf-cd3a-4e41-8986-03510c7e42bd@gmail.com>
Date: Thu, 27 Jun 2024 22:28:26 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPROBLEM=5D_randconfig=3A_=2E/include/linux/forti?=
 =?UTF-8?B?Znktc3RyaW5nLmg6MTIyOjMzOiBlcnJvcjog4oCYX19idWlsdGluX3N0cmNweQ==?=
 =?UTF-8?Q?=E2=80=99_source_argument_is_the_same_as_destination_=5B-Werror?=
 =?UTF-8?Q?=3Drestrict=5D?=
To: Kees Cook <kees@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Kernel Build System <linux-kbuild@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Shevchenko <andy@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 Song Liu <song@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Zhen Lei <thunder.leizhen@huawei.com>, Ard Biesheuvel <ardb@kernel.org>,
 Xin Li <xin3.li@intel.com>, Michael Roth <michael.roth@amd.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org
References: <f2d1425e-dc7d-444f-ba8d-4aac0c8fc882@gmail.com>
 <202406271127.CEAE5F4E@keescook>
Content-Language: en-US
From: Mirsad Todorovac <mtodorovac69@gmail.com>
In-Reply-To: <202406271127.CEAE5F4E@keescook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 6/27/24 20:27, Kees Cook wrote:
> On Thu, Jun 27, 2024 at 08:25:01PM +0200, Mirsad Todorovac wrote:
>> Hi all,
>>
>> I hope it will catch your attention, for I couldn't sort out what is wrong with this:
>>
>> KCONFIG_SEED=0xD859674
>>
>> on vanilla torvalds tree, commit v6.10-rc4-366-gafcd48134c58
>>
>> _______________________________________________________________
>> $ time nice make -j 36 bindeb-pkg |& tee ../err-6.10-rc5-08.log; date
>>   GEN     debian
>> dpkg-buildpackage --build=binary --no-pre-clean --unsigned-changes -R'make -f debian/rules' -j1 -a$(cat debian/arch)
>> dpkg-buildpackage: info: source package linux-upstream
>> dpkg-buildpackage: info: source version 6.10.0-rc5-gafcd48134c58-34
>> dpkg-buildpackage: info: source distribution jammy
>> dpkg-buildpackage: info: source changed by marvin <marvin@defiant>
>> dpkg-architecture: warning: specified GNU system type i686-linux-gnu does not match CC system type x86_64-linux-gnu, try setting a correct CC environment variable
>>  dpkg-source --before-build .
>> dpkg-buildpackage: info: host architecture i386
>>  make -f debian/rules binary
>> #
>> # No change to .config
>> #
>>   CALL    scripts/checksyscalls.sh
>>   UPD     init/utsversion-tmp.h
>>   CC      init/version.o
>>   AR      init/built-in.a
>>   CC      kernel/kallsyms.o
>> In file included from ./include/linux/string.h:374,
>>                  from ./arch/x86/include/asm/page_32.h:18,
>>                  from ./arch/x86/include/asm/page.h:14,
>>                  from ./arch/x86/include/asm/thread_info.h:12,
>>                  from ./include/linux/thread_info.h:60,
>>                  from ./include/linux/spinlock.h:60,
>>                  from ./include/linux/mmzone.h:8,
>>                  from ./include/linux/gfp.h:7,
>>                  from ./include/linux/mm.h:7,
>>                  from ./include/linux/kallsyms.h:13,
>>                  from kernel/kallsyms.c:15:
>> kernel/kallsyms.c: In function ‘__sprint_symbol’:
>> ./include/linux/fortify-string.h:122:33: error: ‘__builtin_strcpy’ source argument is the same as destination [-Werror=restrict]
>>   122 | #define __underlying_strcpy     __builtin_strcpy
>>       |                                 ^
>> ./include/linux/fortify-string.h:787:24: note: in expansion of macro ‘__underlying_strcpy’
>>   787 |                 return __underlying_strcpy(p, q);
>>       |                        ^~~~~~~~~~~~~~~~~~~
>> cc1: all warnings being treated as errors
>> make[6]: *** [scripts/Makefile.build:244: kernel/kallsyms.o] Error 1
>> make[5]: *** [scripts/Makefile.build:485: kernel] Error 2
>> make[4]: *** [Makefile:1934: .] Error 2
>> make[3]: *** [debian/rules:74: build-arch] Error 2
>> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
>> make[2]: *** [scripts/Makefile.package:121: bindeb-pkg] Error 2
>> make[1]: *** [/home/marvin/linux/kernel/linux_torvalds/Makefile:1555: bindeb-pkg] Error 2
>> make: *** [Makefile:240: __sub-make] Error 2
> 
> Does this patch solve the problem for you?
> 
> https://lore.kernel.org/lkml/20240604044228.2910712-1-liujinlong@kylinos.cn/

Thanks, it does.

Tested-by: Mirsad Todorovac <mtodorovac69@gmail.com>

Best regards,
Mirsad Todorovac


> -Kees
> 

