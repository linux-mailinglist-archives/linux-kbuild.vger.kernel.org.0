Return-Path: <linux-kbuild+bounces-13302-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLuFLdx/D2pdMwYAu9opvQ
	(envelope-from <linux-kbuild+bounces-13302-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 23:57:48 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C75985AC3E9
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 23:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0B43E3016B3E
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 May 2026 21:57:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D0A3446CE;
	Thu, 21 May 2026 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="pD9gP2P0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF51433F5A7
	for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2026 21:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779400650; cv=none; b=UwIkJQVYPaA1mLy5j4z9/XrXMaPseCMlwhB53MlyRM3t96SPie+WHMOnpE3otWPSA3EDhD36qKixi81Tofo2ugTX6jVFVjWbPC0ulwGbFMYze9QJ5HTwj+zGmY730MhWQpMAbAAxGpe6xYfjd87rlSUHIZj3lWDtsTDr7jPhTzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779400650; c=relaxed/simple;
	bh=dN/Ouz6Gx8zRex/mSWQGh1HUKwndLo3j/QXe5RFa3tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnbzPOYRDyArsabJe6JaEnqom6ftEJuWHQrEVeHYVkhjuM9yZu+URLSxrt2lKcEXDz9S7b6FyuBsyIuWxJMuVJuGQ27m23gj0GGJfNg8troZ086xDG00GDIbBqCFD4kmPZ+5SEz1SAW90vOZ8gAP/wfdylP49Xp6bskiuz8D1RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=pD9gP2P0; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <69e60bc9-cfe6-4b8d-b61b-5840f7d2518a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1779400636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xQNkuJH7kA7sCyQjsW5bf2RbZYI8pGmnGfg1gJiQndM=;
	b=pD9gP2P0WdkGMFY/FVC1Tg6P2SVsQQLvdvUghngqUPSVAO1najrfQNsFUOSZYbdV6mC2Fw
	Jpt7XlQAiOfg0MLGeVhN4dlVAQcWsZMyPBPsUvGAjdph9CJZvzyFaFt/mD3tu5FjOMncdn
	xiJlRHczpMgEMSXVTdQilHvrHC2oeT4=
Date: Thu, 21 May 2026 14:56:53 -0700
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 3/3] kbuild: distributed build support for Clang
 ThinLTO
Content-Language: en-GB
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nicolas Schier <nicolas.schier@linux.dev>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Alice Ryhl <aliceryhl@google.com>, Sami Tolvanen <samitolvanen@google.com>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Rafael Aquini <aquini@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Stafford Horne <shorne@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Piotr Gorski <piotrgorski@cachyos.org>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20260331154827.2793269-1-xur@google.com>
 <20260331154827.2793269-4-xur@google.com> <20260331162729.GA2006419@ax162>
 <2672f790-f57b-4739-b78f-906c0a5d202e@linux.dev>
 <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yonghong Song <yonghong.song@linux.dev>
In-Reply-To: <CAF1bQ=R6=0G9O-eNFsHiCLMpkph7=hSu4Rn_HjFD4PvTFnAnDQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13302-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linux.dev,gmail.com,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,linux.ibm.com,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yonghong.song@linux.dev,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linux.dev:email,linux.dev:mid,linux.dev:dkim]
X-Rspamd-Queue-Id: C75985AC3E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/21/26 11:31 AM, Rong Xu wrote:
> Yonghong, thanks for the update.
>
> Regarding this guard: ther is a period of Clang (before this patch and
> after your first patch), even though ld.lld having these options
> (specifically --lto-whole-program-visibility -mllvm
> -always-rename-promoted-locals=false), distributed ThinLTO mode
> remains unsupported, correct? What the behvior of using this options
> in distributed mode with these compilers? nop or it will lead to
> error?

The in-process thin-lto support is landed on Feb 27.
The distributed thin-lto support is landed on Apr 24.

If people are using distributed thin-lto in kernel between Feb 27 and
Apr 24, there will be some issues. But people typically use released
compiler, so we should be fine.

>
> I would assume there will be errors; otherwise, you would not ask me
> to change my patch last time. In this case, I would keep this guard
> and remove it when the minimum llvm version passes llvm23. What do you
> think?

There is no need to keep compiler version guard.

