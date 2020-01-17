Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5377214117B
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 20:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbgAQTNM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 14:13:12 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:43195 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727573AbgAQTNM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 14:13:12 -0500
Received: by mail-qk1-f193.google.com with SMTP id t129so23748208qke.10;
        Fri, 17 Jan 2020 11:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ADIZocMZReJrjMbw9nPTOASTb/3FgLZiglzVEfrysHc=;
        b=tut0kCOMkdGJSiNqMoxqMqsN95iTpjZu26IZYYPHVmrheqlXj7wgoVZYGYSrZTagC0
         GlOiATVb3lLOs9X8kl58SAff/aaXsJE6HaoAaHgB6AMQa1Zcgp/x9B6RbVX+2oQzZEZX
         FSow2qGOHBbyb5gmJBiHYD2/ybpmCEfwNU8WwqAH/OPYjua8zM8mFhSnQKP8NGiy05yJ
         OoHtNQMzYZobtel7K8BxouDmmQanyxIF0PkWOQl0lou3apjHcHm0wWoSrSgmOyKHM1bA
         rquGOWNKd7PfXAcpUnzquGxUzuXWygcks7+mmsdCa5cz/Qt5prxbbCCKDsj5c6HEXh7L
         DC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ADIZocMZReJrjMbw9nPTOASTb/3FgLZiglzVEfrysHc=;
        b=PCaJzBrBEa59F3zgp3iYmM1uU7cl6WWWrBFeLZYHxl4bafE1rcOSMAX+Yn29SNPy8V
         4Yq91A61mdaDUD56VqJxPFs6YZ/i1TEysABv21T+9MyuAG4ot8fvvPCmsWkciO2F2+rP
         rq8YRmGSV+9xvA3YHhSRmVppaqGVd5OiP6jJjMFnUgNkHu3gFOMpVRvPl8segfjeE25M
         bk9QdWd1yMS7Tk7B5HQVHhrDUn8d+/erMZILTvCvJxM+pT1nlzgHOtpwEwmpLWQWkvHZ
         kj6R6dRpgoYN5GqDfZ2yc1k4T97PzHzTHD5Ro3Dtrs2FFGiRKeTGhP5k7TII7Ux9UBdb
         8GzQ==
X-Gm-Message-State: APjAAAU+KZGf73YxfObFUqB6vbf819VwS9gTURBDuMiRQq55pAA6Mo80
        YI4I4i42ruxzfGFWX8EIlgK4UTkT
X-Google-Smtp-Source: APXvYqwBzsRQf1NPdmTAvAquDKQ6qIbj/WfZZRFcf353pxdlfi6NrpAJmiumxVkeVhosLLaIzFGYFA==
X-Received: by 2002:a37:6287:: with SMTP id w129mr39639039qkb.381.1579288390967;
        Fri, 17 Jan 2020 11:13:10 -0800 (PST)
Received: from [192.168.1.46] (c-73-88-245-53.hsd1.tn.comcast.net. [73.88.245.53])
        by smtp.gmail.com with ESMTPSA id h204sm611223qke.6.2020.01.17.11.13.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Jan 2020 11:13:10 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] Add device tree build information
To:     Alexandre Torgue <alexandre.torgue@st.com>, robh+dt@kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        david@gibson.dropbear.id.au, sjg@chromium.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org, devicetree-compiler@vger.kernel.org
References: <20200113181625.3130-1-alexandre.torgue@st.com>
 <f21ad44d-f119-2035-b4ee-16b3619879af@gmail.com>
 <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
From:   Frank Rowand <frowand.list@gmail.com>
Message-ID: <7cfd0bc0-13fd-98ea-9bfd-6cfbbfd77b6d@gmail.com>
Date:   Fri, 17 Jan 2020 13:13:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <233e0a5f-d38f-908c-5ca7-66ee87d0fcae@st.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 1/16/20 2:19 AM, Alexandre Torgue wrote:
> Hi Franck,
> 
> On 1/16/20 3:28 AM, Frank Rowand wrote:
>> On 1/13/20 12:16 PM, Alexandre Torgue wrote:
>>> Hi,
>>>
>>> The goal of this series is to add device tree build information in dtb.
>>> This information can be dtb build date, where devicetree files come from,
>>> who built the dtb ... Actually, same kind of information that you can find
>>> in the Linux banner which is printout during kernel boot. Having the same
>>> kind of information for device tree is useful for debugging and maintenance.
>>>
>>> To achieve that a new option "-B" (using an argument) is added to dtc.
>>> The argument is a file containing a string with build information
>>> (e.g., From Linux 5.5.0-rc1 by alex the Mon Jan 13 18:25:38 CET 2020).
>>> DTC use it to append dts file with a new string property "Build-info".
>>>
>>> of/fdt.c is modified to printout "Build-info" property during Kernel boot and
>>> scripts/Makefile.lib is modified to use dtc -B option during kernel make (this
>>> last part could be improved for sure).
>>
>> Please read through the thread at:
>>
>>    https://lore.kernel.org/linux-arm-kernel/550A42AC.8060104@gmail.com/
>>
>> which was my attempt to do something similar.
> 
> Yes the idea is the same: get build DTB information like build date,
> "who built the DTB" ... The difference seems to be the way to do it.
> In my case, I don't want to modify existing dts source files., but I
> "just" append them by creating a new property with a string
> containing this build information.> 
> Why your proposition has not been accepted ?

Since you are asking this question, I am presuming that you did not
read the replies in the thread I referenced.  Please read through
the entire thread.  Most of the review comments were objecting to
the concept of my proposal.

-Frank

> 
> Regards
> Alex
> 
>>
>> -Frank
>>
>>>
>>> Regards
>>> Alex
>>>
>>> Alexandre Torgue (3):
>>>    dtc: Add dtb build information option
>>>    of: fdt: print dtb build information
>>>    scripts: Use -B dtc option to generate dtb build information.
>>>
>>>   drivers/of/fdt.c           |  9 +++++++
>>>   scripts/Makefile.lib       | 11 +++++---
>>>   scripts/dtc/dtc.c          | 55 +++++++++++++++++++++++++++++++++-----
>>>   scripts/gen_dtb_build_info | 11 ++++++++
>>>   4 files changed, 76 insertions(+), 10 deletions(-)
>>>   create mode 100755 scripts/gen_dtb_build_info
>>>
>>
> 

