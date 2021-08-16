Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DFD53EDEC4
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Aug 2021 22:50:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231783AbhHPUuv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 16:50:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:49758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231698AbhHPUuu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 16:50:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7DCD760560;
        Mon, 16 Aug 2021 20:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629147018;
        bh=wISwkjHTfTAUWw1Z6yZ0IudlKaSouuWuR/XqPDC8g9M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SZD/PpQcB1eCBfJTu/63I3U1DRoFamChOETPIGXlHcxDGok6BOtXsXeDdENSoimto
         XXGOQ6hjqi7nmllM4tketbnUOV49qKQ/h3CKXyLigmoitxyAUQSVyqepSisuTPhFDR
         ceBCAEYpGU3i1Ff+OXWYonpxnRxv83D+ZlZlP0nx6ciMPmbCA38ADr9TiEVBD2mDzO
         L5j0Q0AikepAFFM4+0MYbEUWGGJE/EKMpR91dwRtr5H5lJoEG9u7xl8aZvH64e0vAS
         B5OuxJ8TbYyv8NyM+md0wTiJvF9a50hk3QTA/3sdZUs4D8vfzoYfLquV22PqDLYZYM
         x3z6q4XZOQvQw==
Subject: Re: [PATCH] kbuild: Switch to 'f' variants of integrated assembler
 flag
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
References: <20210816203635.53864-1-nathan@kernel.org>
 <CAKwvOd=+rn-xyHrX=P=B19EJ8MSmDvQt8oU+QD=59KUHOC7R=A@mail.gmail.com>
From:   Nathan Chancellor <nathan@kernel.org>
Message-ID: <d2e4e93c-a54d-ec38-e6e7-dce5e082ea12@kernel.org>
Date:   Mon, 16 Aug 2021 13:50:17 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=+rn-xyHrX=P=B19EJ8MSmDvQt8oU+QD=59KUHOC7R=A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 8/16/2021 1:48 PM, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Mon, Aug 16, 2021 at 1:37 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> It has been brought up a few times in various code reviews that clang
>> 3.5 introduced -f{,no-}integrated-as as the preferred way to enable and
>> disable the integrated assembler, mentioning that -{no-,}integrated-as
>> are now considered legacy flags.
>>
>> Switch the kernel over to using those variants in case there is ever a
>> time where clang decides to remove the non-'f' variants of the flag.
>>
>> Link: https://releases.llvm.org/3.5.0/tools/clang/docs/ReleaseNotes.html#new-compiler-flags
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Thanks for the patch! Want to fix
> tools/testing/selftests/rseq/Makefile and
> tools/testing/selftests/sched/Makefile, too? Either way...
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Yes, I was planning to in a separate patch due to different maintainers :)

>> ---
>>   scripts/Makefile.clang | 4 ++--
>>   scripts/as-version.sh  | 6 +++---
>>   2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/scripts/Makefile.clang b/scripts/Makefile.clang
>> index 3ae63bd35582..4cce8fd0779c 100644
>> --- a/scripts/Makefile.clang
>> +++ b/scripts/Makefile.clang
>> @@ -23,11 +23,11 @@ CLANG_FLAGS += --target=$(notdir $(CROSS_COMPILE:%-=%))
>>   endif # CROSS_COMPILE
>>
>>   ifeq ($(LLVM_IAS),0)
>> -CLANG_FLAGS    += -no-integrated-as
>> +CLANG_FLAGS    += -fno-integrated-as
>>   GCC_TOOLCHAIN_DIR := $(dir $(shell which $(CROSS_COMPILE)elfedit))
>>   CLANG_FLAGS    += --prefix=$(GCC_TOOLCHAIN_DIR)$(notdir $(CROSS_COMPILE))
>>   else
>> -CLANG_FLAGS    += -integrated-as
>> +CLANG_FLAGS    += -fintegrated-as
>>   endif
>>   CLANG_FLAGS    += -Werror=unknown-warning-option
>>   KBUILD_CFLAGS  += $(CLANG_FLAGS)
>> diff --git a/scripts/as-version.sh b/scripts/as-version.sh
>> index 8b9410e329df..a0fc366728f1 100755
>> --- a/scripts/as-version.sh
>> +++ b/scripts/as-version.sh
>> @@ -21,13 +21,13 @@ get_canonical_version()
>>          echo $((10000 * $1 + 100 * ${2:-0} + ${3:-0}))
>>   }
>>
>> -# Clang fails to handle -Wa,--version unless -no-integrated-as is given.
>> -# We check -(f)integrated-as, expecting it is explicitly passed in for the
>> +# Clang fails to handle -Wa,--version unless -fno-integrated-as is given.
>> +# We check -fintegrated-as, expecting it is explicitly passed in for the
>>   # integrated assembler case.
>>   check_integrated_as()
>>   {
>>          while [ $# -gt 0 ]; do
>> -               if [ "$1" = -integrated-as -o "$1" = -fintegrated-as ]; then
>> +               if [ "$1" = -fintegrated-as ]; then
>>                          # For the intergrated assembler, we do not check the
> 
> ^ want to fix this typo, too? s/intergrated/integrated/

Sounds good, v2 inc.

>>                          # version here. It is the same as the clang version, and
>>                          # it has been already checked by scripts/cc-version.sh.
>>
>> base-commit: f12b034afeb3a977bbb1c6584dedc0f3dc666f14
>> --
>> 2.33.0.rc2
>>
> 
> 
