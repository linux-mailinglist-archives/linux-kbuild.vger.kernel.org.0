Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F1C1CCDE3
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 22:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729227AbgEJUa4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 May 2020 16:30:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728468AbgEJUa4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 16:30:56 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85CC8C061A0C;
        Sun, 10 May 2020 13:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=lbFI9MBD40QBYokysPHLxu6F41fz0KpiRSnXqnhfN8g=; b=NUhhd54+ZYe3CR+WRaIQU7YnbU
        sGWKq6LYixYvxdlKYJ4qd05yekwVJJIjHlm6g6WqBzhi0+EmDPAK8YRA9Le/ID5pNwr3AMdS3IKAb
        Cp6TfPiO2u8Pjlv6zuKfVH4GE2kuAzJYAZKZHrB/CJFZeKV8pvcYTxA+pwh03Ae4jIQXNhbYpm0S0
        NAmN+VEWt8jqqyi6Jjf/i4XhB2GHa/+7Q5t8INF7ma4I/p0wg6Hx1dq6CPKRCyY/c3SLRiZ1Syz/q
        2FGJbKRgOMN4mKUiJ5RdVX1jWb5iTWJOEpAADo+tBfKnmwEN1/fol8JM7yatvMkwg2sd2jG3iF/Se
        DjXU1KUg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jXsb7-0003zz-Gr; Sun, 10 May 2020 20:30:53 +0000
Subject: Re: Using a custom LDFLAG for all objects and binaries
To:     Mahmood Naderan <mahmood.nt@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>
References: <CADa2P2UP1AtEmQYtyqUFKVNz8Rxii+-Zut3ibc5pMYnQB90-zw@mail.gmail.com>
 <32637993-b73f-c2cb-6823-590c1638b5a6@infradead.org>
 <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
 <ff3401cc-e2c1-f510-c971-2151e9d540fe@infradead.org>
 <CADa2P2VP6-aLgTqiTDpBjU+gnzT0dPT9SqGu9GY8c+OZ_xhfcw@mail.gmail.com>
 <a8c709ff-67df-09b6-25ff-a4b46a5a2a79@infradead.org>
 <CADa2P2WqYxUjZWMYw5aq_5e8XLf8zRCnTsMaF98sFg8==F+WNw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ae0bfc33-312a-6163-9381-786db6264024@infradead.org>
Date:   Sun, 10 May 2020 13:30:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADa2P2WqYxUjZWMYw5aq_5e8XLf8zRCnTsMaF98sFg8==F+WNw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/10/20 12:53 PM, Mahmood Naderan wrote:
>> OK, I suggest that you reorder the options like so:
>>
>>        KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE) --emit-relocs
> 
> 
> I did that. After
> 
> $ make V=1
> $ sudo make modules_install V=1
> $ sudo make install
> 
> I grepped for "emit-relocs" in the log and saw many instances such as
> 
>   gcc -Wp,-MD,drivers/rtc/.rtc-ds1305.o.d  -nostdinc -isystem
> /usr/lib/gcc/x86_64-linux-gnu/5/include -I./arch/x86/include
> -I./arch/x86/include/generated  -I./include -I./arch/x86/include/uapi
> -I./arch/x86/include/generated/uapi -I./include/uapi
> -I./include/generated/uapi -include ./include/linux/kconfig.h -include
> ./include/linux/compiler_types.h -D__KERNEL__ -Wall -Wundef
> -Wstrict-prototypes -Wno-trigraphs -fno-strict-aliasing -fno-common
> -fshort-wchar -Werror-implicit-function-declaration
> -Wno-format-security -std=gnu89 -fno-PIE -mno-sse -mno-mmx -mno-sse2
> -mno-3dnow -mno-avx -m64 -falign-jumps=1 -falign-loops=1 -mno-80387
> -mno-fp-ret-in-387 -mpreferred-stack-boundary=3 -mskip-rax-setup
> -mtune=generic -mno-red-zone -mcmodel=kernel -funit-at-a-time
> -DCONFIG_X86_X32_ABI -DCONFIG_AS_CFI=1 -DCONFIG_AS_CFI_SIGNAL_FRAME=1
> -DCONFIG_AS_CFI_SECTIONS=1 -DCONFIG_AS_FXSAVEQ=1 -DCONFIG_AS_SSSE3=1
> -DCONFIG_AS_CRC32=1 -DCONFIG_AS_AVX=1 -DCONFIG_AS_AVX2=1
> -DCONFIG_AS_AVX512=1 -DCONFIG_AS_SHA1_NI=1 -DCONFIG_AS_SHA256_NI=1
> -pipe -Wno-sign-compare -fno-asynchronous-unwind-tables
> -mindirect-branch=thunk-extern -mindirect-branch-register
> -fno-jump-tables -fno-delete-null-pointer-checks -O2
> --param=allow-store-data-races=0 -Wframe-larger-than=1024
> -fstack-protector-strong -Wno-unused-but-set-variable
> -fno-omit-frame-pointer -fno-optimize-sibling-calls
> -fno-var-tracking-assignments -g -gdwarf-4 -pg -mrecord-mcount
> -mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement
> -Wno-pointer-sign -fno-strict-overflow -fno-merge-all-constants
> -fmerge-constants -fno-stack-check -fconserve-stack
> -Werror=implicit-int -Werror=strict-prototypes -Werror=date-time
> -Werror=incompatible-pointer-types -Werror=designated-init  -DMODULE
> -DKBUILD_BASENAME='"rtc_ds1305"' -DKBUILD_MODNAME='"rtc_ds1305"' -c -o
> drivers/rtc/rtc-ds1305.o drivers/rtc/rtc-ds1305.c
>    ./tools/objtool/objtool check  --module --retpoline
> "drivers/scsi/aacraid/dpcsup.o";
> 
> OR
> 
>   ld -r -m elf_x86_64 --emit-relocs  -z max-page-size=0x200000 -T
> ./scripts/module-common.lds  --build-id  -o
> sound/usb/line6/snd-usb-line6.ko sound/usb/line6/snd-usb-line6.o
> sound/usb/line6/snd-usb-line6.mod.o ;  true
> 
> 
> 
> I guess that all kernel modules are now use --emit-relocs.
> I would like to be sure that libc and those files related to syscalls
> are also using that.
> 
> I grepped for "libc.so" but it seems that there is no such match.
> Did I miss something?

The kernel doesn't use libc...

-- 
~Randy

