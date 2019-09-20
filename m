Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97EA5B90D9
	for <lists+linux-kbuild@lfdr.de>; Fri, 20 Sep 2019 15:42:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728238AbfITNms (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 20 Sep 2019 09:42:48 -0400
Received: from foss.arm.com ([217.140.110.172]:44866 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726924AbfITNmr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 09:42:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63A791570;
        Fri, 20 Sep 2019 06:42:47 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43D923F67D;
        Fri, 20 Sep 2019 06:42:46 -0700 (PDT)
Subject: Re: "arm64: use asm-generic/dma-mapping.h" introduced a kbuild
 warning
To:     Qian Cai <cai@lca.pw>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <1568898377.5576.186.camel@lca.pw>
 <CAK7LNATa=rzCZkBCDaUCcyo4_1JxsrGQrdUFxPh0Pw3KEu6exA@mail.gmail.com>
 <1568985515.5576.195.camel@lca.pw>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <32e53c34-6cc5-6231-6069-3b782f5d2cf0@arm.com>
Date:   Fri, 20 Sep 2019 14:42:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1568985515.5576.195.camel@lca.pw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 20/09/2019 14:18, Qian Cai wrote:
> On Fri, 2019-09-20 at 19:24 +0900, Masahiro Yamada wrote:
>> Hi Qian,
>>
>> On Thu, Sep 19, 2019 at 10:06 PM Qian Cai <cai@lca.pw> wrote:
>>>
>>> The commit 5489c8e0cf03 ("arm64: use asm-generic/dma-mapping.h") introduced a
>>> kbuild warning,
>>>
>>> scripts/Makefile.asm-generic:25: redundant generic-y found in
>>> arch/arm64/include/asm/Kbuild: dma-mapping.h
>>>
>>>
>>
>> Which tree did you test?
> 
> It was yesterday's linux-next (next-20190918) with this config [1], but it seems
> gone in today's linux-next.

There was a conflict in dma-mapping.h between the arm64 tree and the 
dma-mapping tree (where that commit deleted it) - looks like -next must 
have just resolved it the wrong way that day.

Robin.

> [1] https://raw.githubusercontent.com/cailca/linux-mm/master/arm64.config
> 
>>
>> I tried the latest Linus tree (, which contains 5489c8e0cf03),
>> but I did not see this warning.
>>
>>
>>
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
