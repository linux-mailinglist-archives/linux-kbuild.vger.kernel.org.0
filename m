Return-Path: <linux-kbuild+bounces-5714-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DA6A3105B
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 16:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBA23188ADB5
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 15:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A10A253B4C;
	Tue, 11 Feb 2025 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="h9LP7Sho"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out.smtpout.orange.fr (out-18.smtpout.orange.fr [193.252.22.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD67253B7E;
	Tue, 11 Feb 2025 15:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289326; cv=none; b=NInUSLwSVnnbfFrejFK6OeZhXYh3BslmVTYsGhBs9oxeoWAMDh9PYLtj1NRY+1hOApfCW4+acZOhEZBO8S5eFCOfDhnTNZkstKkkgxb5Ufq1UaB4wh6uLn6sOyd66h1OJvrCbCs0cLm3xs+USPD2NBDwP2czcnPdAsQMeeT0ZrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289326; c=relaxed/simple;
	bh=V7PNzMQxo4TZt8aGdWHlswy9qpNZDfS8SdTYmYF0L0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cSji64wkM/aOe01gl6NLkT8CaDx21ZMaJrLM6Xi6PrPvcpAE2VzkWMjMIIB2L2M9pz9iZ1z57ogsQKQXL13/xshZSSvQDtINb/PI8X8FXvsehqpqxdgbMn/Ca18CsAZtp5ytEPYzruxl3vw3GMkaWVSUHC1gPSuFpOZ30SidD9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=h9LP7Sho; arc=none smtp.client-ip=193.252.22.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id hsaAtxLjmxCt3hsaFtr2nX; Tue, 11 Feb 2025 16:54:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1739289243;
	bh=yEXqa7YNuavn2wejrOqytQlQCFtdPpma1qWJYMlGod4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=h9LP7ShouuH5wwXcpT6iyJcABUFta9nu7NV1izfueKrKQzK1G95xMxCfl0oN7Tcal
	 7RdaxhhGQcy+hx4Jz97dJt+aKRll77xWhr29qtitGzpTizwLAyxawT6zeV3+XQFWAT
	 DdmNWhcLLu9w9kYfU3NutVvs9itcVOhRQopsyZf1rk84+wGoDtDgHvMAfhWpCpu+gT
	 64i+xg+AobM3iXePjm88jsm5TZgBwgp1jWu4hGZrj970gM/Q1TbWY/Z0D1cc8455TW
	 L8gMxBLI7Ja70akhqcPJVe9nwMXckmDTqRQ3NK48GJQuPhys6s0D0wPjWuh5Kpqpca
	 Gw8WPqkeiiBlg==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Tue, 11 Feb 2025 16:54:03 +0100
X-ME-IP: 124.33.176.97
Message-ID: <a18675a5-41e5-4646-83a2-fe06e2014aae@wanadoo.fr>
Date: Wed, 12 Feb 2025 00:53:53 +0900
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux/bits.h: Squash unsigned comparison warning for
 GENMASK
To: Yury Norov <yury.norov@gmail.com>, Yazen Ghannam <yazen.ghannam@amd.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Kees Cook <kees@kernel.org>,
 Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>,
 linux-kbuild@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
References: <20250204-fix-genmask-warn-v1-1-626de7a30090@amd.com>
 <Z6KF8UBsQ4NmR9KS@thinkpad> <20250205170651.GA56382@yaz-khff2.amd.com>
 <Z6PRRXgYYEoMbjsp@thinkpad> <20250206020227.GA322224@yaz-khff2.amd.com>
 <Z6T3Dv09chNN3lh5@thinkpad>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <Z6T3Dv09chNN3lh5@thinkpad>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Because this is more a discussion on build flags than on GENMASK(), I am
adding the maintainers of scripts/Makefile.extrawarn in CC:

+CC: Masahiro Yamada <masahiroy@kernel.org>
+CC: Nathan Chancellor <nathan@kernel.org>
+CC: Nicolas Schier <nicolas@fjasle.eu>
+CC: linux-kbuild@vger.kernel.org

On 07/02/2025 at 02:53, Yury Norov wrote:
> Add a couple of compiler experts.
> 
> On Wed, Feb 05, 2025 at 09:02:27PM -0500, Yazen Ghannam wrote:
>> On Wed, Feb 05, 2025 at 03:59:49PM -0500, Yury Norov wrote:
>>> On Wed, Feb 05, 2025 at 12:06:51PM -0500, Yazen Ghannam wrote:
>>>> On Tue, Feb 04, 2025 at 04:26:20PM -0500, Yury Norov wrote:
>>>>> On Tue, Feb 04, 2025 at 05:13:16PM +0000, Yazen Ghannam wrote:
>>>>>> Cast inputs to 'long' to avoid the following 'type-limits' warning:
>>>>>>   warning: comparison of unsigned expression in ‘< 0’ is always false
>>>>>>
>>>>>> The 'long' type can hold +/- 2G which far exceeds valid inputs for the
>>>>>> GENMASK helpers (current max use is 128 bits).
>>>>>>
>>>>>> Idea is similar to implementation in __is_nonneg().
>>>>>>
>>>>>> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
>>>>>> ---
>>>>>> Note to maintainers:
>>>>>> I found some previous discussions on this topic in the mailing list
>>>>>> archives. The upstream code has changed a bit since then, and this
>>>>>> proposed solution seems fairly simple when based on the latest code.
>>>>>>
>>>>>> I figured I'd look at something outside my normal focus areas. I
>>>>>> apologize for the noise if this solution is too naive or incomplete.
>>>>>>
>>>>>> Thanks!
>>>>>
>>>>> Hi Yazen,
>>>>>
>>>>> Wtype-limits is enabled in W=2 only, see scripts/Makefile.extrawarn.
>>>>> We normally shouldn't see this type of warnings even when compiling
>>>>> with W=1, at all. 
>>>>>
>>>>> We have quite a lot callers in kernel already that do GENMASK(xxx, 0)
>>>>>
>>>>>   yury:linux$ git grep GENMASK | grep 0\) | wc -l
>>>>>   13788
>>>>>
>>>>> And nobody complained so far. 

I complained, but I was NAKed by Linus :)

  Link:
