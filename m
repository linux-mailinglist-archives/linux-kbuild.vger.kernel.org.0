Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0C37432BB7
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Oct 2021 04:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbhJSCQ5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 18 Oct 2021 22:16:57 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:14825 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229529AbhJSCQ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Oct 2021 22:16:56 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4HYHHv6XGZz90KD;
        Tue, 19 Oct 2021 10:09:47 +0800 (CST)
Received: from kwepemm600003.china.huawei.com (7.193.23.202) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 19 Oct 2021 10:14:35 +0800
Received: from [10.67.110.146] (10.67.110.146) by
 kwepemm600003.china.huawei.com (7.193.23.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 19 Oct 2021 10:14:35 +0800
From:   Ye Weihua <yeweihua4@huawei.com>
Subject: [QUESTION] Compile error on ppc32 with compilation option
 '-fdata-sections'
To:     <masahiroy@kernel.org>, <michal.lkml@markovi.net>,
        <keescook@chromium.org>, <daniel@iogearbox.net>, <andriin@fb.com>
CC:     <linux-kbuild@vger.kernel.org>
Message-ID: <fe5a0d0c-0394-5866-8b92-e91f348a3a2a@huawei.com>
Date:   Tue, 19 Oct 2021 10:14:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
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

Hi,


When I was compiling the ppc32 kernel with the compilation option 
'-fdata-sections', a compilation error occurred and the message was as 
follows:


     "Inconsistent kallsyms data

     Try make KALLSYMS_EXTRA_PASS=1 as a workaround"


After comparing the symbol tables, I found that the "_end" and 
"__bss_stop" positions in Symtem.map and tmp_System.map are different: 
in Symtem.map they are in the middle of the symbol table. In 
tmp_System.map, they are at the end of the symbol table.


commit af73d78bd384aa9b add "strip-debug" to improve performance. 
However, the addition takes effect only for tmp_vmlinux but not for 
vmlinux. As a result, the symbol tables are different after the 
"-fdata-sections" compilation option is enabled.


How the "strip-debug" compilation option affects symbol table order?

Can "strip-debug" be added during vmlinux generation?


Kind regards,

Weihua

.

