Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0283145B41
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Jan 2020 19:00:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgAVSAz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 22 Jan 2020 13:00:55 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:16218 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgAVSAz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Jan 2020 13:00:55 -0500
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 00MI0I9Z015380;
        Wed, 22 Jan 2020 19:00:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=FD3TOxxOgAtCMT+1BxBtntOt5Z7oR4wttkJhsEbfDwY=;
 b=QSnkPW9EQAL047il27ei1fTP2oMQjoFJPVoppePLs5mUE+D/Wu9jQ4DnvP/0jzwponSP
 LC0GftePNu91R42x9cQpb2ejYdi3DMQM8xt9K13XTXfYlOQxp/6/nU5rU2yPFQvAj7Vk
 QiPV00jZHj5Al3TMe4LTZVmlisryZsmpYdnVHqJCBI+I4mD4RPpKSb4YNEqI6hwrLjP1
 OSae02ppyQdFSAi+V1bueMdhHWx1XVNWaL8zO5Py/8OPlr0ELqD0NKbq+so0FwcAT/da
 s4ub8DhaReZnhA88dESmwvKko8PS3srlJY6LuzwPIoR7kewMNFB91wYhYZxqDZQIYmWX Ug== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 2xkr1e5wn3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Jan 2020 19:00:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AC8CE10002A;
        Wed, 22 Jan 2020 19:00:19 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node2.st.com [10.75.127.8])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 93D422A52DC;
        Wed, 22 Jan 2020 19:00:19 +0100 (CET)
Received: from lmecxl0912.lme.st.com (10.75.127.48) by SFHDAG3NODE2.st.com
 (10.75.127.8) with Microsoft SMTP Server (TLS) id 15.0.1347.2; Wed, 22 Jan
 2020 19:00:18 +0100
Subject: Re: [RFC PATCH 1/3] dtc: Add dtb build information option
To:     Steve McIntyre <steve.mcintyre@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Gibson <david@gibson.dropbear.id.au>,
        Frank Rowand <frowand.list@gmail.com>, <ian@freebsd.org>
CC:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Simon Glass <sjg@chromium.org>, <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Devicetree Compiler <devicetree-compiler@vger.kernel.org>
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <20200113181625.3130-2-alexandre.torgue@st.com>
 <20200116005741.GB54439@umbus> <d2594b79-a45d-dcac-3642-90016a1408b8@st.com>
 <20200117090937.GU54439@umbus>
 <CAL_JsqKTsX9efYDMjGahFDxj0cEfzozeNrY1Nq1bECzgOZGqdQ@mail.gmail.com>
 <20200120181708.GN3697@linaro.org>
From:   Alexandre Torgue <alexandre.torgue@st.com>
Message-ID: <9d83a36c-78c5-3452-bb48-209d68c46038@st.com>
Date:   Wed, 22 Jan 2020 19:00:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200120181708.GN3697@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG4NODE3.st.com (10.75.127.12) To SFHDAG3NODE2.st.com
 (10.75.127.8)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-01-22_07:2020-01-22,2020-01-22 signatures=0
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi

On 1/20/20 7:17 PM, Steve McIntyre wrote:
> On Fri, Jan 17, 2020 at 08:43:23AM -0600, Rob Herring wrote:
>> On Fri, Jan 17, 2020 at 6:26 AM David Gibson
>> <david@gibson.dropbear.id.au> wrote:
> 
> ...
> 
>>> What might be better would be to have a dtc option which force appends
>>> an extra .dts to the mail .dts compiled.  You can then put an overlay
>>> template in that file, something like:
>>>
>>> &{/} {
>>>          linux,build-info = /incbin/ "build-info.txt;
>>> }
>>
>> I like this suggestion either as an include another dts file or an
>> overlay. The latter could be useful as a way to maintain current dtb
>> files while splitting the source files into base and overlay dts
>> files.
> 
> ACK, that sounds like it could be helpful.
> 
>> But no, let's not prepend this with 'linux'. It's not a property
>> specific for Linux to consume.
> 
> Right. We might be seeing the data coming through from U-Boot (or any
> other random bootloader) too.
> 
> Cheers,
> 

Thanks for reviews. I gonna prepare a V2 with David proposition (to use 
overlay format) by keeping in mind not to modify existing dts(i) files.

Remaining questions are:

1- "build-info" or "linux,build-info"? IMO, If information is "generic" 
then first one should be used.

2- Looking at Franck proposition[1] some years ago and objections on it, 
do you think that this one could accepted ?

regards
Alex

[1] https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/