https://lore.kernel.org/all/CAHk-=whvGWbpsTa538CvQ9e=VF+m8WPQmES2y6-=0=-64uGkgg@mail.gmail.com/

Because this is an old discussion, let me summarize it here. My past
complain is that this -Wtype-limits warning is on an header file, as
such it pollutes the error log of other files.

When I compile my file, I want to see my warnings, not other people's one.

And we are not speaking of a few lines of spam. This
GENMASK_INPUT_CHECK() is responsible of the vast majority of all W=12
warning. For example, on a defconfig (minus CONFIG_WERROR):

  $ make W=12 -j8 2>&1 >/dev/null | \
      sed -n "s/\(^.*:\).*\(\[-W.*\]\)/\1 \2/p" | \
      sort | uniq -c | sort -rn | head -n5
    50276 ./include/linux/bits.h:24:68: warning: [-Wtype-limits]
    12194 ./include/linux/minmax.h:68:57: warning: [-Wtype-limits]
      564 ./include/linux/container_of.h:19:15: warning: [-Wshadow]
      327 ./include/linux/overflow.h:215:13: warning: [-Wtype-limits]
      327 ./include/linux/overflow.h:214:21: warning: [-Wtype-limits]

Incontestable victory of GENMASK_INPUT_CHECK() as the biggest W=2 spam
(if I do the full stats, this single line in bits.h represent 75% of all
warnings on the defconfig build).

My honest opinion is that the top two warnings of this list should be fixed.

