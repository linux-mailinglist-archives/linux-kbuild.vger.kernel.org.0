Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B962A1CCD2C
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 21:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729113AbgEJTI3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 May 2020 15:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728385AbgEJTI3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 15:08:29 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C01C061A0C;
        Sun, 10 May 2020 12:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=jyfzrM7jx8UkKgrYyqm9TZ9ytI+tCynSEk/Htl77plI=; b=XP6oOf4sGCMwfj3cgyuZdsepDt
        vpVlFLJYZf7FS6ITsfJG2j3MkTlVeifMMR48iGViaOm7IGTiCC96/hdTO9b5JBvZ9VHR6DQeyYtzk
        Z+kLe5VN15nB6k/JuJ8BD22wQ04ufSwiM8QcX+EixjCGTFu4Vr1lPnfmjK5wWOgia85Z5cj5Ctpra
        HnwpNYEM/lbOAmwuLdeCnGBb/GJZ7S5NSKYmHt7+SXX2eGSQIkyyAtgFYw7tUkRdf63sWPm+tkgKb
        ecRU4T2Z4BKe/uG1EUAUDhUr2m6jHhLvKaiBaYQgNq67+uMeOfRiehtUkHHaUiuL64FJG0BBNE6Io
        NqnlF8zg==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jXrJK-0005vz-Jt; Sun, 10 May 2020 19:08:26 +0000
Subject: Re: Using a custom LDFLAG for all objects and binaries
To:     Mahmood Naderan <mahmood.nt@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>
References: <CADa2P2UP1AtEmQYtyqUFKVNz8Rxii+-Zut3ibc5pMYnQB90-zw@mail.gmail.com>
 <32637993-b73f-c2cb-6823-590c1638b5a6@infradead.org>
 <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
 <ff3401cc-e2c1-f510-c971-2151e9d540fe@infradead.org>
 <CADa2P2VP6-aLgTqiTDpBjU+gnzT0dPT9SqGu9GY8c+OZ_xhfcw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a8c709ff-67df-09b6-25ff-a4b46a5a2a79@infradead.org>
Date:   Sun, 10 May 2020 12:08:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADa2P2VP6-aLgTqiTDpBjU+gnzT0dPT9SqGu9GY8c+OZ_xhfcw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/10/20 12:04 PM, Mahmood Naderan wrote:
>>> or
>>> 2- Editing arch/x86/Makefile with
>>>    KBUILD_LDFLAGS := -m --emit-relocs elf_$(UTS_MACHINE)
>>
>> That should work.
> 
> 
> Seems not... I ran the following commands:
> 
> $ cp -v /boot/config-$(uname -r) .config
> $ make menuconfig  -> Exit -> Save
> $ vim arch/x86/Makefile
>      KBUILD_LDFLAGS := -m --emit-relocs elf_$(UTS_MACHINE)
> $ make V=1

OK, I suggest that you reorder the options like so:

	KBUILD_LDFLAGS := -m elf_$(UTS_MACHINE) --emit-relocs

I.e., don't split -m and the machine type.


> This is the error that I get
> 
> make -f ./scripts/Makefile.build obj=usr need-builtin=1
> /bin/bash ./usr/gen_initramfs_list.sh -l -d > usr/.initramfs_data.cpio.d
> (cat /dev/null; ) > usr/modules.order
> make -f ./scripts/Makefile.build obj=arch/x86 need-builtin=1
> make -f ./scripts/Makefile.build obj=arch/x86/crypto need-builtin=1
> make -f ./scripts/Makefile.build obj=arch/x86/crypto/sha1-mb need-builtin=
> (cat /dev/null;   echo kernel/arch/x86/crypto/sha1-mb/sha1-mb.ko;) >
> arch/x86/crypto/sha1-mb/modules.order
>   ld -m --emit-relocs elf_x86_64     -r -o
> arch/x86/crypto/sha1-mb/sha1-mb.o arch/x86/crypto/sha1-mb/sha1_mb.o
> arch/x86/crypto/sha1-mb/sha1_mb_mgr_flush_avx2.o
> arch/x86/crypto/sha1-mb/sha1_mb_mgr_init_avx2.o
> arch/x86/crypto/sha1-mb/sha1_mb_mgr_submit_avx2.o
> arch/x86/crypto/sha1-mb/sha1_x8_avx2.o
> ld: unrecognised emulation mode: --emit-relocs
> Supported emulations: elf_x86_64 elf32_x86_64 elf_i386 elf_iamcu
> i386linux elf_l1om elf_k1om i386pep i386pe
> scripts/Makefile.build:516: recipe for target
> 'arch/x86/crypto/sha1-mb/sha1-mb.o' failed
> make[3]: *** [arch/x86/crypto/sha1-mb/sha1-mb.o] Error 1
> scripts/Makefile.build:544: recipe for target 'arch/x86/crypto/sha1-mb' failed
> make[2]: *** [arch/x86/crypto/sha1-mb] Error 2
> scripts/Makefile.build:544: recipe for target 'arch/x86/crypto' failed
> make[1]: *** [arch/x86/crypto] Error 2
> Makefile:1053: recipe for target 'arch/x86' failed
> make: *** [arch/x86] Error 2
> 
> 
> 
> 
> 
> ORIGINAL QUESTION:
> 
>> Hi
>> I would like to modify the kernel makefile in a way to include
>> --emit-relocs for every file that is linked during the process of
>> kernel make.
>> I see
>>
>> KBUILD_HOSTLDFLAGS  := $(HOST_LFS_LDFLAGS) $(HOSTLDFLAGS)
>> LDFLAGS_MODULE  =
>> LDFLAGS_vmlinux =
>> ...
>>
>> But I don't know which one is the main. Should I put that option in
>> front of every LD* variable? Or it is possible to apply one variable
>> for every file that is linked?
>> Appreciate your help.
>>
> 
> 
> Regards,
> Mahmood
> 


-- 
~Randy

