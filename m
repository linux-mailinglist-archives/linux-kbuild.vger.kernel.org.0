Return-Path: <linux-kbuild+bounces-8728-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 73337B44A00
	for <lists+linux-kbuild@lfdr.de>; Fri,  5 Sep 2025 00:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A42B4E0305
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Sep 2025 22:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B1A2F49F6;
	Thu,  4 Sep 2025 22:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YzfKQRY5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D92BE020;
	Thu,  4 Sep 2025 22:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026610; cv=none; b=bVMI9xH+IOKwzz+jdvDUNLHTp3FHCRofxhlcem1RjTdloIj8PFXRrhBV63gnPJfDUZP3vUTbO63phBoDHQ8xiLlmZzjfZlVTAb1oRFys/r4Os/LX+y3cW09v6HEXDjDJwuNgcxBGnBRZk7XICbrVa/4FEnHMLVDSMxLUXCtpqUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026610; c=relaxed/simple;
	bh=JYcdaBsJPM3aXP97DSmZE1zLWV6/mzt9FeGlt4RrHgc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Aq9mkqccDs03z5TI0EgJUkxBduZAjiLp5i+JI6PRYB4iiE2VVjvBfAjpUli57Z3VrxoeIBWMOO4peeCF7VLxnqVDWb7En3DCv5sO+fVwFYY5mH4qiKtZzIrpv+87FH9nBDEIRSU2d6MwN7xsQHtaEgVRA0TWxefPqWlehWJ73fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YzfKQRY5; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71d6014810fso16734267b3.0;
        Thu, 04 Sep 2025 15:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757026608; x=1757631408; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aZJsJ6Dias4aJk5oVm4edgReGaNhIOC6r9PNPMsZ5pk=;
        b=YzfKQRY5H0yB6DPUD6x6Ov5OC5QO+QVUy8Zkkde45zkB8QhGPYvqFN14LiwCcegYfw
         /ifoi42S0AsD6wnTgWLiAtXG6AWbhhFi7BBedlKm4b3QZDAAscsaeHNOlfoXU/rPnm1S
         Z9vyAiHFZ+1GSy0Sc4FP19uMQ4Y70UZ7KsE2d/QQCBuChMBLO6/ErdJ/Oi/9l8Z2QETs
         b5mrY7tzirXkwmKkqWZI3ZdvhO0iCnk7KKYf6fCsPfiNzRQ34sZvUQKKzJsIpY8u69Ue
         bf2d4H6aot2su19k577urmj4cOs808ePUPtRPrKG47VC+OxXZdmGmie1T9pGYgCEPLOE
         i6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757026608; x=1757631408;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZJsJ6Dias4aJk5oVm4edgReGaNhIOC6r9PNPMsZ5pk=;
        b=EjEr84bgGu6qNpeB15FKDhBi6W9zziBT01GbiB3BnPKEqANiEkAtB+itaQmreYGoQK
         Tw53gzbnfmU4JNgHRn9H7nUv5kbNhg9NtADwY+IhFbnjJyHf1HXUsxa4GizHRaP7jykC
         Jjtx0/qpCsjnkINQ5he79Flk8OIIojKEbxFRoYhT2SGvr9R9qCPzqKw10Hx648xOVp+p
         /SJasn+sUDfVJDwp+CBgr2AQIgqvC3KmmuNiSW9bVLwbv2dWrG6IbAcQulfeGXIaL/hJ
         3nSlssrbx4HWxTIDcsjASH3YN84d/6J0ycJLKuyssyRiRX6UTHTooixWMEdnLPKHD8cH
         YB1Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+CyvG32FLjWCM4qeMa+OU9GCj4fPfYxCsEkwtRbEnubs72XRDDNnRv1Q7TPxLeCBt2di2OvM6hjHRBot2@vger.kernel.org, AJvYcCV6h9VNVafkLEa9CIKyNV6lswKM3jgNotmluTtzWRJ5pHdqaKb3i+d+J/0pxggNGHJFNRA7YOi4fnd2sGg/@vger.kernel.org, AJvYcCVEJzr2VuKNe3TgQFQphJUOBEi1JqvKzpKHGkxI1tB+1BQ8gdi90mbHGlWEOKLVTWdb2fdNBQM/OSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjVYWmJlF2UbxtJdMOrwTVfvYFxAoksKMB9m2oLGMT5itrVchj
	/MwUgc3FTsB5botE9tUqTx3tx26w8EDGFxZaik8c6WnnmbhLbsiHEvxQ
