Return-Path: <linux-kbuild+bounces-6400-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E77A7A734
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 17:45:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F830163754
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D61B24E4B1;
	Thu,  3 Apr 2025 15:45:29 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5B4537E9;
	Thu,  3 Apr 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743695129; cv=none; b=qSKEILuYUnG/kKPxgZNcAaGIir0lQclCJm2HTl/fBkgZsAyPxMjBrThniF03X0dMLcVQzM00cIDJ7NQwKmR//ZPVdhT0xMlbqa3XLu7tNGFV/AO1vnnhg7gOWe46sXv0khVeX4sGCYw8OlHy817YkZtAcK9HsI9VuqIHNVPXzpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743695129; c=relaxed/simple;
	bh=jvpIPEuIcyKUpzPSC+F7ycl6bb+POOYIf+09VH7zuMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9zh2GnAZHP+VmtRyYpBgqgi5a/osO73QqoVLu8TxGRYzqfVXmQ//qOzxzzo9QblvC1j70EKiKD2FJFUrGX4sn4nTYW9YpXQRv1OmN7kaj2ivbTz7v8IcuuDCkK3yizElsUF88iUofo09cVF/RyDBGw5PSOLILk4wEj4qMjGWdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75DB344311;
	Thu,  3 Apr 2025 15:45:22 +0000 (UTC)
Message-ID: <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr>
Date: Thu, 3 Apr 2025 17:45:22 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeduffeugedvtdegleeuhfeuteetueegfeefkefhheffvdduhfegvdehuddukeffgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemjegtuddvmehffhdtieemugefgegrmegufegvlegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepuddvpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghom
 hdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegsjhhorhhnsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepnhhitgholhgrshesfhhjrghslhgvrdgvuh
X-GND-Sasl: alex@ghiti.fr

Hi Ard,

On 03/04/2025 17:11, Ard Biesheuvel wrote:
> On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>> riscv uses the .rela.dyn section to relocate the kernel at runtime but
>> that section is stripped from vmlinux. That prevents kexec to
>> successfully load vmlinux since it does not contain the relocations info
>> needed.
>>
> Maybe explain that .rela.dyn contains runtime relocations, which are
> only emitted if they are actually needed - as opposed to the static
> relocations that are not emitted as SHF_ALLOC sections, and are not
> considered to be part of the runtime image in the first place.


Ok I'll do.


> It
> would be nice if we could use --remove-relocations= here, which only
> removes static relocations, but unfortunately, llvm-objcopy does not
> support this.
>
> Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn and
> .relr.dyn, as they all carry runtime relocations.


Ok, I'll add them to the next version.


>
> Finally, I'd be curious to know why RISC-V relies on --emit-relocs in
> the first place? Is the relocs check really needed? If not, it would
> be a nice opportunity to get rid of Makefile.postlink entirely.


So I had to check and it happens that this was an issue with the 
toolchain, I should check if that still happens with newer ones.

commit 559d1e45a16dcf1542e430ea3dce9ab625be98d0
Author: Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Wed Mar 29 06:53:29 2023 +0200

     riscv: Use --emit-relocs in order to move .rela.dyn in init

     To circumvent an issue where placing the relocations inside the init
     sections produces empty relocations, use --emit-relocs. But to avoid
     carrying those relocations in vmlinux, use an intermediate
     vmlinux.relocs file which is a copy of vmlinux *before* stripping its
     relocations.

     Suggested-by: Björn Töpel <bjorn@kernel.org>
     Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
     Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
     Link: 
https://lore.kernel.org/r/20230329045329.64565-7-alexghiti@rivosinc.com
     Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>


>
> In any case, for this change, or a variation along the lines of what I
> wrote above,
>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>


Thanks,

Alex


>
>
>> Fixes: 71d815bf5dfd ("kbuild: Strip runtime const RELA sections correctly")
>> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>> ---
>>   scripts/Makefile.lib | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index cad20f0e66ee..0a1f1e67a0ed 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -377,7 +377,7 @@ quiet_cmd_objcopy = OBJCOPY $@
>>   cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>>
>>   quiet_cmd_strip_relocs = RSTRIP  $@
>> -cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
>> +cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' --remove-section=!.rela.dyn $@
>>
>>   # Gzip
>>   # ---------------------------------------------------------------------------
>> --
>> 2.39.2
>>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

