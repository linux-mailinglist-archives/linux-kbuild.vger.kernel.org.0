Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56C883D0041
	for <lists+linux-kbuild@lfdr.de>; Tue, 20 Jul 2021 19:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbhGTQuC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 20 Jul 2021 12:50:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:60670 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229627AbhGTQtu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Jul 2021 12:49:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B97260234;
        Tue, 20 Jul 2021 17:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626802228;
        bh=rp4ew6J2sHydARmRMQwoi0vEpfDpd+74XnQGCcoIBx8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sii3r5bFZKaSTH7De2GI/4VjUvtrVyVYbkXzLA4iN0dTTiaVCviTSNwnq72RkAYPQ
         gjmk3nBzPaQZs/P7AIQsF1EMsEZZR36nZaAGfnqgott+ePA9wD/eXHLBmUXOUbysQG
         FUuPfW2tZV3PGyKyKJa6v0FN5gliHFjiPzRloPA0f1UjI+OO1ifpxgn0Z7EFWLBIxC
         WpYWL5Ljzdyl+PTRb8ar/jieRFnEWRQMq+aA/AExQ6vEI+pFl/BcAhDI7UOkqofO10
         //Q1jmbhRtJ7lWuAkXQ3UHJsqjlU1LfpF994hCDrcdhMa5pfyxY0aIpaSg6ocY5Qct
         uzBEosMsez0TA==
Subject: Re: [PATCH v2 2/2] Makefile: infer CROSS_COMPILE from SRCARCH for
 LLVM=1 LLVM_IAS=1
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>, Fangrui Song <maskray@google.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christoph Hellwig <hch@infradead.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
References: <20210708232522.3118208-1-ndesaulniers@google.com>
 <20210708232522.3118208-3-ndesaulniers@google.com>
 <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <0636b417-15bb-3f65-39f7-148d94fe22db@kernel.org>
