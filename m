Return-Path: <linux-kbuild+bounces-6397-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 400D4A7A5F3
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 17:07:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B447188EC09
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Apr 2025 15:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF28624EF97;
	Thu,  3 Apr 2025 15:07:16 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F0B288A2;
	Thu,  3 Apr 2025 15:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743692836; cv=none; b=jwCXaf3jRBGXYJrZDqI4DLr93n4hPiHjZnSfasaY8hFZRD1puUD3Vhvpuv6Zj9dAc1II0x6bmorNYK7bzjW2LR4QRkapgWT4RcQ/j0HgZh6rv68HBTBEpUtuBBh5FLU7XLxqkV/EkszBIYCWWF4i1wdAvIhjuDtHhzRQorjgIvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743692836; c=relaxed/simple;
	bh=a+Elpo09uRi5kMrDgUVA8Gj+kzl67KA6NE7ixco4xPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mefXoe11pi+Y1KQmob3hX2EZwlUs0omrP2eD55dosioEW0zY91jdlLhSdn9CDHdS1B6bZQuwe4Nw+SYijqy2uAdL115vCE9pZbc68Aq9rUyjy1RQSPqUI5piGMhOC814e0tkAX8Fp7kTo2ECF3OQ4eJBVLkcVAxeH7U+1mNrMgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id C8752442C9;
	Thu,  3 Apr 2025 15:07:09 +0000 (UTC)
Message-ID: <28018be2-eabc-4d6f-9bb1-913a1f0515db@ghiti.fr>
Date: Thu, 3 Apr 2025 17:07:09 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Use --strip-unneeded with INSTALL_MOD_STRIP
Content-Language: en-US
To: Masahiro Yamada <masahiroy@kernel.org>,
 Charlie Jenkins <charlie@rivosinc.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier
 <nicolas@fjasle.eu>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20250122-strip_unneeded-v1-1-ac29a726cb41@rivosinc.com>
 <20250131035245.GA47826@ax162> <Z5xzkwwZAWRRLCdj@ghost>
 <CAK7LNAR=1sNs+hOW8gL=7xOs=gHLToTAnAUTF1SizroYoui8sg@mail.gmail.com>
 <Z51BpVEkmVCg7gTX@ghost>
 <CAK7LNATs=c4J7mR69ec3scPqw6PK4SKTs-ixrQM_eRiz=EhS8A@mail.gmail.com>
 <Z6JcgeDmt63MupyW@ghost>
 <CAK7LNAS5RVtm078rLFJNxQwPf+1VH+zf12dQJ1Xh-Wc4_qFGTw@mail.gmail.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <CAK7LNAS5RVtm078rLFJNxQwPf+1VH+zf12dQJ1Xh-Wc4_qFGTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeekkeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmeejtgduvdemfhhftdeimegufeegrgemugefvgelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmeejtgduvdemfhhftdeimegufeegrgemugefvgelpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmeejtgduvdemfhhftdeimegufeegrgemugefvgelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehmrghsrghhihhrohihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegthhgrrhhlihgvsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehnrghthhgrnheskhgvrhhnvghlrdhorhhgpdhrtghpt
 hhtohepnhhitgholhgrshesfhhjrghslhgvrdgvuhdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtoheplhhinhhugidqkhgsuhhilhgusehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Masahiro,

