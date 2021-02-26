Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3A72325B87
	for <lists+linux-kbuild@lfdr.de>; Fri, 26 Feb 2021 03:16:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhBZCPD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 25 Feb 2021 21:15:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:12582 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbhBZCPC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Feb 2021 21:15:02 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DmtTC6kgVzMf1Q;
        Fri, 26 Feb 2021 10:12:15 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.498.0; Fri, 26 Feb
 2021 10:14:13 +0800
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: Allow modular (de)compression
 algorithms
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Masahiro Yamada <masahiroy@kernel.org>
CC:     Randy Dunlap <rdunlap@infradead.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        <linux-f2fs-devel@lists.sourceforge.net>,
        Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210222125916.4168804-1-geert@linux-m68k.org>
 <CAK7LNARxO6O7aRwzJ+i9hEGvWBTCukpwGBC6B79c7UdO=f0Ymw@mail.gmail.com>
 <CAMuHMdX-t4Z27RnWn0Sp1AoO3A=+aT8GXkcGC5gSArtm+W9w1Q@mail.gmail.com>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <f1e9abe1-6c43-cefc-276b-d36fec72e4a4@huawei.com>
Date:   Fri, 26 Feb 2021 10:14:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX-t4Z27RnWn0Sp1AoO3A=+aT8GXkcGC5gSArtm+W9w1Q@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Geert,

On 2021/2/23 15:42, Geert Uytterhoeven wrote:
>> I checked the code in menu_finalize(), and this seems to work like this.
>>
>> I discussed the oddity of the select behavior before
>> (https://lore.kernel.org/linux-kbuild/e1a6228d-1341-6264-d97a-e2bd52a65c82@infradead.org/),
>> but I was not confident about what the right direction was.
>>
>>
>> Anyway, the behavior is obscure from the current code.
>>
>> If you want to make this more robust,
>> you can write as follows:
>>
>> config F2FS_FS
>>          tristate "F2FS filesystem support"
>>          depends on BLOCK
>>          select NLS
>>          select CRYPTO
>>          select CRYPTO_CRC32
>>          select F2FS_FS_XATTR if FS_ENCRYPTION
>>          select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
>>          select LZO_COMPRESS if F2FS_FS_LZO
>>          select LZO_DECOMPRESS if F2FS_FS_LZO
>>          select LZ4_COMPRESS if F2FS_FS_LZ4
>>          select LZ4_DECOMPRESS if F2FS_FS_LZ4
>>          select LZ4HC_COMPRESS if F2FS_FS_LZ4HC
>>          select ZSTD_COMPRESS if F2FS_FS_ZSTD
>>          select ZSTD_DECOMPRESS if F2FS_FS_ZSTD
>>
>> The code is a bit clumsy, but it is clear
>> that the module (F2FS_FS) is selecting the
>> compress/decompress libraries.
> Actually the above is what I tried first ;-)  Works fine.
> 
> Then I started to look for similar cases in other file systems (e.g.
> EROFS_FS_ZIP), and discovered the issue doesn't happen there, which
> sparked my investigation.  So I settled on the direct dependency,
> because it keeps all compression-related logic together.

It looks above way is more explicit, how about using your previous implementation?

Thank,

> 
> Gr{oetje,eeting}s,
