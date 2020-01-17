Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB86E140D80
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 16:12:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728977AbgAQPLu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 10:11:50 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:26656 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728512AbgAQPLu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 10:11:50 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00HF8JSd015901;
        Fri, 17 Jan 2020 16:11:27 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=I8opKmRhMDLAX/mwhQ7AJgFOCzwL3KGOMdzGP4ujidg=;
 b=wCrbuGeczxC3de1GP6W+MhgMjgAh4vsgu1qfa5pY4T7/v4LHaEelC6zFwxKnpLkiIg/F
 SmfAVdF60putnZTPOeYRwYh6gIBE1mRukwqINvxM917nx14ab7VSLuz+T0QPY/ayjhoo
 q0dVM6cxJgJo3sOzdD6TlzRw2b9R5y1DRVCkPMMfVWh0JX54HEna6v5IBQ+r+PV0w2z6
 KbkTg+5k2D8eqedcplq56DGIiWQ4mK95AlmJ3rDyHvgRWvxlpkismGxbYlcw7yfxFuSj
 vccCCC6vTQM2Csntll4M6OP7Lz9ASoFstKmz4eR3DBRo4xCcHNhH7rZg5Ve4ellVa+ut kw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xk0rkc4q6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 17 Jan 2020 16:11:27 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CCAA210002A;
        Fri, 17 Jan 2020 16:11:20 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B33E92C38AE;
        Fri, 17 Jan 2020 16:11:20 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.44) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Fri, 17 Jan
 2020 16:11:20 +0100
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
To:     Rob Herring <robh+dt@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>
CC:     Frank Rowand <frowand.list@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Simon Glass <sjg@chromium.org>, <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>,
        Steve McIntyre <steve.mcintyre@linaro.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus> <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <c78545d9-cd91-9b18-2b85-07ce5f87ca04@st.com>
Date:   Fri, 17 Jan 2020 16:11:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG8NODE2.st.com (10.75.127.23) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-17_03:2020-01-16,2020-01-17 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

David, Rob,

On 1/17/20 3:43 PM, Rob Herring wrote:
> On Fri, Jan 17, 2020 at 6:26 AM David Gibson
> <david@gibson.dropbear.id.au> wrote:
>>
>> On Thu, Jan 16, 2020 at 09:58:23AM +0100, Alexandre Torgue wrote:
>>> Hi David
>>>
>>> On 1/16/20 1:57 AM, David Gibson wrote:
>>>> On Mon, Jan 13, 2020 at 07:16:23PM +0100, Alexandre Torgue wrote:
>>>>> This commit adds the possibility to add build information for a DTB.
>>>>> Build information can be: build date, DTS version, "who built the DTB"
>>>>> (same kind of information that we get in Linux with the Linux banner).
>>>>>
>>>>> To do this, an extra option "-B" using an information file as argument
>>>>> has been added. If this option is used, input device tree is appended with
>>>>> a new string property "Build-info". This property is built with information
>>>>> found in information file given as argument. This file has to be generated
>>>>> by user and shouldn't exceed 256 bytes.
>>>>>
>>>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@st.com>
>>>>
>>>> At the very least, this patch of the series will need to be sent to
>>>> upstream dtc first.
>>>
>>> Ok sorry. I thought that sending all the series would give more
>>> information.
>>
>> That's fair enough, but in order to merge, you'll need to post against
>> upstream dtc.

ok

>>
>>>> I'm also not terribly clear on what you're trying to accomplish here,
>>>> and why it's useful.
>>>
>>> Let's take Kernel boot at example (but could be extend to other DTB "users"
>>> like U-Boot). When Linux kernel booting we get a log that gives useful
>>> information about kernel image: source version, build date, people who built
>>> the kernel image, compiler version. This information is useful for debug and
>>> support. The aim is to get same kind of information but for the DTB.
>>>
>>>> Since you're doing this specifically for use with dtbs built in the
>>>> kernel build, could you just use a:
>>>>      Build-info = /incbin/ "build-info.txt";
>>>> in each of the in-kernel .dts files?
>>>
>>> My first idea was to not modify all existing .dts files. Adding an extra
>>> option in dtc is (for me) the softer way to do it. I mean, compile
>>> information should come through compiler without modify .dts files outside
>>> from dtc. In this way it will be easy to everybody using dtc (inside our
>>> outside Linux tree) to add dtb build info (even if they don't how to write a
>>> dts file).
>>
>> But you're not really having this information coming from the
>> compiler.  Instead you're adding a compiler option that just force
>> includes another file into the generated tree, and it's up to your
>> build scripts to put something useful into that file.
>>
>> I don't really see that as preferable to modifying the .dts files.

I agree. I took example on kernel version info. It doesn't come from gcc 
but from auto-generated file. I thought it was the easier way to 
process. But I understand your concerns. As it is not generated by dtc 
itself, dtc should not be modified.

>>
>> I also dislike the fact that the option as proposed is much more
>> general than the name suggests, but also very similar too, but much
>> more specific than the existing /incbin/ option.
>>
>> What might be better would be to have a dtc option which force appends
>> an extra .dts to the mail .dts compiled.  You can then put an overlay
>> template in that file, something like:
>>
>> &{/} {
>>          linux,build-info = /incbin/ "build-info.txt;
>> }
> 
> I like this suggestion either as an include another dts file or an
> overlay. The latter could be useful as a way to maintain current dtb
> files while splitting the source files into base and overlay dts
> files.

First suggestion will imply to modify an huge part of dts file (not a 
big modification but a lot :)).
Second one (dtbo) sounds good. In this case this dtso will be created 
from build-info.txt and applied when dtb is built. So no impacts on 
current dts file. I'm right ?

Alex

> 
> But no, let's not prepend this with 'linux'. It's not a property
> specific for Linux to consume.
> 
> Rob
> 
