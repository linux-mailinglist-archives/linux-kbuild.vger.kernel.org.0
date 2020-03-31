Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE5E19991F
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 17:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730533AbgCaPBp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 11:01:45 -0400
Received: from mx07-00178001.pphosted.com ([62.209.51.94]:57662 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730153AbgCaPBo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 11:01:44 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 02VEwljB021795;
        Tue, 31 Mar 2020 17:01:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=RRp8QYyeUiwuSaXSnIHnR9hdRCvg8TE5DV1VWhJfO9c=;
 b=UcX4NrqDDsCH0+NbGCIMMUopkKgeeMNjQB/GJXKTltDNzQt5J4gptk9hbTa0JoJwxrGv
 Q6SjvOd+l/XKhv6sQQqQD+rF986XEoaQId3y00Ke40cwE7MqGohA5W0BlTjlz0WbkcPO
 4uUFk5hIYw3cOSS/MXYRLztJov/b1Re09+gcWYXa3vgqtT8vcVwPLz9fKx3rXLOzxAuL
 7jvBwd059dOhDw3vqKOaifeKku82O+6vuWcEZFrgnV5PxsurbUdGqFIzXpXGJcFUyHO2
 SYumR54vuXivBlNLLPo2gPXHEpyb5xMDnb3+AO+Tu+mOjdlS/EvH+IyuD3oUHXb4Xbdc EA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 302y53suhq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 31 Mar 2020 17:01:03 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 0CACE100038;
        Tue, 31 Mar 2020 17:00:58 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EA0CB2B4D4F;
        Tue, 31 Mar 2020 17:00:57 +0200 (CEST)
Received: from lmecxl0912.tpe.st.com (10.75.127.50) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Tue, 31 Mar
 2020 17:00:52 +0200
Subject: Re: [RFC PATCH v2 0/4] Add device tree build information
To:     Steve McIntyre <steve.mcintyre@linaro.org>
CC:     Frank Rowand <frowand.list@gmail.com>, <robh+dt@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        <david@gibson.dropbear.id.au>, <sjg@chromium.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-kbuild@vger.kernel.org>,
        <devicetree-compiler@vger.kernel.org>, Ian Lepore <ian@freebsd.org>
References: <20200221161418.20225-1-alexandre.torgue@st.com>
 <1b946fcf-47a9-012d-1b04-f4bbd2682607@gmail.com>
 <67d75f0c-7478-23b0-8619-746cf83cedb5@gmail.com>
 <dba17be2-067f-8221-f313-7a3edcf61511@st.com>
 <20200331010347.GF4037@linaro.org>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <afa534b0-c671-600f-f344-de7026dc2c79@st.com>
Date:   Tue, 31 Mar 2020 17:00:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200331010347.GF4037@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-03-31_05:2020-03-31,2020-03-31 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Steeve

On 3/31/20 3:03 AM, Steve McIntyre wrote:
> Hi Alexandre,
> 
> On Mon, Mar 02, 2020 at 01:55:55PM +0100, Alexandre Torgue wrote:
>> On 2/28/20 6:47 PM, Frank Rowand wrote:
>>>> This would require modifying every single main .dts file to get the build info
>>>> I would prefer the method that Ian and David came up with (sorry, no lore link,
>>>> it did not go to lkml).  Extract from David's email:
>>>>
>>>>      Date:   Tue, 21 Jan 2020 13:05:25 +1100
>>>>      From:   David Gibson <david@gibson.dropbear.id.au>
>>>>      Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
>>>>
>>>>      > Given that dts files are run through the C preprocessor before being
>>>>      > fed to dtc, the build script could use the '-include' flag to force-
>>>>      > include a fragment containing generated build info without any need to
>>>>      > modify existing dts files.
>>>>
>>>>      Uh... maybe.  -include will essentially prepend the forced file, which
>>>>      is a bit awkward for our purposes.  It means that the prepended file
>>>>      would need the /dts-v1/ tag, and we couldn't have it in the main files
>>>>      which would be a bit confusing.  I think it would also cause problems
>>>>      with any /memreserve/ tags and means that the main tree could in
>>>>      theory overwrite the build information which we don't necessarily
>>>>      want.
>>>>
>>>>      I guess we could build things the other way around: have the main .dts
>>>>      file specified with -include and have the dts on the dtc commandline
>>>>      be a fixed one with the build information.  It'd be a little weird,
>>>>      though.
>>>>
>>>> -Frank
>>
>> Yes. I try briefly this idea but I got issues with dts-v1 tag. I agree, it is
>> cleaner to not modify input dts file. I can rework int this way.
> 
> Have you made any progress on this please?

Unfortunately no. I cook something locally but not yet upstream-able.
Due to project issue I didn't find time to work on it. I think (I hope) 
to be less busy next week and so I'll restart it.

regards
alex

> 
> Cheers,
> 
