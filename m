Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C57AE175AB1
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Mar 2020 13:40:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgCBMkk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Mar 2020 07:40:40 -0500
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:43640 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727361AbgCBMkj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Mar 2020 07:40:39 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 022CRZP1031014;
        Mon, 2 Mar 2020 13:40:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=od867/NqQ0zAhpHSh/6j6bad1lhZJnIKCi8AtM5gVIw=;
 b=nYaQcCZhWBqb0nnxjzdyHnMifIGYDGQmQCWWG5kdWwKEKVrNwC3nRiXqsAi90ofqa3xj
 Z2UsyY28A1h8UIB63mu4eEJ5ksxdcuhzyFZJ3rgH2dLzu2pHs0hMtJJxpm76LgCPxBg7
 RGUKdLHwmMEBjLy+KjYAPeQVGkKWuzYRr5aCrh+bR3c7WQ4RUGYHUaD9gn7X5Z6rBdka
 ZiCS6Um2JKrBMYxenV9juKDDpeO3x6hpaTG2JSlz3I3Xhv46QEk7oCJSBj97bo+3wL+Z
 616UieuuMdLVeQjCMYab5TuNyw2lp2cSMZbMqVTe5fGjBTj4sg3bpI9tMTiiR241Fpo5 aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2yfea6khun-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 02 Mar 2020 13:40:09 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A724D100034;
        Mon,  2 Mar 2020 13:40:03 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 943FD2C38B1;
        Mon,  2 Mar 2020 13:40:03 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.49) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Mon, 2 Mar
 2020 13:40:02 +0100
Subject: Re: [RFC PATCH v2 1/4] scripts: Add script to generate dtb build
 information
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
CC:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        David Gibson <david@gibson.dropbear.id.au>,
        Simon Glass <sjg@chromium.org>, <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Ian Lepore <ian@freebsd.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <20200221161418.20225-2-alexandre.torgue@st.com>
 <592e41a4-6115-474e-b6ce-eeb82f858a78@gmail.com>
 <CAL_JsqJuj1=ae+_-L7_R6+ZfcbNW99BDUDSvuYSsN1=gRcvQqQ@mail.gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <866a8137-4152-da6e-f6d6-03aa245ddbb0@st.com>
Date:   Mon, 2 Mar 2020 13:40:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJuj1=ae+_-L7_R6+ZfcbNW99BDUDSvuYSsN1=gRcvQqQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG5NODE2.st.com (10.75.127.14) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-03-02_03:2020-03-02,2020-03-02 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org



On 2/21/20 8:38 PM, Rob Herring wrote:
> On Fri, Feb 21, 2020 at 11:52 AM Frank Rowand <frowand.list@gmail.com> wrote:
>>
>> On 2/21/20 10:14 AM, Alexandre Torgue wrote:
>>> This commit adds a new script to create a file (in dts file directory) with
>>> some information (date, Linux version, user). This file could then be used
>>> to populate "build-info" property in every dts file that would use this
>>> build information:
>>>
>>> Example:
>>>
>>> / {
>>>        ...
>>>        build-info = /incbin/("dtb-build.txt");
>>
>> s/.txt/.dtsi/
>>
>> and same wherever the file name is used.
>>
>>
>>>        ...
>>> };
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>>
>>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>>> index bae62549e3d2..a5af84ef4ffc 100644
>>> --- a/scripts/Makefile.lib
>>> +++ b/scripts/Makefile.lib
>>> @@ -246,6 +246,7 @@ quiet_cmd_gzip = GZIP    $@
>>>   # DTC
>>>   # ---------------------------------------------------------------------------
>>>   DTC ?= $(objtree)/scripts/dtc/dtc
>>> +DTB_GEN_INFO ?= $(objtree)/scripts/gen_dtb_build_info.sh
>>>
>>>   # Disable noisy checks by default
>>>   ifeq ($(findstring 1,$(KBUILD_EXTRA_WARN)),)
>>> @@ -286,6 +287,7 @@ $(obj)/%.dtb.S: $(obj)/%.dtb FORCE
>>>
>>>   quiet_cmd_dtc = DTC     $@
>>>   cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>>> +     $(DTB_GEN_INFO) $(src) ; \
>>>        $(HOSTCC) -E $(dtc_cpp_flags) -x assembler-with-cpp -o $(dtc-tmp) $< ; \
>>>        $(DTC) -O $(2) -o $@ -b 0 \
>>>                $(addprefix -i,$(dir $<) $(DTC_INCLUDE)) $(DTC_FLAGS) \
>>> diff --git a/scripts/gen_dtb_build_info.sh b/scripts/gen_dtb_build_info.sh
>>> new file mode 100755
>>> index 000000000000..0cd8bd98e410
>>> --- /dev/null
>>> +++ b/scripts/gen_dtb_build_info.sh
>>> @@ -0,0 +1,10 @@
>>> +#!/bin/bash
>>> +# SPDX-License-Identifier: GPL-2.0
>>> +
>>> +set -o nounset
>>> +
>>> +DTB_DIR=$1
>>> +DTB_COMPILE_BY=$(whoami | sed 's/\\/\\\\/')
>>> +DTB_INFO="From Linux $KERNELRELEASE by $DTB_COMPILE_BY the $(date).\0"
>>
>> I would remove the filler words "From", "by", "the", and the trailing
>> period ('.').
>>
>> <bikeshed>
>> You might consider using a format more like the Linux
>> kernel version line, which puts parenthesis around the
>> compiled by info.
> 
> IMO, we should use exactly the Linux kernel version line. Or exactly
> the u-boot version line when built in u-boot.

I agree to keep the same format than Linux banner. But does it make 
sense to keep uts version, config flags ?

regards
Alex

> 
> Rob
> 
