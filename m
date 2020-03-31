Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04B1B19949C
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 13:02:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730442AbgCaLCK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 07:02:10 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:55724 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730380AbgCaLCK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 07:02:10 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02VAtkeg104245;
        Tue, 31 Mar 2020 11:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=8UJKYPmVqO3q927NHBR2tIQ/sC9DY5OTafLbmNr3u9s=;
 b=nPw94g7GH/VFVIsdAMlMKKfP/GFM6I67moeRxg+yL2bYzt1lWkYEp6aXyTP/rfz+0bfW
 Q2utHuntLreyD5MvgIsjJYdNHXWYZOmboBekqjBAFy3YxmXsn3Z8+xHVQkrTr2SRRdsu
 VLqxB064Fl+ZwZikV0sO4AhtyP7mwBhcporZhAPVm8wojmmtP4PeaaRegE868NTj/vSu
 HUl11Ui43Z7+4Eb1va50J0PXUFYEpLuqCaAPtKe/E7+rGB89J5jzJhUKd5sx5VjuWIi3
 scRhYa+AxcayhE3GCfQ2MiDYpMCcBPksa9AdhDkf6o+Zhtb3gtpXRCL/vn4WEjCEYxxl DA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 303yun1g3g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 11:02:06 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02VB25hU091900;
        Tue, 31 Mar 2020 11:02:05 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3020.oracle.com with ESMTP id 302g9x2bhs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 31 Mar 2020 11:02:05 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02VB23SC026099;
        Tue, 31 Mar 2020 11:02:03 GMT
Received: from [10.175.15.184] (/10.175.15.184)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 31 Mar 2020 04:02:03 -0700
Subject: Re: single target builds are broken
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Jens Axboe <axboe@kernel.dk>, LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
References: <a5ce79eb-be9d-df97-0b58-5aee5a48f4d3@oracle.com>
 <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
From:   Vegard Nossum <vegard.nossum@oracle.com>
Message-ID: <8c491e3b-a622-14c1-15c3-8cff061017ba@oracle.com>
Date:   Tue, 31 Mar 2020 13:01:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ8LZMPxrjVkuLizHjVZyBtSmLFZ=EvDCCAPb-XGfJLHA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9576 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 impostorscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003310098
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 3/31/20 11:49 AM, Masahiro Yamada wrote:
> On Tue, Mar 31, 2020 at 6:16 PM Vegard Nossum <vegard.nossum@oracle.com> wrote:
>>
>>
>> Hi,
>>
>> I often run 'make foo/bar.o' as part of my workflow, even when bar.o is
>> not specified in any kernel makefile, and this has worked just fine for
>> years.
>>
>> This is broken after commit 394053f4a4b3e3eeeaa67b67fc886a9a75bd9e4d
>> (kbuild: make single targets work more correctly) and just gives an error:
>>
>> $ make kernel/test.o
>>     CALL    scripts/checksyscalls.sh
>>     CALL    scripts/atomic/check-atomics.sh
>>     DESCEND  objtool
>> make[2]: *** No rule to make target 'kernel/test.o'.  Stop.
>> scripts/Makefile.build:502: recipe for target '__build' failed
>> make[1]: *** [__build] Error 2
>> Makefile:1670: recipe for target 'kernel' failed
>> make: *** [kernel] Error 2
> 
> 
> This is intentional to make the single target builds
> work in the same manner as the normal builds.
> 
> 
> The necessary CONFIG dependency must be met.
> 
> obj-$(CONFIG_FOO) += foo.o
> 
> foo.o can be built only when CONFIG_FOO is y/m.
> 
> 
> 
>> For top-level objects (e.g. 'make bar.o') the situation is even worse,
>> since make exits with status 0 without building anything :-/
> 
> 
> There is no .c or .S file at the top-level of the kernel source tree.
> 
> 'make bar.o' never happens.

It doesn't happen in mainline, but I often use that to small test things
in an isolated source file. As just one example you can do

#include <linux/sched.h>
unsigned int task_struct_size = sizeof(struct task_struct);

and then you can look in the object file to find the size. Or any other
of a million useful things that you might want to do without rebuilding
an actual source file or modifying makefiles.

>> Is there any chance we can get this back? It was super useful for me.
> 
> 
> What you want is "Let's build whatever", right?

It's really useful to be able to build object files separately, but as
if it was part of the kernel (so e.g. with all the gcc flags, include
paths, etc.).

> No, please add 'obj-y += test.o' if you want to
> test your local file.

This is a clear workflow regression for me. Why is it so absolutely
necessary to break the way it used to work?

At the very least, can we find a way to reduce the typing overhead for
testing one-offs like that? 'make STANDALONE=1 test.o' or something?


Vegard