>>>> Right, this is with W=2.
>>>  
>>>> I focus mostly on x86 MCE, and I was doing some extra checking.
>>>>
>>>>>
>>>>> Still, I tried to compile a small userspace app that calls
>>>>> __GENMASK(10,0), and found no warnings with Wall, Wextra and
>>>>> Wtype-limits enabled.
>>>>
>>>> The warning comes from the GENMASK_INPUT_CHECK(). Using __GENMASK()
>>>> would bypass this, correct?
>>>
>>> Yeah.. I actually tried GENMASK(). This is my code. (I have to pull
>>> more macros because I run it against Ubuntu 6.8.0-52-generic kernel)
>>>
>>>   $ cat tst.c
>>>   #include <linux/const.h>
>>>   #include <stdio.h>
>>>   
>>>   #define false 0
>>>   #define __is_constexpr(x) \
>>>           (sizeof(int) == sizeof(*(8 ? ((void *)((long)(x) * 0l)) : (int *)8)))
>>>   #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
>>>   #define const_true(x) __builtin_choose_expr(__is_constexpr(x), x, false)
>>>   
>>>   #define __BITS_PER_LONG (64)
>>>   #define __GENMASK(h, l) \
>>>           (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
>>>            (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
>>>   
>>>   #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>>>   #define GENMASK(h, l) (GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
>>>   
>>>   int main()
>>>   {
>>>   	printf("%lx\n", GENMASK(10,0));
>>>   	return 0;
>>>   }
>>>   $ gcc -Wall -Wextra -Wtype-limits tst.c ; ./a.out
>>>   7ff
>>>   $ gcc --version
>>>   gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
>>>   Copyright (C) 2023 Free Software Foundation, Inc.
>>>   This is free software; see the source for copying conditions.  There is NO
>>>   warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
>>>
>>>>> Can you share more about your compiler, compilation command and config?
>>>>
>>>> Compilers with warning: GCC 13 and 14
>>>> Compilation command:    make W=2 arch/x86/kernel/cpu/mce/
>>>> Config:                 make defconfig (on x86_64)
>>>>
>>>> I don't see the same warnings with LLVM/clang. The '-Wextra' flag does
>>>> not include '-Wtype-limits' (at least on clang 18 and 19). But I still
>>>> don't see the same warning when I add it.
>>>
>>> This looks like a specific compiler issue. Nothing to fix on kernel
>>> side, but you may want to file a bug in GCC.
>>>
>>
>> I'm able to reproduce the issue with your test code by using a variable
>> for the 'h' parameter. I assume many of the warnings around the kernel
>> may fall into this case, i.e. 'h' is 'unsigned' variable and 'l' is '0'.
>>
>> >From the GCC docs:
>> Warn if a comparison is always true or always false due to the limited
>> range of the data type, but do not warn for constant expressions.
>>
>> So it seems the warning only applies to non-constant expression, hence
>> the need for the 'h' parameter to be a unsigned variable to trip the
>> warning.
>>
>> My changes to your tst.c:
>>
>> 	int main(void)
>> 	{
>> 	        unsigned int TEST;
> 
> Uninitialized?
> 
>> 	
>> 	        printf("%lx\n", GENMASK(TEST,0));
>> 	        return 0;
>> 	}
> 
> I also tried some combinations, and it makes no sense to me.
> 'const unsigned int' should definitely help to evaluate this
> expression at compile time:
>  
>         const unsigned int h = 10;
>         printf("%lx\n", GENMASK(h, 0));
> 
> But gcc -Wall -Wextra -Wtype-limits tst.c doesn't think so.
> 
> I can understand why Wtype-limits is happy with 'int h = 10, l=0'.
> I can't understand why it's happy with the 'unsigned int h = 10, l=0',
> and at the same time is not happy with the above.

The warning is silenced on integer constant expression. Here, unsigned
int h is not an integer constant expression (yes, this is confusing, but
in C the const qualifier does not declare constant expressions, you need
the C23 constexpr qualifier for that). So you are getting the warning.

It is happy with int h = 10, l = 0 because here, it is not a tautology.

>> When compiling and keeping the intermediate files, I see the following
>> for the __is_constexpr() macro:
>>
>> (sizeof(int) == sizeof(*(8 ? ((void *)((long)((0) > (TEST)) * 0l)) : (int *)8))), (0) > (TEST), 0)))
>>
>> The "(0) > (TEST)" check seems to be the issue in that "TEST" is
>> 'unsigned int'. So it seems that the GCC warning is correct, AFAICT.
>>
>> Clang generates the same code, but doesn't complain. So I'm inclined to
>> think something is different with its checking. It does catch a simple
>> case like "if (0 > TEST)", so maybe there's something that gets applied
>> differently through the macros.
>>
>> Maybe Clang immediately fails the __builtin_choose_expr() check when it
>> sees that any part of the 'const_exp' is a variable. And it short
>> circuits its warning checks. If so, then this could be a limitation in
>> GCC. Of course, this is just conjecture from me.
>>
>> We could ignore the warning or do more complex type checking. Though a
>> simple fix is to reverse the conditional. Please see the patch below.
>  
> You can try something more complex, just keep in mind that from kernel
> perspective, we'd like to be able to call GENMASK() with non-constant
> high and/or low limits, as soon as the 'l > h' combination eventually
> evaluates to a const expression. For example, in linux/find.h
> we call GENMASK() like this:
> 
>         if (small_const_nbits(size)) {
>                 unsigned long val;
> 
>                 if (unlikely(offset >= size))
>                         return size;
> 
>                 val = *addr1 & *addr2 & GENMASK(size - 1, offset);
>                 return val ? __ffs(val) : size;
>         }
> 
> In lib/test_bitmap.h we've got this:
> 
>         for (nbits = 0; nbits < EXP1_IN_BITS; ++nbits) {
>                 ...
>                 GENMASK_ULL((nbits - 1) % 64, 0));
>         }
> 
> I would like to keep both examples working.
> 
>> In any case, this was an interesting topic. :)
>>
>> Thanks,
>> Yazen
>>
>> >From 00e95116ef5a971e53e49b732839edd5d0887545 Mon Sep 17 00:00:00 2001
>> From: Yazen Ghannam <yazen.ghannam@amd.com>
>> Date: Mon, 3 Feb 2025 18:44:33 +0000
>> Subject: [PATCH] linux/bits.h: Squash unsigned comparison warning for GENMASK
>> MIME-Version: 1.0
>> Content-Type: text/plain; charset=UTF-8
>> Content-Transfer-Encoding: 8bit
>>
>> Invert conditionals to avoid the following 'type-limits' warning:
>>   warning: comparison of unsigned expression in ‘< 0’ is always false
>>
>> The warning is enabled with W=2 and is present on GCC.
>>
>> Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
>> ---
>>  include/linux/bits.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/include/linux/bits.h b/include/linux/bits.h
>> index 61a75d3f294b..45f70fb56ac3 100644
>> --- a/include/linux/bits.h
>> +++ b/include/linux/bits.h
>> @@ -21,7 +21,7 @@
>>  #if !defined(__ASSEMBLY__)
>>  #include <linux/build_bug.h>
>>  #include <linux/compiler.h>
>> -#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>> +#define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true(!((l) < (h))))
> 
> (l > h) negation would be: !(l <= h). And if you do this properly, the
> warning will stay there.

