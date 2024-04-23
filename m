Return-Path: <linux-kbuild+bounces-1670-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 017FE8AE543
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 14:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 25C371C21F7A
	for <lists+linux-kbuild@lfdr.de>; Tue, 23 Apr 2024 12:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C33085950;
	Tue, 23 Apr 2024 11:48:30 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F9482D7;
	Tue, 23 Apr 2024 11:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713872910; cv=none; b=X+CC0YO+QVoD2r3TQABFNGZmUX0SQsyISp/CWmTxE2NEN3eU3cuVhNXQ7cIVadZztJ4iWbKjgcqg8PEi/U5+U2E7g6gHxLfgSQFPs8nl9uIm/5mJnJvtwb5b97+UOvCoqimImPJ5nOo/GJgMHEegenMhI8Eb5n7PQ5o9etZF1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713872910; c=relaxed/simple;
	bh=s1VrbkB1mFREuzasvo0D9mWuRluO73r6qFb8n2kFnVI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OJ4rwwja3Kv4jl8684CQ/JTRbKs8ONtQY31KsbZ69lldpzEwzU2aug7j6amPD8ZVwYXpU+Wwn2yZ7Z1K/5mhnFS6OlRbMcIpJNC4HOu7gxznhfJXhA4DqO8jiWJMCKf8nKUBz1tw2r0jMk1aW11FFZNTwYPsDdSaJCpDGKImuHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4VP0gN6t5czNt7j;
	Tue, 23 Apr 2024 19:45:52 +0800 (CST)
Received: from dggpemd100004.china.huawei.com (unknown [7.185.36.20])
	by mail.maildlp.com (Postfix) with ESMTPS id 530DA18007A;
	Tue, 23 Apr 2024 19:48:23 +0800 (CST)
Received: from [10.67.109.211] (10.67.109.211) by
 dggpemd100004.china.huawei.com (7.185.36.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 23 Apr 2024 19:48:23 +0800
Message-ID: <0ead5774-92ca-4a84-82e3-ec5c198794e5@huawei.com>
Date: Tue, 23 Apr 2024 19:48:22 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-kbuild@vger.kernel.org>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <nathan@kernel.org>,
	<nicolas@fjasle.eu>, <peterz@infradead.org>, <jpoimboe@kernel.org>,
	<leitao@debian.org>, <petr.pavlu@suse.com>, <richard.weiyang@gmail.com>,
	<ruanjinjie@huawei.com>, <ndesaulniers@google.com>, <jgross@suse.com>
References: <20240422060556.1226848-1-liuyuntao12@huawei.com>
 <CAK7LNAQgkt6t6UEB+_q15KJb2STVL6oqUo3mFM8EzumFH+-mYw@mail.gmail.com>
From: "liuyuntao (F)" <liuyuntao12@huawei.com>
In-Reply-To: <CAK7LNAQgkt6t6UEB+_q15KJb2STVL6oqUo3mFM8EzumFH+-mYw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemd100004.china.huawei.com (7.185.36.20)



On 2024/4/23 0:01, Masahiro Yamada wrote:
> On Mon, Apr 22, 2024 at 3:41 PM Yuntao Liu <liuyuntao12@huawei.com> wrote:
>>
>> The current x86 architecture does not yet support the
>> HAVE_LD_DEAD_CODE_DATA_ELIMINATION feature. x86 is widely used in
>> embedded scenarios, and enabling this feature would be beneficial for
>> reducing the size of the kernel image.
>>
>> In order to make this work, we keep the necessary tables by annotating
>> them with KEEP, also it requires further changes to linker script to KEEP
>> some tables and wildcard compiler generated sections into the right place.
>>
>> Enabling CONFIG_UNWINDER_ORC or CONFIG_MITIGATION_RETPOLINE will enable
>> the objtool's --orc and --retpoline parameters, which will alter the
>> layout of the binary file, thereby preventing gc-sections from functioning
>> properly. Therefore, HAVE_LD_DEAD_CODE_DATA_ELIMINATION should only be
>> selected when they are not enabled.
>>
>> Enabling CONFIG_LTO_CLANG or CONFIG_X86_KERNEL_IBT will use vmlinux.o
>> instead of performing the slow LTO link again. This can also prevent
>> gc-sections from functioning properly. Therefore, using this optimization
>> when CONFIG_LD_DEAD_CODE_DATA_ELIMINATION is not enabled.
>>
>> The size comparison of zImage is as follows:
>> x86_def_defconfig  i386_defconfig    tinyconfig
>> 10892288           10826240          607232          no dce
>> 10748928           10719744          529408          dce
>> 1.3%               0.98%             12.8%           shrink
>>
>> When using smaller config file, there is a significant reduction in the
>> size of the zImage.
>> ---
> 
>> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
>> index 7862a8101747..7287b5a9f17d 100755
>> --- a/scripts/link-vmlinux.sh
>> +++ b/scripts/link-vmlinux.sh
>> @@ -60,7 +60,7 @@ vmlinux_link()
>>          # skip output file argument
>>          shift
>>
>> -       if is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT; then
>> +       if [ is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT ] && [ ! is_enabled CONFIG_LD_DEAD_CODE_DATA_ELIMINATION ]; then
>>                  # Use vmlinux.o instead of performing the slow LTO link again.
>>                  objs=vmlinux.o
>>                  libs=
>> --
> 
> 
> This is wrong.
> You should not put is_enabled inside [ ... ]
> 

My mistake.

> (is_enabled CONFIG_LTO_CLANG || is_enabled CONFIG_X86_KERNEL_IBT) && !
> is_enabled CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
> 
> is still weird.
> 
> 
> When CONFIG_LTO_CLANG=y and CONFIG_LD_DEAD_CODE_DATA_ELIMINATION=y,
> the result of LTO will be discarded.
>

On arm and risc-v, these two configs can both be enabled without any 
issues, i think, it should be the same for x86 as well.

