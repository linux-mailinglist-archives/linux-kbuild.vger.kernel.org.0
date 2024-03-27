Return-Path: <linux-kbuild+bounces-1360-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EAF88D65E
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 07:31:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 591CD1F2A27C
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Mar 2024 06:31:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B571E16427;
	Wed, 27 Mar 2024 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aFBphJX/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62FE9CA78
	for <linux-kbuild@vger.kernel.org>; Wed, 27 Mar 2024 06:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521082; cv=none; b=DpxXv1nGfIqQNJw6PmtPFOyVvdlrDNzkGxBY2Miq2DWppc+VZ+CKK0O3HYDzfPKq6ryH701ReTQrGBxBxT6vrjXleHEltDtjjTw/sp9xAHi48ADuYCL9hMTIWmeMYTqDt1UmpdsE/uVz8xYAJuhulZASrXeIGFIzvx8di/xIx+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521082; c=relaxed/simple;
	bh=OwKcAPpt+uqc44w5yehqNJbdlh2gso2VkyD/bvoItO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qp+oyqo+M01sEixPkIWqhed9kpcviuOLdfOpmCs/TxQAot9fCq9F5GGVCawWCXUguLA26Y3PrQ0Xgy7O+xFxjO8ZJC+WNcxDXfz+9UOeU15LtjPF3XCpiZBePXv2n8hYmd32aR02IFPFDWCiSgnQneNXooaBheddd+eXChS8/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aFBphJX/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41494c6ee06so1441725e9.1
        for <linux-kbuild@vger.kernel.org>; Tue, 26 Mar 2024 23:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711521079; x=1712125879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhpFZQpOMPEuWhNyecOS9hDFqqTSnzNsHuwPkusroyo=;
        b=aFBphJX/dSIy7iDnAD7Cvap4BipjJruiLhZWYYyg16nVWMNMv7cChGFT3eQJb2gMnt
         JC7agz1busnPuEo0za3oI+/9u7z/e73bkQOmdqhqiiy8nHJKktvnG4iP96h19pap3Gzi
         UGrIsEVz3pTPqbtHJGXastLTxBJwhxxcqJuilsXi4Sn0MNz9XKYL8OU2BNcbt4Htls/L
         rOedFwhv4/3SLCRyuzgmhyFuEwa4/d0tVKAVsObOIFAV94zEf01986ZYvcbJeYI92rgO
         rwOHBfFmdVyuwli8QoKeXOQ8Voei39UWiMyOrC1SDPonW7i5DuVRR/Z2OdoquKEUlnuU
         abCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521079; x=1712125879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhpFZQpOMPEuWhNyecOS9hDFqqTSnzNsHuwPkusroyo=;
        b=A9PJcY4AeIoxOlkXoElfELV6YMCX4dMCJhILuKnrgNMWOhxOiAGt7ayTKoO0wwoVKV
         SvAgCuilavL3wqJfgNlk4kVGBr/SYDMUpXVGEmfdT43Na+nYGUYCdpVVo8DbCNKjK8Cp
         A2aCbKWsb0f50kVQ9NeyujIDu55tBjvdXgJbUQ7ijRhspe1edSr89w4OahfmRAcC/QoX
         q53RRT6/hCvF15vr3whXYnswuecIWeB0lMXnDVlrHy+lzBahXlcnlr1jHKNZxUovvN/C
         IJAagaLBg4N1t+njLItiS+1aPdykpWg2IRbcBf4xPWIKLBoJZa6hQ7a8YP14XPmsn8xn
         OIlw==
X-Forwarded-Encrypted: i=1; AJvYcCUMLhFU5JyOjzsVTx4qzJmPuQ0fwa3nM+fAhBPqNT/rD+aLxbCWrKnrRAIjDfY4e9hbHKQyDKC3Ee2ApSNUfEdF6R2RnWOnbavKFMjq
X-Gm-Message-State: AOJu0YwKjacqdmGZR3fGV4B5qRXmM1AembP16ifqbN2ecAhwqYmKRVr8
	XTQaqKo4810gyEIbAK0HIL/BxXPCuZlNPA361DtDSQX1mRpC0wgDmkYNN/gJ5KM=
X-Google-Smtp-Source: AGHT+IFzlt3YxD5jKTZanObeHfH9d1F6xQ36M0dYqgOuDwLds1IEr9IYVmG0v4sZ/5u7ki5AQIBhhw==
X-Received: by 2002:a05:600c:a47:b0:412:f572:5318 with SMTP id c7-20020a05600c0a4700b00412f5725318mr303758wmq.11.1711521078647;
        Tue, 26 Mar 2024 23:31:18 -0700 (PDT)
Received: from ?IPV6:2a10:bac0:b000:73fa:7285:c2ff:fedd:7e3a? ([2a10:bac0:b000:73fa:7285:c2ff:fedd:7e3a])
        by smtp.gmail.com with ESMTPSA id f6-20020a05600c4e8600b004148ff6ef54sm1113036wmq.29.2024.03.26.23.31.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 23:31:18 -0700 (PDT)
Message-ID: <26803d4f-0e58-4ca8-8f09-1a5d52a67ac4@suse.com>
Date: Wed, 27 Mar 2024 08:31:15 +0200
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kbuild: Disable KCSAN for autogenerated *.mod.c
 intermediaries
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org
Cc: Marco Elver <elver@google.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 LKML <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com,
 David Kaplan <David.Kaplan@amd.com>