X-Gm-Gg: ASbGncsVCmyuwxM+ybDv+nuGNFxnSmin5D+SQ/kqnYexduh3hbRcbiggDrpNFv44iJJ
	LZMoqlKYc4LwquZhbVTcNs5bJOUoiStnEsf0hufNABgKRLLk68CxHRHCpaFIDy5GX0VCysdZeZB
	Ra/hzrVL98qtfWccJPdX8bELisnaaKS7eVd+jp4w01uNqFwqCCdMPs3ulHt3It0ebp6o4UbTcyX
	fMzXBATueSNzl6mI3Xxj34cbxhLuVLvhIeJ1JqYS6I5bwZ1BT6zb35rzFJD1SfZfPAny1UzCFd0
	T+wQlSOv1HRtxmFnSEZOvqfWUq52+wG9vpJhS3b30cxawH/YT7kKQvamoL64/3qX/XUGKg59mTr
	BHhKFNQx0mgSfceMJC9kDkbRny30TmZEdTdwT7nf/jhJIwNRax3P9Hv3mXC9U8fA=
X-Google-Smtp-Source: AGHT+IEHGA0wsG9SM+lLIiJeqw57Hw+stWOBnY10zVsxOztzEXgl10NjAasmizVO1rfQqLWWpmuaDQ==
X-Received: by 2002:a05:690c:6a03:b0:724:c055:3cf3 with SMTP id 00721157ae682-724c0553f47mr40845437b3.14.1757026606920;
        Thu, 04 Sep 2025 15:56:46 -0700 (PDT)
Received: from [192.168.1.209] (74.211.99.176.16clouds.com. [74.211.99.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-723a855a865sm24681447b3.54.2025.09.04.15.56.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 15:56:46 -0700 (PDT)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
Date: Fri, 5 Sep 2025 06:56:35 +0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Conor Dooley <conor@kernel.org>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Masahiro Yamada <masahiroy@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Shakeel Butt <shakeel.butt@linux.dev>,
 Jan Hendrik Farr <kernel@jfarr.cc>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Christian Brauner <brauner@kernel.org>,
 Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
Content-Language: en-US
In-Reply-To: <20250904-sterilize-swagger-c7999b124e83@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

> One thing - please don't send new versions
> of patchsets in response to earlier versions or other threads. It
> doesn't do you any favours with mailbox visibility.

I apologize for this, I'm pretty much new to mailing lists, so I had 
followed the step "Explicit In-Reply-To headers" [1] in doc. For future 
patches I'll send them alone instead of replying to existing threads.

[1]: 
https://www.kernel.org/doc/html/v6.9/process/submitting-patches.html#explicit-in-reply-to-headers

> Other than Zicsr/Zifencei that may need explicit handling in a dedicated
> option, the approach here seems kinda backwards.
> Individually these symbols don't actually mean what they say they do,
> which is confusing: "recognises" here is true even when it may not be
> true at all because TOOLCHAIN_HAS_FOO is not set. Why can these options
> not be removed, and instead the TOOLCHAIN_HAS_FOO options grow a
> "depends on !RUST || <condition>"?

Yes, it's kinda "backwards", which is intentional, based on the 
following considerations:

1) As mentioned in rust/Makefile, filtering flags for libclang is a 
hack, because currently bindgen only has libclang as backend, and 
ideally bindgen should support GCC so that the passed CC flags are 
supposed to be fully compatible. On the RISC-V side, I tend to think 
that version checking for extensions for libclang is also a hack, which 
could have been accomplished with just the cc-option function, ideally.

2) Rust bindgen only "generates" FFI stuff, it is not involved in the 
final assembly stage. In other words, it doesn't matter so much what 
RISC-V extensions to turn on for bindgen (although it does have a little 
impact, like some macro switches), it's more matter to CC.

