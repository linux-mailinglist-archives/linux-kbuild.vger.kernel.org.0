Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E41314289E
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Jan 2020 11:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgATK5I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Jan 2020 05:57:08 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:58578 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726148AbgATK5I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Jan 2020 05:57:08 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00KArVoL012020;
        Mon, 20 Jan 2020 11:56:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=bIRHwgpqgU803NnMOwsEIsnL8ULDWviN0SfB76bEG7w=;
 b=WhmySkKWFl6omfBikRqjrkeanA12VrhTOSj6gS1L2zzZwGjE1YKG9x0kRn2VLnE5tOp/
 qthIHKggg+8tz0/zrrESxk86w4lRa8DJVwi9X7SJ/4iQM1cJncdKenYYVjdaBn1zrFzr
 nbWp0FjNF0Fpe7/WsuVJtSMXx6Eo/7+FB/6c6EkBLPyt7RTBM4yK3lXtqovoyWLtV4r7
 brBTdoRVkdZwtwDqtm1w/StIDTvGaFVhH3QU14ZGrPbmtH3HQ7HiMfh0xijnCTtETazY
 lQJXoArSolItFYhFuWhKfxXKr9hQgYKKPmf5VwFFBTuXIB71+9rV0sv4qRQZl0LipHf/ Eg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkssnrukf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 20 Jan 2020 11:56:46 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7BBDE100034;
        Mon, 20 Jan 2020 11:56:42 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node3.st.com [10.75.127.9])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 649572A96F4;
        Mon, 20 Jan 2020 11:56:42 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.50) by SFHDAG3NODE3.st.com
 (10.75.127.9) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 20 Jan
 2020 11:56:41 +0100
Subject: Re: [RFC PATCH 0/3] Add device tree build information
To:     Frank Rowand <frowand.list@gmail.com>, <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        <david@gibson.dropbear.id.au>, <sjg@chromium.org>
CC:     <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>,
        <devicetree-compiler@vger.kernel.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
 <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <220e3aea-b273-417a-69c9-059236c888af@st.com>
Date:   Mon, 20 Jan 2020 11:56:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE3.st.com
 (10.75.127.9)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-20_01:2020-01-20,2020-01-20 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Franck

On 1/17/20 8:13 PM, Frank Rowand wrote:
> 
> On 1/16/20 2:19 AM, Alexandre Torgue wrote:
>> Hi Franck,
>>
>> On 1/16/20 3:28 AM, Frank Rowand wrote:
>>> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>>>> Hi,
>>>>
>>>> The goal of this series is to add device tree build information in dtb.
>>>> This information can be dtb build date, where devicetree files come from,
>>>> who built the dtb ... Actually, same kind of information that you can find
>>>> in the Linux banner which is printout during kernel boot. Having the same
>>>> kind of information for device tree is useful for debugging and maintenance.
>>>>
>>>> To achieve that a new option "-B" (using an argument) is added to dtc.
>>>> The argument is a file containing a string with build information
>>>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>>>> DTC use it to append dts file with a new string property "Build-info".
>>>>
>>>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>>>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>>>> last part could be improved for sure).
>>>
>>> Please read through the thread at:
>>>
>>>     https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
>>>
>>> which was my attempt to do something similar.
>>
>> Yes the idea is the same: get build DTB information like build date,
>> "who built the DTB" ... The difference seems to be the way to do it.
>> In my case, I don't want to modify existing dts source files., but I
>> "just" append them by creating a new property with a string
>> containing this build information.>
>> Why your proposition has not been accepted ?
> 
> Since you are asking this question, I am presuming that you did not
> read the replies in the thread I referenced.  Please read through
> the entire thread.  Most of the review comments were objecting to
> the concept of my proposal.

Sorry I have been lazy :$. This series is a tiny one compare to yours, 
and adds less dtb information (only git used, who built dtb and the 
date). There are no "dtb versions", and "absolute/relative" path which 
created concerns. One remaining concern is "reproducible build" but 
making dtb info optional could respond to it.
I continue to think that it's useful to get those information (even if 
it's only a string) But before continuing (and find a better technical 
way to do it), I need to know if there are no other obstacles.


Regards
Alex


> 
> -Frank
> 
>>
>> Regards
>> Alex
>>
>>>
>>> -Frank
>>>
>>>>
>>>> Regards
>>>> Alex
>>>>
>>>> Alexandre Torgue (3):
>>>>     dtc: Add dtb build information option
>>>>     of: fdt: print dtb build information
>>>>     scripts: Use -B dtc option to generate dtb build information.
>>>>
>>>>    drivers/of/fdt.c           |  9 +++++++
>>>>    scripts/Makefile.lib       | 11 +++++---
>>>>    scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>>>    scripts/gen_dtb_build_info | 11 ++++++++
>>>>    4 files changed, 76 insertions(+), 10 deletions(-)
>>>>    create mode 100755 scripts/gen_dtb_build_info
>>>>
>>>
>>
> 