References: <0851a207-7143-417e-be31-8bf2b3afb57d@molgen.mpg.de>
 <47e032a0-c9a0-4639-867b-cb3d67076eaf@suse.com>
 <20240326155247.GJZgLvT_AZi3XPPpBM@fat_crate.local>
 <80582244-8c1c-4eb4-8881-db68a1428817@suse.com>
 <20240326191211.GKZgMeC21uxi7H16o_@fat_crate.local>
 <CANpmjNOcKzEvLHoGGeL-boWDHJobwfwyVxUqMq2kWeka3N4tXA@mail.gmail.com>
 <20240326202548.GLZgMvTGpPfQcs2cQ_@fat_crate.local>
From: Nikolay Borisov <nik.borisov@suse.com>
In-Reply-To: <20240326202548.GLZgMvTGpPfQcs2cQ_@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26.03.24 г. 22:25 ч., Borislav Petkov wrote:
> On Tue, Mar 26, 2024 at 08:33:31PM +0100, Marco Elver wrote:
>> I think just removing instrumentation from the mod.c files is very reasonable.
> 
> Thanks!
> 
> @Masahiro: pls send this to Linus now as the commit which adds the
> warning is in 6.9 so we should make sure we release it with all issues
> fixed.
> 
> Thx.
> 
> ---
> From: "Borislav Petkov (AMD)" <bp@alien8.de>
> Date: Tue, 26 Mar 2024 21:11:01 +0100
> 
> When KCSAN and CONSTRUCTORS are enabled, one can trigger the
> 
>    "Unpatched return thunk in use. This should not happen!"
> 
> catch-all warning.
> 
> Usually, when objtool runs on the .o objects, it does generate a section
> .return_sites which contains all offsets in the objects to the return
> thunks of the functions present there. Those return thunks then get
> patched at runtime by the alternatives.
> 
> KCSAN and CONSTRUCTORS add this to the the object file's .text.startup
> section:
> 
>    -------------------
>    Disassembly of section .text.startup:
> 
>    ...
> 
>    0000000000000010 <_sub_I_00099_0>:
>      10:   f3 0f 1e fa             endbr64
>      14:   e8 00 00 00 00          call   19 <_sub_I_00099_0+0x9>
>                            15: R_X86_64_PLT32      __tsan_init-0x4
>      19:   e9 00 00 00 00          jmp    1e <__UNIQUE_ID___addressable_cryptd_alloc_aead349+0x6>
>                            1a: R_X86_64_PLT32      __x86_return_thunk-0x4
>    -------------------
> 
> which, if it is built as a module goes through the intermediary stage of
> creating a <module>.mod.c file which, when translated, receives a second
> constructor:
> 
>    -------------------
>    Disassembly of section .text.startup:
> 
>    0000000000000010 <_sub_I_00099_0>:
>      10:   f3 0f 1e fa             endbr64
>      14:   e8 00 00 00 00          call   19 <_sub_I_00099_0+0x9>
>                            15: R_X86_64_PLT32      __tsan_init-0x4
>      19:   e9 00 00 00 00          jmp    1e <_sub_I_00099_0+0xe>
>                            1a: R_X86_64_PLT32      __x86_return_thunk-0x4
> 
>    ...
> 
>    0000000000000030 <_sub_I_00099_0>:
>      30:   f3 0f 1e fa             endbr64
>      34:   e8 00 00 00 00          call   39 <_sub_I_00099_0+0x9>
>                            35: R_X86_64_PLT32      __tsan_init-0x4
>      39:   e9 00 00 00 00          jmp    3e <__ksymtab_cryptd_alloc_ahash+0x2>
>                            3a: R_X86_64_PLT32      __x86_return_thunk-0x4
>    -------------------
> 
> in the .ko file.
> 
> Objtool has run already so that second constructor's return thunk cannot
> be added to the .return_sites section and thus the return thunk remains
> unpatched and the warning rightfully fires.
> 
> Drop KCSAN flags from the mod.c generation stage as those constructors
> do not contain data races one would be interested about.
> 
> Debugged together with David Kaplan <David.Kaplan@amd.com> and Nikolay
> Borisov <nik.borisov@suse.com>.
> 
> Reported-by: Paul Menzel <pmenzel@molgen.mpg.de>
> Signed-off-by: Borislav Petkov (AMD) <bp@alien8.de>
> Link: https://lore.kernel.org/r/0851a207-7143-417e-be31-8bf2b3afb57d@molgen.mpg.de
> ---
>   scripts/Makefile.modfinal | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
> index 8568d256d6fb..79fcf2731686 100644
> --- a/scripts/Makefile.modfinal
> +++ b/scripts/Makefile.modfinal
> @@ -23,7 +23,7 @@ modname = $(notdir $(@:.mod.o=))
>   part-of-module = y
>   
>   quiet_cmd_cc_o_c = CC [M]  $@
> -      cmd_cc_o_c = $(CC) $(filter-out $(CC_FLAGS_CFI) $(CFLAGS_GCOV), $(c_flags)) -c -o $@ $<
> +      cmd_cc_o_c = $(CC) $(filter-out $(CC_FLAGS_CFI) $(CFLAGS_GCOV) $(CFLAGS_KCSAN), $(c_flags)) -c -o $@ $<
>   
>   %.mod.o: %.mod.c FORCE
>   	$(call if_changed_dep,cc_o_c)


Reviewed-by: Nikolay Borisov <nik.borisov@suse.com>