The easiest fix is, I think:

  #define GENMASK_INPUT_CHECK(h, l) \
  	BUILD_BUG_ON_ZERO(const_true((l) > (int)(h)))

The warning only occurs when l is zero, only h need to be casted to a
signed integer. And the lost of precision is not an issue either, out of
bound numbers are already caught by -Wshift-count-overflow.

> Maybe true compiler gurus will help...

I am not the compiler guru, but I know a bit of this subject to shed
some lights.

So, that warning is implemented similarly in clang and gcc: it warn for
tautologies in comparisons only if the operand being compared is not an
integer constant expression. So:

  0 > 42U		/* OK: tautology but constant expression */
  0 > signed_var	/* OK: not a tautology */
  0 > unsigned_var	/* Warning: tautology and
			 * non constant expression */

Where gcc and clang differs is on the implementation of
__builtin_choose_expr(). clang will only emit a warning if it is on the
chosen expression, gcc will warn even if the expression is discarded. So:

  __builtin_choose_expr(__builtin_constant_p(a), 0 > unsigned_var, 0);

will only yield a warning on gcc.

This is a godbolt link with above examples:

  https://godbolt.org/z/nzxaP1oqe

Note that this is consistent with gcc documentation, I quote:

  Furthermore, the unused expression (exp1 or exp2 depending on the
  value of const_exp) may still generate syntax errors.


https://gcc.gnu.org/onlinedocs/gcc/Other-Builtins.html#index-_005f_005fbuiltin_005fchoose_005fexpr

In summary, in , the warning only occurs when the the results is discarded.

> Thanks,
> Yury
> 
>>  #else
>>  /*
>>   * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>> -- 
>> 2.43.0
> 

-- 
Yours sincerely,
Vincent Mailhol


