Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCB4113D5D1
	for <lists+linux-kbuild@lfdr.de>; Thu, 16 Jan 2020 09:19:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730923AbgAPITx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 16 Jan 2020 03:19:53 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:60660 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729472AbgAPITw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 16 Jan 2020 03:19:52 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00G8J8WG007057;
        Thu, 16 Jan 2020 09:19:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=VA1LsnuX6faMUJQvhZzy7LZ3v6e2+z9OibnTE+vdYBA=;
 b=U6P8jg0BIbNy7cmOlAkekIOtLTvBcQWP2OfQAz266SLdRno96feVCD7rFVSbtYBcmf9r
 /vkaOcoxV+sh5Ds8roj0Ewf9yQhAUnRdeMG1c3d5YBRYnYjEmOnDU2vtWSrq+8BfaE7L
 2BFu4e0SJRxu986Wq+HbXyp6OvP/YCT0g8nZEbvlC2ox8MlJbsSiLTPBGPXqwxtzC1yp
 NGYl2k/sCVD8EjT2VXYXwwvHFtvbDovGotVvEv+lDfa3ojLtfykalS2Xq2GN65jGrkN5
 d7kZSTFe1rYgbfQIV6wu++Vm6/+qyHM9tl4cC2qoPVroNUWLkA6wq15iOzTsoMt8TtjS UQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xf77b7qcr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 16 Jan 2020 09:19:31 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 399A8100034;
        Thu, 16 Jan 2020 09:19:23 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B786C21CA8C;
        Thu, 16 Jan 2020 09:19:23 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Thu, 16 Jan
 2020 09:19:23 +0100
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
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
Date:   Thu, 16 Jan 2020 09:19:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-16_02:2020-01-16,2020-01-15 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Franck,

On 1/16/20 3:28 AM, Frank Rowand wrote:
> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>> Hi,
>>
>> The goal of this series is to add device tree build information in dtb.
>> This information can be dtb build date, where devicetree files come from,
>> who built the dtb ... Actually, same kind of information that you can find
>> in the Linux banner which is printout during kernel boot. Having the same
>> kind of information for device tree is useful for debugging and maintenance.
>>
>> To achieve that a new option "-B" (using an argument) is added to dtc.
>> The argument is a file containing a string with build information
>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>> DTC use it to append dts file with a new string property "Build-info".
>>
>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>> last part could be improved for sure).
> 
> Please read through the thread at:
> 
>    https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
> 
> which was my attempt to do something similar.

Yes the idea is the same: get build DTB information like build date, 
"who built the DTB" ... The difference seems to be the way to do it. In 
my case, I don't want to modify existing dts source files., but I "just" 
append them by creating a new property with a string containing this 
build information.

Why your proposition has not been accepted ?

Regards
Alex

> 
> -Frank
> 
>>
>> Regards
>> Alex
>>
>> Alexandre Torgue (3):
>>    dtc: Add dtb build information option
>>    of: fdt: print dtb build information
>>    scripts: Use -B dtc option to generate dtb build information.
>>
>>   drivers/of/fdt.c           |  9 +++++++
>>   scripts/Makefile.lib       | 11 +++++---
>>   scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>   scripts/gen_dtb_build_info | 11 ++++++++
>>   4 files changed, 76 insertions(+), 10 deletions(-)
>>   create mode 100755 scripts/gen_dtb_build_info
>>
> 
