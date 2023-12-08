Return-Path: <linux-kbuild+bounces-287-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF187809B2B
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 05:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA2FB1C20B7C
	for <lists+linux-kbuild@lfdr.de>; Fri,  8 Dec 2023 04:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1F54290F;
	Fri,  8 Dec 2023 04:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HvZSylFf"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1D73172C
	for <linux-kbuild@vger.kernel.org>; Thu,  7 Dec 2023 20:49:55 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-77f524597c3so4618885a.3
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Dec 2023 20:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702010995; x=1702615795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Siq5/aLB+N8os3ShA228wuqtqMbftMOZ84Ddlbg3k10=;
        b=HvZSylFfgTw4/EzNnDO7HhqVGULEsFS4BpNRhHitANhJH0km497hczzh2h0FSkm04n
         rhj6qopq70FRH1CUM4Y9Xk4rtusb1lYturbj18RmDBvPNCXSWQ6vyRLKsJBTwq6iyCVG
         KkXHhZZ2ZIcw1scjdvORIgojefYObOkKkeGMqDafxVQKG0EzjryltxHgqC+GcFKI5mh/
         hhf0M6b4/gcBrzpzgWw2v+yygjHulQHUBhB3OmbmbRcY/n+a+AMkAXmibaKSJaWf/AG2
         8A3uZyuYL+1JukY+iUs9Bv4H5l60aQ4jLEB2Y6VDEbnfnaC/FVzP5Vm3CczTO9e7dSO+
         fmeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702010995; x=1702615795;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Siq5/aLB+N8os3ShA228wuqtqMbftMOZ84Ddlbg3k10=;
        b=jLAAG008BzVMls0CXlv8P9yjvRRoJ1CoTeSm1DWUwUBj45VVgqzRmhw+/WfXXujVNf
         A3iN57D9bIYLuMjfSoyuNWt7uvaVTpS6uOgr77G7xh3POu/XUT80fx2nbgUNeva6bzCb
         grWaddaI6/JdT6iUai8D6TJlJq1WKHCvF6eIVMvhUOR1170tw74O058yywet3AhiiyLV
         vipkOQAuV08WngSGxl8irdn7khp+lIzHRqNC1+029vUiKp9ev+OYIp5S2AnOHyJ6VZm9
         QnaVNdq4bVG9zXEu/J6BREAfnUWACKF12+lVf8bvjL5XWyOH79Ujcs4Z2VPWNh0q+xJB
         3T+A==
X-Gm-Message-State: AOJu0YzQjU4XgAF0/nwNrWCRBc5HZuRJIPZXVrT79Z69kSaOom/kykq9
	eGAcW3FJgRLRdZNvBSWSdUAaow==
X-Google-Smtp-Source: AGHT+IFZn6XnJPcvVcVddGixsOUuewR/YlITPthokCfZLM+Gy+wdFy5aCuBE/cobBs7DetgZyfJ9UA==
X-Received: by 2002:a05:620a:1a8a:b0:77f:338c:a713 with SMTP id bl10-20020a05620a1a8a00b0077f338ca713mr2602110qkb.62.1702010994966;
        Thu, 07 Dec 2023 20:49:54 -0800 (PST)
Received: from ?IPV6:2600:1700:2000:b002:41c5:bf1:860b:1e95? ([2600:1700:2000:b002:41c5:bf1:860b:1e95])
        by smtp.gmail.com with ESMTPSA id ov11-20020a05620a628b00b0077f05db2663sm430776qkn.66.2023.12.07.20.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 20:49:54 -0800 (PST)
Message-ID: <6d4cecd5-9083-4d68-a7e2-266dae9e3952@sifive.com>
Date: Thu, 7 Dec 2023 22:49:53 -0600
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/amd/display: Support DRM_AMD_DC_FP on RISC-V
Content-Language: en-US
To: Christoph Hellwig <hch@infradead.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Pan Xinhui <Xinhui.Pan@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-kbuild@vger.kernel.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20231122030621.3759313-1-samuel.holland@sifive.com>
 <20231122030621.3759313-4-samuel.holland@sifive.com>
 <ZV2+f/yu3C6xTVqn@infradead.org>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <ZV2+f/yu3C6xTVqn@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Christoph,

On 2023-11-22 2:40 AM, Christoph Hellwig wrote:
>> -	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
>> +	select DRM_AMD_DC_FP if ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG
>> +	select DRM_AMD_DC_FP if PPC64 && ALTIVEC
>> +	select DRM_AMD_DC_FP if RISCV && FPU
>> +	select DRM_AMD_DC_FP if LOONGARCH || X86
> 
> This really is a mess.  Can you add a ARCH_HAS_KERNEL_FPU_SUPPORT
> symbol that all architetures that have it select instead, and them
> make DRM_AMD_DC_FP depend on it?

Yes, I have done this for v2, which I will send shortly.

>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>>  		kernel_fpu_begin();
>>  #elif defined(CONFIG_PPC64)
>>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
>> @@ -122,7 +124,7 @@ void dc_fpu_end(const char *function_name, const int line)
>>  
>>  	depth = __this_cpu_dec_return(fpu_recursion_depth);
>>  	if (depth == 0) {
>> -#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
>> +#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH) || defined(CONFIG_RISCV)
>>  		kernel_fpu_end();
>>  #elif defined(CONFIG_PPC64)
>>  		if (cpu_has_feature(CPU_FTR_VSX_COMP))
> 
> And then this mess can go away.  We'll need to decide if we want to
> cover all the in-kernel vector support as part of it, which would
> seem reasonable to me, or have a separate generic kernel_vector_begin
> with it's own option.

I think we may want to keep vector separate for performance on architectures
with separate FP and vector register files. For now, I have limited my changes
to FPU support only, which means I have removed VSX/Altivec from here; the
AMDGPU code doesn't need Altivec anyway.

>> diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> index ea7d60f9a9b4..5c8f840ef323 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> +++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
>> @@ -43,6 +43,12 @@ dml_ccflags := -mfpu=64
>>  dml_rcflags := -msoft-float
>>  endif
>>  
>> +ifdef CONFIG_RISCV
>> +include $(srctree)/arch/riscv/Makefile.isa
>> +# Remove V from the ISA string, like in arch/riscv/Makefile, but keep F and D.
>> +dml_ccflags := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
>> +endif
>> +
>>  ifdef CONFIG_CC_IS_GCC
>>  ifneq ($(call gcc-min-version, 70100),y)
>>  IS_OLD_GCC = 1
> 
> And this is again not really something we should be doing.
> Instead we need a generic way in Kconfig to enable FPU support
> for an object file or set of, that the arch support can hook
> into.

I've included this in v2 as well.

> Btw, I'm also really worried about folks using the FPU instructions
> outside the kernel_fpu_begin/end windows in general (not directly
> related to the RISC-V support).  Can we have objecttool checks
> for that similar to only allowing the unsafe uaccess in the
> uaccess begin/end pairs?

ARM partially enforces this at compile time: it disallows calling
kernel_neon_begin() inside a translation unit that has NEON enabled. That
doesn't prevent the programmer from calling a FPU-enabled function from outside
a begin/end section, but it does prevent the compiler from generating unexpected
FPU usage behind your back. I implemented this same functionality for RISC-V.

Actually tracking all possibly-FPU-tainted functions and their call sites is
probably possible, but a much larger task.

Regards,
Samuel


