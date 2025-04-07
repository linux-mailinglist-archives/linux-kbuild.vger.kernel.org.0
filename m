Return-Path: <linux-kbuild+bounces-6484-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D32DA7D843
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 10:43:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F090B3AF5F6
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Apr 2025 08:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB20A226CF1;
	Mon,  7 Apr 2025 08:43:01 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BDA189BB5;
	Mon,  7 Apr 2025 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015381; cv=none; b=EK/gjPER/6hG8kWkxTOrqOw8vGEtTAnYbwPl9Dk5dVYL0LBr4pTS0Js5TsdDczVED2/fShb2wHIJOYKjlJzpGY62Xe1ACzPRrls9D3I4CR/mM0CPkZKRvfitsn/LUhGoGLuzJ7qBPgQ50/9z5GwHQNBNtNTSEMD3rnOMLeAipCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015381; c=relaxed/simple;
	bh=7eSUJOvvhlDbC8vWHXQK9jkDzyOY6RKgrdSjupt46cQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jX78F0PEneJ5Nrv3GQ0ntZZ2B2Wn/LFER9Fh7UimK+BPXPRf2XZSMqlAJUeiXhn5TZvBeN+aNt7luRBZJSQRteObixHQEZqJb0mixIeXYyb3lVGu7V+IBZJ69SZ5hSF644dKa/Q17u02zmsIT4HSiZ4I5FLELMNAiWAJO5oCCuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id C0D7C44201;
	Mon,  7 Apr 2025 08:42:46 +0000 (UTC)
Message-ID: <e760a42c-1147-4fe8-9c65-6c4919f15fff@ghiti.fr>
Date: Mon, 7 Apr 2025 10:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
 Masahiro Yamada <masahiroy@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
 <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr>
 <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
 <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduleeljeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeeuffefvdelteelteejhfejhedujeetteevtddvvddthfeiteffledvffeggfeiieenucffohhmrghinhepihhnfhhrrgguvggrugdrohhrghenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeeisgemvdefgeekmeduvgduheemvdgrgeehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegrlhgvgihghhhithhisehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrrhgus
 geskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtohhlrghssehfjhgrshhlvgdrvghu
X-GND-Sasl: alex@ghiti.fr


On 07/04/2025 10:15, Alexandre Ghiti wrote:
> Hi Masahiro,
>
> On Fri, Apr 4, 2025 at 5:25 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>> On Fri, Apr 4, 2025 at 12:45 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>> Hi Ard,
>>>
>>> On 03/04/2025 17:11, Ard Biesheuvel wrote:
>>>> On Thu, 3 Apr 2025 at 16:42, Alexandre Ghiti <alexghiti@rivosinc.com> wrote:
>>>>> riscv uses the .rela.dyn section to relocate the kernel at runtime but
>>>>> that section is stripped from vmlinux. That prevents kexec to
>>>>> successfully load vmlinux since it does not contain the relocations info
>>>>> needed.
>>>>>
>>>> Maybe explain that .rela.dyn contains runtime relocations, which are
>>>> only emitted if they are actually needed - as opposed to the static
>>>> relocations that are not emitted as SHF_ALLOC sections, and are not
>>>> considered to be part of the runtime image in the first place.
>>>
>>> Ok I'll do.
>>>
>>>
>>>> It
>>>> would be nice if we could use --remove-relocations= here, which only
>>>> removes static relocations, but unfortunately, llvm-objcopy does not
>>>> support this.
>>>>
>>>> Also, I wonder if this should apply to all of .rel.dyn, .rela.dyn and
>>>> .relr.dyn, as they all carry runtime relocations.
>>>
>>> Ok, I'll add them to the next version.
>>>
>>>
>>>> Finally, I'd be curious to know why RISC-V relies on --emit-relocs in
>>>> the first place? Is the relocs check really needed? If not, it would
>>>> be a nice opportunity to get rid of Makefile.postlink entirely.
>>>
>>> So I had to check and it happens that this was an issue with the
>>> toolchain, I should check if that still happens with newer ones.
>>>
>>> commit 559d1e45a16dcf1542e430ea3dce9ab625be98d0
>>> Author: Alexandre Ghiti <alexghiti@rivosinc.com>
>>> Date:   Wed Mar 29 06:53:29 2023 +0200
>>>
>>>       riscv: Use --emit-relocs in order to move .rela.dyn in init
>>
>>
>>
>> So,
>>
>> Fixes: 559d1e45a16d ("riscv: Use --emit-relocs in order to move
>> .rela.dyn in init")
>>
>> Is this the correct tag?
> This is the initial culprit yes, but if we use this tag, the fix won't
> apply. So I decided to pick Ard's patch so that this fix can be easily
> backported to 6.14, and I'll come up with a new version for previous
> releases. Is that ok with you?


And I have just looked at 6.15-rc1 and noticed that the relocation 
stripping was moved to Makefile.vmlinux, so this fix won't apply to 6.14 
neither.

I'll then use the initial culprit, which is Fixes: 559d1e45a16d ("riscv: 
Use --emit-relocs in order to move.rela.dyn in init").

Sorry for the noise,

Alex


>
> Thanks,
>
> Alex
>
>>
>>
>>
>>
>> --
>> Best Regards
>> Masahiro Yamada
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