Date:   Tue, 20 Jul 2021 10:30:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNARye5Opc0AdXpn+DHB7hTaphoRSCUWxJgXu+sjuNjWUCg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 7/20/2021 1:04 AM, Masahiro Yamada wrote:
> On Fri, Jul 9, 2021 at 8:25 AM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
>>
>> We get constant feedback that the command line invocation of make is too
>> long. CROSS_COMPILE is helpful when a toolchain has a prefix of the
>> target triple, or is an absolute path outside of $PATH, but it's mostly
>> redundant for a given SRCARCH. SRCARCH itself is derived from ARCH
>> (normalized for a few different targets).
>>
>> If CROSS_COMPILE is not set, simply set --target= for CLANG_FLAGS,
>> KBUILD_CFLAGS, and KBUILD_AFLAGS based on $SRCARCH.
>>
>> Previously, we'd cross compile via:
>> $ ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- make LLVM=1 LLVM_IAS=1
>> Now:
>> $ ARCH=arm64 make LLVM=1 LLVM_IAS=1
>>
>> For native builds (not involving cross compilation) we now explicitly
>> specify a target triple rather than rely on the implicit host triple.
>>
>> Link: https://github.com/ClangBuiltLinux/linux/issues/1399
>> Suggested-by: Arnd Bergmann <arnd@kernel.org>
>> Suggested-by: Nathan Chancellor <nathan@kernel.org>
>> Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
>> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
>> ---
>> Changes v1 -> v2:
>> * Fix typos in commit message as per Geert and Masahiro.
>> * Use SRCARCH instead of ARCH, simplifying x86 handling, as per
>>    Masahiro. Add his sugguested by tag.
>> * change commit oneline from 'drop' to 'infer.'
>> * Add detail about explicit host --target and relationship of ARCH to
>>    SRCARCH, as per Masahiro.
>>
>> Changes RFC -> v1:
>> * Rebase onto linux-kbuild/for-next
>> * Keep full target triples since missing the gnueabi suffix messes up
>>    32b ARM. Drop Fangrui's sugguested by tag. Update commit message to
>>    drop references to arm64.
>> * Flush out TODOS.
>> * Add note about -EL/-EB, -m32/-m64.
>> * Add note to Documentation/.
>>
>>   Documentation/kbuild/llvm.rst |  5 +++++
>>   scripts/Makefile.clang        | 34 ++++++++++++++++++++++++++++++++--
>>   2 files changed, 37 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/kbuild/llvm.rst b/Documentation/kbuild/llvm.rst
>> index b18401d2ba82..80c63dd9a6d1 100644
>> --- a/Documentation/kbuild/llvm.rst
>> +++ b/Documentation/kbuild/llvm.rst
>> @@ -46,6 +46,11 @@ example: ::
>>
>>          clang --target=aarch64-linux-gnu foo.c
>>
>> +When both ``LLVM=1`` and ``LLVM_IAS=1`` are used, ``CROSS_COMPILE`` becomes
>> +unnecessary and can be inferred from ``ARCH``. Example: ::
>> +
>> +       ARCH=arm64 make LLVM=1 LLVM_IAS=1
>> +
>>   LLVM Utilities
>>   --------------
>>
>> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
>> index 297932e973d4..956603f56724 100644
>> --- a/scripts/Makefile.clang
>> +++ b/scripts/Makefile.clang
>> @@ -1,6 +1,36 @@
>> -ifneq ($(CROSS_COMPILE),)
>> +# Individual arch/{arch}/Makfiles should use -EL/-EB to set intended endianness
>> +# and -m32/-m64 to set word size based on Kconfigs instead of relying on the
>> +# target triple.
>> +ifeq ($(CROSS_COMPILE),)
>> +ifneq ($(LLVM),)
> 
> 
> Do you need to check $(LLVM) ?
> 
> 
> LLVM=1 is a convenient switch to change all the
> defaults, but yet you can flip each tool individually.
> 
> Instead of LLVM=1, you still should be able to
> get the equivalent setups by:
> 
> 
>    make CC=clang LD=ld.lld AR=llvm-ar OBJCOPY=llvm-objcopy ...
> 
> 
> The --target option is passed to only
> KBUILD_CFLAGS and KBUILD_AFLAGS.
> 
> So, when we talk about --target=,
> we only care about whether $(CC) is Clang.
> Not caring about $(AR), $(LD), or $(OBJCOPY).
> 
> 
> scripts/Makefile.clang is already guarded by:
> 
> ifneq ($(findstring clang,$(CC_VERSION_TEXT)),

$ make ARCH=arm64 CC=clang LLVM_IAS=1

will use the right compiler and assembler but none of the other binary 
tools because '--prefix=' will not be set so CROSS_COMPILE needs to be 
specified still, which defeats the purpose of this whole change. This 
patch is designed to work for the "normal" case of saying "I want to use 
all of the LLVM tools", not "I want to use clang by itself".

>> +ifeq ($(LLVM_IAS),1)
>> +ifeq ($(SRCARCH),arm)
>> +CLANG_FLAGS    += --target=arm-linux-gnueabi
>> +else ifeq ($(SRCARCH),arm64)
>> +CLANG_FLAGS    += --target=aarch64-linux-gnu
>> +else ifeq ($(SRCARCH),hexagon)
>> +CLANG_FLAGS    += --target=hexagon-linux-gnu
>> +else ifeq ($(SRCARCH),m68k)
>> +CLANG_FLAGS    += --target=m68k-linux-gnu
>> +else ifeq ($(SRCARCH),mips)
>> +CLANG_FLAGS    += --target=mipsel-linux-gnu
>> +else ifeq ($(SRCARCH),powerpc)
>> +CLANG_FLAGS    += --target=powerpc64le-linux-gnu
>> +else ifeq ($(SRCARCH),riscv)
>> +CLANG_FLAGS    += --target=riscv64-linux-gnu
>> +else ifeq ($(SRCARCH),s390)
>> +CLANG_FLAGS    += --target=s390x-linux-gnu
>> +else ifeq ($(SRCARCH),x86)
>> +CLANG_FLAGS    += --target=x86_64-linux-gnu
>> +else
>> +$(error Specify CROSS_COMPILE or add '--target=' option to scripts/Makefile.clang)
>> +endif # SRCARCH
>> +endif # LLVM_IAS
>> +endif # LLVM
>> +else
>>   CLANG_FLAGS    += --target=$(notdir $(CROSS_COMPILE:%-=%))
>> -endif
>> +endif # CROSS_COMPILE
>> +
>>   ifeq ($(LLVM_IAS),1)
>>   CLANG_FLAGS    += -integrated-as
>>   else
>> --
>> 2.32.0.93.g670b81a890-goog
>>
>> --
>> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210708232522.3118208-3-ndesaulniers%40google.com.
> 
> 
> 
