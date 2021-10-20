Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 654124343A9
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Oct 2021 04:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhJTDBn (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 19 Oct 2021 23:01:43 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:26172 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJTDBm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 19 Oct 2021 23:01:42 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HYwKJ2fndz8tlq;
        Wed, 20 Oct 2021 10:58:12 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 10:59:26 +0800
Received: from [10.67.110.146] (10.67.110.146) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Wed, 20 Oct 2021 10:59:25 +0800
Subject: Re: [QUESTION] Compile error on ppc32 with compilation option
 '-fdata-sections'
From:   Ye Weihua <yeweihua4@huawei.com>
To:     <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <keescook@chromium.org>, <daniel@iogearbox.net>, <andriin@fb.com>
CC:     <linux-kbuild@vger.kernel.org>
References: <fe5a0d0c-0394-5866-8b92-e91f348a3a2a@huawei.com>
Message-ID: <d224e06f-0d5b-ba5a-04f5-e27621dc8c84@huawei.com>
Date:   Wed, 20 Oct 2021 10:59:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <fe5a0d0c-0394-5866-8b92-e91f348a3a2a@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.67.110.146]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi,


I did additional testing on other architectures and found that only the 
ppc32 had this problem. Is there a difference between the compiler's 
support for the ppc32 architecture and other architectures?


I hope you'll take the time to reply. Thanks.


Kind regards,

Weihua

.

On 2021/10/19 10:14, Ye Weihua wrote:
> Hi,
>
>
> When I was compiling the ppc32 kernel with the compilation option 
> '-fdata-sections', a compilation error occurred and the message was as 
> follows:
>
>
>     "Inconsistent kallsyms data
>
>     Try make KALLSYMS_EXTRA_PASS=1 as a workaround"
>
>
> After comparing the symbol tables, I found that the "_end" and 
> "__bss_stop" positions in Symtem.map and tmp_System.map are different: 
> in Symtem.map they are in the middle of the symbol table. In 
> tmp_System.map, they are at the end of the symbol table.
>
>
> commit af73d78bd384aa9b add "strip-debug" to improve performance. 
> However, the addition takes effect only for tmp_vmlinux but not for 
> vmlinux. As a result, the symbol tables are different after the 
> "-fdata-sections" compilation option is enabled.
>
>
> How the "strip-debug" compilation option affects symbol table order?
>
> Can "strip-debug" be added during vmlinux generation?
>
>
> Kind regards,
>
> Weihua
>
> .
>