On 05/02/2025 16:00, Masahiro Yamada wrote:
> On Wed, Feb 5, 2025 at 3:29 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>> On Tue, Feb 04, 2025 at 01:04:26PM +0900, Masahiro Yamada wrote:
>>> On Sat, Feb 1, 2025 at 6:33 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>> On Sat, Feb 01, 2025 at 12:10:02AM +0900, Masahiro Yamada wrote:
>>>>> On Fri, Jan 31, 2025 at 3:54 PM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>>>> On Thu, Jan 30, 2025 at 08:52:45PM -0700, Nathan Chancellor wrote:
>>>>>>> On Wed, Jan 22, 2025 at 07:17:26PM -0800, Charlie Jenkins wrote:
>>>>>>>> On riscv, kernel modules end up with a significant number of local
>>>>>>>> symbols. This becomes apparent when compiling modules with debug symbols
>>>>>>>> enabled. Using amdgpu.ko as an example of a large module, on riscv the
>>>>>>>> size is 754MB (no stripping), 53MB (--strip-debug), and 21MB
>>>>>>>> (--strip-unneeded). ON x86, amdgpu.ko is 482MB (no stripping), 21MB
>>>>>>>> (--strip-debug), and 20MB (--strip-unneeded).
>>>>>>>>
>>>>>>>> Use --strip-unneeded instead of --strip-debug to strip modules so
>>>>>>>> decrease the size of the resulting modules. This is particularly
>>>>>>>> relevant for riscv, but also marginally aids other architectures.
>>>>>>>>
>>>>>>>> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
>>>>>>> Is there any sort of regression risk with this patch? If so, another
>>>>>>> option may be to give another level to INSTALL_MOD_STRIP like 2 so that
>>>>>>> INSTALL_MOD_STRIP=1 continues to behave as before but people can easily
>>>>>>> opt into this option. No strong opinion because I am not sure but was
>>>>>>> not sure if it was considered.
>>>>>> I do not believe this would cause regressions. The description on gnu
>>>>>> strip is:
>>>>>>
>>>>>> "Remove all symbols that are not needed for relocation processing in
>>>>>> addition to debugging symbols and sections stripped by --strip-debug."
>>>>>>
>>>>>> The description on llvm-strip is:
>>>>>>
>>>>>> "Remove from the output all local or undefined symbols that are not
>>>>>> required by relocations. Also remove all debug sections."
>>>>>>
>>>>>> gnu strip --strip-unneeded strips slightly more aggressively but it does
>>>>>> not appear this causes any issues.
>>>>>>
>>>>>>> Regardless:
>>>>>>>
>>>>>>> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
>>>>>> Thanks!
>>>>>>
>>>>>
>>>>> It is true --strip-unneeded drops a lot of compiler-generated symbols, but
>>>>> it also drops real symbols that originate in the source code.
>>>>>
>>>>> So, this would give user-visible changes for kallsyms at least.
>>>> Adding INSTALL_MOD_STRIP="--strip-unneeded" would be sufficient for
>>>> riscv. However, this has the downside that riscv will require different
>>>> flags than other architectures to get reasonably sized modules.
>>> You can use INSTALL_MOD_STRIP=--strip-unneeded for all architecture if you like.
>>>
>>> I assume this is a riscv issue. Specifically, riscv gcc.
>>> With LLVM=1, I see much smaller riscv modules using INSTALL_MOD_STRIP=1.
>>>
>>> --strip-unneeded is needlessly aggressive for other architectures,
>>> and I do not see a good reason to change the default.
>> Yes it is primarily an issue with riscv GCC. I was hoping for something
>> more standardized so that other people using riscv GCC wouldn't
>> encounter this. Would it be reasonable to add this flag by default only
>> for the riscv architecture, or do you think it's just better to leave it
>> up to the user's choice?
> The latter.
>
> INSTALL_MOD_STRIP=1 passes --strip-debug.
> This is clearly documented in Documentation/kbuild/makefiles.rst
> and it has worked like that for many years, with no exception.
>
> If users want it to work differently, the flexibility is already there.
>
> If INSTALL_MOD_STRIP=1 worked differently, silently only for riscv,
> I would regard it as insane behavior.
>
>

I find it a bit "harsh" for users to know that on riscv, they need to 
set INSTALL_MOD_STRIP to have modules with a "normal" size.

So I'd rather have it set by default for riscv, would the following be 
acceptable for you?

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 13fbc0f942387..c49b9dda20cd1 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -6,6 +6,8 @@
  # for more details.
  #

+INSTALL_MOD_STRIP := --strip-unneeded
+
  LDFLAGS_vmlinux := -z norelro
  ifeq ($(CONFIG_RELOCATABLE),y)
         LDFLAGS_vmlinux += -shared -Bsymbolic -z notext --emit-relocs
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 1628198f3e830..e60895761b73b 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -77,6 +77,8 @@ quiet_cmd_install = INSTALL $@
  # are installed. If INSTALL_MOD_STRIP is '1', then the default option
  # --strip-debug will be used. Otherwise, INSTALL_MOD_STRIP value will 
be used
  # as the options to the strip command.
+# Read arch-specific Makefile to set INSTALL_MOD_STRIP as needed.
+include $(srctree)/arch/$(SRCARCH)/Makefile
  ifdef INSTALL_MOD_STRIP

  ifeq ($(INSTALL_MOD_STRIP),1)


Thanks,

Alex



