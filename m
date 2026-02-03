Return-Path: <linux-kbuild+bounces-10985-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPIiMoyVgWl/HAMAu9opvQ
	(envelope-from <linux-kbuild+bounces-10985-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 07:28:28 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3259D53A5
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 07:28:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 747B9300601B
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 06:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31082378D8B;
	Tue,  3 Feb 2026 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="Jmmk8o+v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C44E636C5B9;
	Tue,  3 Feb 2026 06:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100102; cv=none; b=dhi1oEV81hCLLY/xJ5wga4eXNfljdzWswWQ/PRvNofAubVKdVLzwjoZcQygFmgsrkY5gdb2AXINO/tW6q76Dhvec6GNWda23W18UWyq2KNqL6jDsUrcdIutYbmZ0BxZ6iW0pmdAQWz/HZHbY8QUk5MpQPWWGCBy609zD07+SHsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100102; c=relaxed/simple;
	bh=QKAGH/BAke7rlk4wTDeomyjIuiLy1CsZ/pdt9fF6n0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sNDp6VkY7mvYCCIXnp8J+7uYoCqyT246UJCUJmW2wvDsrj5m8wKpwthV9D2Y6Fwe8QzOqW22uYuOe0pxWWvTwMuliDmo4lCE0BuGiZdifEd3MSDbeHbXO3GecnBQgz+ibONt6iRl/vNRdFZ1ChRztajPGEVwWCjgLV95DD9kjDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=Jmmk8o+v; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Received: from [10.95.64.228] (unknown [167.220.238.132])
	by linux.microsoft.com (Postfix) with ESMTPSA id A5AFA20B7169;
	Mon,  2 Feb 2026 22:28:14 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com A5AFA20B7169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1770100099;
	bh=LVycVSeEop8JKxuUHxlsz1NcKD3LEqIHbdeXH2h5LMw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jmmk8o+vanxcCqM7DOKRp0g/bHvUD+y0np5BNl84lLBWwMxemC42T+UpzsxkfFMSt
	 oE8Bl1J4qBhXbumv1fOxAqblNmCy87LLPE1UlrEiTPecpuYTmx0RoohyMvCvFM/zCC
	 jULyGZBPmZEhYYMsG2ZnI2ogvXq89snfMpvc5N7o=
Message-ID: <6eadf05f-21bf-47d7-abd8-e4694a21e6da@linux.microsoft.com>
Date: Tue, 3 Feb 2026 11:58:11 +0530
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] kbuild: Make --build-id linker flag configurable
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Masahiro Yamada <masahiroy@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Tamir Duberstein <tamird@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, Kees Cook <kees@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Saurabh Singh Sengar <ssengar@linux.microsoft.com>
References: <20260202110631.978412-1-namjain@linux.microsoft.com>
 <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <20260202151101-d5558a6f-88d0-41dd-8816-18957a029ce8@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.microsoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[linux.microsoft.com:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10985-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,arm.com,redhat.com,alien8.de,linux.intel.com,zytor.com,gmail.com,goodmis.org,vger.kernel.org,lists.infradead.org,linux.microsoft.com];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namjain@linux.microsoft.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[linux.microsoft.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,reproducible-builds.org:url]
X-Rspamd-Queue-Id: D3259D53A5
X-Rspamd-Action: no action



On 2/2/2026 7:45 PM, Thomas Weißschuh wrote:
> Hi Naman,
> 
> On Mon, Feb 02, 2026 at 11:06:31AM +0000, Naman Jain wrote:
>> Build ID hashes include file paths, so building the same source from
>> different directories produces different binaries. This breaks
>> reproducible builds.
>>
>> Add KBUILD_BUILD_ID variable (default: sha1) to allow overriding:
>>
>>      make KBUILD_BUILD_ID=none
>>
>> The variable is exported to VDSO Makefiles which also include a
>> fallback default for standalone invocation.
>>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>> Hi,
>> Sending this change for RFC, as it is quite possible that this is a
>> generic problem and I may be missing something.
>>
>> I am trying to implement reproducible builds for one of my product
>> kernel. I referred https://reproducible-builds.org/docs/build-path/
>> and tried to use both -fdebug-prefix-map=OLD=NEW and
>> -fmacro-prefix-map=OLD=NEW, but still could not achieve bit by bit
>> binary reproducibility without overwriting build-id to none.
>> If I move the kernel to same path in other setup, I was able to create
>> same binary hash, however, without it, there is some difference in
>> build-id hash values.
> 