Before llvm23, the below will be a noop:
    $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
since '-mllvm -always-rename-promoted-locals=false' is a new flag and the compiler won't
recognize it so the kernel will resolve above 'call ...' option as noop.

With llvm23 and later, the kernel will be able to recognize above options and
things should be okay.

>
> Best,
>
> -Rong
>
>
> On Thu, May 21, 2026 at 1:57 PM Yonghong Song <yonghong.song@linux.dev> wrote:
>>
>>
>> On 3/31/26 9:27 AM, Nathan Chancellor wrote:
>>> Hi Rong,
>>>
>>> On Tue, Mar 31, 2026 at 03:48:27PM +0000, xur@google.com wrote:
>>>> diff --git a/Makefile b/Makefile
>>>> index 69ccf9b8507d..26005c64016d 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -1047,11 +1047,13 @@ export CC_FLAGS_SCS
>>>>    endif
>>>>
>>>>    ifdef CONFIG_LTO_CLANG
>>>> -ifdef CONFIG_LTO_CLANG_THIN
>>>> +ifdef CONFIG_LTO_CLANG_FULL
>>>> +CC_FLAGS_LTO        := -flto
>>>> +else
>>>>    CC_FLAGS_LTO       := -flto=thin -fsplit-lto-unit
>>>> +if CONFIG_LTO_CLANG_THIN
>>> This should be an 'ifdef', not an 'if'. You copied Yonghong's mistake:
>>>
>>>     https://lore.kernel.org/abgRRX3PH9IaExi8@sirena.org.uk/
>>>     https://lore.kernel.org/6db3a2f6-d61c-42f1-9b9d-0aca021cc2d7@linux.dev/
>>>
>>> Please slow down and test build your changes before sending them. Each
>>> revision adds four new emails to everyone's inbox, which is just noise
>>> when there are obvious, basic problems. 'b4 diff' shows no actual
>>> difference from v8 and v9, which should have been caught by a simple
>>> build test right before 'git send-email'.
>>>
>>>>    KBUILD_LDFLAGS += $(call ld-option,--lto-whole-program-visibility -mllvm -always-rename-promoted-locals=false)
>>>> -else
>>>> -CC_FLAGS_LTO        := -flto
>>>> +endif
>> The above patch has a guard CONFIG_LTO_CLANG_THIN, which can be removed.
>> See llvm patch
>>      https://github.com/llvm/llvm-project/pull/188074
>> which supports distributed thin-lto mode too for reducing the number
>> of renaming. In other words, for llvm23, both in-process and
>> distributed-process are supported for thin-lto.
>>
>>>>    endif
>>>>    CC_FLAGS_LTO       += -fvisibility=hidden
>>>>
>>>> @@ -1657,6 +1659,7 @@ endif # CONFIG_MODULES
>>>>    CLEAN_FILES += vmlinux.symvers modules-only.symvers \
>>>>              modules.builtin modules.builtin.modinfo modules.nsdeps \
>>>>              modules.builtin.ranges vmlinux.o.map vmlinux.unstripped \
>>>> +           vmlinux.thinlto-index builtin.order \
>>>>              compile_commands.json rust/test \
>>>>              rust-project.json .vmlinux.objs .vmlinux.export.c \
>>>>                   .builtin-dtbs-list .builtin-dtb.S
>>>> @@ -2118,7 +2121,7 @@ clean: $(clean-dirs)
>>>>       $(call cmd,rmfiles)
>>>>       @find . $(RCS_FIND_IGNORE) \
>>>>               \( -name '*.[aios]' -o -name '*.rsi' -o -name '*.ko' -o -name '.*.cmd' \
>>>> -            -o -name '*.ko.*' \
>>>> +            -o -name '*.ko.*' -o -name '*.o.thinlto.bc' \
>>>>               -o -name '*.dtb' -o -name '*.dtbo' \
>>>>               -o -name '*.dtb.S' -o -name '*.dtbo.S' \
>>>>               -o -name '*.dt.yaml' -o -name 'dtbs-list' \
>>> With that addressed above, the series survives my basic LLVM 22.1.2
>>> build test with my distribution configuration. I'll provide formal tags
>>> on a properly tested and fixed revision.
>>>
>>> Cheers,
>>> Nathan


