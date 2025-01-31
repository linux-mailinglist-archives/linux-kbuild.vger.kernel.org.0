Return-Path: <linux-kbuild+bounces-5582-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 860F7A2417B
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 18:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00DF9163CAA
	for <lists+linux-kbuild@lfdr.de>; Fri, 31 Jan 2025 17:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A96C6A8D2;
	Fri, 31 Jan 2025 17:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Wo/AF/ew"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-175.mta1.migadu.com (out-175.mta1.migadu.com [95.215.58.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E094738DF9
	for <linux-kbuild@vger.kernel.org>; Fri, 31 Jan 2025 17:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738343002; cv=none; b=jWy89vK9TzTrgks7ttFJ/13rurOMLFHbWIuSe/ENNkjHM65wuoMbUhIWrKTzJAsfBZmjTqLUnfERwRnSH+QYOKX20ac/pW+mIKcQnFq5UHZzAYCR1f99HopqXR12z2QOLGeYMxoQAe14JxYq4I6PFndOk5X7iAuSchvL6qIfV94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738343002; c=relaxed/simple;
	bh=qTAvAV+ljVpaZZ5TLRK7tSG7FxAocWPV0Yb1WBFSq4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z0Pq9KI2/cOU4qQ7lSiOtuYoPQ4oCnGowfdvr30LlcJFhH1EtV08LyG41w7zSQhEgIJSGFIpf1cjmtIPrXObUSb32+b5d36fqJLahsvmAicXQ4/nNnUsOcrwKh8kKwd229/KaqQGiUzfXDBUMdGvQ6dc8YCnJdlvd0ck0ED5PIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Wo/AF/ew; arc=none smtp.client-ip=95.215.58.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <9c426abe-471a-43c4-bc69-d19c290b5b88@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738342997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uxBTI0YbED6PyyykEKqp0D9DL3nSCpBnGFcX6r0oGrk=;
	b=Wo/AF/ewAUMmhGCNA7wdAjTHWcc9BIWpkJvm4mJ4bqg7UqqhwL5qslXgFxr+oAXw8tjlHY
	ZgQVWKRr7BQyxDuVFMIwXBU3xTyHrIKD+zZNXhlVea4R/Ze6W5VJgDd1i+K2XFlIJH21Ft
	8gNb2+W45zc1+96rS+NfRPi1xjG6sMw=
Date: Fri, 31 Jan 2025 09:03:11 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Fix lto build issue for aarch64
Content-Language: en-GB
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, kernel-team@fb.com,
 Marco Elver <elver@google.com>, Nathan Chancellor <nathan@kernel.org>,
 Nikolay Borisov <nik.borisov@suse.com>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Song Liu <song@kernel.org>
References: <20250130222208.4109974-1-yonghong.song@linux.dev>
 <CAK7LNASOKf=VWcgvncLqkCwq8bZOe-9y=zydJhRwy+sQr1jf=Q@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <CAK7LNASOKf=VWcgvncLqkCwq8bZOe-9y=zydJhRwy+sQr1jf=Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT




On 1/31/25 6:08 AM, Masahiro Yamada wrote:
> On Fri, Jan 31, 2025 at 7:25 AM Yonghong Song <yonghong.song@linux.dev> wrote:
>> Commit bede169618c6 ("kbuild: enable objtool for *.mod.o and additional kernel objects")
>> added objtool support for various files like *.mod.o, vmlinux.export.o, etc.
>> But unfortunately it also breaks lto build for aarch64 where a common source file,
>> e.g., kernel/bpf/syscall.c, is compiled with command:
>>    clang ... -flto=thin ... -c -o kernel/bpf/syscall.o /home/yhs/work/bpf-next/kernel/bpf/syscall.c  ;
>>    ld.lld -EL  -maarch64elf -z norelro -mllvm -import-instr-limit=5 -z noexecstack   \
>>        -r -o kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o;
>>    mv kernel/bpf/.tmp_syscall.o kernel/bpf/syscall.o
>>
>> The above command line completely destroyed thin-lto since file kernel/bpf/syscall.o
>> is expected to be a llvm bitcode file and later ld.lld can do cross-file inlining.
>>
>> The issue has been reported in [1] and Masahiro actually provided a suggested fix.
>> But unfortunately that suggested fix does not work.
> Thanks for the report, but your patch does not fix the real issue.
>
> I think my original [1] worked, although it was a bit redundant
> (extra $(LD) is executed where it is unnecessary).
>
>
>> This patch made improvement on top of [2] and the issue for aarch64 lto is fixed.
>> The x86_64 is also tested without any issue.
> You are not fixing the issue.
> You are just disabling objtool (i.e. reverting  bede169618c6).

You are correct. Essentially my patch just reverted bede169618c6
since I am not familar with Makefile.build and Makefile.lib so
won't be able to come up with a proper solution.

>
>
>> In [1], commit 1b466b29a3bf ("kbuild: re-enable KCSAN for autogenerated *.mod.c intermediaries")
>> enabled kcsan for *.mod.c files. This patch actually disabled that.
>> Should we revert commit 1b466b29a3bf as well?
> No.
> I do not want to revert 1b466b29a3bf.
>
> If 1b466b29a3bf were reverted, there would be no point
> in applying bede169618c6.
>
>
>>    [1] https://lore.kernel.org/lkml/20241113234526.402738-1-masahiroy@kernel.org/
>>    [2] https://lore.kernel.org/lkml/CAK7LNATpu5zYwx7kmaknsPGLXt8n8uCXyFpdi5vZeFZiBxYkGw@mail.gmail.com/
>>
>> Fixes: bede169618c6 ("kbuild: enable objtool for *.mod.o and additional kernel objects")
>> Signed-off-by: Yonghong Song <yonghong.song@linux.dev>
>> ---
>>   scripts/Makefile.build | 2 ++
>>   scripts/Makefile.lib   | 4 +---
>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index c16e4cf54d77..e9ae38b71a08 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -129,6 +129,8 @@ $(obj)/%.ll: $(obj)/%.c FORCE
>>
>>   is-single-obj-m = $(and $(part-of-module),$(filter $@, $(obj-m)),y)
>>
>> +need-ld-single = $(is-single-obj-m)
>> +
>>   ifdef CONFIG_MODVERSIONS
>>   # When module versioning is enabled the following steps are executed:
>>   # o compile a <file>.o from <file>.c
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 7395200538da..f04672bfe068 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -302,11 +302,9 @@ endef
>>   # ===========================================================================
>>   # These are shared by some Makefile.* files.
>>
>> -objtool-enabled := y
>> -
> This is wrong.
>
> You are simply disabling objtool for *.mod.o
>
> I am pretty sure the problem reported by 54babdc
> will come back.
>
>
> I submitted a proper fix.

I tested the patch with arm64/x86_64 + lto/no-lto. Everything works fine.
I have replied with my Tested-by tag. Thanks!

>
>
>
>>   ifdef CONFIG_LTO_CLANG
>>   # objtool cannot process LLVM IR. Make $(LD) covert LLVM IR to ELF here.
>> -cmd_ld_single = $(if $(objtool-enabled), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
>> +cmd_ld_single = $(if $(need-ld-single), ; $(LD) $(ld_flags) -r -o $(tmp-target) $@; mv $(tmp-target) $@)
>>   endif
>>
>>   quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
>> --
>> 2.43.5
>>
>
> --
> Best Regards
>
> Masahiro Yamada