Therefore, I chose not to modify the original extension config 
conditions so that if libclang doesn't support the CC flag for an 
extension, then the Rust build is not supported, rather than treating 
the extension as not supported.

Nonetheless, it occurred to me as I was writing this reply that if GCC 
implements a new extension in the future that LLVM/Clang doesn't yet 
have, this could once again lead to a break in GCC+Rust build support if 
the kernel decides to use the new extension. So it's a trade-off, you 
guys decide, I'm fine with both.

Regarding the name, initially I named it "compatible", and ended up 
changed it to "recognize" before sending the patch. If we continue on 
this path, I'm not sure what name is appropriate to use here, do you 
guys have any ideas?

> What does the libclang >= 17 requirement actually do here? Is that the
> version where llvm starts to require that Zicsr/Zifencei is set in order
> to use them? I think a comment to that effect is required if so. This
> doesn't actually need to be blocking either, should just be able to
> filter it out of march when passing to bindgen, no?

libclang >= 17 starts recognizing Zicsr/Zifencei in -march, passing them 
to -march doesn't generate an error, and passing them or not doesn't 
have any real difference. (still follows ISA before version 20190608 -- 
Zicsr/Zifencei are included in base ISA). I should have written a 
comment there to avoid confusion.

Reference commit in LLVM/Clang 22e199e6af ("[RISCV] Accept zicsr and 
zifencei command line options")
https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16

> What about the case where TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI is not
> set at all? Currently your patch is going to block rust in that case,
> when actually nothing needs to be done at all - no part of the toolchain
> requires understanding Zicsr/Zifencei as standalone extensions in this
> case.

This is a bug, I missed this case. So it should be corrected to:

    config RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI
         def_bool y
         depends on TOOLCHAIN_NEEDS_OLD_ISA_SPEC ||
    !TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI ||
    RUST_BINDGEN_LIBCLANG_VERSION >= 170000


> The TOOLCHAIN_NEEDS_OLD_ISA_SPEC handling I don't remember 100% how it
> works, but if bindgen requires them to be set to use the extension
> this will return true but do nothing to add the extensions to march?
> That seems wrong to me.
> I'd be fairly amenable to disabling rust though when used in combination
> with gcc < 11.3 and gas >=2.36 since it's such a niche condition, rather
> doing work to support it. That'd be effectively an inversion of your
> first condition.

The current latest version of LLVM/Clang still does not require explicit 
Zicsr/Zifence to enable these two extensions, Clang just accepts them in 
-march and then silently ignores them.

Checking the usage of CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC:

    ifdef CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC
    KBUILD_CFLAGS += -Wa,-misa-spec=2.2
    KBUILD_AFLAGS += -Wa,-misa-spec=2.2
    else
    riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=
    $(riscv-march-y)_zicsr_zifencei
    endif

It just uses -Wa to force an older ISA version to GAS. So the 
RUST_BINDGEN_LIBCLANG_RECOGNIZES_ZICSR_ZIFENCEI I corrected above should 
be fine now I guess? Or would you still prefer your idea of blocking 
Rust if TOOLCHAIN_NEEDS_OLD_ISA_SPEC is true?

(To be clear, the breaking changes regarding Zicsr/Zifence are since ISA 
version 20190608, and versions 2.0, 2.1, 2.2 are older than 20190608)

The only thing I'm confused about is that according to the comment of 
TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI, GCC-12.1.0 bumped the default 
ISA to 20191213, but why doesn't the depends-on have condition || 
(CC_IS_GCC && GCC_VERSION >= 120100)?

Thanks for your detailed review.

