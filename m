Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4FBF57E5034
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Nov 2023 07:00:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbjKHGAu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Nov 2023 01:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjKHGAt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Nov 2023 01:00:49 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D58AD41
        for <linux-kbuild@vger.kernel.org>; Tue,  7 Nov 2023 22:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
        Message-ID:Sender:Reply-To:Content-ID:Content-Description;
        bh=QBid7HVCoGvEDVq1twLH9v7Uua/NFPJbcJ/bw5jpTFU=; b=sPLq70b/uLcR3Uv0J6xzSzXPi9
        uN8REg2gN5PZ9AW6ajXuYUnOcGp2KVdH+mtqf18b9xHrqqQLHH9Bv43z5SqFsVHUyX4SU3gIfZLDc
        f2WlnN97Scu4hOxmwnQNCUiW+vKK3/eYrVOAjsaUhNLCk7LLVAqrM1ArxGgyPwmSNoAXauWX1cKv1
        8w6gGW97wcskjw24x12zXUTgKkrLFJR4pdJs17D/ol8Ofu91Y2Sox5kIYsE4ERA9XXvZiZ2hFf4RY
        pGyRC2iXQ9trm6MEMJDggJhbD2mBZA+4oZyemgdkj6zfazxUwPHKWUstbASXn2AKq1mAElPMitEKs
        4y/v6X+g==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
        by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
        id 1r0bcL-0031lb-2h;
        Wed, 08 Nov 2023 06:00:45 +0000
Message-ID: <1aab6cfd-1b87-42a8-9beb-02073bdf9add@infradead.org>
Date:   Tue, 7 Nov 2023 22:00:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: SymSearch can cause make nconfig to segfault
Content-Language: en-US
To:     Jesse T <mr.bossman075@gmail.com>,
        Vivien Gallinaro <vivien.gallinaro@free.fr>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
References: <5ec262711df2f3d3ccd84930ed4e9778@free.fr>
 <CAJFTR8Sfea5gCpYA+Xb5vAz=0nemrQNxSf5BFeD0jM+YfagpmA@mail.gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAJFTR8Sfea5gCpYA+Xb5vAz=0nemrQNxSf5BFeD0jM+YfagpmA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 11/7/23 19:06, Jesse T wrote:
> On Tue, Nov 7, 2023 at 9:30 PM Vivien Gallinaro
> <vivien.gallinaro@free.fr> wrote:
>>
>> Hi all,
>>
>> In make nconfig, when I perform a SymSearch (F8) for "x86", I get a
>> segfault. It doesn't happen in make menuconfig (/ search).
>>
>> It doesn't seem to be a simple matter of "too many results" as a
>> SymSearch for "fs" does ok.
>>
>>
>> For a fresh 6.6 kernel :
>>
>> $ cd linux-6.6
>> $ make mrproper
>> $ make nconfig 2>../blarb
>> (<F8> x86 <enter>)
>> $ reset
> 
> I'm assuming "reset" here means you got put back into your shell and are
> resetting the terminal state.
> 
>> $ cat ../blarb
>>
>> gives :
>>
>> make[2]: *** [scripts/kconfig/Makefile:48: nconfig] Segmentation fault
>> make[1]: *** [/home/username/linux-6.6/Makefile:697: nconfig] Error 2
>> make: *** [Makefile:234: __sub-make] Error 2
> 
> I can not recreate this error on my machine unfortunately are you
> using the tar release?
> What distro are you using?
> 
> Thanks,
> Jesse Taube
>>
>>
>> That's not very helpful, I know… looking up "x86" was not particularly
>> useful either! (I was following a wiki referring to x86_sysfb. Before I
>> realized it probably doesn't exist any more, I tried to widen the
>> search, since I had just come across the deprecation of efi_vars in
>> favor of efivar_fs, so to speak.) I hope some one can help the search
>> fail gracefully.
>>
>> Have a nice day,
>> VG

I also cannot recreate this issue.
FWIW.

More info needed.

-- 
~Randy