Hi Thomas,
Thanks for looking into this and sharing your inputs.


> Can you force the same build path during package building?
> That should avoid this issue.

Since we can't control where the user would clone their kernel, I was 
initially skeptical to copy the kernel to a same build path like 
/tmp/kernel/src directory due to uncertainties related to free space, 
permissions, but I tried it now and it works fine. It should be OK for 
my use-case.

I am currently using NixOS for reproducible build environment.

> 
>> Reproducibility wiki says "In most cases however, post-processing is
>> required to either remove the build path or to normalize it to a
>> predefined value.". I have tried that, and it works, but wanted to
>> conclude if that is my last option here.
> 
> I am not a fan of this aproach. The build id should stay usable.
> Can you figure out where the build paths are used?
> You may need to also compare the debug symbols.
> 
>> Thanks.

I agree.
We did not have any use of these build paths, but some vendors may be 
using it to fetch the build information from the binaries.
If your comment was about in-kernel usage of these build paths, I'll 
look into it.

>>
>> ---
>>   Makefile                          | 8 ++++++--
>>   arch/arm64/kernel/vdso/Makefile   | 5 ++++-
>>   arch/arm64/kernel/vdso32/Makefile | 5 ++++-
>>   arch/x86/entry/vdso/Makefile      | 5 ++++-
>>   4 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 3373308d2217c..3fcff4af200d7 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1132,8 +1132,12 @@ KBUILD_AFLAGS   += $(KAFLAGS)
>>   KBUILD_CFLAGS   += $(KCFLAGS)
>>   KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
>>   
>> -KBUILD_LDFLAGS_MODULE += --build-id=sha1
>> -LDFLAGS_vmlinux += --build-id=sha1
>> +# Can be overridden for reproducible builds by using "make KBUILD_BUILD_ID=none"
>> +KBUILD_BUILD_ID ?= sha1
>> +export KBUILD_BUILD_ID
>> +
>> +KBUILD_LDFLAGS_MODULE += --build-id=$(KBUILD_BUILD_ID)
>> +LDFLAGS_vmlinux += --build-id=$(KBUILD_BUILD_ID)
>>   
>>   KBUILD_LDFLAGS	+= -z noexecstack
>>   ifeq ($(CONFIG_LD_IS_BFD),y)
>> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
>> index 7dec05dd33b70..b3ee5982b4676 100644
>> --- a/arch/arm64/kernel/vdso/Makefile
>> +++ b/arch/arm64/kernel/vdso/Makefile
>> @@ -9,6 +9,9 @@
>>   # Include the generic Makefile to check the built vdso.
>>   include $(srctree)/lib/vdso/Makefile.include
>>   
>> +# Fallback for standalone builds, normally inherited from top-level Makefile
>> +KBUILD_BUILD_ID ?= sha1
>> +
> 
> What kind of standalone builds?
> This doesn't look like it belongs into this patch.
> 
> (...)

The case I was trying to cover here was when we try to compile 
arch/x86/entry/vdso/ separately, without the KBUILD_BUILD_ID coming from 
main build scripts, "--build-id=" would be left empty, while we may want 
to retain original value i.e. sha1.

     make ARCH=x86_64 arch/x86/entry/vdso/


arch/x86/entry/vdso/Makefile:
-VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 --no-undefined \
+VDSO_LDFLAGS = -shared --hash-style=both --build-id=$(KBUILD_BUILD_ID) 
--no-undefined \

Anyways, this may not be required now.

Regards,
Naman

