Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF5011CCCC1
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 May 2020 19:50:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgEJRuK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 10 May 2020 13:50:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726744AbgEJRuK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 10 May 2020 13:50:10 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4239BC061A0C;
        Sun, 10 May 2020 10:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=6+0hqBa3ewO7D+7BOeRzGEBHEbr46c1CCbxLxiI0IS4=; b=YMZySFv5qmnzTKkkoA4yzp11MO
        z9jKcufeqIcTRS/ZTYvJ3GVu0Orfqqe13rkNLdiL9IJYHxYk7EmSavo6mxx4T48z/SmQCLJ0TaLlx
        y1QM+QJPPDL1XIZ8OqBIo1fttMk+YbWAmlR49O3WvzDllZzrN1+PFQat6Umq/HXbDvTnwcP3ozW0Q
        tcEFnMuqydtIJSsVUB3/16wmnny29Foe7KwZabNaeLVEIXRf9V3gTiTSmKePS+MhC5ijZ4B2CIRb+
        PlakRG++V4L0yETOJL1zCXUlI6ZAtD4hS45lD/24aQtkkbEjCjZpCpg5T7ccnWjzKc+9sVxQCxakH
        n1HWGkHA==;
Received: from [2601:1c0:6280:3f0:897c:6038:c71d:ecac]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jXq5X-0004N2-0I; Sun, 10 May 2020 17:50:07 +0000
Subject: Re: Using a custom LDFLAG for all objects and binaries
To:     Mahmood Naderan <mahmood.nt@gmail.com>
Cc:     linux-kernel@vger.kernel.org,
        linux-kbuild <linux-kbuild@vger.kernel.org>
References: <CADa2P2UP1AtEmQYtyqUFKVNz8Rxii+-Zut3ibc5pMYnQB90-zw@mail.gmail.com>
 <32637993-b73f-c2cb-6823-590c1638b5a6@infradead.org>
 <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <ff3401cc-e2c1-f510-c971-2151e9d540fe@infradead.org>
Date:   Sun, 10 May 2020 10:50:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CADa2P2UTMwwYPFLW+UM5FNBL+_8Pi_Am+saa+Y2ywpi0jPDvWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 5/10/20 10:13 AM, Mahmood Naderan wrote:
>> Have you read Documentation/kbuild/makefiles.rst ?
>>
>>     LDFLAGS
>>         Generic $(LD) options
>>
>>         Flags used for all invocations of the linker.
> 
> 
> What I see is this in Documentation/kbuild/makefiles.txt
> 
>     LDFLAGS             Generic $(LD) options
> 
>         Flags used for all invocations of the linker.
>         Often specifying the emulation is sufficient.
> 
>         Example:
>                 #arch/s390/Makefile
>                 LDFLAGS         := -m elf_s390
>         Note: ldflags-y can be used to further customise
>         the flags used. See chapter 3.7.
> 
> 
> 
> I have two questions then:
> 1- Can I use that as a bash variable? Like "LDFLAGS=--emit-relocs make"

I don't know. You could experiment with it to see.
(again by using 'make V=1' to see the commands that are being used)

> or
> 2- Editing arch/x86/Makefile with
>    KBUILD_LDFLAGS := -m --emit-relocs elf_$(UTS_MACHINE)

That should work.

> Thanks for your help.

It would be better to ask these questions on the linux-kbuild mailing list
(added now).

-- 
~Randy

