Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D0E326AF2
	for <lists+linux-kbuild@lfdr.de>; Sat, 27 Feb 2021 02:13:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbhB0BN1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 26 Feb 2021 20:13:27 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:13382 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhB0BN1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Feb 2021 20:13:27 -0500
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DnT4907d3z7qtt;
        Sat, 27 Feb 2021 09:11:05 +0800 (CST)
Received: from [10.136.110.154] (10.136.110.154) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.498.0; Sat, 27 Feb
 2021 09:12:40 +0800
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: Allow modular
 (de)compression algorithms
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
        "Masahiro Yamada" <masahiroy@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        <linux-kbuild@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-f2fs-devel@lists.sourceforge.net>
References: <20210226155142.2909545-1-geert@linux-m68k.org>
From:   Chao Yu <yuchao0@huawei.com>
Message-ID: <c77e72ad-fa15-db64-7348-7b1a34b6153f@huawei.com>
Date:   Sat, 27 Feb 2021 09:12:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20210226155142.2909545-1-geert@linux-m68k.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.136.110.154]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2021/2/26 23:51, Geert Uytterhoeven wrote:
> If F2FS_FS is modular, enabling the compressions options
> F2FS_FS_{LZ4,LZ4HZ,LZO,LZORLE,ZSTD} will make the (de)compression
> algorithms {LZ4,LZ4HC,LZO,ZSTD}_{,DE}COMPRESS builtin instead of
> modular, as the former depend on an intermediate boolean
> F2FS_FS_COMPRESSION, which in-turn depends on tristate F2FS_FS.
> 
> Indeed, if a boolean symbol A depends directly on a tristate symbol B
> and selects another tristate symbol C:
> 
>      tristate B
> 
>      tristate C
> 
>      bool A
>        depends on B
>        select C
> 
> and B is modular, then C will also be modular.
> 
> However, if there is an intermediate boolean D in the dependency chain
> between A and B:
> 
>      tristate B
> 
>      tristate C
> 
>      bool D
>        depends on B
> 
>      bool A
>        depends on D
>        select C
> 
> then the modular state won't propagate from B to C, and C will be
> builtin instead of modular.
> 
> As modular dependency propagation through intermediate symbols is
> obscure, fix this in a robust way by moving the selection of tristate
> (de)compression algorithms from the boolean compression options to the
> tristate main F2FS_FS option.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
