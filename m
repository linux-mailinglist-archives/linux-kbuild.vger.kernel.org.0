Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68EE43586E
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Oct 2021 03:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbhJUBtD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 20 Oct 2021 21:49:03 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:26176 "EHLO
        szxga03-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230103AbhJUBtD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Oct 2021 21:49:03 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4HZVfz3npVz8tkv;
        Thu, 21 Oct 2021 09:45:31 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 09:46:46 +0800
Received: from [10.67.110.146] (10.67.110.146) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Thu, 21 Oct 2021 09:46:45 +0800
Subject: Re: [QUESTION] Compile error on ppc32 with compilation option
 '-fdata-sections'
To:     Kees Cook <keescook@chromium.org>
CC:     <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <daniel@iogearbox.net>, <andriin@fb.com>,
        <linux-kbuild@vger.kernel.org>
References: <fe5a0d0c-0394-5866-8b92-e91f348a3a2a@huawei.com>
 <202110200954.F8F7A52@keescook>
From:   Ye Weihua <yeweihua4@huawei.com>
Message-ID: <cfee6631-173c-f906-3567-017bb34dfd01@huawei.com>
Date:   Thu, 21 Oct 2021 09:46:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <202110200954.F8F7A52@keescook>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.67.110.146]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600003.china.huawei.com (7.193.23.202)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 2021/10/21 0:55, Kees Cook wrote:
> On Tue, Oct 19, 2021 at 10:14:34AM +0800, Ye Weihua wrote:
>> Hi,
>>
>>
>> When I was compiling the ppc32 kernel with the compilation option
>> '-fdata-sections', a compilation error occurred and the message was as
>> follows:
>>
>>
>>      "Inconsistent kallsyms data
>>
>>      Try make KALLSYMS_EXTRA_PASS=1 as a workaround"
>>
>>
>> After comparing the symbol tables, I found that the "_end" and "__bss_stop"
>> positions in Symtem.map and tmp_System.map are different: in Symtem.map they
>> are in the middle of the symbol table. In tmp_System.map, they are at the
>> end of the symbol table.
>>
>>
>> commit af73d78bd384aa9b add "strip-debug" to improve performance. However,
>> the addition takes effect only for tmp_vmlinux but not for vmlinux. As a
>> result, the symbol tables are different after the "-fdata-sections"
>> compilation option is enabled.
>>
>>
>> How the "strip-debug" compilation option affects symbol table order?
>>
>> Can "strip-debug" be added during vmlinux generation?
> How did you add -fdata-sections? There needs to be a lot of special
> handling to use that option...

I added "-fdata-sections" to the "CFLAGS_KERNEL" field and "-Wl,--gc-sections" to "LDFLAGS_VMLINUX" in Makefile. I've configured it this way on other architectures, but I haven't had the same problem with the exception of ppc32. Are there any other configurations or steps required?

Thanks.

